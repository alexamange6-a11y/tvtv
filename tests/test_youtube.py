from pathlib import Path
import io
import json
import struct
import sys
import unittest
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from prepare import prepare
from formats import Firmware,Cramfs
from theme import create_theme
from youtube_theme import create_youtube_theme,BROWSE,PLAYER,REGISTRY,FOCUS_ID,GROUP_ID
from youtube_playback import audit_and_patch,diagnose_player,ANDROID_HEADER,ANDROID_UA
from csky import cstring,BASE
from PIL import Image


class YouTubeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.inputs=prepare()
        cls.ecos=(cls.inputs/'extracted/ecos.bin').read_bytes()
        cls.base=create_theme(cls.inputs)
        cls.overlay=create_youtube_theme(cls.inputs,cls.base)

    def test_callback_and_widget_contracts_unchanged(self):
        for path in (BROWSE,PLAYER):
            original=ET.parse(self.inputs/'extracted/cramfs'/path).getroot()
            updated=ET.fromstring(self.overlay[path])
            self.assertEqual([(e.get('name'),e.get('class')) for e in original.iter('widget')],
                             [(e.get('name'),e.get('class')) for e in updated.iter('widget')])
            self.assertEqual([ET.tostring(s) for s in original.iter('signal')],
                             [ET.tostring(s) for s in updated.iter('signal')])
            for w in updated.iter('widget'):
                r=w.find('./property/rect')
                if r is None: continue
                x,y,width,height=map(int,r.text.strip('[]').split(','))
                self.assertGreaterEqual(min(x,y,width,height),0,w.get('name'))
                self.assertLessEqual(x+width,1024,w.get('name'))
                self.assertLessEqual(y+height,576,w.get('name'))

    def test_real_four_results_and_tv_aspect(self):
        widgets={w.get('name'):w for w in ET.fromstring(self.overlay[BROWSE]).iter('widget')}
        rows=[]
        for i in range(1,5):
            image=widgets[f'img_netvideo_item_unfocus{i}']
            self.assertEqual(image.get('class'),'file_image')
            x,y,w,h=map(int,image.find('./property/rect').text.strip('[]').split(','))
            self.assertEqual((w,h),(160,90)); rows.append(y)
            self.assertEqual(image.find('./property/state').text,'hide')
            self.assertFalse(image.find('./property/img').text)
        self.assertEqual(rows,[98,200,302,404])

    def test_assets_registry_and_combined_partition_fit(self):
        combined={**self.base,**self.overlay}
        f=Firmware((self.inputs/'firmware/original_firmware.bin').read_bytes())
        rebuilt=Cramfs(f.cramfs.repack(combined,allow_additions=True))
        self.assertLessEqual(rebuilt.size,0xc0000)
        registry=ET.fromstring(combined[REGISTRY])
        ids=[e.get('id') for e in registry.findall('image')]
        baseline=ET.fromstring(self.base[REGISTRY]).findall('image')
        # Two vendor IDs already alias different files; preserve their original
        # order/resolution rather than changing unrelated media player assets.
        self.assertEqual([(e.get('id'),e.text) for e in registry.findall('image')[:-2]],
                         [(e.get('id'),e.text) for e in baseline])
        self.assertEqual(ids.count(FOCUS_ID),1)
        self.assertEqual(ids.count(GROUP_ID),1)
        self.assertIn('T2_appletv_home_background.bmp',ids)
        for name,size in ((FOCUS_ID,(166,96)),(GROUP_ID,(194,37))):
            p='dvb/theme/image/'+name
            data=rebuilt.files[p].data
            self.assertEqual(struct.unpack_from('<H',data,28)[0],16)
            with Image.open(io.BytesIO(data)) as im:
                self.assertEqual(im.size,size);im.load()
        for path in (BROWSE,PLAYER):
            for e in ET.fromstring(combined[path]).iter():
                if e.tag in ('img','focus_img','unfocus_img') and e.text and e.text.strip():
                    self.assertIn(e.text.strip(),ids)

    def test_version_fix_bounded_and_reversible(self):
        report,patched=audit_and_patch(self.ecos)
        self.assertFalse(report['root_cause_proven'])
        self.assertFalse(report['service_tested'])
        self.assertEqual(len(patched),len(self.ecos))
        self.assertEqual(cstring(patched,BASE+ANDROID_HEADER),'X-YouTube-Client-Version: 19.09.4')
        self.assertIn('/19.09.4 ',cstring(patched,BASE+ANDROID_UA))
        self.assertEqual(cstring(self.ecos,BASE+0x4da3ac),cstring(patched,BASE+0x4da3ac))
        restored=bytearray(patched)
        changed=set()
        for item in report['changes']:
            before=bytes.fromhex(item['before_hex']);off=item['offset']
            restored[off:off+len(before)]=before
            changed.update(range(off,off+len(before)))
        self.assertEqual(restored,self.ecos)
        self.assertTrue(all(i in changed for i,(a,b) in enumerate(zip(self.ecos,patched)) if a!=b))
        with self.assertRaises(ValueError):audit_and_patch(patched)

    def test_diagnostic_direct_muxed_and_expiry(self):
        response=dict(playabilityStatus={'status':'OK'},streamingData={'formats':[
            {'itag':18,'mimeType':'video/mp4; codecs="avc1.42001E, mp4a.40.2"',
             'url':'https://example.invalid/video?expire=200&token=SECRET'}]})
        report=diagnose_player(response,100)
        self.assertEqual(report['progressive_avc_aac_candidates'],1)
        self.assertFalse(report['playback_verified'])
        self.assertEqual(diagnose_player(response,201)['progressive_avc_aac_candidates'],0)
        self.assertNotIn('SECRET',json.dumps(report))
        self.assertNotIn('example.invalid',json.dumps(report))

    def test_diagnostic_cipher_adaptive_and_denial(self):
        r=diagnose_player({'playabilityStatus':{'status':'OK'},'streamingData':{
            'adaptiveFormats':[{'mimeType':'video/mp4; codecs="avc1.640028"','signatureCipher':'s=SECRET'}]}})
        self.assertEqual(r['ciphered_formats'],1)
        self.assertEqual(r['progressive_avc_aac_candidates'],0)
        self.assertNotIn('SECRET',json.dumps(r))
        r=diagnose_player({'playabilityStatus':{'status':'LOGIN_REQUIRED','reason':'SECRET'}})
        self.assertIn('Service refused',r['next_check'])
        self.assertNotIn('SECRET',json.dumps(r))
        for malformed in ([],{'playabilityStatus':[]},{'streamingData':{'formats':{}}}):
            with self.assertRaises(ValueError):diagnose_player(malformed)


if __name__=='__main__':unittest.main()
