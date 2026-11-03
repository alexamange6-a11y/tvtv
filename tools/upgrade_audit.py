"""Hash-gated offline evidence for USB validation and bootloader recovery.

Reads the supported factory files only. Emits JSON and optional GNU listings;
does not construct a recovery image, modify a flash BIN, or contact a device.
String references qualify as evidence only together with checked instructions.
"""
from pathlib import Path
import argparse
import hashlib
import json
import struct
import subprocess

from csky import BASE, half, literal
from formats import Firmware, partition_table_check, update_partition_table_crc
from ck610_vm import (HeaderCRCRunner, BootFlashLoopRunner,
                      BootRecoveryReadGateRunner, BootFATReadBoundsRunner)

ECOS_SHA256 = '64c58484ffaa86996a367c060fcaa46c841f3bcca6d4368b02c17c8b39bf22dc'
BOOT_BASE = 0x93f5e000  # file + 0x2000 is copied to RAM 0x93f60000
INITIAL_BASE = 0x100000
RECOVERY_ENTRY = 0x93f72360

# Ranges include literal pools where required. GNU also prints pool data as
# instructions; only checked control-flow blocks are interpreted by this audit.
ECOS_RANGES = {
    'usb_header_parse_and_crc': (0x2e940, 0x2eb56),
    'usb_partition_crc': (0x2eb56, 0x2ed06),
    'usb_oem_and_result': (0x2ed06, 0x2ee44),
    'native_crc32': (0xccbcc, 0xcd024),
}
BOOT_RANGES = {
    'boot_main_callback_dispatch': (0x2400, 0x2490),
    'boot_recovery_callback_registration': (0x9738, 0x97dc),
    'boot_flash_driver_selection': (0xa454, 0xa4a0),
    'boot_flash_erase_wrapper': (0xa514, 0xa534),
    'boot_flash_write_wrapper': (0xa534, 0xa558),
    'boot_spi_erase_and_program': (0xfa90, 0xfc34),
    'boot_usb_recovery': (0x14360, 0x14604),
    'boot_recovery_file_read_wrappers': (0x15870, 0x158a4),
    'boot_fat_reader_metadata_and_bounds': (0x154e0, 0x155c4),
    'boot_fat_reader_copy_and_result': (0x155c4, 0x15770),
}


def _bytes(blob, base, address, expected_hex, description):
    offset=address-base
    expected=bytes.fromhex(expected_hex)
    if offset < 0 or blob[offset:offset+len(expected)] != expected:
        raise ValueError(f'{description}: instruction preimage differs at {address:#x}')
    return dict(pc=address,file_offset=offset,bytes=expected.hex(),meaning=description)


def _literal(blob, base, address, register, value, description):
    offset=address-base
    if half(blob,offset)&0xff00 != (0x7000|register<<8):
        raise ValueError(f'{description}: expected literal instruction at {address:#x}')
    decoded=literal(blob,offset)
    if decoded is None or decoded[1] != value:
        raise ValueError(f'{description}: literal value differs at {address:#x}')
    return dict(pc=address,file_offset=offset,literal_offset=decoded[0],
                value=value,instruction='jsri' if register==15 else 'lrw',meaning=description)


