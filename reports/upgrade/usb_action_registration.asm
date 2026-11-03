
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002dd6c <.data+0x2dd6c>:
9002dd6c:	2570      	subi      	r0, r0, 24
9002dd6e:	9a00      	st.w      	r10, (r0, 0x0)
9002dd70:	9b10      	st.w      	r11, (r0, 0x4)
9002dd72:	9c20      	st.w      	r12, (r0, 0x8)
9002dd74:	9d30      	st.w      	r13, (r0, 0xc)
9002dd76:	9e40      	st.w      	r14, (r0, 0x10)
9002dd78:	9f50      	st.w      	r15, (r0, 0x14)
9002dd7a:	7d12      	lrw      	r13, 0x904af4f8	// 0x9002ddc4
9002dd7c:	600e      	movi      	r14, 0
9002dd7e:	7b12      	lrw      	r11, 0x9064afe0	// 0x9002ddc8
9002dd80:	7a13      	lrw      	r10, 0x85	// 0x9002ddcc
9002dd82:	12d7      	mov      	r7, r13
9002dd84:	2437      	subi      	r7, r7, 4
9002dd86:	8c07      	ld.w      	r12, (r7, 0x0)
9002dd88:	12c7      	mov      	r7, r12
9002dd8a:	3c27      	lsli      	r7, r7, 2
9002dd8c:	1cb7      	addu      	r7, r7, r11
9002dd8e:	8707      	ld.w      	r7, (r7, 0x0)
9002dd90:	2a07      	cmpnei      	r7, 0
9002dd92:	e804      	bf      	0x9002dd9c	// 0x9002dd9c
9002dd94:	720f      	lrw      	r2, 0x904c06e8	// 0x9002ddd0
9002dd96:	12c3      	mov      	r3, r12
9002dd98:	12e4      	mov      	r4, r14
9002dd9a:	7f0e      	jsri      	0x900D7214	// 0x900d7214
9002dd9c:	3c2c      	lsli      	r12, r12, 2
9002dd9e:	1cbc      	addu      	r12, r12, r11
9002dda0:	870d      	ld.w      	r7, (r13, 0x0)
9002dda2:	970c      	st.w      	r7, (r12, 0x0)
9002dda4:	200e      	addi      	r14, r14, 1
9002dda6:	207d      	addi      	r13, r13, 8
9002dda8:	0fae      	cmpne      	r14, r10
9002ddaa:	e7eb      	bt      	0x9002dd82	// 0x9002dd82
9002ddac:	6002      	movi      	r2, 0
9002ddae:	8f50      	ld.w      	r15, (r0, 0x14)
9002ddb0:	8e40      	ld.w      	r14, (r0, 0x10)
9002ddb2:	8d30      	ld.w      	r13, (r0, 0xc)
9002ddb4:	8c20      	ld.w      	r12, (r0, 0x8)
9002ddb6:	8b10      	ld.w      	r11, (r0, 0x4)
9002ddb8:	8a00      	ld.w      	r10, (r0, 0x0)
9002ddba:	2170      	addi      	r0, r0, 24
9002ddbc:	00cf      	jmp      	r15
9002ddbe:	f7ff      	br      	0x9002ddbe	// 0x9002ddbe
9002ddc0:	f7ff      	br      	0x9002ddc0	// 0x9002ddc0
9002ddc2:	1200      	mov      	r0, r0
9002ddc4:	f4f8      	br      	0x9002d7b6	// 0x9002d7b6
9002ddc6:	904a      	st.w      	r0, (r10, 0x10)
9002ddc8:	afe0      	ld.b      	r15, (r0, 0xe)
9002ddca:	9064      	st.w      	r0, (r4, 0x18)
9002ddcc:	0085      	dect      	r5, r5, 1
9002ddce:	0000      	bkpt
9002ddd0:	06e8      	addc      	r8, r8, r14
9002ddd2:	904c      	st.w      	r0, (r12, 0x10)
9002ddd4:	7214      	lrw      	r2, 0x900d7214	// 0x9002de24
9002ddd6:	900d      	st.w      	r0, (r13, 0x0)
