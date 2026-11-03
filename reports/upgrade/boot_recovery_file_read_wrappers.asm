
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f73870 <.data+0x15870>:
93f73870:	2470      	subi      	r0, r0, 8
93f73872:	9f00      	st.w      	r15, (r0, 0x0)
93f73874:	6006      	movi      	r6, 0
93f73876:	1267      	mov      	r7, r6
93f73878:	7f03      	jsri      	0x93F72D94	// 0x93f72d94
93f7387a:	8f00      	ld.w      	r15, (r0, 0x0)
93f7387c:	2070      	addi      	r0, r0, 8
93f7387e:	00cf      	jmp      	r15
93f73880:	f7ff      	br      	0x93f73880	// 0x93f73880
93f73882:	f7ff      	br      	0x93f73882	// 0x93f73882
93f73884:	2d94      	bmaski      	r4, 25
93f73886:	93f7      	st.w      	r3, (r7, 0x3c)
93f73888:	2470      	subi      	r0, r0, 8
93f7388a:	9f00      	st.w      	r15, (r0, 0x0)
93f7388c:	1237      	mov      	r7, r3
93f7388e:	1245      	mov      	r5, r4
93f73890:	6003      	movi      	r3, 0
93f73892:	1274      	mov      	r4, r7
93f73894:	ffed      	bsr      	0x93f73870	// 0x93f73870
93f73896:	8f00      	ld.w      	r15, (r0, 0x0)
93f73898:	2070      	addi      	r0, r0, 8
93f7389a:	00cf      	jmp      	r15
93f7389c:	f7ff      	br      	0x93f7389c	// 0x93f7389c
93f7389e:	f7ff      	br      	0x93f7389e	// 0x93f7389e
93f738a0:	3870      	rotli      	r0, r0, 7
93f738a2:	93f7      	st.w      	r3, (r7, 0x3c)
