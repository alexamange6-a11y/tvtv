
inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

900158d8 <.data+0x158d8>:
900158d8:	24f0      	subi      	r0, r0, 16
900158da:	9d00      	st.w      	r13, (r0, 0x0)
900158dc:	9e10      	st.w      	r14, (r0, 0x4)
900158de:	9f20      	st.w      	r15, (r0, 0x8)
900158e0:	123e      	mov      	r14, r3
900158e2:	a603      	ld.b      	r6, (r3, 0x0)
900158e4:	2a26      	cmpnei      	r6, 2
900158e6:	e164      	bt      	0x90015bb0	// 0x90015bb0
900158e8:	c243      	ld.h      	r2, (r3, 0x8)
900158ea:	ff94      	bsr      	0x90015814	// 0x90015814
900158ec:	821e      	ld.w      	r2, (r14, 0x4)
900158ee:	c34e      	ld.h      	r3, (r14, 0x8)
900158f0:	7f63      	jsri      	0x9006564C	// 0x9006564c
900158f2:	7763      	lrw      	r7, 0x112	// 0x90015a80
900158f4:	0f72      	cmpne      	r2, r7
900158f6:	e889      	bf      	0x90015a0a	// 0x90015a0a
900158f8:	0d27      	cmplt      	r7, r2
900158fa:	e011      	bt      	0x9001591e	// 0x9001591e
900158fc:	65c7      	movi      	r7, 92
900158fe:	0f72      	cmpne      	r2, r7
90015900:	e821      	bf      	0x90015944	// 0x90015944
90015902:	0d27      	cmplt      	r7, r2
90015904:	e005      	bt      	0x90015910	// 0x90015910
90015906:	2ad2      	cmpnei      	r2, 13
90015908:	e84f      	bf      	0x900159a8	// 0x900159a8
9001590a:	2bb2      	cmpnei      	r2, 27
9001590c:	e151      	bt      	0x90015bb0	// 0x90015bb0
9001590e:	f01d      	br      	0x9001594a	// 0x9001594a
90015910:	66d7      	movi      	r7, 109
90015912:	0f72      	cmpne      	r2, r7
90015914:	e82e      	bf      	0x90015972	// 0x90015972
90015916:	775b      	lrw      	r7, 0x111	// 0x90015a84
90015918:	0f72      	cmpne      	r2, r7
9001591a:	e14a      	bt      	0x90015bb0	// 0x90015bb0
9001591c:	f04b      	br      	0x900159b4	// 0x900159b4
9001591e:	775a      	lrw      	r7, 0x119	// 0x90015a88
90015920:	0f72      	cmpne      	r2, r7
90015922:	e910      	bf      	0x90015b44	// 0x90015b44
90015924:	0d27      	cmplt      	r7, r2
90015926:	e007      	bt      	0x90015936	// 0x90015936
90015928:	7759      	lrw      	r7, 0x114	// 0x90015a8c
9001592a:	0f72      	cmpne      	r2, r7
9001592c:	e8db      	bf      	0x90015ae4	// 0x90015ae4
9001592e:	7758      	lrw      	r7, 0x118	// 0x90015a90
90015930:	0f72      	cmpne      	r2, r7
90015932:	e13e      	bt      	0x90015bb0	// 0x90015bb0
90015934:	f0e9      	br      	0x90015b08	// 0x90015b08
90015936:	7757      	lrw      	r7, 0x190	// 0x90015a94
90015938:	0f72      	cmpne      	r2, r7
9001593a:	e82a      	bf      	0x90015990	// 0x90015990
9001593c:	7757      	lrw      	r7, 0x193	// 0x90015a98
9001593e:	0f72      	cmpne      	r2, r7
90015940:	e137      	bt      	0x90015bb0	// 0x90015bb0
90015942:	f01d      	br      	0x9001597e	// 0x9001597e
90015944:	7256      	lrw      	r2, 0x904b9134	// 0x90015a9c
90015946:	7f56      	jsri      	0x9024E020	// 0x9024e020
90015948:	f133      	br      	0x90015bb0	// 0x90015bb0
9001594a:	7756      	lrw      	r7, 0x90648fdc	// 0x90015aa4
9001594c:	a707      	ld.b      	r7, (r7, 0x0)
9001594e:	2a07      	cmpnei      	r7, 0
90015950:	e802      	bf      	0x90015956	// 0x90015956
90015952:	7f55      	jsri      	0x90014978	// 0x90014978
90015954:	f12d      	br      	0x90015bb0	// 0x90015bb0
90015956:	7755      	lrw      	r7, 0x90648fc4	// 0x90015aac
90015958:	8e07      	ld.w      	r14, (r7, 0x0)
9001595a:	8217      	ld.w      	r2, (r7, 0x4)
9001595c:	2a02      	cmpnei      	r2, 0
9001595e:	e803      	bf      	0x90015966	// 0x90015966
90015960:	00d2      	jsr      	r2
90015962:	2a02      	cmpnei      	r2, 0
90015964:	e002      	bt      	0x9001596a	// 0x9001596a
90015966:	7252      	lrw      	r2, 0x904b9e44	// 0x90015ab0
90015968:	7f4e      	jsri      	0x9024E020	// 0x9024e020
9001596a:	2a0e      	cmpnei      	r14, 0
9001596c:	e921      	bf      	0x90015bb0	// 0x90015bb0
9001596e:	00de      	jsr      	r14
90015970:	f11f      	br      	0x90015bb0	// 0x90015bb0
90015972:	774c      	lrw      	r7, 0x90648fdc	// 0x90015aa4
90015974:	a707      	ld.b      	r7, (r7, 0x0)
90015976:	2a07      	cmpnei      	r7, 0
90015978:	e11b      	bt      	0x90015bb0	// 0x90015bb0
9001597a:	774e      	lrw      	r7, 0x90648f90	// 0x90015ab4
9001597c:	f005      	br      	0x90015988	// 0x90015988
9001597e:	7749      	lrw      	r7, 0x90648fdc	// 0x90015aa4
90015980:	a707      	ld.b      	r7, (r7, 0x0)
90015982:	2a07      	cmpnei      	r7, 0
90015984:	e115      	bt      	0x90015bb0	// 0x90015bb0
90015986:	774c      	lrw      	r7, 0x90648fb4	// 0x90015ab8
90015988:	8707      	ld.w      	r7, (r7, 0x0)
9001598a:	2a07      	cmpnei      	r7, 0
9001598c:	e00b      	bt      	0x900159a4	// 0x900159a4
9001598e:	f110      	br      	0x90015bb0	// 0x90015bb0
90015990:	7745      	lrw      	r7, 0x90648fdc	// 0x90015aa4
90015992:	a707      	ld.b      	r7, (r7, 0x0)
90015994:	2a07      	cmpnei      	r7, 0
90015996:	e10c      	bt      	0x90015bb0	// 0x90015bb0
90015998:	7e49      	lrw      	r14, 0x90648f6c	// 0x90015abc
9001599a:	870e      	ld.w      	r7, (r14, 0x0)
9001599c:	2a07      	cmpnei      	r7, 0
9001599e:	e908      	bf      	0x90015bb0	// 0x90015bb0
900159a0:	fe41      	bsr      	0x90015624	// 0x90015624
900159a2:	870e      	ld.w      	r7, (r14, 0x0)
900159a4:	00d7      	jsr      	r7
900159a6:	f104      	br      	0x90015bb0	// 0x90015bb0
900159a8:	773f      	lrw      	r7, 0x90648fdc	// 0x90015aa4
900159aa:	a707      	ld.b      	r7, (r7, 0x0)
900159ac:	2a07      	cmpnei      	r7, 0
900159ae:	e100      	bt      	0x90015bb0	// 0x90015bb0
900159b0:	7e45      	lrw      	r14, 0x90648fd8	// 0x90015ac4
900159b2:	f7f3      	br      	0x9001599a	// 0x9001599a
900159b4:	773c      	lrw      	r7, 0x90648fdc	// 0x90015aa4
900159b6:	a707      	ld.b      	r7, (r7, 0x0)
900159b8:	2a07      	cmpnei      	r7, 0
900159ba:	e0fa      	bt      	0x90015bb0	// 0x90015bb0
900159bc:	7743      	lrw      	r7, 0x90648f2c	// 0x90015ac8
900159be:	8277      	ld.w      	r2, (r7, 0x1c)
900159c0:	2a02      	cmpnei      	r2, 0
900159c2:	e01d      	bt      	0x900159fe	// 0x900159fe
900159c4:	8747      	ld.w      	r7, (r7, 0x10)
900159c6:	2207      	cmplti      	r7, 1
900159c8:	e0f3      	bt      	0x90015bb0	// 0x90015bb0
900159ca:	7740      	lrw      	r7, 0x90648fbc	// 0x90015acc
900159cc:	8207      	ld.w      	r2, (r7, 0x0)
900159ce:	2a02      	cmpnei      	r2, 0
900159d0:	e803      	bf      	0x900159d8	// 0x900159d8
900159d2:	00d2      	jsr      	r2
900159d4:	2a02      	cmpnei      	r2, 0
900159d6:	e0c1      	bt      	0x90015b5a	// 0x90015b5a
900159d8:	7e3c      	lrw      	r14, 0x90648f2c	// 0x90015ac8
900159da:	827e      	ld.w      	r2, (r14, 0x1c)
900159dc:	7f3d      	jsri      	0x900146F0	// 0x900146f0
900159de:	6037      	movi      	r7, 3
900159e0:	977e      	st.w      	r7, (r14, 0x1c)
900159e2:	1272      	mov      	r2, r7
900159e4:	7f3c      	jsri      	0x900146BC	// 0x900146bc
900159e6:	763c      	lrw      	r6, 0xa0	// 0x90015ad8
900159e8:	1267      	mov      	r7, r6
900159ea:	1ce7      	addu      	r7, r7, r14
900159ec:	8707      	ld.w      	r7, (r7, 0x0)
900159ee:	2a07      	cmpnei      	r7, 0
900159f0:	e802      	bf      	0x900159f6	// 0x900159f6
900159f2:	827e      	ld.w      	r2, (r14, 0x1c)
900159f4:	00d7      	jsr      	r7
900159f6:	7734      	lrw      	r7, 0x90648f2c	// 0x90015ac8
900159f8:	8247      	ld.w      	r2, (r7, 0x10)
900159fa:	2402      	subi      	r2, r2, 1
900159fc:	f02f      	br      	0x90015a5c	// 0x90015a5c
900159fe:	2202      	cmplti      	r2, 1
90015a00:	e0d7      	bt      	0x90015bb0	// 0x90015bb0
90015a02:	7f33      	jsri      	0x900146F0	// 0x900146f0
90015a04:	7e31      	lrw      	r14, 0x90648f2c	// 0x90015ac8
90015a06:	827e      	ld.w      	r2, (r14, 0x1c)
90015a08:	f0c8      	br      	0x90015b9a	// 0x90015b9a
90015a0a:	7726      	lrw      	r7, 0x90648fdc	// 0x90015aa4
90015a0c:	a707      	ld.b      	r7, (r7, 0x0)
90015a0e:	2a07      	cmpnei      	r7, 0
90015a10:	e0cf      	bt      	0x90015bb0	// 0x90015bb0
90015a12:	7e2d      	lrw      	r14, 0x90648f2c	// 0x90015ac8
90015a14:	827e      	ld.w      	r2, (r14, 0x1c)
90015a16:	875e      	ld.w      	r7, (r14, 0x14)
90015a18:	2407      	subi      	r7, r7, 1
90015a1a:	0f72      	cmpne      	r2, r7
90015a1c:	e024      	bt      	0x90015a66	// 0x90015a66
90015a1e:	873e      	ld.w      	r7, (r14, 0xc)
90015a20:	2407      	subi      	r7, r7, 1
90015a22:	864e      	ld.w      	r6, (r14, 0x10)
90015a24:	0d76      	cmplt      	r6, r7
90015a26:	e8c4      	bf      	0x90015bb0	// 0x90015bb0
90015a28:	772d      	lrw      	r7, 0x90	// 0x90015adc
90015a2a:	1c7e      	addu      	r14, r14, r7
90015a2c:	820e      	ld.w      	r2, (r14, 0x0)
90015a2e:	2a02      	cmpnei      	r2, 0
90015a30:	e803      	bf      	0x90015a38	// 0x90015a38
90015a32:	00d2      	jsr      	r2
90015a34:	2a02      	cmpnei      	r2, 0
90015a36:	e091      	bt      	0x90015b5a	// 0x90015b5a
90015a38:	7e24      	lrw      	r14, 0x90648f2c	// 0x90015ac8
90015a3a:	827e      	ld.w      	r2, (r14, 0x1c)
90015a3c:	7f25      	jsri      	0x900146F0	// 0x900146f0
90015a3e:	6006      	movi      	r6, 0
90015a40:	967e      	st.w      	r6, (r14, 0x1c)
90015a42:	1262      	mov      	r2, r6
90015a44:	7f24      	jsri      	0x900146BC	// 0x900146bc
90015a46:	7624      	lrw      	r6, 0xa0	// 0x90015ad8
90015a48:	1267      	mov      	r7, r6
90015a4a:	1ce7      	addu      	r7, r7, r14
90015a4c:	8707      	ld.w      	r7, (r7, 0x0)
90015a4e:	2a07      	cmpnei      	r7, 0
90015a50:	e802      	bf      	0x90015a56	// 0x90015a56
90015a52:	827e      	ld.w      	r2, (r14, 0x1c)
90015a54:	00d7      	jsr      	r7
90015a56:	771c      	lrw      	r7, 0x90648f2c	// 0x90015ac8
90015a58:	8247      	ld.w      	r2, (r7, 0x10)
90015a5a:	2002      	addi      	r2, r2, 1
90015a5c:	9247      	st.w      	r2, (r7, 0x10)
90015a5e:	7620      	lrw      	r6, 0x94	// 0x90015ae0
90015a60:	1c67      	addu      	r7, r7, r6
90015a62:	8707      	ld.w      	r7, (r7, 0x0)
90015a64:	f089      	br      	0x90015b78	// 0x90015b78
90015a66:	37f2      	btsti      	r2, 31
90015a68:	e0a3      	bt      	0x90015bb0	// 0x90015bb0
90015a6a:	7f19      	jsri      	0x900146F0	// 0x900146f0
90015a6c:	827e      	ld.w      	r2, (r14, 0x1c)
90015a6e:	2002      	addi      	r2, r2, 1
90015a70:	f095      	br      	0x90015b9c	// 0x90015b9c
90015a72:	f038      	br      	0x90015ae4	// 0x90015ae4
90015a74:	f7ff      	br      	0x90015a74	// 0x90015a74
90015a76:	1200      	mov      	r0, r0
90015a78:	5814      	stex      	r8, (r4, 0x1)
90015a7a:	9001      	st.w      	r0, (r1, 0x0)
90015a7c:	564c      	stex      	r6, (r12, 0x4)
90015a7e:	9006      	st.w      	r0, (r6, 0x0)
90015a80:	0112      	xtrb2      	r1, r2
90015a82:	0000      	bkpt
90015a84:	0111      	xtrb2      	r1, r1
90015a86:	0000      	bkpt
90015a88:	0119      	xtrb2      	r1, r9
90015a8a:	0000      	bkpt
90015a8c:	0114      	xtrb2      	r1, r4
90015a8e:	0000      	bkpt
90015a90:	0118      	xtrb2      	r1, r8
90015a92:	0000      	bkpt
90015a94:	0190      	tstnbz      	r0
90015a96:	0000      	bkpt
90015a98:	0193      	tstnbz      	r3
90015a9a:	0000      	bkpt
90015a9c:	9134      	st.w      	r1, (r4, 0xc)
90015a9e:	904b      	st.w      	r0, (r11, 0x10)
90015aa0:	e020      	bt      	0x90015ae2	// 0x90015ae2
90015aa2:	9024      	st.w      	r0, (r4, 0x8)
90015aa4:	8fdc      	ld.w      	r15, (r12, 0x34)
90015aa6:	9064      	st.w      	r0, (r4, 0x18)
90015aa8:	4978      	ldex      	r9, (r8, 0x7)
90015aaa:	9001      	st.w      	r0, (r1, 0x0)
90015aac:	8fc4      	ld.w      	r15, (r4, 0x30)
90015aae:	9064      	st.w      	r0, (r4, 0x18)
90015ab0:	9e44      	st.w      	r14, (r4, 0x10)
90015ab2:	904b      	st.w      	r0, (r11, 0x10)
90015ab4:	8f90      	ld.w      	r15, (r0, 0x24)
90015ab6:	9064      	st.w      	r0, (r4, 0x18)
90015ab8:	8fb4      	ld.w      	r15, (r4, 0x2c)
90015aba:	9064      	st.w      	r0, (r4, 0x18)
90015abc:	8f6c      	ld.w      	r15, (r12, 0x18)
90015abe:	9064      	st.w      	r0, (r4, 0x18)
90015ac0:	5624      	stex      	r6, (r4, 0x2)
90015ac2:	9001      	st.w      	r0, (r1, 0x0)
90015ac4:	8fd8      	ld.w      	r15, (r8, 0x34)
90015ac6:	9064      	st.w      	r0, (r4, 0x18)
90015ac8:	8f2c      	ld.w      	r15, (r12, 0x8)
90015aca:	9064      	st.w      	r0, (r4, 0x18)
90015acc:	8fbc      	ld.w      	r15, (r12, 0x2c)
90015ace:	9064      	st.w      	r0, (r4, 0x18)
90015ad0:	46f0      	ldex      	r6, (r0, 0xf)
90015ad2:	9001      	st.w      	r0, (r1, 0x0)
90015ad4:	46bc      	ldex      	r6, (r12, 0xb)
90015ad6:	9001      	st.w      	r0, (r1, 0x0)
90015ad8:	00a0      	inct      	r0, r0, 1
90015ada:	0000      	bkpt
90015adc:	0090      	decf      	r0, r0, 1
90015ade:	0000      	bkpt
90015ae0:	0094      	decf      	r4, r4, 1
90015ae2:	0000      	bkpt
90015ae4:	7737      	lrw      	r7, 0x90648fdc	// 0x90015bc0
90015ae6:	ae07      	ld.b      	r14, (r7, 0x0)
90015ae8:	2a0e      	cmpnei      	r14, 0
90015aea:	e062      	bt      	0x90015bb0	// 0x90015bb0
90015aec:	7d36      	lrw      	r13, 0x90648f2c	// 0x90015bc4
90015aee:	827d      	ld.w      	r2, (r13, 0x1c)
90015af0:	7f36      	jsri      	0x900146F0	// 0x900146f0
90015af2:	7636      	lrw      	r6, 0x8c	// 0x90015bcc
90015af4:	1267      	mov      	r7, r6
90015af6:	1cd7      	addu      	r7, r7, r13
90015af8:	9e07      	st.w      	r14, (r7, 0x0)
90015afa:	7735      	lrw      	r7, 0xa8	// 0x90015bd0
90015afc:	1c7d      	addu      	r13, r13, r7
90015afe:	870d      	ld.w      	r7, (r13, 0x0)
90015b00:	2a07      	cmpnei      	r7, 0
90015b02:	e856      	bf      	0x90015bb0	// 0x90015bb0
90015b04:	12e2      	mov      	r2, r14
90015b06:	f053      	br      	0x90015bae	// 0x90015bae
90015b08:	772e      	lrw      	r7, 0x90648fdc	// 0x90015bc0
90015b0a:	a707      	ld.b      	r7, (r7, 0x0)
90015b0c:	2a07      	cmpnei      	r7, 0
90015b0e:	e050      	bt      	0x90015bb0	// 0x90015bb0
90015b10:	7731      	lrw      	r7, 0x90648fbc	// 0x90015bd4
90015b12:	8207      	ld.w      	r2, (r7, 0x0)
90015b14:	2a02      	cmpnei      	r2, 0
90015b16:	e803      	bf      	0x90015b1e	// 0x90015b1e
90015b18:	00d2      	jsr      	r2
90015b1a:	2a02      	cmpnei      	r2, 0
90015b1c:	e01e      	bt      	0x90015b5a	// 0x90015b5a
90015b1e:	7e29      	lrw      	r14, 0x90648f2c	// 0x90015bc4
90015b20:	8d4e      	ld.w      	r13, (r14, 0x10)
90015b22:	220d      	cmplti      	r13, 1
90015b24:	e006      	bt      	0x90015b32	// 0x90015b32
90015b26:	12d2      	mov      	r2, r13
90015b28:	2402      	subi      	r2, r2, 1
90015b2a:	924e      	st.w      	r2, (r14, 0x10)
90015b2c:	762b      	lrw      	r6, 0x94	// 0x90015bd8
90015b2e:	1c6e      	addu      	r14, r14, r6
90015b30:	f022      	br      	0x90015b76	// 0x90015b76
90015b32:	2a0d      	cmpnei      	r13, 0
90015b34:	e03d      	bt      	0x90015bb0	// 0x90015bb0
90015b36:	827e      	ld.w      	r2, (r14, 0x1c)
90015b38:	2202      	cmplti      	r2, 1
90015b3a:	e03a      	bt      	0x90015bb0	// 0x90015bb0
90015b3c:	7f23      	jsri      	0x900146F0	// 0x900146f0
90015b3e:	9d7e      	st.w      	r13, (r14, 0x1c)
90015b40:	12d2      	mov      	r2, r13
90015b42:	f02d      	br      	0x90015b9e	// 0x90015b9e
90015b44:	771f      	lrw      	r7, 0x90648fdc	// 0x90015bc0
90015b46:	a707      	ld.b      	r7, (r7, 0x0)
90015b48:	2a07      	cmpnei      	r7, 0
90015b4a:	e032      	bt      	0x90015bb0	// 0x90015bb0
90015b4c:	7722      	lrw      	r7, 0x90648fbc	// 0x90015bd4
90015b4e:	8207      	ld.w      	r2, (r7, 0x0)
90015b50:	2a02      	cmpnei      	r2, 0
90015b52:	e807      	bf      	0x90015b62	// 0x90015b62
90015b54:	00d2      	jsr      	r2
90015b56:	2a02      	cmpnei      	r2, 0
90015b58:	e804      	bf      	0x90015b62	// 0x90015b62
90015b5a:	7220      	lrw      	r2, 0x904b908c	// 0x90015bdc
90015b5c:	7321      	lrw      	r3, 0x3e8	// 0x90015be0
90015b5e:	7f21      	jsri      	0x90014A04	// 0x90014a04
90015b60:	f027      	br      	0x90015bb0	// 0x90015bb0
90015b62:	7e18      	lrw      	r14, 0x90648f2c	// 0x90015bc4
90015b64:	824e      	ld.w      	r2, (r14, 0x10)
90015b66:	873e      	ld.w      	r7, (r14, 0xc)
90015b68:	2407      	subi      	r7, r7, 1
90015b6a:	0d72      	cmplt      	r2, r7
90015b6c:	e80d      	bf      	0x90015b88	// 0x90015b88
90015b6e:	2002      	addi      	r2, r2, 1
90015b70:	924e      	st.w      	r2, (r14, 0x10)
90015b72:	7719      	lrw      	r7, 0x94	// 0x90015bd8
90015b74:	1c7e      	addu      	r14, r14, r7
90015b76:	870e      	ld.w      	r7, (r14, 0x0)
90015b78:	2a07      	cmpnei      	r7, 0
90015b7a:	e801      	bf      	0x90015b7e	// 0x90015b7e
90015b7c:	00d7      	jsr      	r7
90015b7e:	7711      	lrw      	r7, 0x90648f2c	// 0x90015bc4
90015b80:	8237      	ld.w      	r2, (r7, 0xc)
90015b82:	8347      	ld.w      	r3, (r7, 0x10)
90015b84:	7f19      	jsri      	0x90014EF8	// 0x90014ef8
90015b86:	f014      	br      	0x90015bb0	// 0x90015bb0
90015b88:	0f72      	cmpne      	r2, r7
90015b8a:	e012      	bt      	0x90015bb0	// 0x90015bb0
90015b8c:	827e      	ld.w      	r2, (r14, 0x1c)
90015b8e:	875e      	ld.w      	r7, (r14, 0x14)
90015b90:	2407      	subi      	r7, r7, 1
90015b92:	0d72      	cmplt      	r2, r7
90015b94:	e80d      	bf      	0x90015bb0	// 0x90015bb0
90015b96:	7f0c      	jsri      	0x900146F0	// 0x900146f0
90015b98:	825e      	ld.w      	r2, (r14, 0x14)
90015b9a:	2402      	subi      	r2, r2, 1
90015b9c:	927e      	st.w      	r2, (r14, 0x1c)
90015b9e:	7f13      	jsri      	0x900146BC	// 0x900146bc
90015ba0:	7614      	lrw      	r6, 0xa0	// 0x90015bf0
90015ba2:	1267      	mov      	r7, r6
90015ba4:	1ce7      	addu      	r7, r7, r14
90015ba6:	8707      	ld.w      	r7, (r7, 0x0)
90015ba8:	2a07      	cmpnei      	r7, 0
90015baa:	e802      	bf      	0x90015bb0	// 0x90015bb0
90015bac:	827e      	ld.w      	r2, (r14, 0x1c)
90015bae:	00d7      	jsr      	r7
90015bb0:	6002      	movi      	r2, 0
90015bb2:	8f20      	ld.w      	r15, (r0, 0x8)
90015bb4:	8e10      	ld.w      	r14, (r0, 0x4)
90015bb6:	8d00      	ld.w      	r13, (r0, 0x0)
90015bb8:	20f0      	addi      	r0, r0, 16
90015bba:	00cf      	jmp      	r15
90015bbc:	f7ff      	br      	0x90015bbc	// 0x90015bbc
90015bbe:	f7ff      	br      	0x90015bbe	// 0x90015bbe
90015bc0:	8fdc      	ld.w      	r15, (r12, 0x34)
90015bc2:	9064      	st.w      	r0, (r4, 0x18)
90015bc4:	8f2c      	ld.w      	r15, (r12, 0x8)
90015bc6:	9064      	st.w      	r0, (r4, 0x18)
90015bc8:	46f0      	ldex      	r6, (r0, 0xf)
90015bca:	9001      	st.w      	r0, (r1, 0x0)
90015bcc:	008c      	dect      	r12, r12, 1
90015bce:	0000      	bkpt
90015bd0:	00a8      	inct      	r8, r8, 1
90015bd2:	0000      	bkpt
90015bd4:	8fbc      	ld.w      	r15, (r12, 0x2c)
90015bd6:	9064      	st.w      	r0, (r4, 0x18)
90015bd8:	0094      	decf      	r4, r4, 1
90015bda:	0000      	bkpt
90015bdc:	908c      	st.w      	r0, (r12, 0x20)
90015bde:	904b      	st.w      	r0, (r11, 0x10)
90015be0:	03e8      	mult      	r8, r8, r14
90015be2:	0000      	bkpt
90015be4:	4a04      	ldex      	r10, (r4, 0x0)
90015be6:	9001      	st.w      	r0, (r1, 0x0)
90015be8:	4ef8      	ldex      	r14, (r8, 0xf)
90015bea:	9001      	st.w      	r0, (r1, 0x0)
90015bec:	46bc      	ldex      	r6, (r12, 0xb)
90015bee:	9001      	st.w      	r0, (r1, 0x0)
90015bf0:	00a0      	inct      	r0, r0, 1
	...
