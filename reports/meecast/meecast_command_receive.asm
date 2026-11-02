
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90013ed0 <.data+0x13ed0>:
90013ed0:	25f0      	subi      	r0, r0, 32
90013ed2:	9800      	st.w      	r8, (r0, 0x0)
90013ed4:	9910      	st.w      	r9, (r0, 0x4)
90013ed6:	9a20      	st.w      	r10, (r0, 0x8)
90013ed8:	9b30      	st.w      	r11, (r0, 0xc)
90013eda:	9c40      	st.w      	r12, (r0, 0x10)
90013edc:	9d50      	st.w      	r13, (r0, 0x14)
90013ede:	9e60      	st.w      	r14, (r0, 0x18)
90013ee0:	9f70      	st.w      	r15, (r0, 0x1c)
90013ee2:	7135      	lrw      	r1, 0x98	// 0x90013fb8
90013ee4:	0510      	subu      	r0, r0, r1
90013ee6:	120e      	mov      	r14, r0
90013ee8:	20fe      	addi      	r14, r14, 16
90013eea:	6015      	movi      	r5, 1
90013eec:	9510      	st.w      	r5, (r0, 0x4)
90013eee:	32e2      	bgeni      	r2, 14
90013ef0:	7f33      	jsri      	0x90081100	// 0x90081100
90013ef2:	122c      	mov      	r12, r2
90013ef4:	6206      	movi      	r6, 32
90013ef6:	9600      	st.w      	r6, (r0, 0x0)
90013ef8:	1202      	mov      	r2, r0
90013efa:	2072      	addi      	r2, r2, 8
90013efc:	ffcf      	bsr      	0x90013e9c	// 0x90013e9c
90013efe:	7b31      	lrw      	r11, 0x904adc98	// 0x90013fc4
90013f00:	60ca      	movi      	r10, 12
90013f02:	6642      	movi      	r2, 100
90013f04:	7f31      	jsri      	0x900785B8	// 0x900785b8
90013f06:	7f31      	jsri      	0x900753EC	// 0x900753ec
90013f08:	2a02      	cmpnei      	r2, 0
90013f0a:	effb      	bf      	0x90013f02	// 0x90013f02
90013f0c:	6642      	movi      	r2, 100
90013f0e:	7f2e      	jsri      	0x900785B8	// 0x900785b8
90013f10:	6022      	movi      	r2, 2
90013f12:	1223      	mov      	r3, r2
90013f14:	6004      	movi      	r4, 0
90013f16:	7f2e      	jsri      	0x900DC4FC	// 0x900dc4fc
90013f18:	122d      	mov      	r13, r2
90013f1a:	2c07      	bmaski      	r7, 0
90013f1c:	0f72      	cmpne      	r2, r7
90013f1e:	eff1      	bf      	0x90013f02	// 0x90013f02
90013f20:	2d03      	bmaski      	r3, 16
90013f22:	6044      	movi      	r4, 4
90013f24:	1205      	mov      	r5, r0
90013f26:	1c45      	addu      	r5, r5, r4
90013f28:	1246      	mov      	r6, r4
90013f2a:	7f2a      	jsri      	0x900DCE9C	// 0x900dce9c
90013f2c:	1202      	mov      	r2, r0
90013f2e:	20f2      	addi      	r2, r2, 16
90013f30:	6003      	movi      	r3, 0
90013f32:	6204      	movi      	r4, 32
90013f34:	7f29      	jsri      	0x9047768C	// 0x9047768c
90013f36:	7529      	lrw      	r5, 0xffffe849	// 0x90013fdc
90013f38:	d51e      	st.h      	r5, (r14, 0x2)
90013f3a:	6026      	movi      	r6, 2
90013f3c:	b61e      	st.b      	r6, (r14, 0x1)
90013f3e:	12d2      	mov      	r2, r13
90013f40:	12e3      	mov      	r3, r14
90013f42:	6204      	movi      	r4, 32
90013f44:	7f27      	jsri      	0x900DC7E4	// 0x900dc7e4
90013f46:	12d2      	mov      	r2, r13
90013f48:	12c3      	mov      	r3, r12
90013f4a:	32e4      	bgeni      	r4, 14
90013f4c:	6005      	movi      	r5, 0
90013f4e:	12e6      	mov      	r6, r14
90013f50:	1207      	mov      	r7, r0
90013f52:	7f24      	jsri      	0x900DCC70	// 0x900dcc70
90013f54:	1228      	mov      	r8, r2
90013f56:	2202      	cmplti      	r2, 1
90013f58:	e027      	bt      	0x90013fa8	// 0x90013fa8
90013f5a:	861e      	ld.w      	r6, (r14, 0x4)
90013f5c:	7723      	lrw      	r7, 0x90648e2c	// 0x90013fe8
90013f5e:	9607      	st.w      	r6, (r7, 0x0)
90013f60:	7719      	lrw      	r7, 0x904adc98	// 0x90013fc4
90013f62:	6009      	movi      	r9, 0
90013f64:	12c2      	mov      	r2, r12
90013f66:	8307      	ld.w      	r3, (r7, 0x0)
90013f68:	7521      	lrw      	r5, 0x90	// 0x90013fec
90013f6a:	1c05      	addu      	r5, r5, r0
90013f6c:	9705      	st.w      	r7, (r5, 0x0)
90013f6e:	7f20      	jsri      	0x900D2FA0	// 0x900d2fa0
90013f70:	2a02      	cmpnei      	r2, 0
90013f72:	751e      	lrw      	r5, 0x90	// 0x90013fec
90013f74:	1c05      	addu      	r5, r5, r0
90013f76:	8705      	ld.w      	r7, (r5, 0x0)
90013f78:	e012      	bt      	0x90013f9e	// 0x90013f9e
90013f7a:	1297      	mov      	r7, r9
90013f7c:	03a7      	mult      	r7, r7, r10
90013f7e:	1cb7      	addu      	r7, r7, r11
90013f80:	8717      	ld.w      	r7, (r7, 0x4)
90013f82:	2a07      	cmpnei      	r7, 0
90013f84:	e803      	bf      	0x90013f8c	// 0x90013f8c
90013f86:	12c2      	mov      	r2, r12
90013f88:	1283      	mov      	r3, r8
90013f8a:	00d7      	jsr      	r7
90013f8c:	03a9      	mult      	r9, r9, r10
90013f8e:	1cb9      	addu      	r9, r9, r11
90013f90:	8729      	ld.w      	r7, (r9, 0x8)
90013f92:	2a07      	cmpnei      	r7, 0
90013f94:	efd8      	bf      	0x90013f46	// 0x90013f46
90013f96:	12d2      	mov      	r2, r13
90013f98:	12e3      	mov      	r3, r14
90013f9a:	00d7      	jsr      	r7
90013f9c:	f7d4      	br      	0x90013f46	// 0x90013f46
90013f9e:	2009      	addi      	r9, r9, 1
90013fa0:	20b7      	addi      	r7, r7, 12
90013fa2:	2a99      	cmpnei      	r9, 9
90013fa4:	e7df      	bt      	0x90013f64	// 0x90013f64
90013fa6:	f7cf      	br      	0x90013f46	// 0x90013f46
90013fa8:	2a02      	cmpnei      	r2, 0
90013faa:	efcd      	bf      	0x90013f46	// 0x90013f46
90013fac:	12d2      	mov      	r2, r13
90013fae:	7f11      	jsri      	0x900DB430	// 0x900db430
90013fb0:	f7a8      	br      	0x90013f02	// 0x90013f02