def _boot_evidence(firmware):
    evidence=[
        _literal(firmware,INITIAL_BASE,0x1005cc,5,0x93f60000,'SPI copy RAM destination'),
        _literal(firmware,INITIAL_BASE,0x100676,6,0x03002000,'SPI read opcode 03 and address 002000'),
        _literal(firmware,INITIAL_BASE,0x100690,3,0x93f7dffc,'last RAM word of copy loop'),
        _bytes(firmware,INITIAL_BASE,0x1006c2,'35b4350f02e83520e4f7','store final byte, compare and increment destination'),
        _literal(firmware,INITIAL_BASE,0x1000ea,4,0x93f60400,'relocated boot main entry'),
        _bytes(firmware,INITIAL_BASE,0x1000ec,'c400','jump to relocated boot main'),
        _literal(firmware,BOOT_BASE,0x93f677a4,7,0x93f7b584,'boot callback structure'),
        _literal(firmware,BOOT_BASE,0x93f677a6,6,0x93f67784,'recovery wrapper address'),
        _bytes(firmware,BOOT_BASE,0x93f677a8,'2796','install recovery callback at structure +8'),
        _literal(firmware,BOOT_BASE,0x93f60470,7,0x93f7b584,'boot main reads callback structure'),
        _bytes(firmware,BOOT_BASE,0x93f60472,'2782022a01e8d200','load callback +8, test nonzero and call'),
        _literal(firmware,BOOT_BASE,0x93f67788,15,RECOVERY_ENTRY,'wrapper calls real recovery function'),
        _bytes(firmware,BOOT_BASE,RECOVERY_ENTRY,'f02500981099209a309b409c509d609e709f','recovery function stack frame'),
        _bytes(firmware,BOOT_BASE,0x93f723b4,'6233','allocate 1<<22 byte input buffer'),
        _literal(firmware,BOOT_BASE,0x93f723d4,2,0x93f79980,'load recovery filename pointer'),
        _bytes(firmware,BOOT_BASE,0x93f723d6,'c3126433','pass buffer and 1<<22 byte read limit'),
        _literal(firmware,BOOT_BASE,0x93f723da,15,0x93f73888,'read recovery file wrapper'),
        _literal(firmware,BOOT_BASE,0x93f73878,15,0x93f72d94,'file reader below wrappers; not established as an image validator'),
        _bytes(firmware,BOOT_BASE,0x93f723dc,'a20f04e0','read-result gate compares only against -1; any other result continues'),
        _bytes(firmware,BOOT_BASE,0x93f7350a,'7387','read FAT directory-entry file size at +0x1c'),
        _bytes(firmware,BOOT_BASE,0x93f735bc,'6d123d1cd70c7d0a','read end is min(offset+requested length, file size)'),
        _bytes(firmware,BOOT_BASE,0x93f73704,'096001f0092c','EOF path returns zero; error path returns -1'),
        _bytes(firmware,BOOT_BASE,0x93f73712,'9212','return FAT-reader byte count from r9'),
        _bytes(firmware,BOOT_BASE,0x93f725be,'0d601e33da63','progress=0, flash start=1<<17, block count=61'),
        _literal(firmware,BOOT_BASE,0x93f725c4,9,0x3f0000,'exclusive flash loop end'),
        _bytes(firmware,BOOT_BASE,0x93f725c6,'4ff7','branch to flash loop at 93f72466'),
        _bytes(firmware,BOOT_BASE,0x93f72466,'e2120333','erase arguments: flash offset and 1<<16 bytes'),
        _literal(firmware,BOOT_BASE,0x93f7246a,15,0x93f68514,'erase dispatch wrapper'),
        _bytes(firmware,BOOT_BASE,0x93f7246c,'e212c312e31c0433','write arguments: flash offset, buffer+offset, 1<<16 bytes'),
        _literal(firmware,BOOT_BASE,0x93f72474,15,0x93f68534,'write dispatch wrapper'),
        _bytes(firmware,BOOT_BASE,0x93f7248a,'07337e1c46666d1c9e0fe8e7','advance 64KiB and loop until exclusive end'),
        _literal(firmware,BOOT_BASE,0x93f68460,13,0x93f74714,'selected SPI driver table'),
        _bytes(firmware,BOOT_BASE,0x93f6846e,'0b77079d','store selected driver table at 93f7b59c'),
        _bytes(firmware,BOOT_BASE,0x93f6851a,'07873787072a01e8d700','erase wrapper calls driver slot +0x0c'),
        _bytes(firmware,BOOT_BASE,0x93f6853a,'07874787072a02e8d700','write wrapper calls driver slot +0x10'),
        _literal(firmware,BOOT_BASE,0x93f6dab4,12,0xffffffd8,'driver erase command byte D8'),
        _bytes(firmware,BOOT_BASE,0x93f6dac6,'0bbc','store erase opcode in SPI command buffer'),
        _bytes(firmware,BOOT_BASE,0x93f6db90,'276009b7','driver program command byte 02'),
    ]
    path_offset=0x93f79980-BOOT_BASE
    path=b'/recovery2.rcv\0'
    if firmware[path_offset:path_offset+len(path)] != path:
        raise ValueError('Recovery path preimage differs')
    driver_offset=0x93f74714-BOOT_BASE
    erase,write=struct.unpack_from('<II',firmware,driver_offset+12)
    if (erase,write)!=(0x93f6da90,0x93f6db20):
        raise ValueError('SPI driver table targets differ')
    loop=BootFlashLoopRunner(firmware).run()
    erase_calls=[c['args'][:2] for c in loop.calls if c['target']==0x93f68514]
    write_calls=[c['args'][:3] for c in loop.calls if c['target']==0x93f68534]
    offsets=list(range(0x20000,0x3f0000,0x10000))
    if erase_calls!=[[off,0x10000] for off in offsets] or write_calls!=[
            [off,loop.BUFFER+off,0x10000] for off in offsets]:
        raise ValueError('Executed recovery loop differs from documented ranges')
    read_results=[dict(read_result=n,passed_gate=BootRecoveryReadGateRunner(firmware,n).run().passed_read_result_gate)
                  for n in (-1,0,1,0x3effff,0x3f0000,0x400000)]
    if [r['passed_gate'] for r in read_results]!=[False,True,True,True,True,True]:
        raise ValueError('Native recovery read-result gate differs')
    bounds=[dict(file_size=n,read_end=BootFATReadBoundsRunner(firmware,n).run().read_end_offset)
            for n in (0,1,0x3effff,0x3f0000,0x400000,0x410000)]
    if [b['read_end'] for b in bounds]!=[None,1,0x3effff,0x3f0000,0x400000,0x400000]:
        raise ValueError('Native FAT reader length clamp differs')
    return dict(
        mapping=dict(initial_file_base=INITIAL_BASE,relocated_file_base=BOOT_BASE,
                     copied_file_start=0x2000,copied_ram_start=0x93f60000,
                     copied_bytes=0x1e000,entry=0x93f60400,entry_file_offset=0x2400),
        entry=RECOVERY_ENTRY,entry_file_offset=RECOVERY_ENTRY-BOOT_BASE,
        filename='/recovery2.rcv',filename_file_offset=path_offset,
        filename_is_installation_instruction=False,
        callback_installed_at=0x93f677a8,callback_dispatch_pc=0x93f60478,
        callback_activation_on_user_device_verified=False,
        input_read_limit=0x400000,minimum_file_length_enforced_by_reader_verified=False,
        read_length_checks=dict(native_blocks_executed=True,file_io_and_metadata_parse_executed=False,
                                caller_rejects_only_minus_one=True,caller_requires_minimum_length=False,
                                required_buffer_coverage_for_write=0x3f0000,
                                caller_gate_cases=read_results,fat_bounds_cases=bounds,
                                limitation='An empty or short read passes this caller gate; remaining flash loop still uses fixed ranges'),
        image_format_validation_before_flash_verified=False,
        write_loop=dict(start=0x20000,end_exclusive=0x3f0000,block_size=0x10000,
                        block_count=61,source='input buffer + same absolute flash offset',
                        original_instructions_executed=True,spi_and_display_calls_stubbed=True,
                        preserved_ranges=[[0,0x20000],[0x3f0000,0x400000]],
                        includes_device_DATA=True,
                        erase_wrapper=0x93f68514,write_wrapper=0x93f68534,
                        driver_table=0x93f74714,erase_driver=erase,write_driver=write),
        physical_recovery_verified=False,evidence=evidence)


