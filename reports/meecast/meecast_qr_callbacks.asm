
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90017d8c <.data+0x17d8c>:
90017d8c:	2470      	subi      	r0, r0, 8
90017d8e:	9e00      	st.w      	r14, (r0, 0x0)
90017d90:	9f10      	st.w      	r15, (r0, 0x4)
90017d92:	122e      	mov      	r14, r2
90017d94:	8742      	ld.w      	r7, (r2, 0x10)
90017d96:	2a17      	cmpnei      	r7, 1
90017d98:	e808      	bf      	0x90017daa	// 0x90017daa
90017d9a:	8422      	ld.w      	r4, (r2, 0x8)
90017d9c:	2a04      	cmpnei      	r4, 0
90017d9e:	e805      	bf      	0x90017daa	// 0x90017daa
90017da0:	7206      	lrw      	r2, 0x904bcf80	// 0x90017db8
90017da2:	7306      	lrw      	r3, 0x904b83e0	// 0x90017dbc
90017da4:	7f07      	jsri      	0x9024E25C	// 0x9024e25c
90017da6:	822e      	ld.w      	r2, (r14, 0x8)
90017da8:	7f07      	jsri      	0x90013950	// 0x90013950
90017daa:	8f10      	ld.w      	r15, (r0, 0x4)
90017dac:	8e00      	ld.w      	r14, (r0, 0x0)
90017dae:	2070      	addi      	r0, r0, 8
90017db0:	00cf      	jmp      	r15
90017db2:	f7ff      	br      	0x90017db2	// 0x90017db2
90017db4:	f7ff      	br      	0x90017db4	// 0x90017db4
90017db6:	1200      	mov      	r0, r0
90017db8:	cf80      	ld.h      	r15, (r0, 0x10)
90017dba:	904b      	st.w      	r0, (r11, 0x10)
90017dbc:	83e0      	ld.w      	r3, (r0, 0x38)
90017dbe:	904b      	st.w      	r0, (r11, 0x10)
90017dc0:	e25c      	bt      	0x9001827a	// 0x9001827a
90017dc2:	9024      	st.w      	r0, (r4, 0x8)
90017dc4:	3950      	rotli      	r0, r0, 21
90017dc6:	9001      	st.w      	r0, (r1, 0x0)
90017dc8:	24f0      	subi      	r0, r0, 16
90017dca:	9d00      	st.w      	r13, (r0, 0x0)
90017dcc:	9e10      	st.w      	r14, (r0, 0x4)
90017dce:	9f20      	st.w      	r15, (r0, 0x8)
90017dd0:	7116      	lrw      	r1, 0x88	// 0x90017e28
90017dd2:	0510      	subu      	r0, r0, r1
90017dd4:	7e16      	lrw      	r14, 0x90649068	// 0x90017e2c
90017dd6:	12e2      	mov      	r2, r14
90017dd8:	6403      	movi      	r3, 64
90017dda:	7f15      	jsri      	0x90013B34	// 0x90013b34
90017ddc:	12e2      	mov      	r2, r14
90017dde:	7f15      	jsri      	0x900138AC	// 0x900138ac
90017de0:	1223      	mov      	r3, r2
90017de2:	2013      	addi      	r3, r3, 2
90017de4:	12e2      	mov      	r2, r14
90017de6:	1204      	mov      	r4, r0
90017de8:	7514      	lrw      	r5, 0x82	// 0x90017e38
90017dea:	7f14      	jsri      	0x90380C98	// 0x90380c98
90017dec:	7d15      	lrw      	r13, 0x904bcf80	// 0x90017e40
90017dee:	7e15      	lrw      	r14, 0x904b83e0	// 0x90017e44
90017df0:	12d2      	mov      	r2, r13
90017df2:	12e3      	mov      	r3, r14
90017df4:	1204      	mov      	r4, r0
90017df6:	7f14      	jsri      	0x9024E25C	// 0x9024e25c
90017df8:	12d2      	mov      	r2, r13
90017dfa:	7314      	lrw      	r3, 0x904f5d18	// 0x90017e4c
90017dfc:	7415      	lrw      	r4, 0x904b846c	// 0x90017e50
90017dfe:	7f12      	jsri      	0x9024E25C	// 0x9024e25c
90017e00:	12d2      	mov      	r2, r13
90017e02:	7f14      	jsri      	0x9024E524	// 0x9024e524
90017e04:	7215      	lrw      	r2, 0x904bcf94	// 0x90017e58
90017e06:	12e3      	mov      	r3, r14
90017e08:	7415      	lrw      	r4, 0x904bcfb0	// 0x90017e5c
90017e0a:	7f0f      	jsri      	0x9024E25C	// 0x9024e25c
90017e0c:	7215      	lrw      	r2, 0x904bcfc8	// 0x90017e60
90017e0e:	12e3      	mov      	r3, r14
90017e10:	7415      	lrw      	r4, 0x904bcfe0	// 0x90017e64
90017e12:	7f0d      	jsri      	0x9024E25C	// 0x9024e25c
90017e14:	6002      	movi      	r2, 0
90017e16:	7104      	lrw      	r1, 0x88	// 0x90017e28
90017e18:	1c10      	addu      	r0, r0, r1
90017e1a:	8f20      	ld.w      	r15, (r0, 0x8)
90017e1c:	8e10      	ld.w      	r14, (r0, 0x4)
90017e1e:	8d00      	ld.w      	r13, (r0, 0x0)
90017e20:	20f0      	addi      	r0, r0, 16
90017e22:	00cf      	jmp      	r15
90017e24:	f7ff      	br      	0x90017e24	// 0x90017e24
90017e26:	f7ff      	br      	0x90017e26	// 0x90017e26
90017e28:	0088      	dect      	r8, r8, 1
90017e2a:	0000      	bkpt
90017e2c:	9068      	st.w      	r0, (r8, 0x18)
90017e2e:	9064      	st.w      	r0, (r4, 0x18)
90017e30:	3b34      	asri      	r4, r4, 19
90017e32:	9001      	st.w      	r0, (r1, 0x0)
90017e34:	38ac      	rotli      	r12, r12, 10
90017e36:	9001      	st.w      	r0, (r1, 0x0)
90017e38:	0082      	dect      	r2, r2, 1
90017e3a:	0000      	bkpt
90017e3c:	0c98      	cmphs      	r8, r9
90017e3e:	9038      	st.w      	r0, (r8, 0xc)
90017e40:	cf80      	ld.h      	r15, (r0, 0x10)
90017e42:	904b      	st.w      	r0, (r11, 0x10)
90017e44:	83e0      	ld.w      	r3, (r0, 0x38)
90017e46:	904b      	st.w      	r0, (r11, 0x10)
90017e48:	e25c      	bt      	0x90018302	// 0x90018302
90017e4a:	9024      	st.w      	r0, (r4, 0x8)
90017e4c:	5d18      	stex      	r13, (r8, 0x1)
90017e4e:	904f      	st.w      	r0, (r15, 0x10)
90017e50:	846c      	ld.w      	r4, (r12, 0x18)
90017e52:	904b      	st.w      	r0, (r11, 0x10)
90017e54:	e524      	bt      	0x9001789e	// 0x9001789e
90017e56:	9024      	st.w      	r0, (r4, 0x8)
90017e58:	cf94      	ld.h      	r15, (r4, 0x12)
90017e5a:	904b      	st.w      	r0, (r11, 0x10)
90017e5c:	cfb0      	ld.h      	r15, (r0, 0x16)
90017e5e:	904b      	st.w      	r0, (r11, 0x10)
90017e60:	cfc8      	ld.h      	r15, (r8, 0x18)
90017e62:	904b      	st.w      	r0, (r11, 0x10)
90017e64:	cfe0      	ld.h      	r15, (r0, 0x1c)
90017e66:	904b      	st.w      	r0, (r11, 0x10)
90017e68:	6002      	movi      	r2, 0
90017e6a:	00cf      	jmp      	r15
90017e6c:	2470      	subi      	r0, r0, 8
90017e6e:	9e00      	st.w      	r14, (r0, 0x0)
90017e70:	9f10      	st.w      	r15, (r0, 0x4)
90017e72:	a703      	ld.b      	r7, (r3, 0x0)
90017e74:	2a27      	cmpnei      	r7, 2
90017e76:	e01a      	bt      	0x90017eac	// 0x90017eac
90017e78:	c743      	ld.h      	r7, (r3, 0x8)
90017e7a:	2bb7      	cmpnei      	r7, 27
90017e7c:	e806      	bf      	0x90017e8a	// 0x90017e8a
90017e7e:	66d6      	movi      	r6, 109
90017e80:	0f67      	cmpne      	r7, r6
90017e82:	e803      	bf      	0x90017e8a	// 0x90017e8a
90017e84:	2ad7      	cmpnei      	r7, 13
90017e86:	e012      	bt      	0x90017eac	// 0x90017eac
90017e88:	f002      	br      	0x90017e8e	// 0x90017e8e
90017e8a:	6012      	movi      	r2, 1
90017e8c:	f010      	br      	0x90017eae	// 0x90017eae
90017e8e:	7e0b      	lrw      	r14, 0x90649048	// 0x90017ebc
90017e90:	12e2      	mov      	r2, r14
90017e92:	6003      	movi      	r3, 0
90017e94:	6204      	movi      	r4, 32
90017e96:	7f0a      	jsri      	0x9047768C	// 0x9047768c
90017e98:	61f7      	movi      	r7, 31
90017e9a:	973e      	st.w      	r7, (r14, 0xc)
90017e9c:	770a      	lrw      	r7, 0x90017d8c	// 0x90017ec4
90017e9e:	976e      	st.w      	r7, (r14, 0x18)
90017ea0:	770a      	lrw      	r7, 0xc8	// 0x90017ec8
90017ea2:	d70e      	st.h      	r7, (r14, 0x0)
90017ea4:	770a      	lrw      	r7, 0x82	// 0x90017ecc
90017ea6:	d71e      	st.h      	r7, (r14, 0x2)
90017ea8:	12e2      	mov      	r2, r14
90017eaa:	7f09      	jsri      	0x90023354	// 0x90023354
90017eac:	6002      	movi      	r2, 0
90017eae:	8f10      	ld.w      	r15, (r0, 0x4)
90017eb0:	8e00      	ld.w      	r14, (r0, 0x0)
90017eb2:	2070      	addi      	r0, r0, 8
90017eb4:	00cf      	jmp      	r15
90017eb6:	f7ff      	br      	0x90017eb6	// 0x90017eb6
90017eb8:	f7ff      	br      	0x90017eb8	// 0x90017eb8
90017eba:	1200      	mov      	r0, r0
90017ebc:	9048      	st.w      	r0, (r8, 0x10)
90017ebe:	9064      	st.w      	r0, (r4, 0x18)
90017ec0:	768c      	lrw      	r6, 0x1c670356	// 0x900180f0
90017ec2:	9047      	st.w      	r0, (r7, 0x10)
90017ec4:	7d8c      	lrw      	r13, 0x77309700	// 0x900180f4
90017ec6:	9001      	st.w      	r0, (r1, 0x0)
90017ec8:	00c8      	jmp      	r8
90017eca:	0000      	bkpt
90017ecc:	0082      	dect      	r2, r2, 1
90017ece:	0000      	bkpt
90017ed0:	3354      	bgeni      	r4, 21
90017ed2:	9002      	st.w      	r0, (r2, 0x0)
90017ed4:	2470      	subi      	r0, r0, 8
90017ed6:	9f00      	st.w      	r15, (r0, 0x0)
90017ed8:	a703      	ld.b      	r7, (r3, 0x0)
90017eda:	2a27      	cmpnei      	r7, 2
90017edc:	e008      	bt      	0x90017eee	// 0x90017eee
90017ede:	c743      	ld.h      	r7, (r3, 0x8)
90017ee0:	2bb7      	cmpnei      	r7, 27
90017ee2:	e803      	bf      	0x90017eea	// 0x90017eea
90017ee4:	66d6      	movi      	r6, 109
90017ee6:	0f67      	cmpne      	r7, r6
90017ee8:	e002      	bt      	0x90017eee	// 0x90017eee
90017eea:	7204      	lrw      	r2, 0x904bcff4	// 0x90017efc
90017eec:	7f05      	jsri      	0x9024E020	// 0x9024e020
90017eee:	6002      	movi      	r2, 0
90017ef0:	8f00      	ld.w      	r15, (r0, 0x0)
90017ef2:	2070      	addi      	r0, r0, 8
90017ef4:	00cf      	jmp      	r15
90017ef6:	f7ff      	br      	0x90017ef6	// 0x90017ef6
90017ef8:	f7ff      	br      	0x90017ef8	// 0x90017ef8
90017efa:	1200      	mov      	r0, r0
90017efc:	cff4      	ld.h      	r15, (r4, 0x1e)
90017efe:	904b      	st.w      	r0, (r11, 0x10)
90017f00:	e020      	bt      	0x90017f42	// 0x90017f42
90017f02:	9024      	st.w      	r0, (r4, 0x8)
