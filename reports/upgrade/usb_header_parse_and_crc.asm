
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002e940 <.data+0x2e940>:
9002e940:	25f0      	subi      	r0, r0, 32
9002e942:	9800      	st.w      	r8, (r0, 0x0)
9002e944:	9910      	st.w      	r9, (r0, 0x4)
9002e946:	9a20      	st.w      	r10, (r0, 0x8)
9002e948:	9b30      	st.w      	r11, (r0, 0xc)
9002e94a:	9c40      	st.w      	r12, (r0, 0x10)
9002e94c:	9d50      	st.w      	r13, (r0, 0x14)
9002e94e:	9e60      	st.w      	r14, (r0, 0x18)
9002e950:	9f70      	st.w      	r15, (r0, 0x1c)
9002e952:	71aa      	lrw      	r1, 0x4c8	// 0x9002ebfc
9002e954:	0510      	subu      	r0, r0, r1
9002e956:	122e      	mov      	r14, r2
9002e958:	74aa      	lrw      	r4, 0x88	// 0x9002ec00
9002e95a:	1248      	mov      	r8, r4
9002e95c:	1c08      	addu      	r8, r8, r0
9002e95e:	1282      	mov      	r2, r8
9002e960:	6003      	movi      	r3, 0
9002e962:	3294      	bgeni      	r4, 9
9002e964:	7fa8      	jsri      	0x9047768C	// 0x9047768c
9002e966:	12e2      	mov      	r2, r14
9002e968:	73a8      	lrw      	r3, 0x9052bd34	// 0x9002ec08
9002e96a:	7fa8      	jsri      	0x900D9AC4	// 0x900d9ac4
9002e96c:	122d      	mov      	r13, r2
9002e96e:	2a02      	cmpnei      	r2, 0
9002e970:	e004      	bt      	0x9002e97a	// 0x9002e97a
9002e972:	72a7      	lrw      	r2, 0x904c0914	// 0x9002ec10
9002e974:	7fa8      	jsri      	0x900D4110	// 0x900d4110
9002e976:	12da      	mov      	r10, r13
9002e978:	f259      	br      	0x9002ee2c	// 0x9002ee2c
9002e97a:	1282      	mov      	r2, r8
9002e97c:	6013      	movi      	r3, 1
9002e97e:	3294      	bgeni      	r4, 9
9002e980:	12d5      	mov      	r5, r13
9002e982:	7fa5      	jsri      	0x900D5448	// 0x900d5448
9002e984:	122b      	mov      	r11, r2
9002e986:	329e      	bgeni      	r14, 9
9002e988:	7ca5      	lrw      	r12, 0xaabcdefa	// 0x9002ec1c
9002e98a:	f00e      	br      	0x9002e9a8	// 0x9002e9a8
9002e98c:	1282      	mov      	r2, r8
9002e98e:	7fa4      	jsri      	0x9002E024	// 0x9002e024
9002e990:	0fc2      	cmpne      	r2, r12
9002e992:	e80d      	bf      	0x9002e9ae	// 0x9002e9ae
9002e994:	1282      	mov      	r2, r8
9002e996:	6003      	movi      	r3, 0
9002e998:	12b4      	mov      	r4, r11
9002e99a:	7f9a      	jsri      	0x9047768C	// 0x9047768c
9002e99c:	1282      	mov      	r2, r8
9002e99e:	6013      	movi      	r3, 1
9002e9a0:	12b4      	mov      	r4, r11
9002e9a2:	12d5      	mov      	r5, r13
9002e9a4:	7f9d      	jsri      	0x900D5448	// 0x900d5448
9002e9a6:	122b      	mov      	r11, r2
9002e9a8:	0feb      	cmpne      	r11, r14
9002e9aa:	eff0      	bf      	0x9002e98c	// 0x9002e98c
9002e9ac:	f239      	br      	0x9002ee20	// 0x9002ee20
9002e9ae:	759d      	lrw      	r5, 0x288	// 0x9002ec24
9002e9b0:	125b      	mov      	r11, r5
9002e9b2:	1c0b      	addu      	r11, r11, r0
9002e9b4:	12b2      	mov      	r2, r11
9002e9b6:	6003      	movi      	r3, 0
9002e9b8:	749c      	lrw      	r4, 0x230	// 0x9002ec28
9002e9ba:	7f92      	jsri      	0x9047768C	// 0x9047768c
9002e9bc:	1282      	mov      	r2, r8
9002e9be:	7f98      	jsri      	0x9002E024	// 0x9002e024
9002e9c0:	920b      	st.w      	r2, (r11, 0x0)
9002e9c2:	ae48      	ld.b      	r14, (r8, 0x4)
9002e9c4:	be4b      	st.b      	r14, (r11, 0x4)
9002e9c6:	7699      	lrw      	r6, 0x284	// 0x9002ec2c
9002e9c8:	1262      	mov      	r2, r6
9002e9ca:	1c02      	addu      	r2, r2, r0
9002e9cc:	7f95      	jsri      	0x9002E024	// 0x9002e024
9002e9ce:	7498      	lrw      	r4, 0x4ac	// 0x9002ec30
9002e9d0:	1247      	mov      	r7, r4
9002e9d2:	1c07      	addu      	r7, r7, r0
9002e9d4:	9207      	st.w      	r2, (r7, 0x0)
9002e9d6:	7597      	lrw      	r5, 0x283	// 0x9002ec34
9002e9d8:	1257      	mov      	r7, r5
9002e9da:	1c07      	addu      	r7, r7, r0
9002e9dc:	a607      	ld.b      	r6, (r7, 0x0)
9002e9de:	7496      	lrw      	r4, 0x4ab	// 0x9002ec38
9002e9e0:	1247      	mov      	r7, r4
9002e9e2:	1c07      	addu      	r7, r7, r0
9002e9e4:	b607      	st.b      	r6, (r7, 0x0)
9002e9e6:	7595      	lrw      	r5, 0x282	// 0x9002ec3c
9002e9e8:	1257      	mov      	r7, r5
9002e9ea:	1c07      	addu      	r7, r7, r0
9002e9ec:	a607      	ld.b      	r6, (r7, 0x0)
9002e9ee:	7494      	lrw      	r4, 0x4aa	// 0x9002ec40
9002e9f0:	1247      	mov      	r7, r4
9002e9f2:	1c07      	addu      	r7, r7, r0
9002e9f4:	b607      	st.b      	r6, (r7, 0x0)
9002e9f6:	7593      	lrw      	r5, 0x281	// 0x9002ec44
9002e9f8:	1257      	mov      	r7, r5
9002e9fa:	1c07      	addu      	r7, r7, r0
9002e9fc:	a607      	ld.b      	r6, (r7, 0x0)
9002e9fe:	7492      	lrw      	r4, 0x4a9	// 0x9002ec48
9002ea00:	1247      	mov      	r7, r4
9002ea02:	1c07      	addu      	r7, r7, r0
9002ea04:	b607      	st.b      	r6, (r7, 0x0)
9002ea06:	60c7      	movi      	r7, 12
9002ea08:	0ce7      	cmphs      	r7, r14
9002ea0a:	e80a      	bf      	0x9002ea20	// 0x9002ea20
9002ea0c:	7590      	lrw      	r5, 0x225	// 0x9002ec4c
9002ea0e:	1259      	mov      	r9, r5
9002ea10:	1c09      	addu      	r9, r9, r0
9002ea12:	768f      	lrw      	r6, 0x8d	// 0x9002ec50
9002ea14:	126e      	mov      	r14, r6
9002ea16:	1c0e      	addu      	r14, r14, r0
9002ea18:	600a      	movi      	r10, 0
9002ea1a:	12b7      	mov      	r7, r11
9002ea1c:	12dc      	mov      	r12, r13
9002ea1e:	f07c      	br      	0x9002eb18	// 0x9002eb18
9002ea20:	728d      	lrw      	r2, 0x904c0930	// 0x9002ec54
9002ea22:	738d      	lrw      	r3, 0x904af91c	// 0x9002ec58
9002ea24:	748e      	lrw      	r4, 0x11d	// 0x9002ec5c
9002ea26:	12e5      	mov      	r5, r14
9002ea28:	7f8e      	jsri      	0x900D7214	// 0x900d7214
9002ea2a:	f089      	br      	0x9002eb3e	// 0x9002eb3e
9002ea2c:	12a6      	mov      	r6, r10
9002ea2e:	1da6      	ixh      	r6, r6, r10
9002ea30:	126d      	mov      	r13, r6
9002ea32:	3c4d      	lsli      	r13, r13, 4
9002ea34:	056d      	subu      	r13, r13, r6
9002ea36:	1c7d      	addu      	r13, r13, r7
9002ea38:	12d2      	mov      	r2, r13
9002ea3a:	2042      	addi      	r2, r2, 5
9002ea3c:	12e3      	mov      	r3, r14
9002ea3e:	6074      	movi      	r4, 7
9002ea40:	7589      	lrw      	r5, 0x4c0	// 0x9002ec64
9002ea42:	1c05      	addu      	r5, r5, r0
9002ea44:	9705      	st.w      	r7, (r5, 0x0)
9002ea46:	7f88      	jsri      	0x900CD2D8	// 0x900cd2d8
9002ea48:	12e2      	mov      	r2, r14
9002ea4a:	2072      	addi      	r2, r2, 8
9002ea4c:	7f75      	jsri      	0x9002E024	// 0x9002e024
9002ea4e:	12d6      	mov      	r6, r13
9002ea50:	2076      	addi      	r6, r6, 8
9002ea52:	b256      	st.b      	r2, (r6, 0x5)
9002ea54:	0112      	xtrb2      	r1, r2
9002ea56:	1215      	mov      	r5, r1
9002ea58:	b566      	st.b      	r5, (r6, 0x6)
9002ea5a:	0122      	xtrb1      	r1, r2
9002ea5c:	1215      	mov      	r5, r1
9002ea5e:	b576      	st.b      	r5, (r6, 0x7)
9002ea60:	3f82      	lsri      	r2, r2, 24
9002ea62:	b286      	st.b      	r2, (r6, 0x8)
9002ea64:	12e2      	mov      	r2, r14
9002ea66:	20b2      	addi      	r2, r2, 12
9002ea68:	7481      	lrw      	r4, 0x4bc	// 0x9002ec6c
9002ea6a:	1c04      	addu      	r4, r4, r0
9002ea6c:	9604      	st.w      	r6, (r4, 0x0)
9002ea6e:	7f6c      	jsri      	0x9002E024	// 0x9002e024
9002ea70:	747f      	lrw      	r4, 0x4bc	// 0x9002ec6c
9002ea72:	1c04      	addu      	r4, r4, r0
9002ea74:	8604      	ld.w      	r6, (r4, 0x0)
9002ea76:	b296      	st.b      	r2, (r6, 0x9)
9002ea78:	0112      	xtrb2      	r1, r2
9002ea7a:	1215      	mov      	r5, r1
9002ea7c:	b5a6      	st.b      	r5, (r6, 0xa)
9002ea7e:	0122      	xtrb1      	r1, r2
9002ea80:	1215      	mov      	r5, r1
9002ea82:	b5b6      	st.b      	r5, (r6, 0xb)
9002ea84:	3f82      	lsri      	r2, r2, 24
9002ea86:	b2c6      	st.b      	r2, (r6, 0xc)
9002ea88:	12e2      	mov      	r2, r14
9002ea8a:	20f2      	addi      	r2, r2, 16
9002ea8c:	7f65      	jsri      	0x9002E024	// 0x9002e024
9002ea8e:	12d6      	mov      	r6, r13
9002ea90:	20f6      	addi      	r6, r6, 16
9002ea92:	b296      	st.b      	r2, (r6, 0x9)
9002ea94:	0112      	xtrb2      	r1, r2
9002ea96:	1215      	mov      	r5, r1
9002ea98:	b5a6      	st.b      	r5, (r6, 0xa)
9002ea9a:	0122      	xtrb1      	r1, r2
9002ea9c:	1215      	mov      	r5, r1
9002ea9e:	b5b6      	st.b      	r5, (r6, 0xb)
9002eaa0:	3f82      	lsri      	r2, r2, 24
9002eaa2:	b2c6      	st.b      	r2, (r6, 0xc)
9002eaa4:	12b6      	mov      	r6, r11
9002eaa6:	24f6      	subi      	r6, r6, 16
9002eaa8:	12e5      	mov      	r5, r14
9002eaaa:	2135      	addi      	r5, r5, 20
9002eaac:	a505      	ld.b      	r5, (r5, 0x0)
9002eaae:	b506      	st.b      	r5, (r6, 0x0)
9002eab0:	12e6      	mov      	r6, r14
9002eab2:	2146      	addi      	r6, r6, 21
9002eab4:	a606      	ld.b      	r6, (r6, 0x0)
9002eab6:	12b5      	mov      	r5, r11
9002eab8:	24e5      	subi      	r5, r5, 15
9002eaba:	67f4      	movi      	r4, 127
9002eabc:	1664      	and      	r4, r4, r6
9002eabe:	b405      	st.b      	r4, (r5, 0x0)
9002eac0:	3e76      	lsri      	r6, r6, 7
9002eac2:	b62b      	st.b      	r6, (r11, 0x2)
9002eac4:	12b6      	mov      	r6, r11
9002eac6:	24c6      	subi      	r6, r6, 13
9002eac8:	12e5      	mov      	r5, r14
9002eaca:	2165      	addi      	r5, r5, 23
9002eacc:	a505      	ld.b      	r5, (r5, 0x0)
9002eace:	2e35      	andi      	r5, r5, 3
9002ead0:	b506      	st.b      	r5, (r6, 0x0)
9002ead2:	1292      	mov      	r2, r9
9002ead4:	7f53      	jsri      	0x9002E024	// 0x9002e024
9002ead6:	12d6      	mov      	r6, r13
9002ead8:	21f6      	addi      	r6, r6, 32
9002eada:	b256      	st.b      	r2, (r6, 0x5)
9002eadc:	0112      	xtrb2      	r1, r2
9002eade:	1215      	mov      	r5, r1
9002eae0:	b566      	st.b      	r5, (r6, 0x6)
9002eae2:	0122      	xtrb1      	r1, r2
9002eae4:	1215      	mov      	r5, r1
9002eae6:	b576      	st.b      	r5, (r6, 0x7)
9002eae8:	3f82      	lsri      	r2, r2, 24
9002eaea:	b286      	st.b      	r2, (r6, 0x8)
9002eaec:	6285      	movi      	r5, 40
9002eaee:	1c5d      	addu      	r13, r13, r5
9002eaf0:	7460      	lrw      	r4, 0x123	// 0x9002ec70
9002eaf2:	1246      	mov      	r6, r4
9002eaf4:	1c86      	addu      	r6, r6, r8
9002eaf6:	a606      	ld.b      	r6, (r6, 0x0)
9002eaf8:	3c86      	lsli      	r6, r6, 8
9002eafa:	745e      	lrw      	r4, 0x124	// 0x9002ec74
9002eafc:	1245      	mov      	r5, r4
9002eafe:	1c85      	addu      	r5, r5, r8
9002eb00:	a505      	ld.b      	r5, (r5, 0x0)
9002eb02:	1c56      	addu      	r6, r6, r5
9002eb04:	0166      	zexth      	r6, r6
9002eb06:	b65d      	st.b      	r6, (r13, 0x5)
9002eb08:	3e86      	lsri      	r6, r6, 8
9002eb0a:	b66d      	st.b      	r6, (r13, 0x6)
9002eb0c:	200a      	addi      	r10, r10, 1
9002eb0e:	217e      	addi      	r14, r14, 24
9002eb10:	2039      	addi      	r9, r9, 4
9002eb12:	7554      	lrw      	r5, 0x4c0	// 0x9002ec64
9002eb14:	1c05      	addu      	r5, r5, r0
9002eb16:	8705      	ld.w      	r7, (r5, 0x0)
9002eb18:	62d6      	movi      	r6, 45
9002eb1a:	1c6b      	addu      	r11, r11, r6
9002eb1c:	2018      	addi      	r8, r8, 2
9002eb1e:	a447      	ld.b      	r4, (r7, 0x4)
9002eb20:	0d4a      	cmplt      	r10, r4
9002eb22:	e784      	bt      	0x9002ea2c	// 0x9002ea2c
9002eb24:	12cd      	mov      	r13, r12
9002eb26:	6002      	movi      	r2, 0
9002eb28:	7536      	lrw      	r5, 0x88	// 0x9002ec00
9002eb2a:	1253      	mov      	r3, r5
9002eb2c:	1c03      	addu      	r3, r3, r0
9002eb2e:	7452      	lrw      	r4, 0x1fc	// 0x9002ec78
9002eb30:	7f53      	jsri      	0x900CCBCC	// 0x900ccbcc
9002eb32:	763f      	lrw      	r6, 0x4ac	// 0x9002ec30
9002eb34:	1267      	mov      	r7, r6
9002eb36:	1c07      	addu      	r7, r7, r0
9002eb38:	8707      	ld.w      	r7, (r7, 0x0)
9002eb3a:	0f72      	cmpne      	r2, r7
9002eb3c:	e171      	bt      	0x9002ee20	// 0x9002ee20
9002eb3e:	7440      	lrw      	r4, 0x4aa	// 0x9002ec40
9002eb40:	1247      	mov      	r7, r4
9002eb42:	1c07      	addu      	r7, r7, r0
9002eb44:	a707      	ld.b      	r7, (r7, 0x0)
9002eb46:	2a07      	cmpnei      	r7, 0
9002eb48:	e966      	bf      	0x9002ee16	// 0x9002ee16
9002eb4a:	754d      	lrw      	r5, 0x2b7	// 0x9002ec80
9002eb4c:	1257      	mov      	r7, r5
9002eb4e:	1c07      	addu      	r7, r7, r0
9002eb50:	754d      	lrw      	r5, 0x4b8	// 0x9002ec84
9002eb52:	1c05      	addu      	r5, r5, r0
9002eb54:	9705      	st.w      	r7, (r5, 0x0)
