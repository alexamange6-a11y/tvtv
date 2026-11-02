
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90265aa8 <.data+0x265aa8>:
90265aa8:	7510      	lrw      	r5, 0x90836760	// 0x90265ae8
90265aaa:	8695      	ld.w      	r6, (r5, 0x24)
90265aac:	1267      	mov      	r7, r6
90265aae:	2007      	addi      	r7, r7, 1
90265ab0:	33f4      	bgeni      	r4, 31
90265ab2:	2064      	addi      	r4, r4, 7
90265ab4:	1647      	and      	r7, r7, r4
90265ab6:	37f7      	btsti      	r7, 31
90265ab8:	e00a      	bt      	0x90265ace	// 0x90265ace
90265aba:	740b      	lrw      	r4, 0x90836760	// 0x90265ae8
90265abc:	8585      	ld.w      	r5, (r5, 0x20)
90265abe:	0f75      	cmpne      	r5, r7
90265ac0:	e80f      	bf      	0x90265ae0	// 0x90265ae0
90265ac2:	3c26      	lsli      	r6, r6, 2
90265ac4:	1c46      	addu      	r6, r6, r4
90265ac6:	9206      	st.w      	r2, (r6, 0x0)
90265ac8:	9794      	st.w      	r7, (r4, 0x24)
90265aca:	6002      	movi      	r2, 0
90265acc:	00cf      	jmp      	r15
90265ace:	2407      	subi      	r7, r7, 1
90265ad0:	6074      	movi      	r4, 7
90265ad2:	01f4      	not      	r4, r4
90265ad4:	1e47      	or      	r7, r7, r4
90265ad6:	2007      	addi      	r7, r7, 1
90265ad8:	7404      	lrw      	r4, 0x90836760	// 0x90265ae8
90265ada:	8585      	ld.w      	r5, (r5, 0x20)
90265adc:	0f75      	cmpne      	r5, r7
90265ade:	e7f1      	bt      	0x90265ac2	// 0x90265ac2
90265ae0:	2c02      	bmaski      	r2, 0
90265ae2:	00cf      	jmp      	r15
90265ae4:	f7ff      	br      	0x90265ae4	// 0x90265ae4
90265ae6:	f7ff      	br      	0x90265ae6	// 0x90265ae6
90265ae8:	6760      	movi      	r0, 118
90265aea:	9083      	st.w      	r0, (r3, 0x20)
90265aec:	760e      	lrw      	r6, 0x90836760	// 0x90265b24
90265aee:	8786      	ld.w      	r7, (r6, 0x20)
90265af0:	8596      	ld.w      	r5, (r6, 0x24)
90265af2:	0f57      	cmpne      	r7, r5
90265af4:	e80c      	bf      	0x90265b0e	// 0x90265b0e
90265af6:	1275      	mov      	r5, r7
90265af8:	3c25      	lsli      	r5, r5, 2
90265afa:	1c65      	addu      	r5, r5, r6
90265afc:	8205      	ld.w      	r2, (r5, 0x0)
90265afe:	2007      	addi      	r7, r7, 1
90265b00:	33f5      	bgeni      	r5, 31
90265b02:	2065      	addi      	r5, r5, 7
90265b04:	1657      	and      	r7, r7, r5
90265b06:	37f7      	btsti      	r7, 31
90265b08:	e004      	bt      	0x90265b12	// 0x90265b12
90265b0a:	9786      	st.w      	r7, (r6, 0x20)
90265b0c:	00cf      	jmp      	r15
90265b0e:	6002      	movi      	r2, 0
90265b10:	00cf      	jmp      	r15
90265b12:	2407      	subi      	r7, r7, 1
90265b14:	6075      	movi      	r5, 7
90265b16:	01f5      	not      	r5, r5
90265b18:	1e57      	or      	r7, r7, r5
90265b1a:	2007      	addi      	r7, r7, 1
90265b1c:	9786      	st.w      	r7, (r6, 0x20)
90265b1e:	f7f6      	br      	0x90265b0c	// 0x90265b0c
90265b20:	f7ff      	br      	0x90265b20	// 0x90265b20
90265b22:	f7ff      	br      	0x90265b22	// 0x90265b22
