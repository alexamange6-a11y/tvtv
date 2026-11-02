
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90013a88 <.data+0x13a88>:
90013a88:	24f0      	subi      	r0, r0, 16
90013a8a:	9c00      	st.w      	r12, (r0, 0x0)
90013a8c:	9d10      	st.w      	r13, (r0, 0x4)
90013a8e:	9e20      	st.w      	r14, (r0, 0x8)
90013a90:	9f30      	st.w      	r15, (r0, 0xc)
90013a92:	6781      	movi      	r1, 120
90013a94:	0510      	subu      	r0, r0, r1
90013a96:	122c      	mov      	r12, r2
90013a98:	123e      	mov      	r14, r3
90013a9a:	1202      	mov      	r2, r0
90013a9c:	6003      	movi      	r3, 0
90013a9e:	6784      	movi      	r4, 120
90013aa0:	7f1b      	jsri      	0x9047768C	// 0x9047768c
90013aa2:	1202      	mov      	r2, r0
90013aa4:	731b      	lrw      	r3, 0x904c3834	// 0x90013b10
90013aa6:	7f1b      	jsri      	0x900D3050	// 0x900d3050
90013aa8:	603d      	movi      	r13, 3
90013aaa:	bdb0      	st.b      	r13, (r0, 0xb)
90013aac:	6117      	movi      	r7, 17
90013aae:	b7f0      	st.b      	r7, (r0, 0xf)
90013ab0:	721a      	lrw      	r2, 0x904bc52c	// 0x90013b18
90013ab2:	1203      	mov      	r3, r0
90013ab4:	20f3      	addi      	r3, r3, 16
90013ab6:	6104      	movi      	r4, 16
90013ab8:	7519      	lrw      	r5, 0x904bc540	// 0x90013b1c
90013aba:	7f19      	jsri      	0x90381A20	// 0x90381a20
90013abc:	6016      	movi      	r6, 1
90013abe:	6247      	movi      	r7, 36
90013ac0:	1c07      	addu      	r7, r7, r0
90013ac2:	b607      	st.b      	r6, (r7, 0x0)
90013ac4:	6257      	movi      	r7, 37
90013ac6:	1c07      	addu      	r7, r7, r0
90013ac8:	bd07      	st.b      	r13, (r7, 0x0)
90013aca:	62ad      	movi      	r13, 42
90013acc:	1c0d      	addu      	r13, r13, r0
90013ace:	12d2      	mov      	r2, r13
90013ad0:	ff93      	bsr      	0x900139f8	// 0x900139f8
90013ad2:	12d2      	mov      	r2, r13
90013ad4:	7f15      	jsri      	0x900D30E4	// 0x900d30e4
90013ad6:	1224      	mov      	r4, r2
90013ad8:	1226      	mov      	r6, r2
90013ada:	2006      	addi      	r6, r6, 1
90013adc:	6297      	movi      	r7, 41
90013ade:	1c07      	addu      	r7, r7, r0
90013ae0:	b607      	st.b      	r6, (r7, 0x0)
90013ae2:	7712      	lrw      	r7, 0xffffe949	// 0x90013b2c
90013ae4:	d71e      	st.h      	r7, (r14, 0x2)
90013ae6:	12c2      	mov      	r2, r12
90013ae8:	1203      	mov      	r3, r0
90013aea:	62b7      	movi      	r7, 43
90013aec:	1c74      	addu      	r4, r4, r7
90013aee:	6005      	movi      	r5, 0
90013af0:	12e6      	mov      	r6, r14
90013af2:	6207      	movi      	r7, 32
90013af4:	7f0f      	jsri      	0x900DCD8C	// 0x900dcd8c
90013af6:	6781      	movi      	r1, 120
90013af8:	1c10      	addu      	r0, r0, r1
90013afa:	8f30      	ld.w      	r15, (r0, 0xc)
90013afc:	8e20      	ld.w      	r14, (r0, 0x8)
90013afe:	8d10      	ld.w      	r13, (r0, 0x4)
90013b00:	8c00      	ld.w      	r12, (r0, 0x0)
90013b02:	20f0      	addi      	r0, r0, 16
90013b04:	00cf      	jmp      	r15
90013b06:	f7ff      	br      	0x90013b06	// 0x90013b06
90013b08:	f7ff      	br      	0x90013b08	// 0x90013b08
90013b0a:	1200      	mov      	r0, r0
90013b0c:	768c      	lrw      	r6, 0xb6076056	// 0x90013d3c
90013b0e:	9047      	st.w      	r0, (r7, 0x10)
90013b10:	3834      	rotli      	r4, r4, 3
90013b12:	904c      	st.w      	r0, (r12, 0x10)
90013b14:	3050      	bclri      	r0, r0, 5
90013b16:	900d      	st.w      	r0, (r13, 0x0)
90013b18:	c52c      	ld.h      	r5, (r12, 0x4)
90013b1a:	904b      	st.w      	r0, (r11, 0x10)
90013b1c:	c540      	ld.h      	r5, (r0, 0x8)
90013b1e:	904b      	st.w      	r0, (r11, 0x10)
90013b20:	1a20      	asr      	r0, r0, r2
90013b22:	9038      	st.w      	r0, (r8, 0xc)
90013b24:	39f8      	rotli      	r8, r8, 31
90013b26:	9001      	st.w      	r0, (r1, 0x0)
90013b28:	30e4      	bclri      	r4, r4, 14
90013b2a:	900d      	st.w      	r0, (r13, 0x0)
90013b2c:	e949      	bf      	0x90013dc0	// 0x90013dc0
90013b2e:	ffff      	bsr      	0x90013b2e	// 0x90013b2e
90013b30:	cd8c      	ld.h      	r13, (r12, 0x10)
90013b32:	900d      	st.w      	r0, (r13, 0x0)
