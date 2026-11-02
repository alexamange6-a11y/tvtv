"""Evidence extraction for C-SKY CK610 ABI v1 (NOT MIPS).

Only decode instruction forms needed for literal/registration cross-references.
Full function listings are produced by GNU C-SKY objdump, not guessed here.
"""
import re
import struct

BASE = 0x90000000
REGISTER_FUNCTION = 0x9024ec58


def half(blob, off):
    return struct.unpack_from('<H', blob, off)[0]


def literal(blob, pc):
    word = half(blob, pc)
    if word >> 12 != 7:
        return None
    off = (pc + 2 + (word & 255) * 4) & ~3
    if off + 4 > len(blob):
        return None
    return off, struct.unpack_from('<I', blob, off)[0]


def cstring(blob, address):
    offset = address - BASE
    if not 0 <= offset < len(blob):
        return None
    end = blob.find(b'\0', offset, min(offset + 160, len(blob)))
    if end < 0:
        return None
    try:
        return blob[offset:end].decode('ascii')
    except UnicodeDecodeError:
        return None


def registrations(blob):
    """Match actual lrw/lrw/mov/mov/jsri register(name, callback) sequences.

    The pointers alone do not qualify as entrypoints. Require the code sequence,
    the common registration call, a C identifier and an even in-image callback.
    """
    rows = []
    for pc in range(0, 0x100000 - 10, 2):
        if half(blob, pc) & 0xff00 != 0x7c00 or half(blob, pc+2) & 0xff00 != 0x7d00:
            continue
        if blob[pc+4:pc+8] != bytes.fromhex('c2 12 d3 12') or half(blob, pc+8) & 0xff00 != 0x7f00:
            continue
        name_load, callback_load, call = (literal(blob, pc+d) for d in (0, 2, 8))
        if not all((name_load, callback_load, call)) or call[1] != REGISTER_FUNCTION:
            continue
        name = cstring(blob, name_load[1])
        callback = callback_load[1]
        if not name or not re.fullmatch(r'[A-Za-z_]\w*', name):
            continue
        if not BASE <= callback < BASE + 0x4a0000 or callback & 1:
            continue
        rows.append(dict(name=name, address=callback, file_offset=callback-BASE,
                         registration_pc=pc+BASE, name_address=name_load[1],
                         name_literal_offset=name_load[0], callback_literal_offset=callback_load[0],
                         register_function=call[1], first_16_bytes=blob[callback-BASE:callback-BASE+16].hex(),
                         evidence='lrw r12/name; lrw r13/callback; mov r2/r12; mov r3/r13; jsri registration',
                         hardware_verified=False))
    return rows


def direct_calls(blob, start, end):
    """Candidates only: caller must exclude embedded literal pools/data."""
    calls = []
    for pc in range(start, end, 2):
        word = half(blob, pc)
        if word & 0xff00 == 0x7f00:
            pool, target = literal(blob, pc)
            calls.append(dict(pc=pc+BASE, target=target, literal_offset=pool, kind='jsri'))
        elif word & 0xf800 == 0xf800:
            imm = word & 0x7ff
            if imm & 0x400:
                imm -= 0x800
            calls.append(dict(pc=pc+BASE, target=pc+BASE+2+imm*2, kind='bsr'))
    return calls
