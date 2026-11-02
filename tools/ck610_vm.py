"""Small fail-closed CK610 runner for the callback and selected native paths.

External GUI/app calls are explicitly stubbed and recorded. This is an opcode
test harness, not an eCos/device emulator and not proof of a working firmware.
"""
import struct
from csky import BASE
from hook import START, STATE, SET_PROPERTY, WINDOW_KEY


class Runner:
    def __init__(self, ecos, hook, selected=0, key=13, event_type=2, native_dispatch=False, youtube_preference=0):
        self.rom = ecos
        self.overlay = {}
        self.r = [0] * 16
        for i in range(8,15): self.r[i] = 0xaabb0000+i
        self.r[0] = 0x92010000
        self.r[3] = 0x92000000
        self.r[15] = 0xdeadbeee
        self.initial_registers = self.r.copy()
        self.pc, self.carry, self.calls, self.steps = START, False, [], 0
        self.native_dispatch = native_dispatch
        self.youtube_preference = youtube_preference
        self.list_selection = 0
        self.write(START, hook)
        self.store(STATE, selected, 4)
        self.store(self.r[3], event_type, 1)
        self.store(self.r[3]+8, key, 2)

    def write(self, addr, data):
        for i,b in enumerate(data): self.overlay[addr+i] = b

    def read(self, addr, count):
        result = []
        for a in range(addr, addr+count):
            if a in self.overlay: result.append(self.overlay[a])
            elif BASE <= a < BASE+len(self.rom): result.append(self.rom[a-BASE])
            elif 0x90640000 <= a < 0x90900000 or 0x92000000 <= a < 0x92020000: result.append(0)
            else: raise ValueError(f'Unmapped read {a:#x}')
        return bytes(result)

    def load(self, addr, count): return int.from_bytes(self.read(addr,count),'little')
    def store(self, addr, value, count): self.write(addr, (value & ((1 << count*8)-1)).to_bytes(count,'little'))

    def stub(self, target):
        allowed = {0x9005577c, SET_PROPERTY, 0x900557a8, 0x90024dd8,
                   0x9024df6c, WINDOW_KEY, 0x9024e63c, 0x9004274c,
                   0x9024e49c,0x900d2fa0,0x90381b4c,0x90010a1c,0x90012f1c,
                   0x900077e4,0x90008118,0x900118a0}
        if target not in allowed: raise ValueError(f'Unstubbed call {target:#x}')
        call = dict(target=target, args=self.r[2:8])
        if target == SET_PROPERTY and self.r[2] == 0x904b8740:
            call['select'] = self.load(self.r[4],4)
            self.list_selection = call['select']
        if target == WINDOW_KEY:
            call['key'] = self.load(self.r[3]+8,2)
        self.calls.append(call)
        if self.native_dispatch and target in (0x9005577c,0x900557a8):
            self.pc = target
            return
        result = 0xcccc0002
        if target == 0x9024e49c:
            if (self.r[2], self.r[3]) != (0x904b8740,0x904ef288):
                raise ValueError('Unexpected native property read')
            self.store(self.r[4],self.list_selection,4)
            result = 0
        elif target == 0x900d2fa0:
            def string(addr):
                out = bytearray()
                while self.load(addr,1):
                    out.append(self.load(addr,1)); addr += 1
                    if len(out) > 100: raise ValueError('Unterminated native string')
                return bytes(out)
            result = 0 if string(self.r[2]) == string(self.r[3]) else 1
        elif target == 0x90381b4c:
            self.store(self.r[3],self.youtube_preference,4)
            result = 0
        # ABI caller-saved registers cannot be relied on after a call.
        for i in range(2,8): self.r[i] = 0xcccc0000+i
        self.r[2] = result

    def run(self):
        while self.pc != 0xdeadbeee:
            self.steps += 1
            if self.steps > 2000: raise ValueError('Instruction budget exceeded')
            pc = self.pc
            word = self.load(pc,2)
            self.pc += 2
            lo, hi = word & 15, (word >> 4) & 15
            top = word >> 12
            if word & 0xff00 == 0x1200:
                self.r[lo] = self.r[hi]
            elif word & 0xfff0 == 0x0160:
                self.r[lo] &= 0xffff
            elif word & 0xf800 == 0x6000:
                self.r[lo] = (word >> 4) & 127
            elif word & 0xfe00 in (0x2000,0x2400):
                value = ((word >> 4) & 31) + 1
                self.r[lo] += value if word & 0xfe00 == 0x2000 else -value
            elif word & 0xfe00 == 0x2a00:
                self.carry = self.r[lo] != ((word >> 4) & 31)
            elif word & 0xff00 in (0x0f00,0x0c00):
                self.carry = (self.r[lo] != self.r[hi] if word & 0xff00 == 0x0f00
                              else self.r[lo] >= self.r[hi])
            elif word & 0xff00 == 0x1c00:
                self.r[lo] += self.r[hi]
            elif word & 0xff00 == 0x1e00:
                self.r[lo] |= self.r[hi]
            elif word & 0xfe00 == 0x3c00:
                self.r[lo] <<= (word >> 4) & 31
            elif top == 7:
                pool = (pc+2+(word & 255)*4) & ~3
                value = self.load(pool,4)
                reg = (word >> 8) & 15
                if reg == 15:
                    self.r[15] = self.pc
                    self.stub(value)
                else: self.r[reg] = value
            elif top in (8,9,10,11,12,13):
                reg = (word >> 8) & 15
                size = {8:4,9:4,10:1,11:1,12:2,13:2}[top]
                addr = self.r[lo] + hi*size
                if top & 1: self.store(addr,self.r[reg],size)
                else: self.r[reg] = self.load(addr,size)
            elif word & 0xf800 in (0xe000,0xe800,0xf000):
                delta = word & 0x7ff
                if delta & 0x400: delta -= 0x800
                kind = word & 0xf800
                if kind == 0xf000 or (self.carry if kind == 0xe000 else not self.carry):
                    self.pc = pc+2+delta*2
            elif word & 0xf800 == 0xf800:
                delta = word & 0x7ff
                if delta & 0x400: delta -= 0x800
                self.r[15] = self.pc
                self.pc = pc+2+delta*2
            elif word & 0xfff0 == 0x00c0:
                self.pc = self.r[lo]
            else: raise ValueError(f'Unsupported opcode {word:#06x} at {pc:#x}')
            self.r = [r & 0xffffffff for r in self.r]
        if self.r[0] != self.initial_registers[0] or self.r[8:15] != self.initial_registers[8:15]:
            raise ValueError('Callback corrupts stack/callee-saved registers')
        return self


