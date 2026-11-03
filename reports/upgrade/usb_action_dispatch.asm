
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002ddd8 <.data+0x2ddd8>:
9002ddd8:	2470      	subi      	r0, r0, 8
9002ddda:	9f00      	st.w      	r15, (r0, 0x0)
9002dddc:	1226      	mov      	r6, r2
9002ddde:	770c      	lrw      	r7, 0xfa	// 0x9002de10
9002dde0:	0c27      	cmphs      	r7, r2
9002dde2:	e003      	bt      	0x9002ddea	// 0x9002ddea
9002dde4:	720c      	lrw      	r2, 0x904c073c	// 0x9002de14
9002dde6:	7f0c      	jsri      	0x900D4110	// 0x900d4110
9002dde8:	f00a      	br      	0x9002ddfe	// 0x9002ddfe
9002ddea:	770c      	lrw      	r7, 0x9064afe0	// 0x9002de1c
9002ddec:	1225      	mov      	r5, r2
9002ddee:	3c25      	lsli      	r5, r5, 2
9002ddf0:	1c57      	addu      	r7, r7, r5
9002ddf2:	8707      	ld.w      	r7, (r7, 0x0)
9002ddf4:	2a07      	cmpnei      	r7, 0
9002ddf6:	e005      	bt      	0x9002de02	// 0x9002de02
9002ddf8:	720a      	lrw      	r2, 0x904c0750	// 0x9002de20
9002ddfa:	1263      	mov      	r3, r6
9002ddfc:	7f0a      	jsri      	0x900D7214	// 0x900d7214
9002ddfe:	2c02      	bmaski      	r2, 0
9002de00:	f001      	br      	0x9002de04	// 0x9002de04
9002de02:	00d7      	jsr      	r7
9002de04:	8f00      	ld.w      	r15, (r0, 0x0)
9002de06:	2070      	addi      	r0, r0, 8
9002de08:	00cf      	jmp      	r15
9002de0a:	f7ff      	br      	0x9002de0a	// 0x9002de0a
9002de0c:	f7ff      	br      	0x9002de0c	// 0x9002de0c
9002de0e:	1200      	mov      	r0, r0
9002de10:	00fa      	brev      	r10, r10
9002de12:	0000      	bkpt
9002de14:	073c      	subc      	r12, r12, r3
9002de16:	904c      	st.w      	r0, (r12, 0x10)
9002de18:	4110      	ldex      	r1, (r0, 0x1)
9002de1a:	900d      	st.w      	r0, (r13, 0x0)
9002de1c:	afe0      	ld.b      	r15, (r0, 0xe)
9002de1e:	9064      	st.w      	r0, (r4, 0x18)
9002de20:	0750      	subc      	r0, r0, r5
9002de22:	904c      	st.w      	r0, (r12, 0x10)
9002de24:	7214      	lrw      	r2, 0x1202e808	// 0x9002de74
9002de26:	900d      	st.w      	r0, (r13, 0x0)
