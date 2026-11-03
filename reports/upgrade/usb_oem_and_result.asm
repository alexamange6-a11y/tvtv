
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002ed06 <.data+0x2ed06>:
9002ed06:	12a3      	mov      	r3, r10
9002ed08:	6324      	movi      	r4, 50
9002ed0a:	7f56      	jsri      	0x9047768C	// 0x9047768c
9002ed0c:	12e7      	mov      	r7, r14
9002ed0e:	1de7      	ixh      	r7, r7, r14
9002ed10:	1278      	mov      	r8, r7
9002ed12:	3c48      	lsli      	r8, r8, 4
9002ed14:	0578      	subu      	r8, r8, r7
9002ed16:	774e      	lrw      	r7, 0x288	// 0x9002ee50
9002ed18:	1c07      	addu      	r7, r7, r0
9002ed1a:	1c78      	addu      	r8, r8, r7
9002ed1c:	1287      	mov      	r7, r8
9002ed1e:	2077      	addi      	r7, r7, 8
9002ed20:	a5a7      	ld.b      	r5, (r7, 0xa)
9002ed22:	3c85      	lsli      	r5, r5, 8
9002ed24:	a497      	ld.b      	r4, (r7, 0x9)
9002ed26:	1e45      	or      	r5, r5, r4
9002ed28:	a6b7      	ld.b      	r6, (r7, 0xb)
9002ed2a:	3d06      	lsli      	r6, r6, 16
9002ed2c:	1e56      	or      	r6, r6, r5
9002ed2e:	adc7      	ld.b      	r13, (r7, 0xc)
9002ed30:	3d8d      	lsli      	r13, r13, 24
9002ed32:	1e6d      	or      	r13, r13, r6
9002ed34:	12d2      	mov      	r2, r13
9002ed36:	7f4c      	jsri      	0x90081100	// 0x90081100
9002ed38:	122c      	mov      	r12, r2
9002ed3a:	2a02      	cmpnei      	r2, 0
9002ed3c:	e873      	bf      	0x9002ee24	// 0x9002ee24
9002ed3e:	20f8      	addi      	r8, r8, 16
9002ed40:	a6a8      	ld.b      	r6, (r8, 0xa)
9002ed42:	3c86      	lsli      	r6, r6, 8
9002ed44:	a598      	ld.b      	r5, (r8, 0x9)
9002ed46:	1e56      	or      	r6, r6, r5
9002ed48:	a7b8      	ld.b      	r7, (r8, 0xb)
9002ed4a:	3d07      	lsli      	r7, r7, 16
9002ed4c:	1e67      	or      	r7, r7, r6
9002ed4e:	a3c8      	ld.b      	r3, (r8, 0xc)
9002ed50:	3d83      	lsli      	r3, r3, 24
9002ed52:	12b2      	mov      	r2, r11
9002ed54:	1e73      	or      	r3, r3, r7
9002ed56:	12a4      	mov      	r4, r10
9002ed58:	7f45      	jsri      	0x900D3E1C	// 0x900d3e1c
9002ed5a:	12c2      	mov      	r2, r12
9002ed5c:	6013      	movi      	r3, 1
9002ed5e:	12d4      	mov      	r4, r13
9002ed60:	12b5      	mov      	r5, r11
9002ed62:	7f43      	jsri      	0x900D5448	// 0x900d5448
9002ed64:	0fd2      	cmpne      	r2, r13
9002ed66:	e804      	bf      	0x9002ed70	// 0x9002ed70
9002ed68:	12bd      	mov      	r13, r11
9002ed6a:	12c2      	mov      	r2, r12
9002ed6c:	7f42      	jsri      	0x900811DC	// 0x900811dc
9002ed6e:	f05c      	br      	0x9002ee28	// 0x9002ee28
9002ed70:	1202      	mov      	r2, r0
9002ed72:	7f41      	jsri      	0x90065D0C	// 0x90065d0c
9002ed74:	1202      	mov      	r2, r0
9002ed76:	2032      	addi      	r2, r2, 4
9002ed78:	7f41      	jsri      	0x90065C9C	// 0x90065c9c
9002ed7a:	1202      	mov      	r2, r0
9002ed7c:	2072      	addi      	r2, r2, 8
9002ed7e:	7f40      	jsri      	0x90065C2C	// 0x90065c2c
9002ed80:	1202      	mov      	r2, r0
9002ed82:	21f2      	addi      	r2, r2, 32
9002ed84:	7340      	lrw      	r3, 0x904c0974	// 0x9002ee84
9002ed86:	8420      	ld.w      	r4, (r0, 0x8)
9002ed88:	7f40      	jsri      	0x900D3C44	// 0x900d3c44
9002ed8a:	6542      	movi      	r2, 84
9002ed8c:	1c02      	addu      	r2, r2, r0
9002ed8e:	733f      	lrw      	r3, 0x904c0984	// 0x9002ee8c
9002ed90:	8410      	ld.w      	r4, (r0, 0x4)
9002ed92:	7f3d      	jsri      	0x900D3C44	// 0x900d3c44
9002ed94:	763f      	lrw      	r6, 0x9064b5cc	// 0x9002ee90
9002ed96:	a606      	ld.b      	r6, (r6, 0x0)
9002ed98:	2a06      	cmpnei      	r6, 0
9002ed9a:	e015      	bt      	0x9002edc6	// 0x9002edc6
9002ed9c:	12c2      	mov      	r2, r12
9002ed9e:	1203      	mov      	r3, r0
9002eda0:	21f3      	addi      	r3, r3, 32
9002eda2:	7f3c      	jsri      	0x900D33D8	// 0x900d33d8
9002eda4:	2a02      	cmpnei      	r2, 0
9002eda6:	e806      	bf      	0x9002edb4	// 0x9002edb4
9002eda8:	12c2      	mov      	r2, r12
9002edaa:	6543      	movi      	r3, 84
9002edac:	1c03      	addu      	r3, r3, r0
9002edae:	7f39      	jsri      	0x900D33D8	// 0x900d33d8
9002edb0:	2a02      	cmpnei      	r2, 0
9002edb2:	e009      	bt      	0x9002edc6	// 0x9002edc6
9002edb4:	12bd      	mov      	r13, r11
9002edb6:	7238      	lrw      	r2, 0x904eee34	// 0x9002ee98
9002edb8:	7f39      	jsri      	0x900D4110	// 0x900d4110
9002edba:	6006      	movi      	r6, 0
9002edbc:	7739      	lrw      	r7, 0x90563950	// 0x9002eea0
9002edbe:	b607      	st.b      	r6, (r7, 0x0)
9002edc0:	12c2      	mov      	r2, r12
9002edc2:	7f2c      	jsri      	0x900811DC	// 0x900811dc
9002edc4:	f02d      	br      	0x9002ee20	// 0x9002ee20
9002edc6:	7237      	lrw      	r2, 0x904c0998	// 0x9002eea4
9002edc8:	7f35      	jsri      	0x900D4110	// 0x900d4110
9002edca:	6017      	movi      	r7, 1
9002edcc:	7435      	lrw      	r4, 0x90563950	// 0x9002eea0
9002edce:	b704      	st.b      	r7, (r4, 0x0)
9002edd0:	12c2      	mov      	r2, r12
9002edd2:	7f28      	jsri      	0x900811DC	// 0x900811dc
9002edd4:	6018      	movi      	r8, 1
9002edd6:	200e      	addi      	r14, r14, 1
9002edd8:	7634      	lrw      	r6, 0x4b8	// 0x9002eea8
9002edda:	1c06      	addu      	r6, r6, r0
9002eddc:	1267      	mov      	r7, r6
9002edde:	8406      	ld.w      	r4, (r6, 0x0)
9002ede0:	62d6      	movi      	r6, 45
9002ede2:	1c64      	addu      	r4, r4, r6
9002ede4:	9407      	st.w      	r4, (r7, 0x0)
9002ede6:	7431      	lrw      	r4, 0x28c	// 0x9002eeac
9002ede8:	1c04      	addu      	r4, r4, r0
9002edea:	a704      	ld.b      	r7, (r4, 0x0)
9002edec:	2407      	subi      	r7, r7, 1
9002edee:	0d7e      	cmplt      	r14, r7
9002edf0:	e6b8      	bt      	0x9002eb62	// 0x9002eb62
9002edf2:	12bd      	mov      	r13, r11
9002edf4:	2a08      	cmpnei      	r8, 0
9002edf6:	e00a      	bt      	0x9002ee0c	// 0x9002ee0c
9002edf8:	7726      	lrw      	r7, 0x9064b5cc	// 0x9002ee90
9002edfa:	a707      	ld.b      	r7, (r7, 0x0)
9002edfc:	2a07      	cmpnei      	r7, 0
9002edfe:	e006      	bt      	0x9002ee0c	// 0x9002ee0c
9002ee00:	722c      	lrw      	r2, 0x904c09a4	// 0x9002eeb0
9002ee02:	7f26      	jsri      	0x900D4110	// 0x900d4110
9002ee04:	7727      	lrw      	r7, 0x90563950	// 0x9002eea0
9002ee06:	b807      	st.b      	r8, (r7, 0x0)
9002ee08:	128a      	mov      	r10, r8
9002ee0a:	f00e      	br      	0x9002ee28	// 0x9002ee28
9002ee0c:	722a      	lrw      	r2, 0x904c09ac	// 0x9002eeb4
9002ee0e:	7f23      	jsri      	0x900D4110	// 0x900d4110
9002ee10:	6016      	movi      	r6, 1
9002ee12:	7723      	lrw      	r7, 0x90563950	// 0x9002eea0
9002ee14:	b607      	st.b      	r6, (r7, 0x0)
9002ee16:	601a      	movi      	r10, 1
9002ee18:	f007      	br      	0x9002ee28	// 0x9002ee28
9002ee1a:	12bd      	mov      	r13, r11
9002ee1c:	f005      	br      	0x9002ee28	// 0x9002ee28
9002ee1e:	12bd      	mov      	r13, r11
9002ee20:	600a      	movi      	r10, 0
9002ee22:	f002      	br      	0x9002ee28	// 0x9002ee28
9002ee24:	12bd      	mov      	r13, r11
9002ee26:	122a      	mov      	r10, r2
9002ee28:	12d2      	mov      	r2, r13
9002ee2a:	7f23      	jsri      	0x900D9BE0	// 0x900d9be0
9002ee2c:	12a2      	mov      	r2, r10
9002ee2e:	7123      	lrw      	r1, 0x4c8	// 0x9002eebc
9002ee30:	1c10      	addu      	r0, r0, r1
9002ee32:	8f70      	ld.w      	r15, (r0, 0x1c)
9002ee34:	8e60      	ld.w      	r14, (r0, 0x18)
9002ee36:	8d50      	ld.w      	r13, (r0, 0x14)
9002ee38:	8c40      	ld.w      	r12, (r0, 0x10)
9002ee3a:	8b30      	ld.w      	r11, (r0, 0xc)
9002ee3c:	8a20      	ld.w      	r10, (r0, 0x8)
9002ee3e:	8910      	ld.w      	r9, (r0, 0x4)
9002ee40:	8800      	ld.w      	r8, (r0, 0x0)
9002ee42:	21f0      	addi      	r0, r0, 32
