from pathlib import Path
import struct
import sys
import unittest
import zlib

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from formats import Firmware,partition_table_check,update_partition_table_crc
from ck610_vm import NativeCRCRunner


class PartitionTableTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        inputs=prepare()
        cls.firmware=(inputs/'firmware/original_firmware.bin').read_bytes()
        cls.ecos=(inputs/'extracted/ecos.bin').read_bytes()
        cls.header=cls.firmware[0x20000:0x20200]

    def test_confirmed_tail_crc_distinct_from_table_partition_slot(self):
        result=partition_table_check(self.header)
        self.assertEqual(result['stored_crc32'],0xb51b6607)
        self.assertEqual(result['calculated_crc32'],zlib.crc32(self.header[:508]))
        self.assertEqual(self.header[0x1a1:0x1a5],bytes(4))
        self.assertEqual(result['tail_bytes_1f9_1fb'],[1,1,0x66])
        self.assertEqual(Firmware(self.firmware).roundtrip(),self.firmware)

    def test_bad_metadata_and_stale_header_crc_are_rejected(self):
        for offset in (0x20,0xc8,0x1ad,0x1f9,0x1fa,0x1fb,0x1fc,0x1ff):
            broken=bytearray(self.firmware);broken[0x20000+offset]^=1
            with self.subTest(offset=offset),self.assertRaisesRegex(ValueError,'table CRC'):
                Firmware(broken,known_original=False)

    def test_header_only_recalculation_keeps_unknown_bytes(self):
        changed=bytearray(self.header)
        struct.pack_into('>I',changed,0x1ad,0x12345678)
        fixed=update_partition_table_crc(changed)
        self.assertEqual(fixed[:508],changed[:508])
        self.assertNotEqual(fixed[508:],self.header[508:])
        partition_table_check(fixed)
        self.assertEqual(update_partition_table_crc(self.header),self.header)

    def test_original_crc_instructions_match_standard_vectors_and_alignment(self):
        for data in (b'',b'123456789',bytes(range(256)),self.header[:508],bytes(range(32))*128):
            for alignment in (0,1,2,3):
                for seed in (0,0x12345678):
                    with self.subTest(length=len(data),alignment=alignment,seed=seed):
                        vm=NativeCRCRunner(self.ecos,data,seed,alignment).run()
                        self.assertEqual(vm.r[2],zlib.crc32(data,seed))
                        self.assertEqual(vm.calls,[])


if __name__=='__main__':unittest.main()
