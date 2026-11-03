
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002b02c <.data+0x2b02c>:
9002b02c:	2570      	subi      	r0, r0, 24
9002b02e:	9b00      	st.w      	r11, (r0, 0x0)
9002b030:	9c10      	st.w      	r12, (r0, 0x4)
9002b032:	9d20      	st.w      	r13, (r0, 0x8)
9002b034:	9e30      	st.w      	r14, (r0, 0xc)
9002b036:	9f40      	st.w      	r15, (r0, 0x10)
9002b038:	122d      	mov      	r13, r2
9002b03a:	123b      	mov      	r11, r3
9002b03c:	2a03      	cmpnei      	r3, 0
9002b03e:	e803      	bf      	0x9002b046	// 0x9002b046
9002b040:	771d      	lrw      	r7, 0x8f	// 0x9002b0b4
9002b042:	0f72      	cmpne      	r2, r7
9002b044:	e802      	bf      	0x9002b04a	// 0x9002b04a
9002b046:	721c      	lrw      	r2, 0x904c0288	// 0x9002b0b8
9002b048:	f005      	br      	0x9002b054	// 0x9002b054
9002b04a:	7f1c      	jsri      	0x90360CF8	// 0x90360cf8
9002b04c:	122e      	mov      	r14, r2
9002b04e:	2a02      	cmpnei      	r2, 0
9002b050:	e004      	bt      	0x9002b05a	// 0x9002b05a
9002b052:	721b      	lrw      	r2, 0x904c02b4	// 0x9002b0c0
9002b054:	12d3      	mov      	r3, r13
9002b056:	7f1b      	jsri      	0x900D7214	// 0x900d7214
9002b058:	f022      	br      	0x9002b09e	// 0x9002b09e
9002b05a:	8d12      	ld.w      	r13, (r2, 0x4)
9002b05c:	2acd      	cmpnei      	r13, 12
9002b05e:	e004      	bt      	0x9002b068	// 0x9002b068
9002b060:	122c      	mov      	r12, r2
9002b062:	207c      	addi      	r12, r12, 8
9002b064:	2a0c      	cmpnei      	r12, 0
9002b066:	e004      	bt      	0x9002b070	// 0x9002b070
9002b068:	12e2      	mov      	r2, r14
9002b06a:	7f17      	jsri      	0x90360DC4	// 0x90360dc4
9002b06c:	7218      	lrw      	r2, 0x904c02e0	// 0x9002b0cc
9002b06e:	f016      	br      	0x9002b09c	// 0x9002b09c
9002b070:	12c2      	mov      	r2, r12
9002b072:	12b3      	mov      	r3, r11
9002b074:	12d4      	mov      	r4, r13
9002b076:	7f16      	jsri      	0x900CD2D8	// 0x900cd2d8
9002b078:	12e2      	mov      	r2, r14
9002b07a:	7f16      	jsri      	0x90361114	// 0x90361114
9002b07c:	2a02      	cmpnei      	r2, 0
9002b07e:	e805      	bf      	0x9002b08a	// 0x9002b08a
9002b080:	12e2      	mov      	r2, r14
9002b082:	7f11      	jsri      	0x90360DC4	// 0x90360dc4
9002b084:	7215      	lrw      	r2, 0x904c030c	// 0x9002b0d8
9002b086:	7f0f      	jsri      	0x900D7214	// 0x900d7214
9002b088:	f00a      	br      	0x9002b09e	// 0x9002b09e
9002b08a:	12b2      	mov      	r2, r11
9002b08c:	12c3      	mov      	r3, r12
9002b08e:	12d4      	mov      	r4, r13
9002b090:	7f10      	jsri      	0x900CD2D8	// 0x900cd2d8
9002b092:	12e2      	mov      	r2, r14
9002b094:	7f0d      	jsri      	0x90360DC4	// 0x90360dc4
9002b096:	2a02      	cmpnei      	r2, 0
9002b098:	e803      	bf      	0x9002b0a0	// 0x9002b0a0
9002b09a:	7210      	lrw      	r2, 0x904c0328	// 0x9002b0dc
9002b09c:	7f11      	jsri      	0x900D4110	// 0x900d4110
9002b09e:	2c02      	bmaski      	r2, 0
9002b0a0:	8f40      	ld.w      	r15, (r0, 0x10)
9002b0a2:	8e30      	ld.w      	r14, (r0, 0xc)
9002b0a4:	8d20      	ld.w      	r13, (r0, 0x8)
9002b0a6:	8c10      	ld.w      	r12, (r0, 0x4)
9002b0a8:	8b00      	ld.w      	r11, (r0, 0x0)
9002b0aa:	2170      	addi      	r0, r0, 24
9002b0ac:	00cf      	jmp      	r15
9002b0ae:	f7ff      	br      	0x9002b0ae	// 0x9002b0ae
9002b0b0:	f7ff      	br      	0x9002b0b0	// 0x9002b0b0
9002b0b2:	1200      	mov      	r0, r0
9002b0b4:	008f      	dect      	r15, r15, 1
9002b0b6:	0000      	bkpt
9002b0b8:	0288      	movt      	r8, r8
9002b0ba:	904c      	st.w      	r0, (r12, 0x10)
9002b0bc:	0cf8      	cmphs      	r8, r15
9002b0be:	9036      	st.w      	r0, (r6, 0xc)
9002b0c0:	02b4      	movt      	r4, r11
9002b0c2:	904c      	st.w      	r0, (r12, 0x10)
9002b0c4:	7214      	lrw      	r2, 0xf7d3287	// 0x9002b114
9002b0c6:	900d      	st.w      	r0, (r13, 0x0)
9002b0c8:	0dc4      	cmplt      	r4, r12
9002b0ca:	9036      	st.w      	r0, (r6, 0xc)
9002b0cc:	02e0      	movt      	r0, r14
9002b0ce:	904c      	st.w      	r0, (r12, 0x10)
9002b0d0:	d2d8      	st.h      	r2, (r8, 0x1a)
9002b0d2:	900c      	st.w      	r0, (r12, 0x0)
9002b0d4:	1114      	mfcr      	r4, cr17
9002b0d6:	9036      	st.w      	r0, (r6, 0xc)
9002b0d8:	030c      	mult      	r12, r12, r0
9002b0da:	904c      	st.w      	r0, (r12, 0x10)
9002b0dc:	0328      	mult      	r8, r8, r2
9002b0de:	904c      	st.w      	r0, (r12, 0x10)
9002b0e0:	4110      	ldex      	r1, (r0, 0x1)
9002b0e2:	900d      	st.w      	r0, (r13, 0x0)
