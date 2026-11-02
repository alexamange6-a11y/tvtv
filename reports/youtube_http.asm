
inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90115bd0 <.data+0x115bd0>:
90115bd0:	e794      	bt      	0x90115afa	// 0x90115afa
90115bd2:	9011      	st.w      	r0, (r1, 0x4)
90115bd4:	768c      	lrw      	r6, 0x904da31c	// 0x90115e04
90115bd6:	9047      	st.w      	r0, (r7, 0x10)
90115bd8:	a410      	ld.b      	r4, (r0, 0x1)
90115bda:	904d      	st.w      	r0, (r13, 0x10)
90115bdc:	e7dc      	bt      	0x90115b96	// 0x90115b96
90115bde:	9011      	st.w      	r0, (r1, 0x4)
90115be0:	9f90      	st.w      	r15, (r0, 0x24)
90115be2:	904d      	st.w      	r0, (r13, 0x10)
90115be4:	a430      	ld.b      	r4, (r0, 0x3)
90115be6:	904d      	st.w      	r0, (r13, 0x10)
90115be8:	94e4      	st.w      	r4, (r4, 0x38)
90115bea:	904f      	st.w      	r0, (r15, 0x10)
90115bec:	4954      	ldex      	r9, (r4, 0x5)
90115bee:	9011      	st.w      	r0, (r1, 0x4)
90115bf0:	a420      	ld.b      	r4, (r0, 0x2)
90115bf2:	904d      	st.w      	r0, (r13, 0x10)
90115bf4:	4eb0      	ldex      	r14, (r0, 0xb)
90115bf6:	9081      	st.w      	r0, (r1, 0x20)
90115bf8:	4eb4      	ldex      	r14, (r4, 0xb)
90115bfa:	9081      	st.w      	r0, (r1, 0x20)
90115bfc:	a454      	ld.b      	r4, (r4, 0x5)
90115bfe:	904d      	st.w      	r0, (r13, 0x10)
90115c00:	15a0      	ixw      	r0, r0, r10
90115c02:	900d      	st.w      	r0, (r13, 0x0)
90115c04:	4a3c      	ldex      	r10, (r12, 0x3)
90115c06:	9011      	st.w      	r0, (r1, 0x4)
90115c08:	4bc8      	ldex      	r11, (r8, 0xc)
90115c0a:	9011      	st.w      	r0, (r1, 0x4)
90115c0c:	4ea0      	ldex      	r14, (r0, 0xa)
90115c0e:	9011      	st.w      	r0, (r1, 0x4)
90115c10:	4b30      	ldex      	r11, (r0, 0x3)
90115c12:	9011      	st.w      	r0, (r1, 0x4)
90115c14:	fffc      	bsr      	0x90115c0e	// 0x90115c0e
90115c16:	ffff      	bsr      	0x90115c16	// 0x90115c16
90115c18:	ff38      	bsr      	0x90115a8a	// 0x90115a8a
90115c1a:	ffff      	bsr      	0x90115c1a	// 0x90115c1a
90115c1c:	ddb0      	st.h      	r13, (r0, 0x16)
90115c1e:	9011      	st.w      	r0, (r1, 0x4)
90115c20:	2570      	subi      	r0, r0, 24
90115c22:	9a00      	st.w      	r10, (r0, 0x0)
90115c24:	9b10      	st.w      	r11, (r0, 0x4)
90115c26:	9c20      	st.w      	r12, (r0, 0x8)
90115c28:	9d30      	st.w      	r13, (r0, 0xc)
90115c2a:	9e40      	st.w      	r14, (r0, 0x10)
90115c2c:	9f50      	st.w      	r15, (r0, 0x14)
90115c2e:	7156      	lrw      	r1, 0x820	// 0x90115d88
90115c30:	0510      	subu      	r0, r0, r1
90115c32:	122a      	mov      	r10, r2
90115c34:	123c      	mov      	r12, r3
90115c36:	7f55      	jsri      	0x9011E908	// 0x9011e908
90115c38:	122d      	mov      	r13, r2
90115c3a:	7f54      	jsri      	0x9011E908	// 0x9011e908
90115c3c:	122b      	mov      	r11, r2
90115c3e:	12d2      	mov      	r2, r13
90115c40:	7354      	lrw      	r3, 0x904da1e0	// 0x90115d90
90115c42:	12b4      	mov      	r4, r11
90115c44:	7f54      	jsri      	0x9011E810	// 0x9011e810
90115c46:	7f51      	jsri      	0x9011E908	// 0x9011e908
90115c48:	122e      	mov      	r14, r2
90115c4a:	12b2      	mov      	r2, r11
90115c4c:	7353      	lrw      	r3, 0x904da1e8	// 0x90115d98
90115c4e:	12e4      	mov      	r4, r14
90115c50:	7f51      	jsri      	0x9011E810	// 0x9011e810
90115c52:	7252      	lrw      	r2, 0x904da464	// 0x90115d9c
90115c54:	7f53      	jsri      	0x9011E8D4	// 0x9011e8d4
90115c56:	1224      	mov      	r4, r2
90115c58:	12e2      	mov      	r2, r14
90115c5a:	7352      	lrw      	r3, 0x904da1f4	// 0x90115da4
90115c5c:	7f4e      	jsri      	0x9011E810	// 0x9011e810
90115c5e:	7252      	lrw      	r2, 0x904da46c	// 0x90115da8
90115c60:	7f50      	jsri      	0x9011E8D4	// 0x9011e8d4
90115c62:	1224      	mov      	r4, r2
90115c64:	12e2      	mov      	r2, r14
90115c66:	7351      	lrw      	r3, 0x904da20c	// 0x90115dac
90115c68:	7f4b      	jsri      	0x9011E810	// 0x9011e810
90115c6a:	6002      	movi      	r2, 0
90115c6c:	7351      	lrw      	r3, 0x403e0000	// 0x90115db0
90115c6e:	7f51      	jsri      	0x9011E894	// 0x9011e894
90115c70:	1224      	mov      	r4, r2
90115c72:	12e2      	mov      	r2, r14
90115c74:	7351      	lrw      	r3, 0x904da474	// 0x90115db8
90115c76:	7f47      	jsri      	0x9011E810	// 0x9011e810
90115c78:	7251      	lrw      	r2, 0x904da488	// 0x90115dbc
90115c7a:	7f49      	jsri      	0x9011E8D4	// 0x9011e8d4
90115c7c:	1224      	mov      	r4, r2
90115c7e:	12e2      	mov      	r2, r14
90115c80:	7350      	lrw      	r3, 0x904da280	// 0x90115dc0
90115c82:	7f44      	jsri      	0x9011E810	// 0x9011e810
90115c84:	7250      	lrw      	r2, 0x904b8bb4	// 0x90115dc4
90115c86:	7f46      	jsri      	0x9011E8D4	// 0x9011e8d4
90115c88:	1224      	mov      	r4, r2
90115c8a:	12e2      	mov      	r2, r14
90115c8c:	734f      	lrw      	r3, 0x904da28c	// 0x90115dc8
90115c8e:	7f41      	jsri      	0x9011E810	// 0x9011e810
90115c90:	724f      	lrw      	r2, 0x904da290	// 0x90115dcc
90115c92:	7f43      	jsri      	0x9011E8D4	// 0x9011e8d4
90115c94:	1224      	mov      	r4, r2
90115c96:	12e2      	mov      	r2, r14
90115c98:	734e      	lrw      	r3, 0x904da294	// 0x90115dd0
90115c9a:	7f3e      	jsri      	0x9011E810	// 0x9011e810
90115c9c:	6002      	movi      	r2, 0
90115c9e:	1223      	mov      	r3, r2
90115ca0:	7f45      	jsri      	0x9011E894	// 0x9011e894
90115ca2:	1224      	mov      	r4, r2
90115ca4:	12e2      	mov      	r2, r14
90115ca6:	734b      	lrw      	r3, 0x904da2a0	// 0x90115dd4
90115ca8:	7f3b      	jsri      	0x9011E810	// 0x9011e810
90115caa:	12a2      	mov      	r2, r10
90115cac:	7f3d      	jsri      	0x9011E8D4	// 0x9011e8d4
90115cae:	1224      	mov      	r4, r2
90115cb0:	12d2      	mov      	r2, r13
90115cb2:	7349      	lrw      	r3, 0x904d9b80	// 0x90115dd8
90115cb4:	7f38      	jsri      	0x9011E810	// 0x9011e810
90115cb6:	7f35      	jsri      	0x9011E908	// 0x9011e908
90115cb8:	122b      	mov      	r11, r2
90115cba:	12d2      	mov      	r2, r13
90115cbc:	7348      	lrw      	r3, 0x904da2b4	// 0x90115ddc
90115cbe:	12b4      	mov      	r4, r11
90115cc0:	7f35      	jsri      	0x9011E810	// 0x9011e810
90115cc2:	7f32      	jsri      	0x9011E908	// 0x9011e908
90115cc4:	122e      	mov      	r14, r2
90115cc6:	12b2      	mov      	r2, r11
90115cc8:	7346      	lrw      	r3, 0x904da2c4	// 0x90115de0
90115cca:	12e4      	mov      	r4, r14
90115ccc:	7f32      	jsri      	0x9011E810	// 0x9011e810
90115cce:	7245      	lrw      	r2, 0x904da2dc	// 0x90115de4
90115cd0:	7f34      	jsri      	0x9011E8D4	// 0x9011e8d4
90115cd2:	1224      	mov      	r4, r2
90115cd4:	12e2      	mov      	r2, r14
90115cd6:	7344      	lrw      	r3, 0x904da2f0	// 0x90115de8
90115cd8:	7f2f      	jsri      	0x9011E810	// 0x9011e810
90115cda:	7f44      	jsri      	0x9011E878	// 0x9011e878
90115cdc:	1224      	mov      	r4, r2
90115cde:	12d2      	mov      	r2, r13
90115ce0:	7344      	lrw      	r3, 0x904da300	// 0x90115df0
90115ce2:	7f2c      	jsri      	0x9011E810	// 0x9011e810
90115ce4:	7f42      	jsri      	0x9011E878	// 0x9011e878
90115ce6:	1224      	mov      	r4, r2
90115ce8:	12d2      	mov      	r2, r13
90115cea:	7342      	lrw      	r3, 0x904da310	// 0x90115df4
90115cec:	7f2a      	jsri      	0x9011E810	// 0x9011e810
90115cee:	12d2      	mov      	r2, r13
90115cf0:	7f42      	jsri      	0x9011E7AC	// 0x9011e7ac
90115cf2:	122e      	mov      	r14, r2
90115cf4:	12d2      	mov      	r2, r13
90115cf6:	7f41      	jsri      	0x9011DDB0	// 0x9011ddb0
90115cf8:	120d      	mov      	r13, r0
90115cfa:	21bd      	addi      	r13, r13, 28
90115cfc:	12d2      	mov      	r2, r13
90115cfe:	6003      	movi      	r3, 0
90115d00:	32b4      	bgeni      	r4, 11
90115d02:	7f3f      	jsri      	0x9047768C	// 0x9047768c
90115d04:	12d2      	mov      	r2, r13
90115d06:	32b3      	bgeni      	r3, 11
90115d08:	743f      	lrw      	r4, 0x904da31c	// 0x90115e04
90115d0a:	753f      	lrw      	r5, 0x904da324	// 0x90115e08
90115d0c:	7640      	lrw      	r6, 0x904da350	// 0x90115e0c
90115d0e:	7f40      	jsri      	0x900D3C18	// 0x900d3c18
90115d10:	1202      	mov      	r2, r0
90115d12:	6003      	movi      	r3, 0
90115d14:	60c4      	movi      	r4, 12
90115d16:	7f3a      	jsri      	0x9047768C	// 0x9047768c
90115d18:	120a      	mov      	r10, r0
90115d1a:	20ba      	addi      	r10, r10, 12
90115d1c:	12a2      	mov      	r2, r10
90115d1e:	6003      	movi      	r3, 0
90115d20:	6104      	movi      	r4, 16
90115d22:	7f37      	jsri      	0x9047768C	// 0x9047768c
90115d24:	7726      	lrw      	r7, 0x904da488	// 0x90115dbc
90115d26:	972a      	st.w      	r7, (r10, 0x8)
90115d28:	6002      	movi      	r2, 0
90115d2a:	733a      	lrw      	r3, 0x904da4c8	// 0x90115e14
90115d2c:	7f3b      	jsri      	0x9012B8EC	// 0x9012b8ec
90115d2e:	733b      	lrw      	r3, 0x904da4e4	// 0x90115e1c
90115d30:	7f3a      	jsri      	0x9012B8EC	// 0x9012b8ec
90115d32:	733b      	lrw      	r3, 0x904da3d0	// 0x90115e20
90115d34:	7f39      	jsri      	0x9012B8EC	// 0x9012b8ec
90115d36:	733b      	lrw      	r3, 0x904da3f0	// 0x90115e24
90115d38:	7f38      	jsri      	0x9012B8EC	// 0x9012b8ec
90115d3a:	122b      	mov      	r11, r2
90115d3c:	920a      	st.w      	r2, (r10, 0x0)
90115d3e:	9e1a      	st.w      	r14, (r10, 0x4)
90115d40:	12d2      	mov      	r2, r13
90115d42:	6013      	movi      	r3, 1
90115d44:	12a4      	mov      	r4, r10
90115d46:	1205      	mov      	r5, r0
90115d48:	7f38      	jsri      	0x9011F5E4	// 0x9011f5e4
90115d4a:	122d      	mov      	r13, r2
90115d4c:	2a02      	cmpnei      	r2, 0
90115d4e:	e004      	bt      	0x90115d58	// 0x90115d58
90115d50:	8200      	ld.w      	r2, (r0, 0x0)
90115d52:	12c3      	mov      	r3, r12
90115d54:	fe63      	bsr      	0x90115a1c	// 0x90115a1c
90115d56:	122d      	mov      	r13, r2
90115d58:	2a0b      	cmpnei      	r11, 0
90115d5a:	e802      	bf      	0x90115d60	// 0x90115d60
90115d5c:	12b2      	mov      	r2, r11
90115d5e:	7f34      	jsri      	0x9012B954	// 0x9012b954
90115d60:	2a0e      	cmpnei      	r14, 0
90115d62:	e802      	bf      	0x90115d68	// 0x90115d68
90115d64:	12e2      	mov      	r2, r14
90115d66:	7f33      	jsri      	0x900D190C	// 0x900d190c
90115d68:	1202      	mov      	r2, r0
90115d6a:	7f33      	jsri      	0x9011F56C	// 0x9011f56c
90115d6c:	12d2      	mov      	r2, r13
90115d6e:	7106      	lrw      	r1, 0x820	// 0x90115d88
90115d70:	1c10      	addu      	r0, r0, r1
90115d72:	8f50      	ld.w      	r15, (r0, 0x14)
90115d74:	8e40      	ld.w      	r14, (r0, 0x10)
90115d76:	8d30      	ld.w      	r13, (r0, 0xc)
90115d78:	8c20      	ld.w      	r12, (r0, 0x8)
90115d7a:	8b10      	ld.w      	r11, (r0, 0x4)
90115d7c:	8a00      	ld.w      	r10, (r0, 0x0)
90115d7e:	2170      	addi      	r0, r0, 24
90115d80:	00cf      	jmp      	r15
90115d82:	f7ff      	br      	0x90115d82	// 0x90115d82
90115d84:	f7ff      	br      	0x90115d84	// 0x90115d84
90115d86:	1200      	mov      	r0, r0
90115d88:	0820      	cprgr      	r0, cpr2
90115d8a:	0000      	bkpt
90115d8c:	e908      	bf      	0x90115f9e	// 0x90115f9e
90115d8e:	9011      	st.w      	r0, (r1, 0x4)
90115d90:	a1e0      	ld.b      	r1, (r0, 0xe)
90115d92:	904d      	st.w      	r0, (r13, 0x10)
90115d94:	e810      	bf      	0x90115db6	// 0x90115db6
90115d96:	9011      	st.w      	r0, (r1, 0x4)
90115d98:	a1e8      	ld.b      	r1, (r8, 0xe)
90115d9a:	904d      	st.w      	r0, (r13, 0x10)
90115d9c:	a464      	ld.b      	r4, (r4, 0x6)
90115d9e:	904d      	st.w      	r0, (r13, 0x10)
90115da0:	e8d4      	bf      	0x90115f4a	// 0x90115f4a
90115da2:	9011      	st.w      	r0, (r1, 0x4)
90115da4:	a1f4      	ld.b      	r1, (r4, 0xf)
90115da6:	904d      	st.w      	r0, (r13, 0x10)
90115da8:	a46c      	ld.b      	r4, (r12, 0x6)
90115daa:	904d      	st.w      	r0, (r13, 0x10)
90115dac:	a20c      	ld.b      	r2, (r12, 0x0)
90115dae:	904d      	st.w      	r0, (r13, 0x10)
90115db0:	0000      	bkpt
90115db2:	403e      	ldex      	r0, (r14, 0x3)
90115db4:	e894      	bf      	0x90115ede	// 0x90115ede
90115db6:	9011      	st.w      	r0, (r1, 0x4)
90115db8:	a474      	ld.b      	r4, (r4, 0x7)
90115dba:	904d      	st.w      	r0, (r13, 0x10)
90115dbc:	a488      	ld.b      	r4, (r8, 0x8)
90115dbe:	904d      	st.w      	r0, (r13, 0x10)
90115dc0:	a280      	ld.b      	r2, (r0, 0x8)
90115dc2:	904d      	st.w      	r0, (r13, 0x10)
90115dc4:	8bb4      	ld.w      	r11, (r4, 0x2c)
90115dc6:	904b      	st.w      	r0, (r11, 0x10)
90115dc8:	a28c      	ld.b      	r2, (r12, 0x8)
90115dca:	904d      	st.w      	r0, (r13, 0x10)
90115dcc:	a290      	ld.b      	r2, (r0, 0x9)
90115dce:	904d      	st.w      	r0, (r13, 0x10)
90115dd0:	a294      	ld.b      	r2, (r4, 0x9)
90115dd2:	904d      	st.w      	r0, (r13, 0x10)
90115dd4:	a2a0      	ld.b      	r2, (r0, 0xa)
90115dd6:	904d      	st.w      	r0, (r13, 0x10)
90115dd8:	9b80      	st.w      	r11, (r0, 0x20)
90115dda:	904d      	st.w      	r0, (r13, 0x10)
90115ddc:	a2b4      	ld.b      	r2, (r4, 0xb)
90115dde:	904d      	st.w      	r0, (r13, 0x10)
90115de0:	a2c4      	ld.b      	r2, (r4, 0xc)
90115de2:	904d      	st.w      	r0, (r13, 0x10)
90115de4:	a2dc      	ld.b      	r2, (r12, 0xd)
90115de6:	904d      	st.w      	r0, (r13, 0x10)
90115de8:	a2f0      	ld.b      	r2, (r0, 0xf)
90115dea:	904d      	st.w      	r0, (r13, 0x10)
90115dec:	e878      	bf      	0x90115ede	// 0x90115ede
90115dee:	9011      	st.w      	r0, (r1, 0x4)
90115df0:	a300      	ld.b      	r3, (r0, 0x0)
90115df2:	904d      	st.w      	r0, (r13, 0x10)
90115df4:	a310      	ld.b      	r3, (r0, 0x1)
90115df6:	904d      	st.w      	r0, (r13, 0x10)
90115df8:	e7ac      	bt      	0x90115d52	// 0x90115d52
90115dfa:	9011      	st.w      	r0, (r1, 0x4)
90115dfc:	ddb0      	st.h      	r13, (r0, 0x16)
90115dfe:	9011      	st.w      	r0, (r1, 0x4)
90115e00:	768c      	lrw      	r6, 0x904da574	// 0x90116030
90115e02:	9047      	st.w      	r0, (r7, 0x10)
90115e04:	a31c      	ld.b      	r3, (r12, 0x1)
90115e06:	904d      	st.w      	r0, (r13, 0x10)
90115e08:	a324      	ld.b      	r3, (r4, 0x2)
90115e0a:	904d      	st.w      	r0, (r13, 0x10)
90115e0c:	a350      	ld.b      	r3, (r0, 0x5)
90115e0e:	904d      	st.w      	r0, (r13, 0x10)
90115e10:	3c18      	lsli      	r8, r8, 1
90115e12:	900d      	st.w      	r0, (r13, 0x0)
90115e14:	a4c8      	ld.b      	r4, (r8, 0xc)
90115e16:	904d      	st.w      	r0, (r13, 0x10)
90115e18:	b8ec      	st.b      	r8, (r12, 0xe)
90115e1a:	9012      	st.w      	r0, (r2, 0x4)
90115e1c:	a4e4      	ld.b      	r4, (r4, 0xe)
90115e1e:	904d      	st.w      	r0, (r13, 0x10)
90115e20:	a3d0      	ld.b      	r3, (r0, 0xd)
90115e22:	904d      	st.w      	r0, (r13, 0x10)
90115e24:	a3f0      	ld.b      	r3, (r0, 0xf)
90115e26:	904d      	st.w      	r0, (r13, 0x10)
90115e28:	f5e4      	br      	0x901159f2	// 0x901159f2
90115e2a:	9011      	st.w      	r0, (r1, 0x4)
90115e2c:	5a1c      	stex      	r10, (r12, 0x1)
90115e2e:	9011      	st.w      	r0, (r1, 0x4)
90115e30:	b954      	st.b      	r9, (r4, 0x5)
90115e32:	9012      	st.w      	r0, (r2, 0x4)
90115e34:	190c      	mtcr      	r12, cr16
90115e36:	900d      	st.w      	r0, (r13, 0x0)
90115e38:	f56c      	br      	0x90115912	// 0x90115912
90115e3a:	9011      	st.w      	r0, (r1, 0x4)
90115e3c:	2570      	subi      	r0, r0, 24
90115e3e:	9a00      	st.w      	r10, (r0, 0x0)
90115e40:	9b10      	st.w      	r11, (r0, 0x4)
90115e42:	9c20      	st.w      	r12, (r0, 0x8)
90115e44:	9d30      	st.w      	r13, (r0, 0xc)
90115e46:	9e40      	st.w      	r14, (r0, 0x10)
90115e48:	9f50      	st.w      	r15, (r0, 0x14)
90115e4a:	7157      	lrw      	r1, 0x820	// 0x90115fa8
90115e4c:	0510      	subu      	r0, r0, r1
90115e4e:	122a      	mov      	r10, r2
90115e50:	123c      	mov      	r12, r3
90115e52:	7f56      	jsri      	0x9011E908	// 0x9011e908
90115e54:	122d      	mov      	r13, r2
90115e56:	7f55      	jsri      	0x9011E908	// 0x9011e908
90115e58:	122b      	mov      	r11, r2
90115e5a:	12d2      	mov      	r2, r13
90115e5c:	7355      	lrw      	r3, 0x904da1e0	// 0x90115fb0
90115e5e:	12b4      	mov      	r4, r11
90115e60:	7f55      	jsri      	0x9011E810	// 0x9011e810
90115e62:	7f52      	jsri      	0x9011E908	// 0x9011e908
90115e64:	122e      	mov      	r14, r2
90115e66:	12b2      	mov      	r2, r11
90115e68:	7354      	lrw      	r3, 0x904da1e8	// 0x90115fb8
90115e6a:	12e4      	mov      	r4, r14
90115e6c:	7f52      	jsri      	0x9011E810	// 0x9011e810
90115e6e:	7253      	lrw      	r2, 0x904da508	// 0x90115fbc
90115e70:	7f54      	jsri      	0x9011E8D4	// 0x9011e8d4
90115e72:	1224      	mov      	r4, r2
90115e74:	12e2      	mov      	r2, r14
90115e76:	7353      	lrw      	r3, 0x904da1f4	// 0x90115fc4
90115e78:	7f4f      	jsri      	0x9011E810	// 0x9011e810
90115e7a:	7253      	lrw      	r2, 0x904da528	// 0x90115fc8
90115e7c:	7f51      	jsri      	0x9011E8D4	// 0x9011e8d4
90115e7e:	1224      	mov      	r4, r2
90115e80:	12e2      	mov      	r2, r14
90115e82:	7352      	lrw      	r3, 0x904da20c	// 0x90115fcc
90115e84:	7f4c      	jsri      	0x9011E810	// 0x9011e810
90115e86:	7252      	lrw      	r2, 0x904b8bb4	// 0x90115fd0
90115e88:	7f4e      	jsri      	0x9011E8D4	// 0x9011e8d4
90115e8a:	1224      	mov      	r4, r2
90115e8c:	12e2      	mov      	r2, r14
90115e8e:	7351      	lrw      	r3, 0x904da28c	// 0x90115fd4
90115e90:	7f49      	jsri      	0x9011E810	// 0x9011e810
90115e92:	7251      	lrw      	r2, 0x904da290	// 0x90115fd8
90115e94:	7f4b      	jsri      	0x9011E8D4	// 0x9011e8d4
90115e96:	1224      	mov      	r4, r2
90115e98:	12e2      	mov      	r2, r14
90115e9a:	7350      	lrw      	r3, 0x904da294	// 0x90115fdc
90115e9c:	7f46      	jsri      	0x9011E810	// 0x9011e810
90115e9e:	6002      	movi      	r2, 0
90115ea0:	1223      	mov      	r3, r2
90115ea2:	7f4f      	jsri      	0x9011E894	// 0x9011e894
90115ea4:	1224      	mov      	r4, r2
90115ea6:	12e2      	mov      	r2, r14
90115ea8:	734f      	lrw      	r3, 0x904da2a0	// 0x90115fe4
90115eaa:	7f42      	jsri      	0x9011E810	// 0x9011e810
90115eac:	7f40      	jsri      	0x9011E908	// 0x9011e908
90115eae:	122e      	mov      	r14, r2
90115eb0:	12b2      	mov      	r2, r11
90115eb2:	734d      	lrw      	r3, 0x904da52c	// 0x90115fe8
90115eb4:	12e4      	mov      	r4, r14
90115eb6:	7f3f      	jsri      	0x9011E810	// 0x9011e810
90115eb8:	724d      	lrw      	r2, 0x904da538	// 0x90115fec
90115eba:	7f41      	jsri      	0x9011E8D4	// 0x9011e8d4
90115ebc:	1224      	mov      	r4, r2
90115ebe:	12e2      	mov      	r2, r14
90115ec0:	734c      	lrw      	r3, 0x904da554	// 0x90115ff0
90115ec2:	7f3c      	jsri      	0x9011E810	// 0x9011e810
90115ec4:	12a2      	mov      	r2, r10
90115ec6:	7f3e      	jsri      	0x9011E8D4	// 0x9011e8d4
90115ec8:	1224      	mov      	r4, r2
90115eca:	12d2      	mov      	r2, r13
90115ecc:	734a      	lrw      	r3, 0x904d9b80	// 0x90115ff4
90115ece:	7f39      	jsri      	0x9011E810	// 0x9011e810
90115ed0:	724a      	lrw      	r2, 0x904da560	// 0x90115ff8
90115ed2:	7f3b      	jsri      	0x9011E8D4	// 0x9011e8d4
90115ed4:	1224      	mov      	r4, r2
90115ed6:	12d2      	mov      	r2, r13
90115ed8:	7349      	lrw      	r3, 0x904da56c	// 0x90115ffc
90115eda:	7f36      	jsri      	0x9011E810	// 0x9011e810
90115edc:	7f34      	jsri      	0x9011E908	// 0x9011e908
90115ede:	122b      	mov      	r11, r2
90115ee0:	12d2      	mov      	r2, r13
90115ee2:	7347      	lrw      	r3, 0x904da2b4	// 0x90116000
90115ee4:	12b4      	mov      	r4, r11
90115ee6:	7f33      	jsri      	0x9011E810	// 0x9011e810
90115ee8:	7f31      	jsri      	0x9011E908	// 0x9011e908
90115eea:	122e      	mov      	r14, r2
90115eec:	12b2      	mov      	r2, r11
90115eee:	7345      	lrw      	r3, 0x904da2c4	// 0x90116004
90115ef0:	12e4      	mov      	r4, r14
90115ef2:	7f30      	jsri      	0x9011E810	// 0x9011e810
90115ef4:	7245      	lrw      	r2, 0x904da2dc	// 0x90116008
90115ef6:	7f32      	jsri      	0x9011E8D4	// 0x9011e8d4
90115ef8:	1224      	mov      	r4, r2
90115efa:	12e2      	mov      	r2, r14
90115efc:	7344      	lrw      	r3, 0x904da2f0	// 0x9011600c
90115efe:	7f2d      	jsri      	0x9011E810	// 0x9011e810
90115f00:	7f44      	jsri      	0x9011E878	// 0x9011e878
90115f02:	1224      	mov      	r4, r2
90115f04:	12d2      	mov      	r2, r13
90115f06:	7343      	lrw      	r3, 0x904da300	// 0x90116014
90115f08:	7f2b      	jsri      	0x9011E810	// 0x9011e810
90115f0a:	7f41      	jsri      	0x9011E878	// 0x9011e878
90115f0c:	1224      	mov      	r4, r2
90115f0e:	12d2      	mov      	r2, r13
90115f10:	7342      	lrw      	r3, 0x904da310	// 0x90116018
90115f12:	7f28      	jsri      	0x9011E810	// 0x9011e810
90115f14:	12d2      	mov      	r2, r13
90115f16:	7f41      	jsri      	0x9011E7AC	// 0x9011e7ac
90115f18:	122e      	mov      	r14, r2
90115f1a:	12d2      	mov      	r2, r13
90115f1c:	7f41      	jsri      	0x9011DDB0	// 0x9011ddb0
90115f1e:	120d      	mov      	r13, r0
90115f20:	21bd      	addi      	r13, r13, 28
90115f22:	12d2      	mov      	r2, r13
90115f24:	6003      	movi      	r3, 0
90115f26:	32b4      	bgeni      	r4, 11
90115f28:	7f3f      	jsri      	0x9047768C	// 0x9047768c
90115f2a:	12d2      	mov      	r2, r13
90115f2c:	32b3      	bgeni      	r3, 11
90115f2e:	743e      	lrw      	r4, 0x904da31c	// 0x90116028
90115f30:	753f      	lrw      	r5, 0x904da324	// 0x9011602c
90115f32:	763f      	lrw      	r6, 0x904da574	// 0x90116030
90115f34:	7f40      	jsri      	0x900D3C18	// 0x900d3c18
90115f36:	1202      	mov      	r2, r0
90115f38:	6003      	movi      	r3, 0
90115f3a:	60c4      	movi      	r4, 12
90115f3c:	7f3a      	jsri      	0x9047768C	// 0x9047768c
90115f3e:	120a      	mov      	r10, r0
90115f40:	20ba      	addi      	r10, r10, 12
90115f42:	12a2      	mov      	r2, r10
90115f44:	6003      	movi      	r3, 0
90115f46:	6104      	movi      	r4, 16
90115f48:	7f37      	jsri      	0x9047768C	// 0x9047768c
90115f4a:	6002      	movi      	r2, 0
90115f4c:	733b      	lrw      	r3, 0x904da5b4	// 0x90116038
90115f4e:	7f3b      	jsri      	0x9012B8EC	// 0x9012b8ec
90115f50:	733c      	lrw      	r3, 0x904da5d0	// 0x90116040
90115f52:	7f3a      	jsri      	0x9012B8EC	// 0x9012b8ec
90115f54:	733c      	lrw      	r3, 0x904da3d0	// 0x90116044
90115f56:	7f39      	jsri      	0x9012B8EC	// 0x9012b8ec
90115f58:	733c      	lrw      	r3, 0x904da3f0	// 0x90116048
90115f5a:	7f38      	jsri      	0x9012B8EC	// 0x9012b8ec
90115f5c:	122b      	mov      	r11, r2
90115f5e:	920a      	st.w      	r2, (r10, 0x0)
90115f60:	9e1a      	st.w      	r14, (r10, 0x4)
90115f62:	12d2      	mov      	r2, r13
90115f64:	6013      	movi      	r3, 1
90115f66:	12a4      	mov      	r4, r10
90115f68:	1205      	mov      	r5, r0
90115f6a:	7f38      	jsri      	0x9011F5E4	// 0x9011f5e4
90115f6c:	122d      	mov      	r13, r2
90115f6e:	2a02      	cmpnei      	r2, 0
90115f70:	e004      	bt      	0x90115f7a	// 0x90115f7a
90115f72:	8200      	ld.w      	r2, (r0, 0x0)
90115f74:	12c3      	mov      	r3, r12
90115f76:	7f36      	jsri      	0x90115A1C	// 0x90115a1c
90115f78:	122d      	mov      	r13, r2
90115f7a:	2a0b      	cmpnei      	r11, 0
90115f7c:	e802      	bf      	0x90115f82	// 0x90115f82
90115f7e:	12b2      	mov      	r2, r11
90115f80:	7f35      	jsri      	0x9012B954	// 0x9012b954
90115f82:	2a0e      	cmpnei      	r14, 0
90115f84:	e802      	bf      	0x90115f8a	// 0x90115f8a
90115f86:	12e2      	mov      	r2, r14
90115f88:	7f34      	jsri      	0x900D190C	// 0x900d190c
90115f8a:	1202      	mov      	r2, r0
90115f8c:	7f34      	jsri      	0x9011F56C	// 0x9011f56c
90115f8e:	12d2      	mov      	r2, r13
90115f90:	7106      	lrw      	r1, 0x820	// 0x90115fa8
90115f92:	1c10      	addu      	r0, r0, r1
90115f94:	8f50      	ld.w      	r15, (r0, 0x14)
90115f96:	8e40      	ld.w      	r14, (r0, 0x10)
90115f98:	8d30      	ld.w      	r13, (r0, 0xc)
90115f9a:	8c20      	ld.w      	r12, (r0, 0x8)
90115f9c:	8b10      	ld.w      	r11, (r0, 0x4)
90115f9e:	8a00      	ld.w      	r10, (r0, 0x0)
90115fa0:	2170      	addi      	r0, r0, 24
90115fa2:	00cf      	jmp      	r15
90115fa4:	f7ff      	br      	0x90115fa4	// 0x90115fa4
90115fa6:	f7ff      	br      	0x90115fa6	// 0x90115fa6
90115fa8:	0820      	cprgr      	r0, cpr2
90115faa:	0000      	bkpt
90115fac:	e908      	bf      	0x901161be	// 0x901161be
90115fae:	9011      	st.w      	r0, (r1, 0x4)
90115fb0:	a1e0      	ld.b      	r1, (r0, 0xe)
90115fb2:	904d      	st.w      	r0, (r13, 0x10)
90115fb4:	e810      	bf      	0x90115fd6	// 0x90115fd6
90115fb6:	9011      	st.w      	r0, (r1, 0x4)
90115fb8:	a1e8      	ld.b      	r1, (r8, 0xe)
90115fba:	904d      	st.w      	r0, (r13, 0x10)
90115fbc:	a508      	ld.b      	r5, (r8, 0x0)
90115fbe:	904d      	st.w      	r0, (r13, 0x10)
90115fc0:	e8d4      	bf      	0x9011616a	// 0x9011616a
90115fc2:	9011      	st.w      	r0, (r1, 0x4)
90115fc4:	a1f4      	ld.b      	r1, (r4, 0xf)
90115fc6:	904d      	st.w      	r0, (r13, 0x10)
90115fc8:	a528      	ld.b      	r5, (r8, 0x2)
90115fca:	904d      	st.w      	r0, (r13, 0x10)
90115fcc:	a20c      	ld.b      	r2, (r12, 0x0)
90115fce:	904d      	st.w      	r0, (r13, 0x10)
90115fd0:	8bb4      	ld.w      	r11, (r4, 0x2c)
90115fd2:	904b      	st.w      	r0, (r11, 0x10)
90115fd4:	a28c      	ld.b      	r2, (r12, 0x8)
90115fd6:	904d      	st.w      	r0, (r13, 0x10)
90115fd8:	a290      	ld.b      	r2, (r0, 0x9)
90115fda:	904d      	st.w      	r0, (r13, 0x10)
90115fdc:	a294      	ld.b      	r2, (r4, 0x9)
90115fde:	904d      	st.w      	r0, (r13, 0x10)
90115fe0:	e894      	bf      	0x9011610a	// 0x9011610a
90115fe2:	9011      	st.w      	r0, (r1, 0x4)
90115fe4:	a2a0      	ld.b      	r2, (r0, 0xa)
90115fe6:	904d      	st.w      	r0, (r13, 0x10)
90115fe8:	a52c      	ld.b      	r5, (r12, 0x2)
90115fea:	904d      	st.w      	r0, (r13, 0x10)
90115fec:	a538      	ld.b      	r5, (r8, 0x3)
90115fee:	904d      	st.w      	r0, (r13, 0x10)
90115ff0:	a554      	ld.b      	r5, (r4, 0x5)
90115ff2:	904d      	st.w      	r0, (r13, 0x10)
90115ff4:	9b80      	st.w      	r11, (r0, 0x20)
90115ff6:	904d      	st.w      	r0, (r13, 0x10)
90115ff8:	a560      	ld.b      	r5, (r0, 0x6)
90115ffa:	904d      	st.w      	r0, (r13, 0x10)
90115ffc:	a56c      	ld.b      	r5, (r12, 0x6)
90115ffe:	904d      	st.w      	r0, (r13, 0x10)
90116000:	a2b4      	ld.b      	r2, (r4, 0xb)
90116002:	904d      	st.w      	r0, (r13, 0x10)
90116004:	a2c4      	ld.b      	r2, (r4, 0xc)
90116006:	904d      	st.w      	r0, (r13, 0x10)
90116008:	a2dc      	ld.b      	r2, (r12, 0xd)
9011600a:	904d      	st.w      	r0, (r13, 0x10)
9011600c:	a2f0      	ld.b      	r2, (r0, 0xf)
9011600e:	904d      	st.w      	r0, (r13, 0x10)
90116010:	e878      	bf      	0x90116102	// 0x90116102
90116012:	9011      	st.w      	r0, (r1, 0x4)
90116014:	a300      	ld.b      	r3, (r0, 0x0)
90116016:	904d      	st.w      	r0, (r13, 0x10)
90116018:	a310      	ld.b      	r3, (r0, 0x1)
9011601a:	904d      	st.w      	r0, (r13, 0x10)
9011601c:	e7ac      	bt      	0x90115f76	// 0x90115f76
9011601e:	9011      	st.w      	r0, (r1, 0x4)
90116020:	ddb0      	st.h      	r13, (r0, 0x16)
90116022:	9011      	st.w      	r0, (r1, 0x4)
90116024:	768c      	lrw      	r6, 0x6407f008	// 0x90116254
90116026:	9047      	st.w      	r0, (r7, 0x10)
90116028:	a31c      	ld.b      	r3, (r12, 0x1)
9011602a:	904d      	st.w      	r0, (r13, 0x10)
9011602c:	a324      	ld.b      	r3, (r4, 0x2)
9011602e:	904d      	st.w      	r0, (r13, 0x10)
90116030:	a574      	ld.b      	r5, (r4, 0x7)
90116032:	904d      	st.w      	r0, (r13, 0x10)
90116034:	3c18      	lsli      	r8, r8, 1
90116036:	900d      	st.w      	r0, (r13, 0x0)
90116038:	a5b4      	ld.b      	r5, (r4, 0xb)
9011603a:	904d      	st.w      	r0, (r13, 0x10)
9011603c:	b8ec      	st.b      	r8, (r12, 0xe)
9011603e:	9012      	st.w      	r0, (r2, 0x4)
90116040:	a5d0      	ld.b      	r5, (r0, 0xd)
90116042:	904d      	st.w      	r0, (r13, 0x10)
90116044:	a3d0      	ld.b      	r3, (r0, 0xd)
90116046:	904d      	st.w      	r0, (r13, 0x10)
90116048:	a3f0      	ld.b      	r3, (r0, 0xf)
9011604a:	904d      	st.w      	r0, (r13, 0x10)
9011604c:	f5e4      	br      	0x90115c16	// 0x90115c16
9011604e:	9011      	st.w      	r0, (r1, 0x4)
90116050:	5a1c      	stex      	r10, (r12, 0x1)
90116052:	9011      	st.w      	r0, (r1, 0x4)
90116054:	b954      	st.b      	r9, (r4, 0x5)
90116056:	9012      	st.w      	r0, (r2, 0x4)
90116058:	190c      	mtcr      	r12, cr16
9011605a:	900d      	st.w      	r0, (r13, 0x0)
9011605c:	f56c      	br      	0x90115b36	// 0x90115b36
9011605e:	9011      	st.w      	r0, (r1, 0x4)
90116060:	25f0      	subi      	r0, r0, 32
90116062:	9800      	st.w      	r8, (r0, 0x0)
90116064:	9910      	st.w      	r9, (r0, 0x4)
90116066:	9a20      	st.w      	r10, (r0, 0x8)
90116068:	9b30      	st.w      	r11, (r0, 0xc)
9011606a:	9c40      	st.w      	r12, (r0, 0x10)
9011606c:	9d50      	st.w      	r13, (r0, 0x14)
9011606e:	9e60      	st.w      	r14, (r0, 0x18)
90116070:	9f70      	st.w      	r15, (r0, 0x1c)
90116072:	6501      	movi      	r1, 80
90116074:	0510      	subu      	r0, r0, r1
90116076:	1229      	mov      	r9, r2
90116078:	1238      	mov      	r8, r3
9011607a:	2a02      	cmpnei      	r2, 0
9011607c:	e9c8      	bf      	0x9011640e	// 0x9011640e
9011607e:	2a03      	cmpnei      	r3, 0
90116080:	e9c6      	bf      	0x9011640e	// 0x9011640e
90116082:	7783      	lrw      	r7, 0x90814eb0	// 0x90116290
90116084:	8707      	ld.w      	r7, (r7, 0x0)
90116086:	2207      	cmplti      	r7, 1
90116088:	e804      	bf      	0x90116092	// 0x90116092
9011608a:	7782      	lrw      	r7, 0x90814eb4	// 0x90116294
9011608c:	8707      	ld.w      	r7, (r7, 0x0)
9011608e:	2207      	cmplti      	r7, 1
