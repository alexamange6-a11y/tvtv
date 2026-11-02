from pathlib import Path
import json
import struct
import sys
import unittest
import zlib

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from dump_analysis import analyze_dump,require_patch_compatible_dump


class DumpAnalysisTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        inputs=prepare()
        cls.factory=(inputs/'firmware/original_firmware.bin').read_bytes()

    def test_usb_export_omission_is_not_filled_or_called_complete(self):
        exported=self.factory[:0x3f0000]
        result=analyze_dump(exported,self.factory)
        self.assertFalse(result['covers_entire_declared_flash_capacity'])
        self.assertFalse(result['physical_recovery_verified'])
        self.assertEqual(result['missing_ranges'][0]['start'],0x3f0000)
        self.assertIsNone(result['partitions'][-1]['present_bytes_sha256'])
        self.assertTrue(result['ecos_matches_factory'])
        self.assertEqual(result['checked_outer_crc_count'],5)
        self.assertEqual(result['cramfs']['files'],435)
        self.assertEqual(len(exported),0x3f0000)

    def test_private_data_changed_beyond_vendor_used_length_is_detected(self):
        exported=bytearray(self.factory[:0x3f0000])
        exported[0x381000:0x381011]=b'PRIVATE_DATA_TEST'
        result=analyze_dump(exported,self.factory)
        data=next(p for p in result['partitions'] if p['name']=='DATA')
        self.assertEqual(data['different_bytes'],17)
        self.assertEqual(data['present_bytes'],0x70000)
        self.assertFalse(result['device_data']['matches_factory'])
        self.assertNotIn('PRIVATE_DATA_TEST',json.dumps(result))

    def test_full_capacity_is_not_a_recovery_guarantee(self):
        result=analyze_dump(self.factory,self.factory)
        self.assertTrue(result['covers_entire_declared_flash_capacity'])
        self.assertEqual(result['missing_ranges'],[])
        self.assertFalse(result['physical_recovery_verified'])

    def test_patch_preimages_reject_changed_code_with_valid_outer_crc(self):
        exported=bytearray(self.factory[:0x3f0000])
        self.assertTrue(require_patch_compatible_dump(exported,self.factory)['ecos_matches_factory'])
        exported[0x100]^=1
        struct.pack_into('>I',exported,0x2019d,zlib.crc32(exported[:0x1bd40]))
        self.assertFalse(analyze_dump(exported,self.factory)['factory_prefix_comparison']['byte_identical'])
        with self.assertRaisesRegex(ValueError,'preimages'):
            require_patch_compatible_dump(exported,self.factory)

    def test_corruption_truncation_and_layout_are_rejected(self):
        for where in (0x100,0x20500,0x2f050,0x35000,0x2c8000,0x2019d):
            exported=bytearray(self.factory[:0x3f0000]);exported[where]^=1
            with self.subTest(where=where),self.assertRaises(ValueError):
                analyze_dump(exported,self.factory)
        for length in (0x20000,0x380000,0x3effff,0x3f0001):
            with self.assertRaisesRegex(ValueError,'size'):
                analyze_dump(self.factory[:length],self.factory)
        exported=bytearray(self.factory[:0x3f0000]);exported[0x20005+8]^=1
        with self.assertRaisesRegex(ValueError,'layout'):
            analyze_dump(exported,self.factory)


if __name__=='__main__':unittest.main()
