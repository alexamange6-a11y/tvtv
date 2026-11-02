from pathlib import Path
import json
import sys
import unittest


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

from prepare import prepare
from hook import build_hook, PHONE_WINDOW, STATE
from ck610_vm import MeeCastKeyRunner
from meecast import (
    DISASSEMBLY_RANGES,
    ECOS_SHA256,
    EXPECTED_COMMANDS,
    audit_meecast,
)


class MeeCastTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        inputs = prepare()
        cls.ecos = (inputs / "extracted/ecos.bin").read_bytes()
        cls.report = audit_meecast(cls.ecos)

    def test_hash_gated_native_startup_and_threads(self):
        self.assertEqual(self.report["ecos_sha256"], ECOS_SHA256)
        service = self.report["service"]
        self.assertEqual(
            [item["target"] for item in service["startup_calls"]],
            [0x90014510, 0x900145D4],
        )
        self.assertEqual(
            [(row["name"], row["entry"]) for row in service["threads"]],
            [
                ("net_play_task", 0x90013ED0),
                ("net_play_task1", 0x90013324),
                ("apps_service", 0x9001456C),
            ],
        )

    def test_command_table_and_native_effects(self):
        commands = self.report["service"]["commands"]
        self.assertEqual(
            [(row["name"], row["parser"], row["reply_builder"]) for row in commands],
            list(EXPECTED_COMMANDS),
        )
        evidence = self.report["code_evidence"]
        self.assertEqual(evidence["key_enqueue"]["target"], 0x90265AA8)
        self.assertEqual(evidence["play_opens_meecast_player"]["target"], 0x9000B078)
        self.assertEqual(evidence["apikey_copy"]["target"], 0x90010590)
        self.assertEqual(evidence["apikey_persist"]["target"], 0x900106F8)

    def test_key_mapping_is_raw_and_complete(self):
        remote = self.report["remote_keys"]
        self.assertEqual(remote["rows"], 0x92)
        keys = remote["important_raw_mappings"]
        self.assertEqual(keys["raw_0x01"], 0x68)
        self.assertEqual(keys["digit_0"], ord("0"))
        self.assertEqual(keys["digit_1"], ord("1"))
        self.assertEqual(keys["digit_9"], ord("9"))
        self.assertEqual(
            [keys[name] for name in ("ok", "up", "down", "right", "left", "back")],
            [0x0D, 0x111, 0x112, 0x114, 0x113, 0x6D],
        )
        mapped = {row["remote_id"]: row["firmware_key"] for row in remote["all_mapped_rows"]}
        self.assertEqual(mapped[0x01], 0x68)
        self.assertNotIn(0, mapped)

    def test_ports_bounds_and_wire_client_are_conservative(self):
        ports = {row["role"]: row["port"] for row in self.report["service"]["ports"]}
        self.assertEqual(
            ports,
            {
                "command_dispatch_receive": 18920,
                "command_dispatch_reply": 18921,
                "secondary_receive": 18940,
                "secondary_reply": 18941,
            },
        )
        self.assertEqual(self.report["payload_bounds"]["receive_buffer_bytes"], 16384)
        self.assertFalse(self.report["wire_codec"]["available"])
        self.assertFalse(self.report["wire_codec"]["lan_client_available"])
        self.assertFalse(self.report["network_io_performed"])

    def test_youtube_path_reports_no_key_material(self):
        phone = self.report["youtube_phone_path"]
        self.assertEqual(phone["runtime_path"], "/home/gx/meecast_youtube_apikey.xml")
        self.assertEqual(phone["copy_limit_bytes_excluding_nul"], 127)
        self.assertFalse(phone["api_key_values_included"])
        encoded = json.dumps(self.report)
        self.assertNotIn("No YouTube API key!", encoded)
        self.assertFalse(self.report["pushed_playback"]["youtube_cast_verified"])

    def test_original_phone_parser_drives_actual_menu_instructions(self):
        hook,_ = build_hook()
        # IDs and byte widths pass through the original CK610 byte parser and
        # 146-row key mapper. Queue delivery and final platform calls are stubs.
        for width in (1,2,4):
            for remote_id, key, selected, resulting in ((0x13,0x114,1,2),
                                                        (0x14,0x113,1,0),
                                                        (0x05,48,1,1)):
                vm=MeeCastKeyRunner(self.ecos,hook,remote_id,selected,width).run()
                self.assertEqual(vm.calls[0]['key'],key)
                self.assertEqual(vm.load(STATE,4),resulting)
                if remote_id == 0x05:
                    self.assertEqual(vm.calls[-1]['target'],0x9024df6c)
                    self.assertEqual(vm.calls[-1]['args'][0],PHONE_WINDOW)
        vm=MeeCastKeyRunner(self.ecos,hook,0x10,selected=1,native_dispatch=True).run()
        self.assertEqual(vm.calls[0]['key'],13)
        self.assertIn(0x90012f1c,[c['target'] for c in vm.calls])

    def test_wrong_revision_is_rejected_and_ranges_are_bounded(self):
        changed = bytearray(self.ecos)
        changed[0] ^= 1
        with self.assertRaisesRegex(ValueError, "Unsupported eCos revision"):
            audit_meecast(bytes(changed))
        for start, end in DISASSEMBLY_RANGES.values():
            self.assertGreaterEqual(start, 0)
            self.assertGreater(end, start)
            self.assertLessEqual(end, len(self.ecos))


if __name__ == "__main__":
    unittest.main()