class MeeCastKeyRunner(Runner):
    """Execute the native payload parser/map, then the new menu callback.

    The native UDP receive loop and system event queue are outside this runner.
    Only the queue insertion is replaced by synchronous delivery to the menu,
    so this verifies key compatibility without claiming real network delivery.
    """
    def __init__(self, ecos, hook, remote_id, selected=0, payload_width=1, native_dispatch=False):
        super().__init__(ecos,hook,selected,native_dispatch=native_dispatch)
        if payload_width not in (1,2,4): raise ValueError('Unsupported key payload width')
        self.pc = 0x900134fc
        self.r[2] = 0x92000100
        self.r[3] = 16+payload_width
        # Only the fields read by this native handler are initialized. This is
        # an offline payload fixture, NOT an encoded MeeCast network packet.
        self.write(self.r[2]+12,payload_width.to_bytes(4,'big'))
        self.write(self.r[2]+16,remote_id.to_bytes(payload_width,'big'))

    def stub(self,target):
        if target == 0x90013108:
            self.pc = target  # execute the original big-endian u32 decoder
        elif target == 0x90265aa8:
            self.calls.append(dict(target=target,args=self.r[2:8],key=self.r[2]))
            self.store(0x92000008,self.r[2],2)
            self.r[3] = 0x92000000
            self.pc = START
        else:
            super().stub(target)