def audit(ecos, firmware):
    if hashlib.sha256(ecos).hexdigest()!=ECOS_SHA256:
        raise ValueError('Unsupported eCos preimage for upgrade audit')
    if hashlib.sha256(firmware).hexdigest()!=Firmware.EXPECTED_SHA:
        raise ValueError('Unsupported factory firmware preimage for upgrade audit')
    header=firmware[0x20000:0x20200]
    evidence=[
        _bytes(ecos,BASE,0x9002eb26,'0260','CRC seed zero'),
        _literal(ecos,BASE,0x9002eb28,5,0x88,'header at stack +0x88'),
        _literal(ecos,BASE,0x9002eb2e,4,508,'header CRC input length'),
        _literal(ecos,BASE,0x9002eb30,15,0x900ccbcc,'native CRC32 function'),
        _literal(ecos,BASE,0x9002eb32,6,0x4ac,'previously decoded stored CRC in stack frame'),
        _bytes(ecos,BASE,0x9002eb38,'0787720f71e1','compare CRC and branch to failure at 9002ee20'),
        _literal(ecos,BASE,0x9002eb3e,4,0x4aa,'previously decoded header byte +0x1fa'),
        _bytes(ecos,BASE,0x9002eb44,'07a7072a66e9','zero byte skips remaining payload/OEM checks; original is one'),
        _bytes(ecos,BASE,0x9002eb62,'1e2aa7e8','payload CRC loop skips TABLE index 1'),
        _literal(ecos,BASE,0x9002ebf0,15,0x900ccbcc,'CRC of enabled partition payload'),
    ]
    broken=bytearray(header);broken[0x1ad]^=1
    fixed=update_partition_table_crc(broken)
    outcomes={label:HeaderCRCRunner(ecos,data).run().header_crc_matches
              for label,data in [('original',header),('stale_crc',broken),('recalculated_crc',fixed)]}
    if outcomes!={'original':True,'stale_crc':False,'recalculated_crc':True}:
        raise ValueError('Original native USB CRC comparison block disagrees with parser')
    return dict(
        status='OFFLINE_EVIDENCE_NOT_INSTALLABLE',
        factory_sha256=Firmware.EXPECTED_SHA,ecos_sha256=ECOS_SHA256,
        header_crc=dict(**partition_table_check(header),flash_offset=0x201fc,
                        algorithm='standard CRC32, seed zero, BE stored u32',
                        table_partition_crc_slot_offset=0x201a1,
                        table_partition_crc_slot_is_separate=True,
                        native_validator_entry=0x9002e940,native_crc_function=0x900ccbcc,
                        executed_block=[0x9002eb26,0x9002eb3e],
                        native_block_outcomes=outcomes,full_validator_executed=False,
                        evidence=evidence),
        boot_recovery=_boot_evidence(firmware),
        modified_flash_bin_emitted=False,recovery_image_emitted=False,
        unresolved=['Caller length gate is insufficient; complete recovery image-format validation is not established',
                    'Boot callback availability and raw IR confirmation keys need hardware confirmation',
                    'Header bytes +1f9/+1fb and other vendor fields are not fully interpreted',
                    'USB recovery has not been exercised on this device; GUI and app lifecycle remain untested'])


