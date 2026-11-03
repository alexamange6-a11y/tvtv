"""Small fail-closed CK610 runner for the callback and selected native paths.

External GUI/app calls are explicitly stubbed and recorded. This is an opcode
test harness, not an eCos/device emulator and not proof of a working firmware.
"""
import struct
from csky import BASE
from hook import START, STATE, SET_PROPERTY, WINDOW_KEY


class Runner:
    max_steps = 2000
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
                   0x900077e4,0x90008118,0x900118a0,0x9024e524}
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

    def run(self, stop_at=()):
        while self.pc != 0xdeadbeee and self.pc not in stop_at:
            self.steps += 1
            if self.steps > self.max_steps: raise ValueError('Instruction budget exceeded')
            pc = self.pc
            word = self.load(pc,2)
            self.pc += 2
            lo, hi = word & 15, (word >> 4) & 15
            top = word >> 12
            if word & 0xff00 == 0x1200:
                self.r[lo] = self.r[hi]
            elif word & 0xff00 in (0x0200,0x0a00):
                if self.carry == (word & 0xff00 == 0x0200):
                    self.r[lo] = self.r[hi]
            elif word & 0xfff0 == 0x0160:
                self.r[lo] &= 0xffff
            elif word & 0xfff0 == 0x01f0:
                self.r[lo] = ~self.r[lo]
            elif word & 0xfff0 in (0x0110,0x0120):
                self.r[1] = (self.r[lo] >> (8 if word & 0xfff0 == 0x0110 else 16)) & 255
            elif word & 0xf800 == 0x6000:
                self.r[lo] = (word >> 4) & 127
            elif word & 0xfe00 in (0x2000,0x2400):
                value = ((word >> 4) & 31) + 1
                self.r[lo] += value if word & 0xfe00 == 0x2000 else -value
            elif word & 0xfe00 == 0x2a00:
                self.carry = self.r[lo] != ((word >> 4) & 31)
            elif word & 0xfff0 == 0x2c10:
                if not self.r[1]: raise ValueError('Unsigned division by zero')
                self.r[lo] //= self.r[1]
            elif word & 0xfe00 == 0x2c00:
                count=(word>>4)&31
                self.r[lo]=(1<<count)-1 if count else 0xffffffff
            elif word & 0xfe00 == 0x2e00:
                self.r[lo] &= (word>>4)&31
            elif word & 0xfe00 == 0x3200:
                self.r[lo] = 1<<((word>>4)&31)
            elif word & 0xfe00 == 0x3400:
                self.r[lo] |= 1<<((word>>4)&31)
            elif word & 0xff00 in (0x0f00,0x0c00):
                self.carry = (self.r[lo] != self.r[hi] if word & 0xff00 == 0x0f00
                              else self.r[lo] >= self.r[hi])
            elif word & 0xff00 == 0x1c00:
                self.r[lo] += self.r[hi]
            elif word & 0xff00 == 0x1e00:
                self.r[lo] |= self.r[hi]
            elif word & 0xff00 == 0x1700:
                self.r[lo] ^= self.r[hi]
            elif word & 0xff00 == 0x1600:
                self.r[lo] &= self.r[hi]
            elif word & 0xff00 == 0x0500:
                self.r[lo] -= self.r[hi]
            elif word & 0xfe00 == 0x3c00:
                self.r[lo] <<= (word >> 4) & 31
            elif word & 0xfe00 == 0x3e00:
                self.r[lo] >>= (word >> 4) & 31
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
        if self.pc == 0xdeadbeee and (self.r[0] != self.initial_registers[0] or self.r[8:15] != self.initial_registers[8:15]):
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


class CreateTailRunner(Runner):
    """Execute the patched original create epilogue and finalizer.

    Entry assumes earlier native create code already ran. GUI calls are stubs;
    this does not model the complete creation or asynchronous event lifecycle.
    """
    def __init__(self,ecos,hook,helper,patch,selected=0):
        super().__init__(ecos,hook,selected)
        self.write(patch['address'],helper)
        self.write(patch['branch_pc'],bytes.fromhex(patch['replacement_branch_bytes']))
        self.pc=patch['branch_pc']
        self.r[0]-=24
        for offset,reg in ((8,13),(12,14),(16,15)):
            self.store(self.r[0]+offset,self.initial_registers[reg],4)
        for offset in range(5):self.store(0x90651640+offset,1,1)
        self.store(0x9064a730,7,4)
        self.store(0x9064a73c,0,4)


