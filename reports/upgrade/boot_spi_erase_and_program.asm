
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f6da90 <.data+0xfa90>:
93f6da90:	2570      	subi      	r0, r0, 24
93f6da92:	9a00      	st.w      	r10, (r0, 0x0)
93f6da94:	9b10      	st.w      	r11, (r0, 0x4)
93f6da96:	9c20      	st.w      	r12, (r0, 0x8)
93f6da98:	9d30      	st.w      	r13, (r0, 0xc)
93f6da9a:	9e40      	st.w      	r14, (r0, 0x10)
93f6da9c:	9f50      	st.w      	r15, (r0, 0x14)
93f6da9e:	7d17      	lrw      	r13, 0x93f74784	// 0x93f6dafc
93f6daa0:	872d      	ld.w      	r7, (r13, 0x8)
93f6daa2:	8727      	ld.w      	r7, (r7, 0x8)
93f6daa4:	122e      	mov      	r14, r2
93f6daa6:	1271      	mov      	r1, r7
93f6daa8:	2c1e      	divu      	r14, r14, r1
93f6daaa:	037e      	mult      	r14, r14, r7
93f6daac:	1c32      	addu      	r2, r2, r3
93f6daae:	05e2      	subu      	r2, r2, r14
93f6dab0:	12db      	mov      	r11, r13
93f6dab2:	21fb      	addi      	r11, r11, 32
93f6dab4:	7c13      	lrw      	r12, 0xffffffd8	// 0x93f6db00
93f6dab6:	f015      	br      	0x93f6dae2	// 0x93f6dae2
93f6dab8:	872d      	ld.w      	r7, (r13, 0x8)
93f6daba:	8a27      	ld.w      	r10, (r7, 0x8)
93f6dabc:	0ca2      	cmphs      	r2, r10
93f6dabe:	022a      	movt      	r10, r2
93f6dac0:	7f11      	jsri      	0x93F6D6AC	// 0x93f6d6ac
93f6dac2:	fed4      	bsr      	0x93f6d86c	// 0x93f6d86c
93f6dac4:	fec5      	bsr      	0x93f6d850	// 0x93f6d850
93f6dac6:	bc0b      	st.b      	r12, (r11, 0x0)
93f6dac8:	7212      	lrw      	r2, 0x93f7478c	// 0x93f6db10
93f6daca:	12e3      	mov      	r3, r14
93f6dacc:	7f12      	jsri      	0x93F6D650	// 0x93f6d650
93f6dace:	872d      	ld.w      	r7, (r13, 0x8)
93f6dad0:	2137      	addi      	r7, r7, 20
93f6dad2:	7211      	lrw      	r2, 0x93f747a4	// 0x93f6db18
93f6dad4:	a307      	ld.b      	r3, (r7, 0x0)
93f6dad6:	2003      	addi      	r3, r3, 1
93f6dad8:	fe07      	bsr      	0x93f6d6e8	// 0x93f6d6e8
93f6dada:	872d      	ld.w      	r7, (r13, 0x8)
93f6dadc:	8227      	ld.w      	r2, (r7, 0x8)
93f6dade:	1c2e      	addu      	r14, r14, r2
93f6dae0:	14a2      	rsub      	r2, r2, r10
93f6dae2:	2a02      	cmpnei      	r2, 0
93f6dae4:	e7e9      	bt      	0x93f6dab8	// 0x93f6dab8
93f6dae6:	8f50      	ld.w      	r15, (r0, 0x14)
93f6dae8:	8e40      	ld.w      	r14, (r0, 0x10)
93f6daea:	8d30      	ld.w      	r13, (r0, 0xc)
93f6daec:	8c20      	ld.w      	r12, (r0, 0x8)
93f6daee:	8b10      	ld.w      	r11, (r0, 0x4)
93f6daf0:	8a00      	ld.w      	r10, (r0, 0x0)
93f6daf2:	2170      	addi      	r0, r0, 24
93f6daf4:	00cf      	jmp      	r15
93f6daf6:	f7ff      	br      	0x93f6daf6	// 0x93f6daf6
93f6daf8:	f7ff      	br      	0x93f6daf8	// 0x93f6daf8
93f6dafa:	1200      	mov      	r0, r0
93f6dafc:	4784      	ldex      	r7, (r4, 0x8)
93f6dafe:	93f7      	st.w      	r3, (r7, 0x3c)
93f6db00:	ffd8      	bsr      	0x93f6dab2	// 0x93f6dab2
93f6db02:	ffff      	bsr      	0x93f6db02	// 0x93f6db02
93f6db04:	d6ac      	st.h      	r6, (r12, 0x14)
93f6db06:	93f6      	st.w      	r3, (r6, 0x3c)
93f6db08:	d86c      	st.h      	r8, (r12, 0xc)
93f6db0a:	93f6      	st.w      	r3, (r6, 0x3c)
93f6db0c:	d850      	st.h      	r8, (r0, 0xa)
93f6db0e:	93f6      	st.w      	r3, (r6, 0x3c)
93f6db10:	478c      	ldex      	r7, (r12, 0x8)
93f6db12:	93f7      	st.w      	r3, (r7, 0x3c)
93f6db14:	d650      	st.h      	r6, (r0, 0xa)
93f6db16:	93f6      	st.w      	r3, (r6, 0x3c)
93f6db18:	47a4      	ldex      	r7, (r4, 0xa)
93f6db1a:	93f7      	st.w      	r3, (r7, 0x3c)
93f6db1c:	d6e8      	st.h      	r6, (r8, 0x1c)
93f6db1e:	93f6      	st.w      	r3, (r6, 0x3c)
93f6db20:	25f0      	subi      	r0, r0, 32
93f6db22:	9800      	st.w      	r8, (r0, 0x0)
93f6db24:	9910      	st.w      	r9, (r0, 0x4)
93f6db26:	9a20      	st.w      	r10, (r0, 0x8)
93f6db28:	9b30      	st.w      	r11, (r0, 0xc)
93f6db2a:	9c40      	st.w      	r12, (r0, 0x10)
93f6db2c:	9d50      	st.w      	r13, (r0, 0x14)
93f6db2e:	9e60      	st.w      	r14, (r0, 0x18)
93f6db30:	9f70      	st.w      	r15, (r0, 0x1c)
93f6db32:	6701      	movi      	r1, 112
93f6db34:	0510      	subu      	r0, r0, r1
93f6db36:	122c      	mov      	r12, r2
93f6db38:	123a      	mov      	r10, r3
93f6db3a:	124d      	mov      	r13, r4
93f6db3c:	7f34      	jsri      	0x93F6D6AC	// 0x93f6d6ac
93f6db3e:	2a0d      	cmpnei      	r13, 0
93f6db40:	e853      	bf      	0x93f6dbe8	// 0x93f6dbe8
93f6db42:	12d6      	mov      	r6, r13
93f6db44:	1cc6      	addu      	r6, r6, r12
93f6db46:	7b32      	lrw      	r11, 0x93f74784	// 0x93f6dc10
93f6db48:	871b      	ld.w      	r7, (r11, 0x4)
93f6db4a:	0c67      	cmphs      	r7, r6
93f6db4c:	e84f      	bf      	0x93f6dbec	// 0x93f6dbec
93f6db4e:	1202      	mov      	r2, r0
93f6db50:	7f31      	jsri      	0x93F6D62C	// 0x93f6d62c
93f6db52:	62ce      	movi      	r14, 44
93f6db54:	1c0e      	addu      	r14, r14, r0
93f6db56:	12e2      	mov      	r2, r14
93f6db58:	6003      	movi      	r3, 0
93f6db5a:	6404      	movi      	r4, 64
93f6db5c:	7f2f      	jsri      	0x93F63D64	// 0x93f63d64
93f6db5e:	12b9      	mov      	r9, r11
93f6db60:	21f9      	addi      	r9, r9, 32
93f6db62:	990e      	st.w      	r9, (r14, 0x0)
93f6db64:	872b      	ld.w      	r7, (r11, 0x8)
93f6db66:	2137      	addi      	r7, r7, 20
93f6db68:	a707      	ld.b      	r7, (r7, 0x0)
93f6db6a:	2007      	addi      	r7, r7, 1
93f6db6c:	972e      	st.w      	r7, (r14, 0x8)
93f6db6e:	8710      	ld.w      	r7, (r0, 0x4)
93f6db70:	6446      	movi      	r6, 68
93f6db72:	1c06      	addu      	r6, r6, r0
93f6db74:	9610      	st.w      	r6, (r0, 0x4)
93f6db76:	906e      	st.w      	r0, (r14, 0x18)
93f6db78:	977e      	st.w      	r7, (r14, 0x1c)
93f6db7a:	9607      	st.w      	r6, (r7, 0x0)
93f6db7c:	9a8e      	st.w      	r10, (r14, 0x20)
93f6db7e:	8710      	ld.w      	r7, (r0, 0x4)
93f6db80:	6646      	movi      	r6, 100
93f6db82:	1c06      	addu      	r6, r6, r0
93f6db84:	9610      	st.w      	r6, (r0, 0x4)
93f6db86:	90ee      	st.w      	r0, (r14, 0x38)
93f6db88:	97fe      	st.w      	r7, (r14, 0x3c)
93f6db8a:	9607      	st.w      	r6, (r7, 0x0)
93f6db8c:	fe6f      	bsr      	0x93f6d86c	// 0x93f6d86c
93f6db8e:	fe60      	bsr      	0x93f6d850	// 0x93f6d850
93f6db90:	6027      	movi      	r7, 2
93f6db92:	b709      	st.b      	r7, (r9, 0x0)
93f6db94:	12b2      	mov      	r2, r11
93f6db96:	2072      	addi      	r2, r2, 8
93f6db98:	12c3      	mov      	r3, r12
93f6db9a:	7f22      	jsri      	0x93F6D650	// 0x93f6d650
93f6db9c:	2c8b      	bmaski      	r11, 8
93f6db9e:	16cb      	and      	r11, r11, r12
93f6dba0:	12d7      	mov      	r7, r13
93f6dba2:	1cb7      	addu      	r7, r7, r11
93f6dba4:	3288      	bgeni      	r8, 8
93f6dba6:	0c78      	cmphs      	r8, r7
93f6dba8:	e804      	bf      	0x93f6dbb2	// 0x93f6dbb2
93f6dbaa:	9dae      	st.w      	r13, (r14, 0x28)
93f6dbac:	1202      	mov      	r2, r0
93f6dbae:	7f1e      	jsri      	0x93F6D6C8	// 0x93f6d6c8
93f6dbb0:	f019      	br      	0x93f6dbe4	// 0x93f6dbe4
93f6dbb2:	148b      	rsub      	r11, r11, r8
93f6dbb4:	9bae      	st.w      	r11, (r14, 0x28)
93f6dbb6:	1202      	mov      	r2, r0
93f6dbb8:	7f1c      	jsri      	0x93F6D6C8	// 0x93f6d6c8
93f6dbba:	f012      	br      	0x93f6dbe0	// 0x93f6dbe0
93f6dbbc:	12d9      	mov      	r9, r13
93f6dbbe:	05b9      	subu      	r9, r9, r11
93f6dbc0:	0c89      	cmphs      	r9, r8
93f6dbc2:	3287      	bgeni      	r7, 8
93f6dbc4:	0279      	movt      	r9, r7
93f6dbc6:	7219      	lrw      	r2, 0x93f7478c	// 0x93f6dc2c
93f6dbc8:	12b3      	mov      	r3, r11
93f6dbca:	1cc3      	addu      	r3, r3, r12
93f6dbcc:	7f16      	jsri      	0x93F6D650	// 0x93f6d650
93f6dbce:	12a7      	mov      	r7, r10
93f6dbd0:	1cb7      	addu      	r7, r7, r11
93f6dbd2:	978e      	st.w      	r7, (r14, 0x20)
93f6dbd4:	99ae      	st.w      	r9, (r14, 0x28)
93f6dbd6:	fe4a      	bsr      	0x93f6d86c	// 0x93f6d86c
93f6dbd8:	fe3b      	bsr      	0x93f6d850	// 0x93f6d850
93f6dbda:	1202      	mov      	r2, r0
93f6dbdc:	7f13      	jsri      	0x93F6D6C8	// 0x93f6d6c8
93f6dbde:	1c9b      	addu      	r11, r11, r9
93f6dbe0:	0cdb      	cmphs      	r11, r13
93f6dbe2:	efec      	bf      	0x93f6dbbc	// 0x93f6dbbc
93f6dbe4:	6002      	movi      	r2, 0
93f6dbe6:	f003      	br      	0x93f6dbee	// 0x93f6dbee
93f6dbe8:	12d2      	mov      	r2, r13
93f6dbea:	f001      	br      	0x93f6dbee	// 0x93f6dbee
93f6dbec:	7211      	lrw      	r2, 0xffffffea	// 0x93f6dc30
93f6dbee:	6701      	movi      	r1, 112
93f6dbf0:	1c10      	addu      	r0, r0, r1
93f6dbf2:	8f70      	ld.w      	r15, (r0, 0x1c)
93f6dbf4:	8e60      	ld.w      	r14, (r0, 0x18)
93f6dbf6:	8d50      	ld.w      	r13, (r0, 0x14)
93f6dbf8:	8c40      	ld.w      	r12, (r0, 0x10)
93f6dbfa:	8b30      	ld.w      	r11, (r0, 0xc)
93f6dbfc:	8a20      	ld.w      	r10, (r0, 0x8)
93f6dbfe:	8910      	ld.w      	r9, (r0, 0x4)
93f6dc00:	8800      	ld.w      	r8, (r0, 0x0)
93f6dc02:	21f0      	addi      	r0, r0, 32
93f6dc04:	00cf      	jmp      	r15
93f6dc06:	f7ff      	br      	0x93f6dc06	// 0x93f6dc06
93f6dc08:	f7ff      	br      	0x93f6dc08	// 0x93f6dc08
93f6dc0a:	1200      	mov      	r0, r0
93f6dc0c:	d6ac      	st.h      	r6, (r12, 0x14)
93f6dc0e:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc10:	4784      	ldex      	r7, (r4, 0x8)
93f6dc12:	93f7      	st.w      	r3, (r7, 0x3c)
93f6dc14:	d62c      	st.h      	r6, (r12, 0x4)
93f6dc16:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc18:	3d64      	lsli      	r4, r4, 22
93f6dc1a:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc1c:	d86c      	st.h      	r8, (r12, 0xc)
93f6dc1e:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc20:	d850      	st.h      	r8, (r0, 0xa)
93f6dc22:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc24:	d650      	st.h      	r6, (r0, 0xa)
93f6dc26:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc28:	d6c8      	st.h      	r6, (r8, 0x18)
93f6dc2a:	93f6      	st.w      	r3, (r6, 0x3c)
93f6dc2c:	478c      	ldex      	r7, (r12, 0x8)
93f6dc2e:	93f7      	st.w      	r3, (r7, 0x3c)
93f6dc30:	ffea      	bsr      	0x93f6dc06	// 0x93f6dc06
93f6dc32:	ffff      	bsr      	0x93f6dc32	// 0x93f6dc32
