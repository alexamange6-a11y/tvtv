
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9024ec58 <.data+0x24ec58>:
9024ec58:	2470      	subi      	r0, r0, 8
9024ec5a:	9f00      	st.w      	r15, (r0, 0x0)
9024ec5c:	2a02      	cmpnei      	r2, 0
9024ec5e:	e004      	bt      	0x9024ec68	// 0x9024ec68
9024ec60:	2c02      	bmaski      	r2, 0
9024ec62:	8f00      	ld.w      	r15, (r0, 0x0)
9024ec64:	2070      	addi      	r0, r0, 8
9024ec66:	00cf      	jmp      	r15
9024ec68:	2a03      	cmpnei      	r3, 0
9024ec6a:	effa      	bf      	0x9024ec60	// 0x9024ec60
9024ec6c:	6004      	movi      	r4, 0
9024ec6e:	7f04      	jsri      	0x90256358	// 0x90256358
9024ec70:	2a02      	cmpnei      	r2, 0
9024ec72:	0022      	mvc      	r2
9024ec74:	2402      	subi      	r2, r2, 1
9024ec76:	8f00      	ld.w      	r15, (r0, 0x0)
9024ec78:	2070      	addi      	r0, r0, 8
9024ec7a:	00cf      	jmp      	r15
9024ec7c:	f7ff      	br      	0x9024ec7c	// 0x9024ec7c
9024ec7e:	f7ff      	br      	0x9024ec7e	// 0x9024ec7e
9024ec80:	6358      	movi      	r8, 53
9024ec82:	9025      	st.w      	r0, (r5, 0x8)
