"""Experimental native CK610 list-key callback, bounded to the old callback.

Emits actual CK610 instructions, not a PC-only menu model. It is NOT installed
into eCos or a flash BIN. GUI/service calls require device-side validation.
"""
import struct
import hashlib
from csky import BASE

START = 0x900261a8
LIMIT = 0x900265c0
STATE = 0x9064a734
SET_PROPERTY = 0x9024e25c
FLUSH = 0x9024e63c
NATIVE_DISPATCH = 0x900557a8
WINDOW_KEY = 0x90025ed8
PHONE_KEY = 48  # GUIK_0, also reachable through the native MeeCast key map
PHONE_WINDOW = 0x904bcff4  # wnd_meecastqr; native dispatcher loads it at 0x900559b0
CREATE_TAIL = 0x90025d48


class Assembler:
    def __init__(self, base=START):
        self.base, self.words, self.labels, self.fixups, self.literals = base, [], {}, [], []

    def emit(self, word):
        self.words.append(word)

    def label(self, name):
        if name in self.labels:
            raise ValueError('Duplicate label')
        self.labels[name] = self.base + len(self.words)*2

    def mov(self, dst, src): self.emit(0x1200 | src << 4 | dst)
    def imm(self, reg, value):
        if not 0 <= value < 128: raise ValueError('movi range')
        self.emit(0x6000 | value << 4 | reg)

    def addi(self, reg, value):
        if not 1 <= abs(value) <= 32: raise ValueError('addi range')
        self.emit((0x2000 if value > 0 else 0x2400) | (abs(value)-1) << 4 | reg)

    def cmpi(self, reg, value):
        if not 0 <= value < 32: raise ValueError('cmpnei range')
        self.emit(0x2a00 | value << 4 | reg)

    def cmp(self, a, b): self.emit(0x0f00 | b << 4 | a)
    def hs(self, a, b): self.emit(0x0c00 | b << 4 | a)
    def add(self, dst, src): self.emit(0x1c00 | src << 4 | dst)
    def shl(self, reg, count): self.emit(0x3c00 | count << 4 | reg)

    def mem(self, kind, reg, base, offset=0):
        scale = {'ldw':4, 'stw':4, 'ldh':2, 'sth':2, 'ldb':1, 'stb':1}[kind]
        opcode = {'ldw':0x8000, 'stw':0x9000, 'ldh':0xc000, 'sth':0xd000,
                  'ldb':0xa000, 'stb':0xb000}[kind]
        if offset % scale or not 0 <= offset//scale < 16: raise ValueError('memory offset')
        self.emit(opcode | reg << 8 | (offset//scale) << 4 | base)

    def literal(self, reg, value):
        idx = len(self.words)
        self.emit(0x7000 | reg << 8)
        self.fixups.append(('literal', idx, value))
        if value not in self.literals: self.literals.append(value)

    def call(self, target): self.literal(15, target)

    def branch(self, kind, label):
        idx = len(self.words)
        self.emit({'bt':0xe000, 'bf':0xe800, 'br':0xf000}[kind])
        self.fixups.append(('branch', idx, label))

    def finish(self):
        if (self.base + len(self.words)*2) % 4: self.emit(0x1200)
        pool_start = self.base + len(self.words)*2
        words = self.words.copy()
        for kind, idx, value in self.fixups:
            pc = self.base + idx*2
            if kind == 'branch':
                delta = self.labels[value] - (pc+2)
                if delta % 2 or not -1024 <= delta//2 <= 1023: raise ValueError('Branch out of range')
                words[idx] |= (delta//2) & 0x7ff
            else:
                addr = pool_start + self.literals.index(value)*4
                delta = (addr - ((pc+2)&~3))//4
                if not 0 <= delta <= 255: raise ValueError('Literal out of range')
                words[idx] |= delta
        data = struct.pack('<'+'H'*len(words), *words)
        data += struct.pack('<'+'I'*len(self.literals), *self.literals)
        if self.base + len(data) > LIMIT: raise ValueError('Hook exceeds old function envelope')
        return data


def build_hook():
    a = Assembler()
    a.addi(0, -32)
    for r in range(8,16): a.mem('stw', r, 0, (r-8)*4)
    a.mov(13,3)
    a.mem('ldb',7,13)
    a.cmpi(7,2); a.branch('bt','unhandled')
    a.literal(14,STATE); a.mem('ldw',8,14)
    a.imm(7,5); a.hs(7,8); a.branch('bt','valid')
    a.imm(8,0)
    a.label('valid')
    a.mem('ldh',6,13,8)
    a.literal(7,PHONE_KEY); a.cmp(6,7); a.branch('bf','phone')
    a.cmpi(6,13); a.branch('bf','activate')
    a.literal(7,0x113); a.cmp(6,7); a.branch('bf','left')
    a.literal(7,0x114); a.cmp(6,7); a.branch('bf','right')
    a.branch('br','unhandled')
    a.label('left')
    a.cmpi(8,0); a.branch('bf','paint')
    a.addi(8,-1); a.branch('br','paint')
    a.label('right')
    a.cmpi(8,5); a.branch('bf','paint')
    a.addi(8,1); a.branch('br','paint')
    a.label('activate')
    a.mem('stw',8,14)
    a.cmpi(8,0); a.branch('bf','tv')
    a.cmpi(8,4); a.branch('bf','media')
    a.cmpi(8,5); a.branch('bf','settings')
    # Preserve the manufacturer's YouTube client choice, IPTV preparation and
    # MEGOGO setup by routing through the existing native USB/app dispatcher.
    a.call(0x9005577c)  # initialize native app-name array
    a.literal(7,0x90651640); a.imm(6,0)
    a.mem('stb',6,7); a.mem('stb',6,7,1)
    a.imm(6,1); a.mem('stb',6,7,2)
    a.cmpi(8,1); a.branch('bf','youtube')
    a.cmpi(8,2); a.branch('bf','megogo')
    a.imm(6,2); a.branch('br','network')
    a.label('youtube'); a.imm(6,1); a.branch('br','network')
    a.label('megogo'); a.imm(6,3)
    a.label('network')
    # Native list-property select expects a pointer to a 32-bit index.
    a.addi(0,-8); a.mem('stw',6,0)
    a.literal(2,0x904b8740); a.literal(3,0x904ef288); a.mov(4,0)
    a.call(SET_PROPERTY)
    a.imm(2,13); a.call(NATIVE_DISPATCH)
    a.addi(0,8); a.branch('br','handled')
    a.label('media'); a.call(0x90024dd8); a.branch('br','handled')
    a.label('settings')
    a.literal(2,0x904bd964); a.call(0x9024df6c); a.branch('br','handled')
    a.label('phone')
    a.literal(2,PHONE_WINDOW); a.call(0x9024df6c); a.branch('br','handled')
    a.label('tv')
    # Reuse the original parent-window exit path, rather than bypassing cleanup.
    a.imm(7,109); a.mem('sth',7,13,8)
    a.mov(3,13); a.call(WINDOW_KEY)
    a.imm(7,13); a.mem('sth',7,13,8); a.branch('br','handled')
    a.label('paint')
    emit_paint(a)
    a.label('handled'); a.imm(2,0); a.branch('br','return')
    # EXIT/BACK and other keys propagate to the existing window keypress.
    a.label('unhandled'); a.imm(2,1)
    a.label('return')
    for r in reversed(range(8,16)): a.mem('ldw',r,0,(r-8)*4)
    a.addi(0,32); a.emit(0x00cf)
    return a.finish(), a.labels


def emit_paint(a):
    """r8 = selected tile, r14 = STATE pointer; preserve both through calls."""
    a.mem('stw',8,14)
    a.literal(10,0x905637b4); a.literal(11,0x905637ec); a.literal(12,0x905637d0)
    a.imm(9,0)
    a.label('loop')
    a.mov(6,9); a.shl(6,2)
    a.mov(7,10); a.add(7,6); a.mem('ldw',2,7)
    a.mov(7,11); a.cmp(9,8); a.branch('bt','image')
    a.mov(7,12)
    a.label('image')
    a.add(7,6); a.mem('ldw',4,7)
    a.literal(3,0x904f5eb4); a.call(SET_PROPERTY)
    a.addi(9,1); a.cmpi(9,6); a.branch('bt','loop')
    a.literal(2,0x904b872c); a.imm(3,0); a.call(FLUSH)


def build_create_hook(ecos):
    """Replace only original create's movi r2,0 with bsr to a finalizer.

    All original create/cleanup work still executes. The new finalizer lives
    after the new key callback, inside the now-replaced old key function.
    This does not write an eCos or BIN file.
    """
    if ecos[CREATE_TAIL-BASE:CREATE_TAIL-BASE+2] != bytes.fromhex('0260'):
        raise ValueError('Unexpected original create epilogue')
    if hashlib.sha256(ecos).hexdigest() != '64c58484ffaa86996a367c060fcaa46c841f3bcca6d4368b02c17c8b39bf22dc':
        raise ValueError('Unsupported eCos revision for create finalizer')
    hook,_ = build_hook()
    start=START+len(hook)
    delta=start-(CREATE_TAIL+2)
    if delta%2 or not -1024<=delta//2<=1023:
        raise ValueError('Create finalizer BSR out of range')
    branch=struct.pack('<H',0xf800|((delta//2)&0x7ff))
    a=Assembler(base=start)
    a.addi(0,-32)
    for r in range(8,16):a.mem('stw',r,0,(r-8)*4)
    a.literal(14,STATE);a.mem('ldw',8,14)
    a.imm(7,5);a.hs(7,8);a.branch('bt','valid')
    a.imm(8,0)
    a.label('valid')
    # Eliminate old nested-category flags and list selection before focusing.
    a.literal(7,0x90651640);a.imm(6,0)
    for offset in range(5):a.mem('stb',6,7,offset)
    a.literal(7,0x9064a730);a.mem('stw',6,7)
    a.literal(7,0x9064a73c);a.imm(6,1);a.mem('stw',6,7)
    a.literal(2,0x904b8740);a.literal(3,0x904ef288);a.literal(4,0x9064a730)
    a.call(SET_PROPERTY)
    # Original create may re-show the old seventh category or activation hint.
    for widget in (0x904bfa08,0x904bf880):
        a.literal(2,widget);a.literal(3,0x904f5d18);a.literal(4,0x904b8454)
        a.call(SET_PROPERTY)
    a.literal(2,0x904b8740);a.call(0x9024e524)
    emit_paint(a)
    a.imm(2,0)
    for r in reversed(range(8,16)): a.mem('ldw',r,0,(r-8)*4)
    a.addi(0,32); a.emit(0x00cf)
    code_end=a.base+len(a.words)*2
    binary=a.finish()
    return binary,dict(address=start,length=len(binary),envelope_end=LIMIT,
                       code_end=code_end,
                       branch_pc=CREATE_TAIL,original_branch_bytes='0260',
                       replacement_branch_bytes=branch.hex(),
                       original_helper_bytes=ecos[start-BASE:start-BASE+len(binary)].hex(),
                       replacement_helper_bytes=binary.hex(),hardware_verified=False)
