from pathlib import Path
import hashlib
import struct
import sys
import unittest
import zlib

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from formats import Firmware, Cramfs, rebuild_original_kernel, romfs_check
from csky import registrations, literal
from hook import build_hook, STATE, SET_PROPERTY, NATIVE_DISPATCH, WINDOW_KEY, START, LIMIT, PHONE_KEY, PHONE_WINDOW
from ck610_vm import Runner


class ProjectTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        inputs = prepare()
        cls.raw = (inputs/'firmware/original_firmware.bin').read_bytes()
        cls.fw = Firmware(cls.raw)
        cls.ecos = (inputs/'extracted/ecos.bin').read_bytes()
        cls.hook, cls.labels = build_hook()

    def test_original_roundtrip_and_checksums(self):
        self.assertEqual(self.raw,self.fw.roundtrip())
        self.assertEqual(self.fw.cramfs.raw,self.fw.cramfs.repack())
        self.assertEqual(sum(p['crc_status']=='valid' for p in self.fw.partitions),5)

    def test_kernel_actual_lzma_romfs_rebuild(self):
        p = self.fw.by_name['KERNEL']
        data = self.raw[p['offset']:p['offset']+p['length']]
        self.assertEqual(rebuild_original_kernel(data),data)

    def test_forced_cramfs_repack_is_semantically_identical(self):
        rebuilt = Cramfs(self.fw.cramfs.repack(force_repack=True))
        self.assertEqual(len(rebuilt.files),435)
        for p,node in self.fw.cramfs.files.items():
            self.assertEqual(rebuilt.files[p].data,node.data)
            self.assertEqual((rebuilt.files[p].mode,rebuilt.files[p].uid,rebuilt.files[p].gid),
                             (node.mode,node.uid,node.gid))

    def test_internal_checksums_reject_corruption(self):
        raw = bytearray(self.fw.cramfs.raw); raw[32] ^= 1
        with self.assertRaisesRegex(ValueError,'CRC'): Cramfs(raw)
        p = self.fw.by_name['KERNEL']
        raw = bytearray(self.raw[p['offset']:p['offset']+p['length']]); raw[12] ^= 1
        with self.assertRaisesRegex(ValueError,'checksum'): romfs_check(raw)

    def test_original_corruption_rejected(self):
        for offset in (0x100,0x20500,0x2f050,0x35000,0x2c8000):
            broken = bytearray(self.raw); broken[offset] ^= 1
            with self.subTest(offset=offset), self.assertRaises(ValueError):
                Firmware(broken,known_original=False)

    def test_repack_changed_resources_all_files_preserved(self):
        path = 'dvb/theme/widget/win_t2_main_menu.xml'
        changed = self.fw.cramfs.files[path].data.replace(b'[75,32,874,520]',b'[0,0,1024,576]')
        self.assertNotEqual(changed,self.fw.cramfs.files[path].data)
        output = Cramfs(self.fw.cramfs.repack({path:changed}))
        self.assertLessEqual(output.size,0xc0000)
        self.assertEqual(output.files[path].data,changed)
        self.assertEqual(len(output.files),435)
        for p, node in output.files.items():
            if p != path: self.assertEqual(node.data,self.fw.cramfs.files[p].data)

    def test_repack_overflow_and_unknown_path_rejected(self):
        with self.assertRaises(ValueError): self.fw.cramfs.repack({'invented':b'bad'})
        path = 'dvb/theme/widget/win_t2_main_menu.xml'
        # Deterministic incompressible payload grows past the partition capacity.
        data = b''.join(hashlib.sha256(struct.pack('<I',i)).digest() for i in range(30000))
        with self.assertRaisesRegex(ValueError,'overflow'): self.fw.cramfs.repack({path:data})

    def test_cramfs_addition_metadata_and_preservation(self):
        path = 'dvb/theme/image/research.dat'
        data = b'new-file-content'*500
        rebuilt = Cramfs(self.fw.cramfs.repack({path:data},allow_additions=True))
        self.assertEqual(rebuilt.files[path].data,data)
        self.assertEqual(rebuilt.files[path].mode,0x81a4)
        self.assertEqual(len(rebuilt.files),436)
        for p,node in self.fw.cramfs.files.items(): self.assertEqual(rebuilt.files[p].data,node.data)
        for path in ('../bad','missing/file','dvb/theme/../bad'):
            with self.assertRaises(ValueError): self.fw.cramfs.repack({path:b'x'},allow_additions=True)

    def test_actual_native_registrations(self):
        regs = {r['name']:r for r in registrations(self.ecos)}
        for name, address in {'win_t2_main_menu_keypress':0x90025ed8,
                              'list_t2_main_menu_keypress':0x900261a8,
                              'app_iptv_create':0x9000705c,
                              'app_netvideo_create':0x90015690}.items():
            self.assertEqual(regs[name]['address'],address)
            self.assertEqual(literal(self.ecos,regs[name]['registration_pc']-0x90000000+8)[1],0x9024ec58)

    def run_hook(self, selected=0, key=13, event_type=2):
        return Runner(self.ecos,self.hook,selected,key,event_type).run()

    def test_hook_size_and_direction_keys(self):
        self.assertLessEqual(START+len(self.hook),LIMIT)
        for selected in range(6):
            for key, expected in ((0x113,max(0,selected-1)),(0x114,min(5,selected+1))):
                with self.subTest(selected=selected,key=key):
                    vm = self.run_hook(selected,key)
                    self.assertEqual(vm.r[2],0)
                    self.assertEqual(vm.load(STATE,4),expected)
                    images = [c for c in vm.calls if c['target']==SET_PROPERTY]
                    self.assertEqual(len(images),6)
                    # Exactly one tile uses its focused image; each actual image
                    # pointer is read from the supplied firmware's native tables.
                    for i,c in enumerate(images):
                        table = 0x5637d0 if i == expected else 0x5637ec
                        self.assertEqual(c['args'][2],struct.unpack_from('<I',self.ecos,table+i*4)[0])

    def test_hook_real_native_network_dispatch(self):
        for tile, native_index in ((1,1),(2,3),(3,2)):
            vm = self.run_hook(tile,13)
            self.assertEqual([c['select'] for c in vm.calls if 'select' in c],[native_index])
            self.assertEqual([c['args'][0] for c in vm.calls if c['target']==NATIVE_DISPATCH],[13])
            self.assertEqual(vm.load(0x90651642,1),1)
            self.assertEqual(vm.r[2],0)

    def test_original_dispatcher_instructions_reach_native_apps(self):
        # Execute original instructions at 0x9005577c and 0x900557a8 too.
        # Platform services and ultimate app entrypoints remain recorded stubs.
        for tile,pref,targets in ((1,0,[0x90012f1c]),(1,1,[0x90010a1c]),
                                  (2,0,[0x900118a0]),(3,0,[0x900077e4,0x90008118])):
            with self.subTest(tile=tile,preference=pref):
                vm = Runner(self.ecos,self.hook,tile,13,native_dispatch=True,youtube_preference=pref).run()
                launch = [c['target'] for c in vm.calls if c['target'] in
                          (0x90012f1c,0x90010a1c,0x900118a0,0x900077e4,0x90008118)]
                self.assertEqual(launch,targets)
                self.assertEqual(vm.r[2],0)

    def test_hook_tv_media_settings(self):
        tv = self.run_hook(0,13)
        self.assertEqual([c['key'] for c in tv.calls if c['target']==WINDOW_KEY],[109])
        self.assertEqual(tv.load(0x92000008,2),13)
        media = self.run_hook(4,13)
        self.assertEqual([c['target'] for c in media.calls],[0x90024dd8])
        settings = self.run_hook(5,13)
        self.assertEqual(settings.calls[0]['target'],0x9024df6c)
        self.assertEqual(settings.calls[0]['args'][0],0x904bd964)

    def test_hook_back_propagates_no_recent(self):
        for key in (27,109,92,0x111,0x112,999):
            vm = self.run_hook(2,key)
            self.assertEqual(vm.r[2],1)
            self.assertEqual(vm.calls,[])
        vm = self.run_hook(2,13,event_type=1)
        self.assertEqual(vm.r[2],1)
        self.assertEqual(vm.calls,[])

    def test_phone_shortcut_opens_actual_native_meecast_window(self):
        # The old dispatcher loads the same window and calls GUI create. No
        # new XML callback, app launch address or network server is invented.
        self.assertEqual(literal(self.ecos,0x559b0)[1],PHONE_WINDOW)
        self.assertEqual(literal(self.ecos,0x559d8)[1],0x9024df6c)
        for selected in range(6):
            vm = self.run_hook(selected,PHONE_KEY)
            self.assertEqual(vm.r[2],0)
            self.assertEqual(vm.load(STATE,4),selected)
            self.assertEqual([(c['target'],c['args'][0]) for c in vm.calls],
                             [(0x9024df6c,PHONE_WINDOW)])

    def test_hook_stale_category_six_clamped(self):
        vm = self.run_hook(6,0x114)
        self.assertEqual(vm.load(STATE,4),1)

    def test_six_tile_theme_resources_and_cramfs_fit(self):
        import io
        import xml.etree.ElementTree as ET
        from PIL import Image
        from theme import create_theme, verify_theme, WIDGETS
        overlay = create_theme(ROOT/'inputs')
        verify_theme(overlay)
        filesystem = Cramfs(self.fw.cramfs.repack(overlay,allow_additions=True))
        self.assertLessEqual(filesystem.size,self.fw.by_name['ROOT']['capacity'])
        self.assertEqual(len(filesystem.files),436)
        menu = ET.fromstring(overlay['dvb/theme/widget/win_t2_main_menu.xml'])
        original = ET.fromstring(self.fw.cramfs.files['dvb/theme/widget/win_t2_main_menu.xml'].data)
        self.assertEqual([(e.tag,e.text) for e in original.iter() if e.tag in ('create','destroy','keypress','get_data','change')],
                         [(e.tag,e.text) for e in menu.iter() if e.tag in ('create','destroy','keypress','get_data','change')])
        slots = {w.get('name'):w for w in menu.findall('./children/widget')}
        for i,name in enumerate(WIDGETS):
            rect = slots['win_t2_main_menu_title_'+name].find('./property/rect').text
            self.assertEqual(rect,f'[{47+i*155},310,112,137]')
        self.assertEqual(slots['win_t2_main_menu_title_usb'].find('./property/state').text,'hide')
        registry = ET.fromstring(overlay['dvb/theme/image/image.xml'])
        images = {entry.get('id'):entry.text.strip() for entry in registry.findall('image')}
        background_path = 'dvb/theme/image/'+images['T2_appletv_home_background.bmp']
        with Image.open(io.BytesIO(filesystem.files[background_path].data)) as image:
            self.assertEqual(image.size,(1024,576))
            self.assertEqual(image.format,'JPEG')
            image.load()
        for entry in menu.iter():
            if entry.tag in ('img','focus_img','unfocus_img') and entry.text and entry.text.strip():
                image_id = entry.text.strip()
                self.assertIn(image_id,images)
                self.assertIn('dvb/theme/image/'+images[image_id],filesystem.files)


if __name__ == '__main__': unittest.main()
