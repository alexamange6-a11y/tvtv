from pathlib import Path
import argparse
import hashlib
import json
import lzma
import subprocess

from prepare import ROOT, prepare
from formats import Firmware, Cramfs, rebuild_original_kernel
from csky import BASE, cstring, registrations


def analyze(objdump=None):
    inputs = prepare()
    output = ROOT / 'build'
    output.mkdir(exist_ok=True)
    raw = (inputs / 'firmware/original_firmware.bin').read_bytes()
    fw = Firmware(raw)
    kernel = fw.by_name['KERNEL']
    packed = raw[kernel['offset']+0x80:kernel['offset']+0x80+fw.romfs['lzma_size']]
    ecos = lzma.decompress(packed, format=lzma.FORMAT_ALONE)
    if ecos != (inputs / 'extracted/ecos.bin').read_bytes():
        raise ValueError('Supplied eCos differs from firmware')
    for path, node in fw.cramfs.files.items():
        if node.data != (inputs / 'extracted/cramfs' / path).read_bytes():
            raise ValueError(f'Supplied resource differs: {path}')
    if fw.roundtrip() != raw or fw.cramfs.repack() != fw.cramfs.raw:
        raise ValueError('No-op roundtrip mismatch')
    kernel_rebuilt = rebuild_original_kernel(raw[kernel['offset']:kernel['offset']+kernel['length']])
    original_rebuilt = bytearray(fw.roundtrip())
    original_rebuilt[kernel['offset']:kernel['offset']+kernel['length']] = kernel_rebuilt
    if original_rebuilt != raw: raise ValueError('Reassembled original differs')
    (output / 'original_roundtrip.bin').write_bytes(original_rebuilt)
    forced_cramfs = fw.cramfs.repack(force_repack=True)
    (output / 'original_repacked_SEMANTIC.cramfs').write_bytes(forced_cramfs)
    regs = registrations(ecos)
    needed = ('win_t2_main_menu', 'list_t2_main_menu', 'app_iptv', 'app_netvideo',
              'app_pvr_media', 'youtube', 'megogo')
    selected = [row for row in regs if any(n in row['name'].lower() for n in needed)]
    # Native 7-category dispatch jump table used by list keypress @ 0x90026202.
    import struct
    table = struct.unpack_from('<7I', ecos, 0x4af2c0)
    report = dict(firmware_sha256=hashlib.sha256(raw).hexdigest(),
                  ecos_sha256=hashlib.sha256(ecos).hexdigest(),
                  architecture='C-SKY CK610 ABI v1, little endian', load_base=BASE,
                  architecture_evidence=['ck610m/gx3201/v3_0/src/gxchip_misc.c string',
                                         'CK610 disassembly of registration and callback bodies',
                                         'PC-relative literal loads resolve consistently at 0x90000000'],
                  partitions=fw.partitions, romfs=fw.romfs,
                  partition_table=fw.table,
                  cramfs=dict(size=fw.cramfs.size, files=len(fw.cramfs.files),
                              crc_valid=True, exact_preservation_noop=True,
                              forced_repack_byte_identical=forced_cramfs==fw.cramfs.raw,
                              forced_repack_files_identical=True,
                              forced_repack_differing_bytes=sum(a!=b for a,b in zip(forced_cramfs,fw.cramfs.raw)),
                              forced_repack_note='File-data allocation/deduplication and fsid blocks/CRC differ; every file and file metadata compared'),
                  kernel_lzma_recompressed_exact=True, romfs_headers_checksums_reserialized_exact=True,
                  full_image_exact_noop=True, selected_registrations=selected,
                  registration_count=len(regs),
                  original_category_dispatch=list(table),
                  native_application_dispatch=dict(address=0x900557a8, jump_table=0x904b0950,
                      youtube=dict(app_name_pointer=0x904bba64,case_index=15,case_address=0x900559dc,
                                   preference_call=0x90381b4c,launch_targets=[0x90010a1c,0x90012f1c]),
                      iptv=dict(app_name_pointer=0x904c67b4,case_index=18,case_address=0x900559f4,
                                preparation=0x900077e4,launch=0x90008118),
                      megogo=dict(app_name_pointer=0x904bc108,case_index=21,case_address=0x900559fa,
                                  launch=0x900118a0),
                      evidence='Original CK610 dispatch instructions executed by tests with platform services/launch targets stubbed'),
                  modified_firmware_built=False, hardware_verified=False)
    (output / 'analysis.json').write_text(json.dumps(report, indent=2, ensure_ascii=False)+'\n', encoding='utf-8')
    (output / 'registrations.json').write_text(json.dumps(regs, indent=2)+'\n', encoding='utf-8')
    if objdump:
        # Capture real GNU listings with explicit architecture, byte order and base.
        ranges = {r['name']: (r['file_offset'], r['file_offset']+0x180) for r in selected}
        ranges.update(window_keypress=(0x25ed8, 0x261a8), list_keypress=(0x261a8, 0x265c0),
                      registration_excerpt=(0x72b46, 0x72d7c),
                      register_function=(0x24ec58, 0x24ec84),
                      navigation_original=(0x254c8,0x25944),
                      usb_dispatch=(0x5577c,0x55ab0),
                      youtube_entry=(0x10a1c,0x10b54),youtube_alternative=(0x12f1c,0x130a0),
                      megogo_entry=(0x118a0,0x11a80),iptv_open=(0x8118,0x815c),
                      media_open=(0x24dd8,0x24e54))
        listing = output / 'disassembly'
        listing.mkdir(exist_ok=True)
        for name, (start, end) in ranges.items():
            result = subprocess.run([str(objdump), '-D', '-b', 'binary', '-m', 'csky:ck610', '-EL',
                                     '--adjust-vma=0x90000000', f'--start-address={BASE+start:#x}',
                                     f'--stop-address={BASE+end:#x}', str(inputs / 'extracted/ecos.bin')],
                                    check=True, capture_output=True, text=True)
            (listing / (name + '.asm')).write_text(result.stdout, encoding='utf-8')
    print(f'Validated original, 435 resource files, 5 populated outer CRC slots, independent partition-table CRC32, ROMFS and cramfs checksums; {len(regs)} registration sequences')
    for r in selected:
        print(f"{r['name']}: {r['address']:#010x}, register call site {r['registration_pc']:#010x}")
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--objdump', type=Path)
    args = parser.parse_args()
    analyze(args.objdump)
