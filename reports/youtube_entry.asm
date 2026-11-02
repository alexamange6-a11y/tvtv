
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90010a1c <.data+0x10a1c>:
90010a1c:	2470      	subi      	r0, r0, 8
90010a1e:	9f00      	st.w      	r15, (r0, 0x0)
90010a20:	25f0      	subi      	r0, r0, 32
90010a22:	6006      	movi      	r6, 0
90010a24:	7725      	lrw      	r7, 0x90648ae4	// 0x90010ab8
90010a26:	b607      	st.b      	r6, (r7, 0x0)
90010a28:	7f25      	jsri      	0x9000EB18	// 0x9000eb18
90010a2a:	7f25      	jsri      	0x9000EC98	// 0x9000ec98
90010a2c:	7f26      	jsri      	0x9000EC50	// 0x9000ec50
90010a2e:	7f26      	jsri      	0x9000ECC8	// 0x9000ecc8
90010a30:	7f27      	jsri      	0x9000EBA8	// 0x9000eba8
90010a32:	7f27      	jsri      	0x9000ECF4	// 0x9000ecf4
90010a34:	7f28      	jsri      	0x9000ED60	// 0x9000ed60
90010a36:	7f28      	jsri      	0x9000EDF8	// 0x9000edf8
90010a38:	7729      	lrw      	r7, 0x90648ba4	// 0x90010adc
90010a3a:	6006      	movi      	r6, 0
90010a3c:	9607      	st.w      	r6, (r7, 0x0)
90010a3e:	1202      	mov      	r2, r0
90010a40:	1263      	mov      	r3, r6
90010a42:	6204      	movi      	r4, 32
90010a44:	7f27      	jsri      	0x9047768C	// 0x9047768c
90010a46:	7727      	lrw      	r7, 0x9000ec1c	// 0x90010ae4
90010a48:	9760      	st.w      	r7, (r0, 0x18)
90010a4a:	7627      	lrw      	r6, 0x9000ec2c	// 0x90010ae8
90010a4c:	9650      	st.w      	r6, (r0, 0x14)
90010a4e:	7727      	lrw      	r7, 0x9000f4a0	// 0x90010aec
90010a50:	9710      	st.w      	r7, (r0, 0x4)
90010a52:	7627      	lrw      	r6, 0x9000ec3c	// 0x90010af0
90010a54:	9640      	st.w      	r6, (r0, 0x10)
90010a56:	7727      	lrw      	r7, 0x900100f8	// 0x90010af4
90010a58:	9720      	st.w      	r7, (r0, 0x8)
90010a5a:	7627      	lrw      	r6, 0x9000f63c	// 0x90010af8
90010a5c:	9670      	st.w      	r6, (r0, 0x1c)
90010a5e:	7727      	lrw      	r7, 0x9000eb98	// 0x90010afc
90010a60:	9700      	st.w      	r7, (r0, 0x0)
90010a62:	7227      	lrw      	r2, 0x904bba64	// 0x90010b00
90010a64:	7328      	lrw      	r3, 0x904bba6c	// 0x90010b04
90010a66:	1204      	mov      	r4, r0
90010a68:	7728      	lrw      	r7, 0x90648ae8	// 0x90010b08
90010a6a:	8507      	ld.w      	r5, (r7, 0x0)
90010a6c:	7f28      	jsri      	0x90014FC8	// 0x90014fc8
90010a6e:	7228      	lrw      	r2, 0x904bba7c	// 0x90010b10
90010a70:	6013      	movi      	r3, 1
90010a72:	7f28      	jsri      	0x90381D40	// 0x90381d40
90010a74:	7729      	lrw      	r7, 0x905635b4	// 0x90010b18
90010a76:	8707      	ld.w      	r7, (r7, 0x0)
90010a78:	2a07      	cmpnei      	r7, 0
90010a7a:	e805      	bf      	0x90010a86	// 0x90010a86
90010a7c:	7f28      	jsri      	0x90015794	// 0x90015794
90010a7e:	7228      	lrw      	r2, 0x904bba8c	// 0x90010b20
90010a80:	7329      	lrw      	r3, 0x90010354	// 0x90010b24
90010a82:	7f29      	jsri      	0x900151B0	// 0x900151b0
90010a84:	f002      	br      	0x90010a8a	// 0x90010a8a
90010a86:	7f29      	jsri      	0x900157D4	// 0x900157d4
90010a88:	7f2a      	jsri      	0x90015228	// 0x90015228
90010a8a:	722a      	lrw      	r2, 0x904c0d78	// 0x90010b34
90010a8c:	732b      	lrw      	r3, 0x9000fae8	// 0x90010b38
90010a8e:	7f2b      	jsri      	0x90015138	// 0x90015138
90010a90:	722c      	lrw      	r2, 0x904bc194	// 0x90010b40
90010a92:	732c      	lrw      	r3, 0x9000ef14	// 0x90010b44
90010a94:	7f2d      	jsri      	0x900152F8	// 0x900152f8
90010a96:	722d      	lrw      	r2, 0x904b872c	// 0x90010b4c
90010a98:	6003      	movi      	r3, 0
90010a9a:	7f2d      	jsri      	0x9024E63C	// 0x9024e63c
90010a9c:	6002      	movi      	r2, 0
90010a9e:	7f2d      	jsri      	0x9000EE34	// 0x9000ee34
90010aa0:	ff79      	bsr      	0x90010994	// 0x90010994
90010aa2:	2a02      	cmpnei      	r2, 0
90010aa4:	e001      	bt      	0x90010aa8	// 0x90010aa8
90010aa6:	7f2d      	jsri      	0x9000F63C	// 0x9000f63c
90010aa8:	6002      	movi      	r2, 0
90010aaa:	21f0      	addi      	r0, r0, 32
90010aac:	8f00      	ld.w      	r15, (r0, 0x0)
90010aae:	2070      	addi      	r0, r0, 8
90010ab0:	00cf      	jmp      	r15
90010ab2:	f7ff      	br      	0x90010ab2	// 0x90010ab2
90010ab4:	f7ff      	br      	0x90010ab4	// 0x90010ab4
90010ab6:	1200      	mov      	r0, r0
90010ab8:	8ae4      	ld.w      	r10, (r4, 0x38)
90010aba:	9064      	st.w      	r0, (r4, 0x18)
90010abc:	eb18      	bf      	0x900110ee	// 0x900110ee
90010abe:	9000      	st.w      	r0, (r0, 0x0)
90010ac0:	ec98      	bf      	0x900103f2	// 0x900103f2
90010ac2:	9000      	st.w      	r0, (r0, 0x0)
90010ac4:	ec50      	bf      	0x90010366	// 0x90010366
90010ac6:	9000      	st.w      	r0, (r0, 0x0)
90010ac8:	ecc8      	bf      	0x9001045a	// 0x9001045a
90010aca:	9000      	st.w      	r0, (r0, 0x0)
90010acc:	eba8      	bf      	0x9001121e	// 0x9001121e
90010ace:	9000      	st.w      	r0, (r0, 0x0)
90010ad0:	ecf4      	bf      	0x900104ba	// 0x900104ba
90010ad2:	9000      	st.w      	r0, (r0, 0x0)
90010ad4:	ed60      	bf      	0x90010596	// 0x90010596
90010ad6:	9000      	st.w      	r0, (r0, 0x0)
90010ad8:	edf8      	bf      	0x900106ca	// 0x900106ca
90010ada:	9000      	st.w      	r0, (r0, 0x0)
90010adc:	8ba4      	ld.w      	r11, (r4, 0x28)
90010ade:	9064      	st.w      	r0, (r4, 0x18)
90010ae0:	768c      	lrw      	r6, 0x90265438	// 0x90010d10
90010ae2:	9047      	st.w      	r0, (r7, 0x10)
90010ae4:	ec1c      	bf      	0x9001031e	// 0x9001031e
90010ae6:	9000      	st.w      	r0, (r0, 0x0)
90010ae8:	ec2c      	bf      	0x90010342	// 0x90010342
90010aea:	9000      	st.w      	r0, (r0, 0x0)
90010aec:	f4a0      	br      	0x9001042e	// 0x9001042e
90010aee:	9000      	st.w      	r0, (r0, 0x0)
90010af0:	ec3c      	bf      	0x9001036a	// 0x9001036a
90010af2:	9000      	st.w      	r0, (r0, 0x0)
90010af4:	00f8      	brev      	r8, r8
90010af6:	9001      	st.w      	r0, (r1, 0x0)
90010af8:	f63c      	br      	0x90010772	// 0x90010772
90010afa:	9000      	st.w      	r0, (r0, 0x0)
90010afc:	eb98      	bf      	0x9001122e	// 0x9001122e
90010afe:	9000      	st.w      	r0, (r0, 0x0)
90010b00:	ba64      	st.b      	r10, (r4, 0x6)
90010b02:	904b      	st.w      	r0, (r11, 0x10)
90010b04:	ba6c      	st.b      	r10, (r12, 0x6)
90010b06:	904b      	st.w      	r0, (r11, 0x10)
90010b08:	8ae8      	ld.w      	r10, (r8, 0x38)
90010b0a:	9064      	st.w      	r0, (r4, 0x18)
90010b0c:	4fc8      	ldex      	r15, (r8, 0xc)
90010b0e:	9001      	st.w      	r0, (r1, 0x0)
90010b10:	ba7c      	st.b      	r10, (r12, 0x7)
90010b12:	904b      	st.w      	r0, (r11, 0x10)
90010b14:	1d40      	ixh      	r0, r0, r4
90010b16:	9038      	st.w      	r0, (r8, 0xc)
90010b18:	35b4      	bseti      	r4, r4, 27
90010b1a:	9056      	st.w      	r0, (r6, 0x14)
90010b1c:	5794      	stex      	r7, (r4, 0x9)
90010b1e:	9001      	st.w      	r0, (r1, 0x0)
90010b20:	ba8c      	st.b      	r10, (r12, 0x8)
90010b22:	904b      	st.w      	r0, (r11, 0x10)
90010b24:	0354      	mult      	r4, r4, r5
90010b26:	9001      	st.w      	r0, (r1, 0x0)
90010b28:	51b0      	stex      	r1, (r0, 0xb)
90010b2a:	9001      	st.w      	r0, (r1, 0x0)
90010b2c:	57d4      	stex      	r7, (r4, 0xd)
90010b2e:	9001      	st.w      	r0, (r1, 0x0)
90010b30:	5228      	stex      	r2, (r8, 0x2)
90010b32:	9001      	st.w      	r0, (r1, 0x0)
90010b34:	0d78      	cmplt      	r8, r7
90010b36:	904c      	st.w      	r0, (r12, 0x10)
90010b38:	fae8      	bsr      	0x9001110a	// 0x9001110a
90010b3a:	9000      	st.w      	r0, (r0, 0x0)
90010b3c:	5138      	stex      	r1, (r8, 0x3)
90010b3e:	9001      	st.w      	r0, (r1, 0x0)
90010b40:	c194      	ld.h      	r1, (r4, 0x12)
90010b42:	904b      	st.w      	r0, (r11, 0x10)
90010b44:	ef14      	bf      	0x9001096e	// 0x9001096e
90010b46:	9000      	st.w      	r0, (r0, 0x0)
90010b48:	52f8      	stex      	r2, (r8, 0xf)
90010b4a:	9001      	st.w      	r0, (r1, 0x0)
90010b4c:	872c      	ld.w      	r7, (r12, 0x8)
90010b4e:	904b      	st.w      	r0, (r11, 0x10)
90010b50:	e63c      	bt      	0x900107ca	// 0x900107ca
90010b52:	9024      	st.w      	r0, (r4, 0x8)
