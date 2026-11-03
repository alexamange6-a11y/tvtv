"""Read-only comparison of the vendor USB Dump with the supported factory image.

Accept the exact known layout, including a USB export ending before empty AD.
Never synthesize missing flash bytes or write a new firmware. No DATA contents,
device identifiers, credentials or configuration strings enter the report.
"""
from pathlib import Path
import argparse
import hashlib
import json
import lzma
import zlib

from formats import Firmware, Cramfs, romfs_check, u32, partition_table_check


def sha(data):
    return hashlib.sha256(data).hexdigest()


def analyze_dump(dump, original):
    reference = Firmware(original)
    if len(dump) not in (0x3f0000, 0x400000):
        raise ValueError('Unexpected dump size: need 0x3f0000 or 0x400000')
    if dump[0x20000:0x20005] != bytes.fromhex('aabcdefa08'):
        raise ValueError('Dump partition table magic/count')
    rows = []
    for index, expected in enumerate(reference.partitions):
        offset = 0x20005 + index*24
        # Known structure is a precondition, not inferred from the filename.
        if dump[offset:offset+24] != original[offset:offset+24]:
            raise ValueError('Unsupported dump partition layout')
        start, capacity, used = expected['offset'], expected['capacity'], expected['length']
        present = max(0, min(capacity, len(dump)-start))
        if present < capacity and (expected['name'] != 'AD' or used != 0 or present != 0):
            raise ValueError('Missing required partition bytes')
        payload = dump[start:start+present]
        compare = original[start:start+present]
        crc_status = expected['crc_status']
        stored = None
        calculated = zlib.crc32(dump[start:start+used]) if present else None
        if index < 6:
            stored = u32(dump, 0x2019d+index*4, '>')
            if crc_status == 'valid' and stored != calculated:
                raise ValueError(f'Outer CRC mismatch: {expected["name"]}')
        rows.append(dict(name=expected['name'],offset=start,capacity=capacity,
                         table_used_bytes=used,present_bytes=present,
                         complete=present==capacity,crc_status=crc_status,
                         stored_crc32=stored,calculated_crc32=calculated,
                         present_bytes_sha256=sha(payload) if present else None,
                         matches_factory_present_bytes=payload==compare if present else None,
                         different_bytes=sum(a!=b for a,b in zip(payload,compare))))
    table = partition_table_check(dump[0x20000:0x20200])
    by_name = {row['name']:row for row in rows}
    kernel = by_name['KERNEL']
    image = dump[kernel['offset']:kernel['offset']+kernel['table_used_bytes']]
    romfs = romfs_check(image)
    ref_kernel = reference.by_name['KERNEL']
    ref_image = original[ref_kernel['offset']:ref_kernel['offset']+ref_kernel['length']]
    ref_ecos = lzma.decompress(ref_image[0x80:0x80+reference.romfs['lzma_size']],format=lzma.FORMAT_ALONE)
    try:
        decoder=lzma.LZMADecompressor(format=lzma.FORMAT_ALONE,memlimit=64*1024*1024)
        ecos=decoder.decompress(image[0x80:0x80+romfs['lzma_size']],max_length=len(ref_ecos)+1)
    except lzma.LZMAError as error:
        raise ValueError('Invalid or excessive LZMA stream') from error
    if not decoder.eof or decoder.unused_data or len(ecos)!=len(ref_ecos):
        raise ValueError('Unexpected LZMA executable length/trailing data')
    root = by_name['ROOT']
    filesystem = Cramfs(dump[root['offset']:root['offset']+root['table_used_bytes']])
    prefix_end = reference.by_name['DATA']['offset']
    complete = len(dump)==len(original)
    return dict(status='VALIDATED_USB_EXPORT_NOT_RECOVERY_PROOF',size_bytes=len(dump),
                sha256=sha(dump),factory_sha256=sha(original),partitions=rows,
                checked_outer_crc_count=sum(row['crc_status']=='valid' for row in rows),
                partition_table=table,
                romfs=romfs,ecos_sha256=sha(ecos),ecos_matches_factory=ecos==ref_ecos,
                cramfs=dict(crc_valid=True,files=len(filesystem.files),size=filesystem.size,
                            file_contents_match_factory=all(
                                path in reference.cramfs.files and node.data==reference.cramfs.files[path].data
                                for path,node in filesystem.files.items())
                                and filesystem.files.keys()==reference.cramfs.files.keys()),
                factory_prefix_comparison=dict(start=0,end_exclusive=prefix_end,
                                               byte_identical=dump[:prefix_end]==original[:prefix_end]),
                covers_entire_declared_flash_capacity=complete,
                missing_ranges=[] if complete else [dict(start=len(dump),end_exclusive=len(original),
                    partition='AD',table_used_bytes=0,actual_device_bytes_known=False)],
                device_data=dict(present=by_name['DATA']['complete'],
                    matches_factory=by_name['DATA']['matches_factory_present_bytes'],
                    preservation_required=True,contents_exported_to_report=False),
                physical_recovery_verified=False,modified_firmware_emitted=False,
                note='Matching code/resources confirms patch preimages; omitted bytes are not inferred from the factory image.')


def require_patch_compatible_dump(dump, original):
    report=analyze_dump(dump,original)
    if not report['factory_prefix_comparison']['byte_identical']:
        raise ValueError('Device boot/code/resource bytes differ from supported patch preimages')
    return report


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('dump',type=Path)
    parser.add_argument('--original',type=Path,default=Path(__file__).resolve().parents[1]/'inputs/firmware/original_firmware.bin')
    parser.add_argument('--output',type=Path)
    args=parser.parse_args()
    report=analyze_dump(args.dump.read_bytes(),args.original.read_bytes())
    encoded=json.dumps(report,ensure_ascii=False,indent=2)+'\n'
    if args.output:
        args.output.parent.mkdir(parents=True,exist_ok=True)
        args.output.write_text(encoded,encoding='utf-8')
    else:
        print(encoded,end='')


if __name__=='__main__':
    main()
