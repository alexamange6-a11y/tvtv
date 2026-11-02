
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9000b078 <.data+0xb078>:
9000b078:	2570      	subi      	r0, r0, 24
9000b07a:	9b00      	st.w      	r11, (r0, 0x0)
9000b07c:	9c10      	st.w      	r12, (r0, 0x4)
9000b07e:	9d20      	st.w      	r13, (r0, 0x8)
9000b080:	9e30      	st.w      	r14, (r0, 0xc)
9000b082:	9f40      	st.w      	r15, (r0, 0x10)
9000b084:	24f0      	subi      	r0, r0, 16
9000b086:	122e      	mov      	r14, r2
9000b088:	123d      	mov      	r13, r3
9000b08a:	124c      	mov      	r12, r4
9000b08c:	125b      	mov      	r11, r5
9000b08e:	7227      	lrw      	r2, 0x904b8394	// 0x9000b12c
9000b090:	7f28      	jsri      	0x9024DFF4	// 0x9024dff4
9000b092:	2a02      	cmpnei      	r2, 0
9000b094:	e840      	bf      	0x9000b116	// 0x9000b116
9000b096:	7227      	lrw      	r2, 0x904b998c	// 0x9000b134
9000b098:	7f26      	jsri      	0x9024DFF4	// 0x9024dff4
9000b09a:	2a02      	cmpnei      	r2, 0
9000b09c:	e002      	bt      	0x9000b0a2	// 0x9000b0a2
9000b09e:	7225      	lrw      	r2, 0x904b998c	// 0x9000b134
9000b0a0:	7f26      	jsri      	0x9024E020	// 0x9024e020
9000b0a2:	7226      	lrw      	r2, 0x904b9acc	// 0x9000b13c
9000b0a4:	7f23      	jsri      	0x9024DFF4	// 0x9024dff4
9000b0a6:	2a02      	cmpnei      	r2, 0
9000b0a8:	e002      	bt      	0x9000b0ae	// 0x9000b0ae
9000b0aa:	7224      	lrw      	r2, 0x904b9acc	// 0x9000b13c
9000b0ac:	7f23      	jsri      	0x9024E020	// 0x9024e020
9000b0ae:	7224      	lrw      	r2, 0x904baa08	// 0x9000b140
9000b0b0:	7f20      	jsri      	0x9024DFF4	// 0x9024dff4
9000b0b2:	2a02      	cmpnei      	r2, 0
9000b0b4:	e002      	bt      	0x9000b0ba	// 0x9000b0ba
9000b0b6:	7222      	lrw      	r2, 0x904baa08	// 0x9000b140
9000b0b8:	7f20      	jsri      	0x9024E020	// 0x9024e020
9000b0ba:	7222      	lrw      	r2, 0x904baa1c	// 0x9000b144
9000b0bc:	7f23      	jsri      	0x9024DF6C	// 0x9024df6c
9000b0be:	6006      	movi      	r6, 0
9000b0c0:	1267      	mov      	r7, r6
9000b0c2:	7522      	lrw      	r5, 0x90647e28	// 0x9000b14c
9000b0c4:	f008      	br      	0x9000b0d6	// 0x9000b0d6
9000b0c6:	1264      	mov      	r4, r6
9000b0c8:	1c54      	addu      	r4, r4, r5
9000b0ca:	12e3      	mov      	r3, r14
9000b0cc:	1c63      	addu      	r3, r3, r6
9000b0ce:	8303      	ld.w      	r3, (r3, 0x0)
9000b0d0:	9304      	st.w      	r3, (r4, 0x0)
9000b0d2:	2007      	addi      	r7, r7, 1
9000b0d4:	2036      	addi      	r6, r6, 4
9000b0d6:	0dd7      	cmplt      	r7, r13
9000b0d8:	e802      	bf      	0x9000b0de	// 0x9000b0de
9000b0da:	2b07      	cmpnei      	r7, 16
9000b0dc:	e7f4      	bt      	0x9000b0c6	// 0x9000b0c6
9000b0de:	761c      	lrw      	r6, 0x90647e20	// 0x9000b150
9000b0e0:	9706      	st.w      	r7, (r6, 0x0)
9000b0e2:	771c      	lrw      	r7, 0x90647e24	// 0x9000b154
9000b0e4:	6006      	movi      	r6, 0
9000b0e6:	9607      	st.w      	r6, (r7, 0x0)
9000b0e8:	771c      	lrw      	r7, 0x90647e1c	// 0x9000b158
9000b0ea:	9c07      	st.w      	r12, (r7, 0x0)
9000b0ec:	2a0b      	cmpnei      	r11, 0
9000b0ee:	e002      	bt      	0x9000b0f4	// 0x9000b0f4
9000b0f0:	751b      	lrw      	r5, 0x904baa00	// 0x9000b15c
9000b0f2:	f001      	br      	0x9000b0f6	// 0x9000b0f6
9000b0f4:	12b5      	mov      	r5, r11
9000b0f6:	721a      	lrw      	r2, 0x90647d9c	// 0x9000b160
9000b0f8:	67f3      	movi      	r3, 127
9000b0fa:	741a      	lrw      	r4, 0x904dc320	// 0x9000b164
9000b0fc:	7f1b      	jsri      	0x900D3C18	// 0x900d3c18
9000b0fe:	6006      	movi      	r6, 0
9000b100:	771b      	lrw      	r7, 0x90647e1b	// 0x9000b16c
9000b102:	b607      	st.b      	r6, (r7, 0x0)
9000b104:	6027      	movi      	r7, 2
9000b106:	b700      	st.b      	r7, (r0, 0x0)
9000b108:	6227      	movi      	r7, 34
9000b10a:	d740      	st.h      	r7, (r0, 0x8)
9000b10c:	6007      	movi      	r7, 0
9000b10e:	9710      	st.w      	r7, (r0, 0x4)
9000b110:	720d      	lrw      	r2, 0x904baa1c	// 0x9000b144
9000b112:	1203      	mov      	r3, r0
9000b114:	7f17      	jsri      	0x9024F2A0	// 0x9024f2a0
9000b116:	20f0      	addi      	r0, r0, 16
9000b118:	8f40      	ld.w      	r15, (r0, 0x10)
9000b11a:	8e30      	ld.w      	r14, (r0, 0xc)
9000b11c:	8d20      	ld.w      	r13, (r0, 0x8)
9000b11e:	8c10      	ld.w      	r12, (r0, 0x4)
9000b120:	8b00      	ld.w      	r11, (r0, 0x0)
9000b122:	2170      	addi      	r0, r0, 24
9000b124:	00cf      	jmp      	r15
9000b126:	f7ff      	br      	0x9000b126	// 0x9000b126
9000b128:	f7ff      	br      	0x9000b128	// 0x9000b128
9000b12a:	1200      	mov      	r0, r0
9000b12c:	8394      	ld.w      	r3, (r4, 0x24)
9000b12e:	904b      	st.w      	r0, (r11, 0x10)
9000b130:	dff4      	st.h      	r15, (r4, 0x1e)
9000b132:	9024      	st.w      	r0, (r4, 0x8)
9000b134:	998c      	st.w      	r9, (r12, 0x20)
9000b136:	904b      	st.w      	r0, (r11, 0x10)
9000b138:	e020      	bt      	0x9000b17a	// 0x9000b17a
9000b13a:	9024      	st.w      	r0, (r4, 0x8)
9000b13c:	9acc      	st.w      	r10, (r12, 0x30)
9000b13e:	904b      	st.w      	r0, (r11, 0x10)
9000b140:	aa08      	ld.b      	r10, (r8, 0x0)
9000b142:	904b      	st.w      	r0, (r11, 0x10)
9000b144:	aa1c      	ld.b      	r10, (r12, 0x1)
9000b146:	904b      	st.w      	r0, (r11, 0x10)
9000b148:	df6c      	st.h      	r15, (r12, 0xc)
9000b14a:	9024      	st.w      	r0, (r4, 0x8)
9000b14c:	7e28      	lrw      	r14, 0x724800d7	// 0x9000b1ec
9000b14e:	9064      	st.w      	r0, (r4, 0x18)
9000b150:	7e20      	lrw      	r14, 0x754b2a06	// 0x9000b1d0
9000b152:	9064      	st.w      	r0, (r4, 0x18)
9000b154:	7e24      	lrw      	r14, 0x7e497f49	// 0x9000b1e4
9000b156:	9064      	st.w      	r0, (r4, 0x18)
9000b158:	7e1c      	lrw      	r14, 0x1257754d	// 0x9000b1c8
9000b15a:	9064      	st.w      	r0, (r4, 0x18)
9000b15c:	aa00      	ld.b      	r10, (r0, 0x0)
9000b15e:	904b      	st.w      	r0, (r11, 0x10)
9000b160:	7d9c      	lrw      	r13, 0x7f4e724e	// 0x9000b3d0
9000b162:	9064      	st.w      	r0, (r4, 0x18)
9000b164:	c320      	ld.h      	r3, (r0, 0x4)
9000b166:	904d      	st.w      	r0, (r13, 0x10)
9000b168:	3c18      	lsli      	r8, r8, 1
9000b16a:	900d      	st.w      	r0, (r13, 0x0)
9000b16c:	7e1b      	lrw      	r14, 0xa307e820	// 0x9000b1d8
9000b16e:	9064      	st.w      	r0, (r4, 0x18)
9000b170:	f2a0      	br      	0x9000b6b2	// 0x9000b6b2
9000b172:	9024      	st.w      	r0, (r4, 0x8)
