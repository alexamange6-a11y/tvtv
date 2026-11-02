"""Offline audit of the vendor MeeCast phone-control implementation.

The original Romsat eCos image already contains a proprietary UDP service for
phone remote keys and pushed media.  This module records only facts that are
anchored to the supported binary revision and native CK610 instructions.  It
does not open sockets, send LAN packets, expose API-key contents, or claim
compatibility with Google Cast.

The request header between the command name and the length field has not been
fully identified.  Consequently this module deliberately has no packet encoder
or LAN client.  Capturing traffic from the real MeeCast app/device remains a
prerequisite for such a tool.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import struct
import subprocess
from pathlib import Path

from csky import BASE, cstring, half, literal, registrations


ECOS_SHA256 = "64c58484ffaa86996a367c060fcaa46c841f3bcca6d4368b02c17c8b39bf22dc"

COMMAND_TABLE_OFFSET = 0x4ADC98
COMMAND_COUNT = 9
KEYMAP_OFFSET = 0x4ADD38
KEYMAP_COUNT = 0x92

EXPECTED_COMMANDS = (
    ("key", 0x900134FC, 0x90013A88),
    ("play", 0x900136B0, 0x90013A88),
    ("play1", 0x900136B0, 0x90013A88),
    ("text", 0x90013574, 0x90013A88),
    ("scan", 0x90013120, 0x90013A88),
    ("conn", 0x90013124, 0x90013A88),
    ("info", 0x90013128, 0x900141F4),
    ("iptv", 0x90013BEC, 0x9001403C),
    ("apikey", 0x90013438, 0x90013A88),
)

# File offsets, not VMAs.  build.py/analyze.py can pass these to the existing
# GNU C-SKY objdump without duplicating ranges or guessing function boundaries.
DISASSEMBLY_RANGES = {
    "meecast_boot_start": (0x50DF0, 0x50E34),
    "meecast_gui_start": (0x540EE, 0x54152),
    "meecast_thread_start": (0x14510, 0x14624),
    "meecast_command_receive": (0x13ED0, 0x13FB2),
    "meecast_command_handlers": (0x13418, 0x1384E),
    "meecast_discovery_reply": (0x13A88, 0x13B34),
    "meecast_secondary_receive": (0x13324, 0x13408),
    "meecast_player_open": (0x0B078, 0x0B174),
    "meecast_qr_callbacks": (0x17D8C, 0x17F04),
    "meecast_key_queue": (0x265AA8, 0x265B24),
    "meecast_youtube_key_storage": (0x10590, 0x10760),
}


def _expect_literal(ecos: bytes, pc: int, target: int, label: str, *, call: bool = False) -> dict:
    """Require a CK610 PC-relative literal load (and optionally a jsri)."""
    word = half(ecos, pc)
    if word >> 12 != 7 or (call and word & 0xFF00 != 0x7F00):
        raise ValueError(f"{label}: expected CK610 {'jsri' if call else 'lrw'} at {BASE + pc:#x}")
    decoded = literal(ecos, pc)
    if decoded is None or decoded[1] != target:
        got = None if decoded is None else decoded[1]
        raise ValueError(f"{label}: literal target differs ({got!r})")
    return {
        "pc": BASE + pc,
        "target": target,
        "literal_offset": decoded[0],
        "instruction": "jsri" if call else "lrw",
    }


def _bsr_target(ecos: bytes, pc: int) -> int:
    word = half(ecos, pc)
    if word & 0xF800 != 0xF800:
        raise ValueError(f"Expected CK610 bsr at {BASE + pc:#x}")
    immediate = word & 0x7FF
    if immediate & 0x400:
        immediate -= 0x800
    return BASE + pc + 2 + immediate * 2


def _expect_bsr(ecos: bytes, pc: int, target: int, label: str) -> dict:
    got = _bsr_target(ecos, pc)
    if got != target:
        raise ValueError(f"{label}: bsr target differs ({got:#x})")
    return {"pc": BASE + pc, "target": target, "instruction": "bsr"}


def _network_port(stored: int) -> int:
    """Interpret a halfword stored into sockaddr.sin_port on little endian CK610."""
    return struct.unpack(">H", struct.pack("<H", stored & 0xFFFF))[0]


def _port_evidence(ecos: bytes) -> list[dict]:
    rows = (
        ("command_dispatch_receive", 0x13F36, 0xFFFFE849),
        ("command_dispatch_reply", 0x13AE2, 0xFFFFE949),
        ("secondary_receive", 0x13354, 0xFFFFFC49),
        ("secondary_reply", 0x1321A, 0xFFFFFD49),
    )
    result = []
    for role, pc, stored in rows:
        evidence = _expect_literal(ecos, pc, stored, role)
        evidence.update(role=role, stored_halfword=stored & 0xFFFF, port=_network_port(stored))
        result.append(evidence)
    return result


def _command_table(ecos: bytes) -> list[dict]:
    commands = []
    for index in range(COMMAND_COUNT):
        address, parser, reply = struct.unpack_from("<III", ecos, COMMAND_TABLE_OFFSET + index * 12)
        name = cstring(ecos, address)
        expected = EXPECTED_COMMANDS[index]
        if (name, parser, reply) != expected:
            raise ValueError(f"MeeCast command row {index} differs")
        commands.append(
            {
                "index": index,
                "name": name,
                "name_address": address,
                "parser": parser,
                "reply_builder": reply,
            }
        )
    return commands


def _keymap(ecos: bytes) -> tuple[list[dict], dict]:
    mapped = []
    raw = {}
    for index in range(KEYMAP_COUNT):
        remote_id, firmware_key = struct.unpack_from("<HH", ecos, KEYMAP_OFFSET + index * 4)
        # The vendor table skips ID 0x8e; it is searched by ID, not indexed
        # directly. Keep the last four rows as stored in the firmware.
        if remote_id != (index if index < 142 else index + 1):
            raise ValueError(f"MeeCast key-map source ID differs at row {index}")
        raw[remote_id] = firmware_key
        if firmware_key:
            mapped.append({"remote_id": remote_id, "firmware_key": firmware_key})

    required = {
        0x01: 0x68,
        0x02: 0x75,
        0x03: 0x72,
        0x04: 0x76,
        0x05: 0x30,
        0x06: 0x31,
        0x0E: 0x39,
        0x10: 0x0D,
        0x11: 0x111,
        0x12: 0x112,
        0x13: 0x114,
        0x14: 0x113,
        0x15: 0x6D,
    }
    for remote_id, firmware_key in required.items():
        if raw[remote_id] != firmware_key:
            raise ValueError(f"Required MeeCast key mapping {remote_id:#x} differs")
    important = {
        "raw_0x01": raw[0x01],
        "raw_0x02": raw[0x02],
        "raw_0x03": raw[0x03],
        "raw_0x04": raw[0x04],
        "digit_0": raw[0x05],
        "digit_1": raw[0x06],
        "digit_9": raw[0x0E],
        "ok": raw[0x10],
        "up": raw[0x11],
        "down": raw[0x12],
        "right": raw[0x13],
        "left": raw[0x14],
        "back": raw[0x15],
    }
    return mapped, important


def audit_meecast(ecos: bytes) -> dict:
    """Return hash-gated, offline findings for the supported original eCos."""
    digest = hashlib.sha256(ecos).hexdigest()
    if digest != ECOS_SHA256:
        raise ValueError("Unsupported eCos revision")

    startup = [
        _expect_literal(ecos, 0x50E26, 0x90014510, "boot starts MeeCast network tasks", call=True),
        _expect_literal(ecos, 0x54130, 0x900145D4, "GUI init starts MeeCast app service", call=True),
    ]
    threads = [
        {
            "name": cstring(ecos, 0x904BC560),
            "entry": 0x90013ED0,
            "name_load": _expect_literal(ecos, 0x14522, 0x904BC560, "net_play_task name"),
            "entry_load": _expect_literal(ecos, 0x14526, 0x90013ED0, "net_play_task entry"),
            "create_call": _expect_literal(ecos, 0x1452E, 0x900784B8, "net_play_task create", call=True),
        },
        {
            "name": cstring(ecos, 0x904BC570),
            "entry": 0x90013324,
            "name_load": _expect_literal(ecos, 0x14530, 0x904BC570, "net_play_task1 name"),
            "entry_load": _expect_literal(ecos, 0x14534, 0x90013324, "net_play_task1 entry"),
            "create_call": _expect_literal(ecos, 0x1453C, 0x900784B8, "net_play_task1 create", call=True),
        },
        {
            "name": cstring(ecos, 0x904BC73C),
            "entry": 0x9001456C,
            "name_load": _expect_literal(ecos, 0x145EE, 0x904BC73C, "apps_service name"),
            "entry_load": _expect_literal(ecos, 0x145F2, 0x9001456C, "apps_service entry"),
            "create_call": _expect_literal(ecos, 0x145FA, 0x900784B8, "apps_service create", call=True),
        },
    ]
    if [row["name"] for row in threads] != ["net_play_task", "net_play_task1", "apps_service"]:
        raise ValueError("MeeCast task names differ")

    # Anchor the table traversal and the native effects of key/play/apikey.
    code_evidence = {
        "command_table_load": _expect_literal(ecos, 0x13EFE, BASE + COMMAND_TABLE_OFFSET, "command table"),
        "key_enqueue": _expect_literal(ecos, 0x134E0, 0x90265AA8, "system input ring enqueue", call=True),
        "play_opens_meecast_player": _expect_literal(ecos, 0x13658, 0x9000B078, "MeeCast player open", call=True),
        "apikey_deobfuscation": _expect_bsr(ecos, 0x1347C, 0x90013418, "API-key differential XOR"),
        "play_deobfuscation": _expect_bsr(ecos, 0x1375C, 0x90013418, "play payload differential XOR"),
        "apikey_copy": _expect_literal(ecos, 0x13480, 0x90010590, "MeeCast API-key copy", call=True),
        "apikey_persist": _expect_literal(ecos, 0x13482, 0x900106F8, "MeeCast API-key persistence", call=True),
        "qr_window_load": _expect_literal(ecos, 0x559B0, 0x904BCFF4, "MeeCast QR window"),
    }

    if half(ecos, 0x13EEE) != 0x32E2 or half(ecos, 0x13342) != 0x32E2:
        raise ValueError("MeeCast receive-buffer bounds differ")
    if half(ecos, 0x1059E) != 0x67F3:
        raise ValueError("MeeCast API-key copy bound differs")

    commands = _command_table(ecos)
    mapped_keys, important_keys = _keymap(ecos)
    ports = _port_evidence(ecos)

    callbacks = {row["name"]: row["address"] for row in registrations(ecos)}
    expected_callbacks = {
        "app_t2_meecast_qr_create": 0x90017DC8,
        "app_t2_meecast_qr_destroy": 0x90017E68,
        "app_t2_meecast_qr_keypress": 0x90017ED4,
        "app_full_screen_meecast_create": 0x9000B3A0,
        "app_full_screen_meecast_destroy": 0x9000B5A0,
        "app_full_screen_meecast_got_focus": 0x9000B600,
        "app_full_screen_meecast_keypress": 0x9000B3A4,
    }
    if any(callbacks.get(name) != address for name, address in expected_callbacks.items()):
        raise ValueError("MeeCast GUI callback registration differs")

    marker_names = ("CHROMECAST", "CASTV2", "DIAL", "SSDP", "UPNP", "MDNS", "BONJOUR", "AIRPLAY")
    upper = ecos.upper()
    marker_hits = [name for name in marker_names if name.encode("ascii") in upper]

    return {
        "status": "EXISTING_VENDOR_SERVICE_RESEARCH_ONLY",
        "ecos_sha256": digest,
        "architecture": "C-SKY CK610 ABI v1, little endian",
        "network_io_performed": False,
        "modified_firmware_emitted": False,
        "hardware_verified": False,
        "service": {
            "name": "MeeCast",
            "startup_calls": startup,
            "threads": threads,
            "ports": ports,
            "commands": commands,
            "registered_gui_callbacks": expected_callbacks,
            "qr_window": "wnd_meecastqr",
            "player_window": "wnd_full_screen_meecast",
        },
        "remote_keys": {
            "table_address": BASE + KEYMAP_OFFSET,
            "rows": KEYMAP_COUNT,
            "mapped_rows": len(mapped_keys),
            "important_raw_mappings": important_keys,
            "all_mapped_rows": mapped_keys,
            "effect": "Mapped values are enqueued into the firmware system-input ring",
        },
        "pushed_playback": {
            "handler": 0x900136B0,
            "player_open": 0x9000B078,
            "maximum_linked_records": 20,
            "service_compatibility_verified": False,
            "youtube_cast_verified": False,
        },
        "youtube_phone_path": {
            "command": "apikey",
            "handler": 0x90013438,
            "runtime_path": "/home/gx/meecast_youtube_apikey.xml",
            "copy_limit_bytes_excluding_nul": 127,
            "api_key_values_included": False,
            "api_key_values_read": False,
        },
        "payload_bounds": {
            "receive_buffer_bytes": 1 << 14,
            "key_payload_length_field": "big-endian u32 at request offset 12",
            "key_value_location": "request offset 16; 1, 2 or first 4 bytes are decoded",
            "differential_xor": "seed 0xcc; each output byte is current input XOR previous input",
        },
        "code_evidence": code_evidence,
        "wire_codec": {
            "available": False,
            "lan_client_available": False,
            "reason": "Request bytes 4..11, message framing and validation semantics are not fully proven by the audited paths",
            "required_next_evidence": "Packet capture from a real MeeCast app paired with this firmware",
        },
        "standard_cast_protocols": {
            "google_cast_receiver_confirmed": False,
            "ascii_markers_searched": list(marker_names),
            "ascii_markers_found": marker_hits,
            "note": "Marker absence is supporting evidence only; it is not a proof that arbitrary binary protocol code is absent",
        },
    }


def write_findings(ecos: bytes, output: Path) -> dict:
    report = audit_meecast(ecos)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    return report


def emit_disassembly(objdump: Path, ecos_path: Path, output_dir: Path) -> list[Path]:
    """Emit bounded native listings; never executes or modifies the firmware."""
    output_dir.mkdir(parents=True, exist_ok=True)
    written = []
    for name, (start, end) in DISASSEMBLY_RANGES.items():
        result = subprocess.run(
            [
                str(objdump),
                "-D",
                "-b",
                "binary",
                "-m",
                "csky:ck610",
                "-EL",
                "--adjust-vma=0x90000000",
                f"--start-address={BASE + start:#x}",
                f"--stop-address={BASE + end:#x}",
                str(ecos_path),
            ],
            check=True,
            capture_output=True,
            text=True,
        )
        path = output_dir / f"{name}.asm"
        path.write_text(result.stdout, encoding="utf-8")
        written.append(path)
    return written


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description="Offline, hash-gated MeeCast audit; performs no network I/O")
    parser.add_argument("ecos", nargs="?", type=Path, default=root / "inputs/extracted/ecos.bin")
    parser.add_argument("--output", type=Path, help="write findings JSON instead of stdout")
    parser.add_argument("--objdump", type=Path, help="optional local GNU C-SKY objdump")
    parser.add_argument("--disassembly-dir", type=Path, default=root / "build/meecast/disassembly")
    args = parser.parse_args()

    ecos = args.ecos.read_bytes()
    report = audit_meecast(ecos)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    else:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    if args.objdump:
        emit_disassembly(args.objdump, args.ecos, args.disassembly_dir)


if __name__ == "__main__":
    main()
