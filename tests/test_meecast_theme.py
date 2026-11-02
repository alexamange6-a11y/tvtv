from pathlib import Path
import sys
import tempfile
import unittest
import xml.etree.ElementTree as ET


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'tools'))

from formats import Firmware, Cramfs
from meecast_theme import (create_meecast_theme, render_preview, WINDOW,
                           LANGUAGES, TRANSLATIONS, TITLE, STEP_WIFI,
                           STEP_RECEIVER, STEP_SERVICE)
from prepare import prepare
from theme import create_theme
from youtube_theme import create_youtube_theme


class MeeCastThemeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.inputs = prepare()
        cls.original_path = cls.inputs / 'extracted/cramfs' / WINDOW
        cls.original = ET.parse(cls.original_path).getroot()
        cls.base = create_theme(cls.inputs)
        cls.youtube = create_youtube_theme(cls.inputs, cls.base)
        cls.existing = {**cls.base, **cls.youtube}
        cls.overlay = create_meecast_theme(cls.inputs, cls.existing)

    def test_native_widget_and_signal_contracts_are_unchanged(self):
        updated = ET.fromstring(self.overlay[WINDOW])
        self.assertEqual([(w.get('name'), w.get('class'))
                          for w in self.original.iter('widget')],
                         [(w.get('name'), w.get('class'))
                          for w in updated.iter('widget')])
        self.assertEqual([ET.tostring(s) for s in self.original.iter('signal')],
                         [ET.tostring(s) for s in updated.iter('signal')])
        old = {w.get('name'): w for w in self.original.iter('widget')}
        new = {w.get('name'): w for w in updated.iter('widget')}
        for name in ('button_meecast_name', 'txt_t2_meecast_exit',
                     'img_meecast_exit'):
            self.assertEqual(old[name].findtext('./property/state'),
                             new[name].findtext('./property/state'))
        for name in ('txt_meecastqr_info_android', 'txt_meecastqr_info_ios'):
            self.assertEqual(old[name].findtext('./property/string'), '')
            self.assertEqual(new[name].findtext('./property/string'), '')

    def test_layout_is_bounded_and_uses_real_store_icons(self):
        updated = ET.fromstring(self.overlay[WINDOW])
        widgets = {w.get('name'): w for w in updated.iter('widget')}
        for widget in updated.iter('widget'):
            rect = widget.findtext('./property/rect')
            if rect is None:
                continue
            x, y, width, height = map(int, rect.strip('[]').split(','))
            self.assertGreaterEqual(min(x, y, width, height), 0, widget.get('name'))
            self.assertLessEqual(x + width, 1024, widget.get('name'))
            self.assertLessEqual(y + height, 576, widget.get('name'))
        self.assertEqual(widgets['img_meecastqr_qr_android'].findtext('./property/img'),
                         'google_play.bmp')
        self.assertEqual(widgets['img_meecastqr_qr_ios'].findtext('./property/img'),
                         'app_store.bmp')
        self.assertNotIn('qr', ''.join((w.findtext('./property/string') or '')
                                       for w in updated.iter('widget')).lower())

    def test_static_instructions_have_three_exact_translations(self):
        updated = ET.fromstring(self.overlay[WINDOW])
        strings = {w.get('name'): w.findtext('./property/string')
                   for w in updated.iter('widget')}
        self.assertEqual(strings['txt_meecastqr_title'], TITLE)
        self.assertEqual(strings['txt_meecastqr_net'], STEP_WIFI)
        self.assertEqual(strings['txt_meecast_name'], STEP_RECEIVER)
        self.assertEqual(strings['txt_t2_meecast_input'], STEP_SERVICE)
        for language, path in LANGUAGES.items():
            root = ET.fromstring(self.overlay[path])
            for identifier, translation in TRANSLATIONS[language].items():
                matches = [node for node in root.findall('tran')
                           if node.get('id') == identifier]
                self.assertEqual(len(matches), 1, (language, identifier))
                self.assertEqual(matches[0].text, translation)

    def test_combined_cramfs_still_fits_without_new_assets(self):
        combined = {**self.existing, **self.overlay}
        firmware = Firmware((self.inputs / 'firmware/original_firmware.bin').read_bytes())
        rebuilt = Cramfs(firmware.cramfs.repack(combined, allow_additions=True))
        self.assertLessEqual(rebuilt.size, firmware.by_name['ROOT']['capacity'])
        self.assertEqual(set(self.overlay), {WINDOW, *LANGUAGES.values()})
        self.assertEqual(len(rebuilt.files), 438)

    def test_preview_is_explicitly_separate_from_firmware_overlay(self):
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / 'meecast_preview.png'
            render_preview(self.inputs, self.overlay, destination)
            self.assertTrue(destination.is_file())
            self.assertGreater(destination.stat().st_size, 1000)
            self.assertNotIn(str(destination), self.overlay)


if __name__ == '__main__':
    unittest.main()
