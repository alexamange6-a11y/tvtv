from pathlib import Path
import struct
import sys
import unittest
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from hook import build_hook,build_create_hook,START,LIMIT,CREATE_TAIL,STATE,SET_PROPERTY
from ck610_vm import CreateTailRunner
from theme import create_theme


class MenuCreateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.inputs=prepare()
        cls.ecos=(cls.inputs/'extracted/ecos.bin').read_bytes()
        cls.hook,_=build_hook()
        cls.helper,cls.patch=build_create_hook(cls.ecos)

    def test_native_return_branch_and_nonoverlapping_code_ranges(self):
        patch=self.patch
        self.assertEqual(patch['address'],START+len(self.hook))
        self.assertLessEqual(patch['address']+len(self.helper),LIMIT)
        word=struct.unpack('<H',bytes.fromhex(patch['replacement_branch_bytes']))[0]
        delta=word&0x7ff
        if delta&0x400:delta-=0x800
        self.assertEqual(CREATE_TAIL+2+delta*2,patch['address'])
        self.assertEqual(word&0xf800,0xf800)
        original=bytearray(self.ecos);original[CREATE_TAIL-0x90000000]^=1
        with self.assertRaisesRegex(ValueError,'epilogue'):build_create_hook(original)

    def test_actual_epilogue_focus_flags_images_stack_and_registers(self):
        for selected in (0,1,2,3,4,5,6,0xffffffff):
            with self.subTest(selected=selected):
                vm=CreateTailRunner(self.ecos,self.hook,self.helper,self.patch,selected).run()
                expected=selected if selected<6 else 0
                self.assertEqual(vm.r[2],0)
                self.assertEqual(vm.load(STATE,4),expected)
                self.assertEqual(vm.read(0x90651640,5),bytes(5))
                self.assertEqual(vm.load(0x9064a730,4),0)
                self.assertEqual(vm.load(0x9064a73c,4),1)
                focus=[c for c in vm.calls if c['target']==0x9024e524]
                self.assertEqual(len(focus),1)
                self.assertEqual(focus[0]['args'][0],0x904b8740)
                images=[c for c in vm.calls if c['target']==SET_PROPERTY and c['args'][1]==0x904f5eb4]
                self.assertEqual(len(images),6)
                for i,c in enumerate(images):
                    table=0x5637d0 if i==expected else 0x5637ec
                    self.assertEqual(c['args'][2],struct.unpack_from('<I',self.ecos,table+i*4)[0])

    def test_resource_event_target_has_nonzero_bounded_area(self):
        overlay=create_theme(self.inputs)
        menu=ET.fromstring(overlay['dvb/theme/widget/win_t2_main_menu.xml'])
        target=next(w for w in menu.iter('widget') if w.get('name')=='win_t2_main_menu_list')
        self.assertEqual(target.findtext('./property/rect'),'[1023,575,1,1]')


if __name__=='__main__':unittest.main()
