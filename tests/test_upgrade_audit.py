from pathlib import Path
import sys
import unittest

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from ck610_vm import (HeaderCRCRunner, BootFlashLoopRunner,
                      BootRecoveryReadGateRunner, BootFATReadBoundsRunner, UpgradeRangeRunner)
from formats import update_partition_table_crc
from upgrade_audit import audit, BOOT_BASE, RECOVERY_ENTRY


class UpgradeAuditTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        inputs=prepare()
        cls.firmware=(inputs/'firmware/original_firmware.bin').read_bytes()
        cls.ecos=(inputs/'extracted/ecos.bin').read_bytes()
        cls.header=cls.firmware[0x20000:0x20200]

    def test_real_usb_comparison_rejects_stale_metadata_crc(self):
        changed=bytearray(self.header);changed[0x1ad]^=1
        for header,expected in ((self.header,True),(changed,False),
                                (update_partition_table_crc(changed),True)):
            vm=HeaderCRCRunner(self.ecos,header).run()
            self.assertEqual(vm.header_crc_matches,expected)
            self.assertEqual(vm.calls,[])  # native CRC function; no service stub
            self.assertGreater(vm.steps,1000)
        self.assertEqual(changed[508:],self.header[508:])

    def test_header_crc_precedes_deeper_check_flag(self):
        changed=bytearray(self.header);changed[0x1fa]=0
        self.assertFalse(HeaderCRCRunner(self.ecos,changed).run().header_crc_matches)
        # This proves only CRC acceptance. It does not enable a flag bypass
        # in the builder or claim the rest of the validator was executed.
        self.assertTrue(HeaderCRCRunner(self.ecos,update_partition_table_crc(changed)).run().header_crc_matches)

    def test_native_recovery_loop_covers_data_preserves_boot_and_ad(self):
        vm=BootFlashLoopRunner(self.firmware).run()
        operations=[c for c in vm.calls if c['target'] in (0x93f68514,0x93f68534)]
        self.assertEqual(len(operations),122)
        written=set()
        for erase,write in zip(operations[::2],operations[1::2]):
            self.assertEqual((erase['target'],write['target']),(0x93f68514,0x93f68534))
            off,source,size=write['args'][:3]
            self.assertEqual(erase['args'][:2],[off,size])
            self.assertEqual(source,vm.BUFFER+off)
            self.assertEqual(size,0x10000)
            self.assertNotIn(off,written)
            written.add(off)
        self.assertEqual(written,set(range(0x20000,0x3f0000,0x10000)))
        self.assertTrue(set(range(0x380000,0x3f0000,0x10000))<=written)
        self.assertFalse(written & {0,0x10000,0x3f0000})
        self.assertEqual(vm.pc,vm.END)

    def test_supported_preimages_required_and_evidence_not_recovery_claim(self):
        result=audit(self.ecos,self.firmware)
        recovery=result['boot_recovery']
        self.assertEqual(RECOVERY_ENTRY-BOOT_BASE,0x14360)
        self.assertTrue(recovery['write_loop']['original_instructions_executed'])
        self.assertFalse(recovery['physical_recovery_verified'])
        self.assertFalse(result['header_crc']['full_validator_executed'])
        self.assertFalse(result['modified_flash_bin_emitted'])
        self.assertFalse(result['recovery_image_emitted'])
        for ecos,firmware in ((b'x'+self.ecos[1:],self.firmware),
                              (self.ecos,b'x'+self.firmware[1:]),
                              (self.ecos,self.firmware[:0x3f0000])):
            with self.assertRaisesRegex(ValueError,'preimage'):
                audit(ecos,firmware)

    def test_original_recovery_caller_does_not_reject_empty_or_short_reads(self):
        for count in (-1,0,1,0x20000,0x3effff,0x3f0000,0x400000):
            with self.subTest(read_result=count):
                vm=BootRecoveryReadGateRunner(self.firmware,count).run()
                self.assertEqual(vm.passed_read_result_gate,count!=-1)
                self.assertEqual(vm.calls,[])

    def test_original_fat_bounds_limit_maximum_but_not_minimum_length(self):
        for size in (0,1,0x1ffff,0x3effff,0x3f0000,0x400000,0x410000):
            vm=BootFATReadBoundsRunner(self.firmware,size).run()
            self.assertEqual(vm.read_end_offset,None if size==0 else min(size,0x400000))
            self.assertEqual(vm.calls,[])
        self.assertEqual(BootFATReadBoundsRunner(self.firmware,1024,128,256).run().read_end_offset,384)
        self.assertIsNone(BootFATReadBoundsRunner(self.firmware,1024,128,1024).run().read_end_offset)
        self.assertEqual(BootFATReadBoundsRunner(self.firmware,1024,0).run().read_end_offset,1024)

    def test_native_usb_all_range_includes_boot_and_data_but_not_ad(self):
        vm=UpgradeRangeRunner(self.ecos,self.firmware,0).run()
        self.assertEqual(vm.r[2],0)
        self.assertEqual(vm.load(vm.OUTPUT,4),0)
        self.assertEqual(vm.load(vm.OUTPUT+4,4),0x3f0000)
        self.assertEqual(vm.r[0],vm.initial_registers[0])
        self.assertEqual(vm.r[8:15],vm.initial_registers[8:15])

    def test_native_usb_other_ranges_use_capacities_including_full_data(self):
        for selection,start,length in ((1,0,0x380000),(2,0x380000,0x70000)):
            vm=UpgradeRangeRunner(self.ecos,self.firmware,selection).run()
            self.assertEqual(vm.r[2],0)
            self.assertEqual((vm.load(vm.OUTPUT,4),vm.load(vm.OUTPUT+4,4)),(start,length))
        import struct
        self.assertEqual(struct.unpack_from('>I',self.firmware,0x20005+6*24+12)[0],1)
        # DATA range still covers capacity 0x70000 rather than used=1.

    def test_native_usb_unknown_range_is_rejected(self):
        for selection in (3,99,0xffffffff):
            vm=UpgradeRangeRunner(self.ecos,self.firmware,selection).run()
            self.assertEqual(vm.r[2],0xffffffff)
            self.assertEqual(vm.load(vm.OUTPUT+4,4),0)


if __name__=='__main__':unittest.main()