class NativeCRCRunner(Runner):
    """Execute the original pure CRC32 function, including its lookup tables.

    This path makes no GUI/OS calls and uses no service stubs. It still covers
    only these CK610 instruction forms; it is not a full CPU/device emulator.
    """
    max_steps = 100000

    def __init__(self,ecos,data,seed=0,alignment=0):
        if len(data)>16384 or alignment not in (0,1,2,3):
            raise ValueError('CRC test buffer limit/alignment')
        super().__init__(ecos,b'')
        self.pc=0x900ccbcc
        self.r[2]=seed&0xffffffff
        self.r[3]=0x92000100+alignment
        self.r[4]=len(data)
        self.write(self.r[3],data)

    def stub(self,target):
        raise ValueError(f'CRC path unexpectedly calls an external function: {target:#x}')


class HeaderCRCRunner(Runner):
    """Execute the USB validator's original CRC call and comparison block.

    Entry assumes the header was read and its stored BE CRC decoded by earlier
    code. File I/O, parsing, OEM checks and the flash writer are NOT executed.
    The CRC function and lookup tables execute without substitution or stubs.
    """
    max_steps = 100000
    SUCCESS = 0x9002eb3e
    FAILURE = 0x9002ee20

    def __init__(self, ecos, header):
        if len(header) != 512:
            raise ValueError('Expected a 512-byte header')
        super().__init__(ecos,b'')
        self.pc=0x9002eb26
        self.write(self.r[0]+0x88,header)
        self.store(self.r[0]+0x4ac,int.from_bytes(header[508:512],'big'),4)

    def stub(self,target):
        if target != 0x900ccbcc:
            raise ValueError(f'Unexpected USB CRC block call: {target:#x}')
        self.pc=target

    def run(self):
        super().run(stop_at=(self.SUCCESS,self.FAILURE))
        self.header_crc_matches=self.pc==self.SUCCESS
        return self


class BootFlashLoopRunner(Runner):
    """Execute only the original recovery range setup and erase/write loop.

    All SPI/display/log calls are recorded stubs. No device, file reader or
    flash contents are emulated, read or written by these calls.
    """
    max_steps=10000
    BUFFER=0x94000000
    END=0x93f72496

    def __init__(self, firmware):
        super().__init__(b'',b'')
        self.boot=firmware[:0x20000]
        self.pc=0x93f725be
        self.r[12]=self.BUFFER

    def read(self,addr,count):
        offset=addr-0x93f5e000
        if 0<=offset and offset+count<=len(self.boot):
            return self.boot[offset:offset+count]
        return super().read(addr,count)

    def stub(self,target):
        if target not in (0x93f68514,0x93f68534,0x93f638dc,0x93f6cc48):
            raise ValueError(f'Unexpected recovery loop call: {target:#x}')
        self.calls.append(dict(target=target,args=self.r[2:8]))
        for i in range(2,8):self.r[i]=0xcccc0000+i
        self.r[2]=0

    def run(self):
        return super().run(stop_at=(self.END,))


class BootRecoveryReadGateRunner(BootFlashLoopRunner):
    """Only execute the original caller's comparison of a file-read result.

    The input is an assumed FAT-reader result; no file I/O or flash action is
    executed. Passing this gate is not permission to flash or CRC acceptance.
    """
    ACCEPT=0x93f723e8
    NEXT_PARTITION=0x93f723e0

    def __init__(self,firmware,read_result):
        super().__init__(firmware)
        self.pc=0x93f723dc
        self.r[2]=read_result&0xffffffff
        self.r[10]=0xffffffff

    def stub(self,target):
        raise ValueError(f'Read-result block unexpectedly calls {target:#x}')

    def run(self):
        Runner.run(self,stop_at=(self.ACCEPT,self.NEXT_PARTITION))
        self.passed_read_result_gate=self.pc==self.ACCEPT
        return self


class BootFATReadBoundsRunner(BootFlashLoopRunner):
    """Execute only the FAT-reader's offset/length clamp after file lookup.

    File size, requested read length and offset are supplied as already parsed
    metadata. Directory lookup, FAT chains and copying are outside this block.
    """
    CLAMP_END=0x93f735c4
    EMPTY_OR_OFFSET_PAST_EOF=0x93f73704

    def __init__(self,firmware,file_size,requested_length=0x400000,offset=0):
        if any(not 0<=n<=0xffffffff for n in (file_size,requested_length,offset)):
            raise ValueError('File size/read bounds must fit u32')
        super().__init__(firmware)
        self.pc=0x93f735a8
        self.r[7]=self.r[13]=file_size
        self.store(self.r[0]+0xaa8,offset,4)
        self.store(self.r[0]+0xabc,requested_length,4)

    def stub(self,target):
        raise ValueError(f'FAT read-bounds block unexpectedly calls {target:#x}')

    def run(self):
        Runner.run(self,stop_at=(self.CLAMP_END,self.EMPTY_OR_OFFSET_PAST_EOF))
        self.read_end_offset=self.r[13] if self.pc==self.CLAMP_END else None
        return self