def emit_disassembly(objdump, ecos_path, firmware_path, destination):
    destination=Path(destination);destination.mkdir(parents=True,exist_ok=True)
    groups=[(ecos_path,BASE,ECOS_RANGES),(firmware_path,BOOT_BASE,BOOT_RANGES),
            (firmware_path,INITIAL_BASE,{'boot_initial_jump':(0xd8,0xee),
                                       'boot_initial_spi_copy':(0x5cc,0x700)})]
    for path,base,ranges in groups:
        for name,(start,end) in ranges.items():
            result=subprocess.run([str(objdump),'-D','-b','binary','-m','csky:ck610','-EL',
                                   f'--adjust-vma={base:#x}',f'--start-address={base+start:#x}',
                                   f'--stop-address={base+end:#x}',str(path)],
                                  check=True,capture_output=True,text=True)
            (destination/(name+'.asm')).write_text(result.stdout,encoding='utf-8')


if __name__=='__main__':
    from prepare import prepare, ROOT
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',type=Path,default=ROOT/'build/upgrade/findings.json')
    parser.add_argument('--objdump',type=Path)
    args=parser.parse_args()
    inputs=prepare()
    ecos_path=inputs/'extracted/ecos.bin'
    firmware_path=inputs/'firmware/original_firmware.bin'
    result=audit(ecos_path.read_bytes(),firmware_path.read_bytes())
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    if args.objdump:emit_disassembly(args.objdump,ecos_path,firmware_path,args.output.parent/'disassembly')
    print('Verified native header CRC comparison and boot recovery instruction anchors. No flash/recovery image emitted.')
