
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

001000d8 <.data+0xd8>:
  1000d8:	e007      	bt      	0x1000e8	// 0x1000e8
  1000da:	0512      	subu      	r2, r2, r1
  1000dc:	3e22      	lsri      	r2, r2, 2
  1000de:	6003      	movi      	r3, 0
  1000e0:	9301      	st.w      	r3, (r1, 0x0)
  1000e2:	2031      	addi      	r1, r1, 4
  1000e4:	01b2      	decne      	r2, r2, 1
  1000e6:	e7fc      	bt      	0x1000e0	// 0x1000e0
  1000e8:	11ff      	psrset      	ie, fe, ee
  1000ea:	7418      	lrw      	r4, 0x93f60400	// 0x10014c
  1000ec:	00c4      	jmp      	r4
