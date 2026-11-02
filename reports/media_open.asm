
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90024dd8 <.data+0x24dd8>:
90024dd8:	25f0      	subi      	r0, r0, 32
90024dda:	9f60      	st.w      	r15, (r0, 0x18)
90024ddc:	9e70      	st.w      	r14, (r0, 0x1c)
90024dde:	2570      	subi      	r0, r0, 24
90024de0:	fe75      	bsr      	0x90024acc	// 0x90024acc
90024de2:	122e      	mov      	r14, r2
90024de4:	2a02      	cmpnei      	r2, 0
90024de6:	e00d      	bt      	0x90024e02	// 0x90024e02
90024de8:	7711      	lrw      	r7, 0x90575b9c	// 0x90024e2c
90024dea:	8707      	ld.w      	r7, (r7, 0x0)
90024dec:	00d7      	jsr      	r7
90024dee:	7210      	lrw      	r2, 0x905751f4	// 0x90024e30
90024df0:	8702      	ld.w      	r7, (r2, 0x0)
90024df2:	7610      	lrw      	r6, 0xffffff9c	// 0x90024e34
90024df4:	1c62      	addu      	r2, r2, r6
90024df6:	00d7      	jsr      	r7
90024df8:	7210      	lrw      	r2, 0x904bf648	// 0x90024e38
90024dfa:	7f10      	jsri      	0x9024DF6C	// 0x9024df6c
90024dfc:	7711      	lrw      	r7, 0x9064a6c0	// 0x90024e40
90024dfe:	be07      	st.b      	r14, (r7, 0x0)
90024e00:	f00b      	br      	0x90024e18	// 0x90024e18
90024e02:	1202      	mov      	r2, r0
90024e04:	6003      	movi      	r3, 0
90024e06:	62c4      	movi      	r4, 44
90024e08:	7f0f      	jsri      	0x9047768C	// 0x9047768c
90024e0a:	6017      	movi      	r7, 1
90024e0c:	9700      	st.w      	r7, (r0, 0x0)
90024e0e:	760e      	lrw      	r6, 0x904b9464	// 0x90024e48
90024e10:	9640      	st.w      	r6, (r0, 0x10)
90024e12:	9710      	st.w      	r7, (r0, 0x4)
90024e14:	1202      	mov      	r2, r0
90024e16:	7f0d      	jsri      	0x9004AB88	// 0x9004ab88
90024e18:	2170      	addi      	r0, r0, 24
90024e1a:	8f60      	ld.w      	r15, (r0, 0x18)
90024e1c:	8e70      	ld.w      	r14, (r0, 0x1c)
90024e1e:	21f0      	addi      	r0, r0, 32
90024e20:	00cf      	jmp      	r15
90024e22:	f7ff      	br      	0x90024e22	// 0x90024e22
90024e24:	f7ff      	br      	0x90024e24	// 0x90024e24
90024e26:	1200      	mov      	r0, r0
90024e28:	4acc      	ldex      	r10, (r12, 0xc)
90024e2a:	9002      	st.w      	r0, (r2, 0x0)
90024e2c:	5b9c      	stex      	r11, (r12, 0x9)
90024e2e:	9057      	st.w      	r0, (r7, 0x14)
90024e30:	51f4      	stex      	r1, (r4, 0xf)
90024e32:	9057      	st.w      	r0, (r7, 0x14)
90024e34:	ff9c      	bsr      	0x90024d6e	// 0x90024d6e
90024e36:	ffff      	bsr      	0x90024e36	// 0x90024e36
90024e38:	f648      	br      	0x90024aca	// 0x90024aca
90024e3a:	904b      	st.w      	r0, (r11, 0x10)
90024e3c:	df6c      	st.h      	r15, (r12, 0xc)
90024e3e:	9024      	st.w      	r0, (r4, 0x8)
90024e40:	a6c0      	ld.b      	r6, (r0, 0xc)
90024e42:	9064      	st.w      	r0, (r4, 0x18)
90024e44:	768c      	lrw      	r6, 0x7218f003	// 0x90025074
90024e46:	9047      	st.w      	r0, (r7, 0x10)
90024e48:	9464      	st.w      	r4, (r4, 0x18)
90024e4a:	904b      	st.w      	r0, (r11, 0x10)
90024e4c:	ab88      	ld.b      	r11, (r8, 0x8)
90024e4e:	9004      	st.w      	r0, (r4, 0x0)
90024e50:	25f0      	subi      	r0, r0, 32
90024e52:	9f60      	st.w      	r15, (r0, 0x18)
