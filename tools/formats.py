"""Strict parsers and conservative repacking for this exact GX flash image.

No hardware flashing. The container writer only permits unchanged payloads.
Modified cramfs images are research artifacts, never declared installable.
"""
from dataclasses import dataclass, field
import hashlib
import struct
import zlib
import copy
import lzma


def u32(data, offset, endian='<'):
    return struct.unpack_from(endian + 'I', data, offset)[0]


def sum_be(data):
    data += bytes((-len(data)) % 4)
    return sum(struct.unpack('>' + 'I' * (len(data) // 4), data)) & 0xffffffff


def partition_table_check(header):
    """Check the 512-byte vendor header, including its independent tail CRC.

    The TABLE entry's zero payload-CRC slot is separate. Native USB validation
    computes seed-zero CRC32 over bytes [0,508), then reads a big-endian u32.
    """
    if len(header) != 512 or header[:4] != bytes.fromhex('aabcdefa'):
        raise ValueError('Partition table header length/magic')
    if not 1 <= header[4] <= 12:
        raise ValueError('Partition table header count')
    stored=u32(header,508,'>')
    calculated=zlib.crc32(header[:508])
    if stored != calculated:
        raise ValueError('Partition table CRC32 mismatch')
    return dict(size=512,crc_offset=508,crc_covered_bytes=508,
                stored_crc32=stored,calculated_crc32=calculated,crc_valid=True,
                tail_bytes_1f9_1fb=list(header[505:508]))


def update_partition_table_crc(header):
    """Recompute only the CRC of a header; never emit a full modified BIN."""
    if len(header)!=512 or header[:4]!=bytes.fromhex('aabcdefa'):
        raise ValueError('Partition table header length/magic')
    result=bytearray(header)
    struct.pack_into('>I',result,508,zlib.crc32(result[:508]))
    partition_table_check(result)
    return bytes(result)


def romfs_check(data):
    if data[:8] != b'-rom1fs-':
        raise ValueError('ROMFS magic')
    size = u32(data, 8, '>')
    if not 128 <= size <= len(data):
        raise ValueError('ROMFS size')
    if sum_be(data[:min(size, 512)]):
        raise ValueError('ROMFS superblock checksum')
    # Known file inode: name ends at offset 0x80, checksum covers metadata/name.
    if data[0x70:0x7e] != b'ecos.bin.lzma\0':
        raise ValueError('Unexpected ROMFS layout')
    if sum_be(data[0x60:0x80]):
        raise ValueError('ROMFS file inode checksum')
    packed_size = u32(data, 0x68, '>')
    if 0x80 + packed_size > size:
        raise ValueError('ROMFS file range')
    return {'size': size, 'lzma_offset': 0x80, 'lzma_size': packed_size,
            'superblock_checksum_valid': True, 'inode_checksum_valid': True}


def rebuild_original_kernel(kernel):
    """Actually recompress LZMA and reserialize ROMFS header and checksums.

    This path only accepts the original executable and requires exact bytes on
    output. It does not offer a modified firmware publication/flash path.
    """
    info = romfs_check(kernel)
    compressed = kernel[0x80:0x80+info['lzma_size']]
    raw = lzma.decompress(compressed,format=lzma.FORMAT_ALONE)
    if hashlib.sha256(raw).hexdigest() != '64c58484ffaa86996a367c060fcaa46c841f3bcca6d4368b02c17c8b39bf22dc':
        raise ValueError('Only original eCos accepted by exact reconstruction')
    encoded = lzma.compress(raw,format=lzma.FORMAT_ALONE,preset=6)
    image = bytearray(kernel[:0x80]+encoded)
    image.extend(bytes((-len(image))%16))
    struct.pack_into('>I',image,8,len(image))
    struct.pack_into('>I',image,0x68,len(encoded))
    struct.pack_into('>I',image,0x6c,0)
    struct.pack_into('>I',image,0x6c,(-sum_be(image[0x60:0x80]))&0xffffffff)
    struct.pack_into('>I',image,12,0)
    struct.pack_into('>I',image,12,(-sum_be(image[:512]))&0xffffffff)
    romfs_check(image)
    image.extend(bytes((-len(image))%1024))
    if image != kernel:
        raise ValueError('Original LZMA/ROMFS reconstruction is not byte exact on this toolchain')
    return bytes(image)


@dataclass
class Node:
    name: str
    path: str
    inode: int
    mode: int
    uid: int
    gid: int
    size: int
    offset: int
    children: list = field(default_factory=list)
    data: bytes = b''
    blocks: list = field(default_factory=list)


class Cramfs:
    def __init__(self, data):
        if len(data) < 76 or data[:4] != b'E=\xcd(':
            raise ValueError('cramfs magic/length')
        self.size = u32(data, 4)
        if self.size > len(data) or self.size < 76:
            raise ValueError('cramfs size')
        self.raw = bytes(data[:self.size])
        if u32(data, 8) != 3:
            raise ValueError('Unsupported cramfs flags')
        check = bytearray(self.raw)
        check[32:36] = bytes(4)
        if zlib.crc32(check) != u32(data, 32):
            raise ValueError('cramfs CRC')
        self.nodes = []
        self.directory_end = 76
        self.root = self._read('', '', 64, set())
        self.files = {n.path: n for n in self.nodes if n.mode & 0xf000 == 0x8000}
        if len(self.files) != sum(n.mode & 0xf000 == 0x8000 for n in self.nodes):
            raise ValueError('Duplicate cramfs path')

    def _read(self, name, path, inode, ancestors):
        if inode < 64 or inode + 12 > self.size or len(ancestors) > 64:
            raise ValueError('inode range/depth')
        a, b, c = struct.unpack_from('<III', self.raw, inode)
        node = Node(name, path, inode, a & 0xffff, a >> 16, b >> 24,
                    b & 0xffffff, (c >> 6) * 4)
        self.nodes.append(node)
        kind = node.mode & 0xf000
        if node.offset + (node.size if kind == 0x4000 else 0) > self.size:
            raise ValueError('inode data range')
        if kind == 0x4000:
            if node.offset in ancestors and node.size:
                raise ValueError('Directory cycle')
            end = node.offset + node.size
            self.directory_end = max(self.directory_end, end)
            off = node.offset
            while off < end:
                if off + 12 > end:
                    raise ValueError('Short directory inode')
                namelen = (u32(self.raw, off + 8) & 63) * 4
                if not namelen or off + 12 + namelen > end:
                    raise ValueError('Directory name range')
                name = self.raw[off + 12:off + 12 + namelen].split(b'\0')[0].decode('utf-8')
                if not name or '/' in name or '\\' in name or name in ('.', '..'):
                    raise ValueError('Unsafe cramfs filename')
                child = self._read(name, (path + '/' + name).lstrip('/'), off,
                                   ancestors | {node.offset})
                node.children.append(child)
                off += 12 + namelen
        elif kind == 0x8000:
            count = (node.size + 4095) // 4096
            start = node.offset + count * 4
            if start > self.size:
                raise ValueError('Block pointer table range')
            content = bytearray()
            for i in range(count):
                end = u32(self.raw, node.offset + i * 4)
                if end < start or end > self.size:
                    raise ValueError('Block range/unsupported block flag')
                packed = self.raw[start:end]
                chunk = zlib.decompress(packed) if packed else bytes(4096)
                expected = min(4096, node.size - i * 4096)
                if len(chunk) != expected:
                    raise ValueError('Block decompression length')
                content.extend(chunk)
                node.blocks.append(packed)
                start = end
            node.data = bytes(content)
        else:
            raise ValueError(f'Unsupported inode type {kind:x}')
        return node

    def repack(self, replacements=None, limit=0xc0000, allow_additions=False, force_repack=False):
        """Keep directory/inode ordering; reuse unchanged compressed blocks.

        An unchanged request returns the original byte-for-byte. Changed files
        are compressed into a newly laid out file-data area; inode offsets,
        lengths, superblock size, block count and CRC are updated. All files
        are reparsed and compared before returning. Explicit additions may be
        made in existing directories; deletion is not supported.
        """
        replacements = replacements or {}
        additions = set(replacements) - self.files.keys()
        if additions and not allow_additions:
            raise ValueError('Cannot add/remove files in conservative repacker')
        if not force_repack and not additions and all(self.files[p].data == d for p, d in replacements.items()):
            return self.raw
        files = self.files
        node_count = len(self.nodes)
        if additions:
            tree = copy.deepcopy(self.root)
            dirs, files = {}, {}
            def index(node):
                if node.mode & 0xf000 == 0x4000:
                    dirs[node.path] = node
                    for child in node.children: index(child)
                else: files[node.path] = node
            index(tree)
            for path in sorted(additions):
                components = path.split('/')
                if any(not x or x in ('.','..') or '\\' in x for x in components):
                    raise ValueError('Unsafe new path')
                parent_path = '/'.join(components[:-1])
                if parent_path not in dirs or path in dirs:
                    raise ValueError('New file requires an existing directory')
                parent = dirs[parent_path]
                node = Node(components[-1],path,0,0x81a4,parent.uid,parent.gid,0,0)
                parent.children.append(node)
                files[path] = node
            out = bytearray(self.raw[:76])
            tree.inode = 64
            def write_inode(node, name_length):
                struct.pack_into('<III',out,node.inode,
                                 node.uid << 16 | node.mode, node.gid << 24 | node.size,
                                 (node.offset//4) << 6 | (name_length//4))
            def directories(node):
                if node.mode & 0xf000 != 0x4000: return
                node.offset = len(out) if node.children else 0
                for child in node.children:
                    name = child.name.encode('utf-8')
                    padded = (len(name)+3)&~3
                    if not 0 < padded <= 252: raise ValueError('New name too long')
                    child.inode = len(out)
                    out.extend(bytes(12)+name+bytes(padded-len(name)))
                node.size = len(out)-node.offset if node.children else 0
                namelen = 0 if node is tree else (len(node.name.encode('utf-8'))+3)&~3
                write_inode(node,namelen)
                for child in node.children:
                    if child.mode & 0xf000 == 0x4000: directories(child)
                    else:
                        child.offset = 0
                        write_inode(child,(len(child.name.encode('utf-8'))+3)&~3)
            directories(tree)
            node_count += len(additions)
        else:
            out = bytearray(self.raw[:self.directory_end])
        out.extend(bytes((-len(out)) % 4))
        blocks_total = 0
        dedup = {}
        for path, node in files.items():
            data = replacements.get(path, node.data)
            if len(data) >= 1 << 24:
                raise ValueError('File exceeds inode size field')
            if data in dedup:
                offset = dedup[data]
            elif data:
                offset = len(out)
                count = (len(data) + 4095) // 4096
                out.extend(bytes(count * 4))
                chunks = node.blocks if data == node.data else [
                    zlib.compress(data[i:i+4096], 9) for i in range(0, len(data), 4096)]
                blocks_total += count
                for i, chunk in enumerate(chunks):
                    out.extend(chunk)
                    struct.pack_into('<I', out, offset + i * 4, len(out))
                out.extend(bytes((-len(out)) % 4))
                dedup[data] = offset
            else:
                offset = 0
            struct.pack_into('<I', out, node.inode + 4, node.gid << 24 | len(data))
            old = u32(out, node.inode + 8)
            struct.pack_into('<I', out, node.inode + 8, (offset // 4) << 6 | (old & 63))
        out.extend(bytes((-len(out)) % 4096))
        if len(out) > limit:
            raise ValueError(f'cramfs overflow: {len(out):#x} > {limit:#x}')
        struct.pack_into('<I', out, 4, len(out))
        struct.pack_into('<I', out, 40, blocks_total)
        struct.pack_into('<I', out, 44, node_count)
        struct.pack_into('<I', out, 32, 0)
        struct.pack_into('<I', out, 32, zlib.crc32(out))
        verified = Cramfs(out)
        if verified.files.keys() != files.keys():
            raise ValueError('Repack lost files')
        for path, node in files.items():
            other = verified.files[path]
            if other.data != replacements.get(path, node.data):
                raise ValueError(f'Repack data mismatch: {path}')
            if (other.mode, other.uid, other.gid) != (node.mode, node.uid, node.gid):
                raise ValueError(f'Repack metadata mismatch: {path}')
        return bytes(out)


class Firmware:
    EXPECTED_SHA = '3395ffe1989e78a1e4496c91246b8b84f3efcd16ca9ee6d8606691523a03aa4c'

    def __init__(self, data, known_original=True):
        self.raw = bytes(data)
        if len(data) != 0x400000 or data[0x20000:0x20004] != bytes.fromhex('aabcdefa'):
            raise ValueError('Flash length/table magic')
        if known_original and hashlib.sha256(data).hexdigest() != self.EXPECTED_SHA:
            raise ValueError('Unexpected original SHA256')
        if data[0x20004] != 8:
            raise ValueError('Unexpected partition count')
        self.table = partition_table_check(data[0x20000:0x20200])
        self.partitions = []
        for i in range(8):
            off = 0x20005 + i * 24
            name = data[off:off+8].rstrip(b'\0').decode('ascii')
            capacity, length, start = struct.unpack_from('>III', data, off+8)
            flags = data[off+20:off+24].hex()
            if length > capacity or start + capacity > len(data):
                raise ValueError('Partition bounds')
            # First six partition slots carry big-endian outer CRC32 values.
            crc_offset = 0x2019d + i * 4 if i < 6 else None
            stored = u32(data, crc_offset, '>') if crc_offset else None
            calculated = zlib.crc32(data[start:start+length])
            status = 'not_present' if i >= 6 else 'unused_zero_slot' if name == 'TABLE' else 'valid'
            if status == 'valid' and stored != calculated:
                raise ValueError(f'Outer CRC mismatch: {name}')
            self.partitions.append(dict(name=name, offset=start, capacity=capacity, length=length,
                                        flags=flags, crc_offset=crc_offset, stored_crc32=stored,
                                        calculated_crc32=calculated, crc_status=status))
        self.by_name = {p['name']: p for p in self.partitions}
        root = self.by_name['ROOT']
        self.cramfs = Cramfs(data[root['offset']:root['offset']+root['length']])
        kernel = self.by_name['KERNEL']
        self.romfs = romfs_check(data[kernel['offset']:kernel['offset']+kernel['length']])

    def roundtrip(self):
        """Reserialize known table fields/CRCs, preserve unknown metadata/gaps.

        This is a lossless original-image reconstruction, not proof that all
        bootloader/update validation fields are understood for modified images.
        """
        out = bytearray(self.raw)
        for i,p in enumerate(self.partitions):
            start, size = p['offset'], p['length']
            out[start:start+size] = self.raw[start:start+size]
            offset = 0x20005+i*24
            struct.pack_into('>8sIII4s',out,offset,p['name'].encode('ascii'),p['capacity'],
                             size,start,bytes.fromhex(p['flags']))
            if p['crc_status']=='valid':
                struct.pack_into('>I',out,p['crc_offset'],zlib.crc32(out[start:start+size]))
        out[0x20000:0x20200]=update_partition_table_crc(out[0x20000:0x20200])
        return bytes(out)
