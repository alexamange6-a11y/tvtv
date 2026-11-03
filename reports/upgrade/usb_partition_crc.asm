
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002eb56 <.data+0x2eb56>:
9002eb56:	600e      	movi      	r14, 0
9002eb58:	12e8      	mov      	r8, r14
9002eb5a:	1209      	mov      	r9, r0
9002eb5c:	20b9      	addi      	r9, r9, 12
9002eb5e:	12db      	mov      	r11, r13
9002eb60:	f142      	br      	0x9002ede6	// 0x9002ede6
9002eb62:	2a1e      	cmpnei      	r14, 1
9002eb64:	e8a7      	bf      	0x9002ecb4	// 0x9002ecb4
9002eb66:	7447      	lrw      	r4, 0x4b8	// 0x9002ec84
9002eb68:	1c04      	addu      	r4, r4, r0
9002eb6a:	8504      	ld.w      	r5, (r4, 0x0)
9002eb6c:	a405      	ld.b      	r4, (r5, 0x0)
9002eb6e:	2a04      	cmpnei      	r4, 0
9002eb70:	e8a1      	bf      	0x9002ecb4	// 0x9002ecb4
9002eb72:	12e7      	mov      	r7, r14
9002eb74:	1de7      	ixh      	r7, r7, r14
9002eb76:	127d      	mov      	r13, r7
9002eb78:	3c4d      	lsli      	r13, r13, 4
9002eb7a:	057d      	subu      	r13, r13, r7
9002eb7c:	752a      	lrw      	r5, 0x288	// 0x9002ec24
9002eb7e:	1c05      	addu      	r5, r5, r0
9002eb80:	1c5d      	addu      	r13, r13, r5
9002eb82:	12d6      	mov      	r6, r13
9002eb84:	20f6      	addi      	r6, r6, 16
9002eb86:	a5a6      	ld.b      	r5, (r6, 0xa)
9002eb88:	3c85      	lsli      	r5, r5, 8
9002eb8a:	a796      	ld.b      	r7, (r6, 0x9)
9002eb8c:	1e75      	or      	r5, r5, r7
9002eb8e:	a7b6      	ld.b      	r7, (r6, 0xb)
9002eb90:	3d07      	lsli      	r7, r7, 16
9002eb92:	1e57      	or      	r7, r7, r5
9002eb94:	a3c6      	ld.b      	r3, (r6, 0xc)
9002eb96:	3d83      	lsli      	r3, r3, 24
9002eb98:	12b2      	mov      	r2, r11
9002eb9a:	1e73      	or      	r3, r3, r7
9002eb9c:	6004      	movi      	r4, 0
9002eb9e:	7f3a      	jsri      	0x900D3E1C	// 0x900d3e1c
9002eba0:	1292      	mov      	r2, r9
9002eba2:	6003      	movi      	r3, 0
9002eba4:	6144      	movi      	r4, 20
9002eba6:	7f17      	jsri      	0x9047768C	// 0x9047768c
9002eba8:	12d7      	mov      	r7, r13
9002ebaa:	2077      	addi      	r7, r7, 8
9002ebac:	a5a7      	ld.b      	r5, (r7, 0xa)
9002ebae:	3c85      	lsli      	r5, r5, 8
9002ebb0:	a497      	ld.b      	r4, (r7, 0x9)
9002ebb2:	1e45      	or      	r5, r5, r4
9002ebb4:	a6b7      	ld.b      	r6, (r7, 0xb)
9002ebb6:	3d06      	lsli      	r6, r6, 16
9002ebb8:	1e56      	or      	r6, r6, r5
9002ebba:	acc7      	ld.b      	r12, (r7, 0xc)
9002ebbc:	3d8c      	lsli      	r12, r12, 24
9002ebbe:	1e6c      	or      	r12, r12, r6
9002ebc0:	9c29      	st.w      	r12, (r9, 0x8)
9002ebc2:	1292      	mov      	r2, r9
9002ebc4:	6023      	movi      	r3, 2
9002ebc6:	7f31      	jsri      	0x90082640	// 0x90082640
9002ebc8:	8a09      	ld.w      	r10, (r9, 0x0)
9002ebca:	2a0a      	cmpnei      	r10, 0
9002ebcc:	e926      	bf      	0x9002ee1a	// 0x9002ee1a
9002ebce:	12a2      	mov      	r2, r10
9002ebd0:	6013      	movi      	r3, 1
9002ebd2:	12c4      	mov      	r4, r12
9002ebd4:	12b5      	mov      	r5, r11
9002ebd6:	7f10      	jsri      	0x900D5448	// 0x900d5448
9002ebd8:	1224      	mov      	r4, r2
9002ebda:	0fc2      	cmpne      	r2, r12
9002ebdc:	e807      	bf      	0x9002ebec	// 0x9002ebec
9002ebde:	12bd      	mov      	r13, r11
9002ebe0:	722c      	lrw      	r2, 0x904c0950	// 0x9002ec90
9002ebe2:	1243      	mov      	r3, r4
9002ebe4:	7f1f      	jsri      	0x900D7214	// 0x900d7214
9002ebe6:	1292      	mov      	r2, r9
9002ebe8:	7f2b      	jsri      	0x90082B14	// 0x90082b14
9002ebea:	f11a      	br      	0x9002ee20	// 0x9002ee20
9002ebec:	6002      	movi      	r2, 0
9002ebee:	12a3      	mov      	r3, r10
9002ebf0:	7f23      	jsri      	0x900CCBCC	// 0x900ccbcc
9002ebf2:	122c      	mov      	r12, r2
9002ebf4:	1292      	mov      	r2, r9
9002ebf6:	f050      	br      	0x9002ec98	// 0x9002ec98
9002ebf8:	f7ff      	br      	0x9002ebf8	// 0x9002ebf8
9002ebfa:	1200      	mov      	r0, r0
9002ebfc:	04c8      	mac      	r8, r12
9002ebfe:	0000      	bkpt
9002ec00:	0088      	dect      	r8, r8, 1
9002ec02:	0000      	bkpt
9002ec04:	768c      	lrw      	r6, 0x8d508e60	// 0x9002ee34
9002ec06:	9047      	st.w      	r0, (r7, 0x10)
9002ec08:	bd34      	st.b      	r13, (r4, 0x3)
9002ec0a:	9052      	st.w      	r0, (r2, 0x14)
9002ec0c:	9ac4      	st.w      	r10, (r4, 0x30)
9002ec0e:	900d      	st.w      	r0, (r13, 0x0)
9002ec10:	0914      	cprgr      	r4, cpr17
9002ec12:	904c      	st.w      	r0, (r12, 0x10)
9002ec14:	4110      	ldex      	r1, (r0, 0x1)
9002ec16:	900d      	st.w      	r0, (r13, 0x0)
9002ec18:	5448      	stex      	r4, (r8, 0x4)
9002ec1a:	900d      	st.w      	r0, (r13, 0x0)
9002ec1c:	defa      	st.h      	r14, (r10, 0x1e)
9002ec1e:	aabc      	ld.b      	r10, (r12, 0xb)
9002ec20:	e024      	bt      	0x9002ec6a	// 0x9002ec6a
9002ec22:	9002      	st.w      	r0, (r2, 0x0)
9002ec24:	0288      	movt      	r8, r8
9002ec26:	0000      	bkpt
9002ec28:	0230      	movt      	r0, r3
9002ec2a:	0000      	bkpt
9002ec2c:	0284      	movt      	r4, r8
9002ec2e:	0000      	bkpt
9002ec30:	04ac      	mac      	r12, r10
9002ec32:	0000      	bkpt
9002ec34:	0283      	movt      	r3, r8
9002ec36:	0000      	bkpt
9002ec38:	04ab      	mac      	r11, r10
9002ec3a:	0000      	bkpt
9002ec3c:	0282      	movt      	r2, r8
9002ec3e:	0000      	bkpt
9002ec40:	04aa      	mac      	r10, r10
9002ec42:	0000      	bkpt
9002ec44:	0281      	movt      	r1, r8
9002ec46:	0000      	bkpt
9002ec48:	04a9      	mac      	r9, r10
9002ec4a:	0000      	bkpt
9002ec4c:	0225      	movt      	r5, r2
9002ec4e:	0000      	bkpt
9002ec50:	008d      	dect      	r13, r13, 1
9002ec52:	0000      	bkpt
9002ec54:	0930      	cprgr      	r0, cpr19
9002ec56:	904c      	st.w      	r0, (r12, 0x10)
9002ec58:	f91c      	bsr      	0x9002ee92	// 0x9002ee92
9002ec5a:	904a      	st.w      	r0, (r10, 0x10)
9002ec5c:	011d      	xtrb2      	r1, r13
9002ec5e:	0000      	bkpt
9002ec60:	7214      	lrw      	r2, 0xe0b50f7c	// 0x9002ecb0
9002ec62:	900d      	st.w      	r0, (r13, 0x0)
9002ec64:	04c0      	mac      	r0, r12
9002ec66:	0000      	bkpt
9002ec68:	d2d8      	st.h      	r2, (r8, 0x1a)
9002ec6a:	900c      	st.w      	r0, (r12, 0x0)
9002ec6c:	04bc      	mac      	r12, r11
9002ec6e:	0000      	bkpt
9002ec70:	0123      	xtrb1      	r1, r3
9002ec72:	0000      	bkpt
9002ec74:	0124      	xtrb1      	r1, r4
9002ec76:	0000      	bkpt
9002ec78:	01fc      	not      	r12, r12
9002ec7a:	0000      	bkpt
9002ec7c:	cbcc      	ld.h      	r11, (r12, 0x18)
9002ec7e:	900c      	st.w      	r0, (r12, 0x0)
9002ec80:	02b7      	movt      	r7, r11
9002ec82:	0000      	bkpt
9002ec84:	04b8      	mac      	r8, r11
9002ec86:	0000      	bkpt
9002ec88:	3e1c      	lsri      	r12, r12, 1
9002ec8a:	900d      	st.w      	r0, (r13, 0x0)
9002ec8c:	2640      	cpwgr      	r0, cpr4
9002ec8e:	9008      	st.w      	r0, (r8, 0x0)
9002ec90:	0950      	cprgr      	r0, cpr21
9002ec92:	904c      	st.w      	r0, (r12, 0x10)
9002ec94:	2b14      	cmpnei      	r4, 17
9002ec96:	9008      	st.w      	r0, (r8, 0x0)
9002ec98:	7f6d      	jsri      	0x90082B14	// 0x90082b14
9002ec9a:	21fd      	addi      	r13, r13, 32
9002ec9c:	a76d      	ld.b      	r7, (r13, 0x6)
9002ec9e:	3c87      	lsli      	r7, r7, 8
9002eca0:	a55d      	ld.b      	r5, (r13, 0x5)
9002eca2:	1e57      	or      	r7, r7, r5
9002eca4:	a67d      	ld.b      	r6, (r13, 0x7)
9002eca6:	3d06      	lsli      	r6, r6, 16
9002eca8:	1e76      	or      	r6, r6, r7
9002ecaa:	a78d      	ld.b      	r7, (r13, 0x8)
9002ecac:	3d87      	lsli      	r7, r7, 24
9002ecae:	1e67      	or      	r7, r7, r6
9002ecb0:	0f7c      	cmpne      	r12, r7
9002ecb2:	e0b5      	bt      	0x9002ee1e	// 0x9002ee1e
9002ecb4:	12e7      	mov      	r7, r14
9002ecb6:	1de7      	ixh      	r7, r7, r14
9002ecb8:	127d      	mov      	r13, r7
9002ecba:	3c4d      	lsli      	r13, r13, 4
9002ecbc:	057d      	subu      	r13, r13, r7
9002ecbe:	7664      	lrw      	r6, 0x288	// 0x9002ee50
9002ecc0:	1c06      	addu      	r6, r6, r0
9002ecc2:	1c6d      	addu      	r13, r13, r6
9002ecc4:	12dc      	mov      	r12, r13
9002ecc6:	204c      	addi      	r12, r12, 5
9002ecc8:	12c2      	mov      	r2, r12
9002ecca:	7362      	lrw      	r3, 0x904daea0	// 0x9002ee54
9002eccc:	7f63      	jsri      	0x900D2FA0	// 0x900d2fa0
9002ecce:	2a02      	cmpnei      	r2, 0
9002ecd0:	e00d      	bt      	0x9002ecec	// 0x9002ecec
9002ecd2:	20fd      	addi      	r13, r13, 16
9002ecd4:	a7ad      	ld.b      	r7, (r13, 0xa)
9002ecd6:	3c87      	lsli      	r7, r7, 8
9002ecd8:	a49d      	ld.b      	r4, (r13, 0x9)
9002ecda:	1e47      	or      	r7, r7, r4
9002ecdc:	a6bd      	ld.b      	r6, (r13, 0xb)
9002ecde:	3d06      	lsli      	r6, r6, 16
9002ece0:	1e76      	or      	r6, r6, r7
9002ece2:	a7cd      	ld.b      	r7, (r13, 0xc)
9002ece4:	3d87      	lsli      	r7, r7, 24
9002ece6:	1e67      	or      	r7, r7, r6
9002ece8:	755d      	lrw      	r5, 0x9064b4c8	// 0x9002ee5c
9002ecea:	9705      	st.w      	r7, (r5, 0x0)
9002ecec:	12c2      	mov      	r2, r12
9002ecee:	735c      	lrw      	r3, 0x904c096c	// 0x9002ee60
9002ecf0:	7f5a      	jsri      	0x900D2FA0	// 0x900d2fa0
9002ecf2:	122a      	mov      	r10, r2
9002ecf4:	2a02      	cmpnei      	r2, 0
9002ecf6:	e06f      	bt      	0x9002edd6	// 0x9002edd6
9002ecf8:	1202      	mov      	r2, r0
9002ecfa:	21f2      	addi      	r2, r2, 32
9002ecfc:	12a3      	mov      	r3, r10
9002ecfe:	6324      	movi      	r4, 50
9002ed00:	7f59      	jsri      	0x9047768C	// 0x9047768c
9002ed02:	6542      	movi      	r2, 84
9002ed04:	1c02      	addu      	r2, r2, r0
