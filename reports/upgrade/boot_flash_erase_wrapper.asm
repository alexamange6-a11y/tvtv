
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f68514 <.data+0xa514>:
93f68514:	2470      	subi      	r0, r0, 8
93f68516:	9f00      	st.w      	r15, (r0, 0x0)
93f68518:	7706      	lrw      	r7, 0x93f7b59c	// 0x93f68530
93f6851a:	8707      	ld.w      	r7, (r7, 0x0)
93f6851c:	8737      	ld.w      	r7, (r7, 0xc)
93f6851e:	2a07      	cmpnei      	r7, 0
93f68520:	e801      	bf      	0x93f68524	// 0x93f68524
93f68522:	00d7      	jsr      	r7
93f68524:	8f00      	ld.w      	r15, (r0, 0x0)
93f68526:	2070      	addi      	r0, r0, 8
93f68528:	00cf      	jmp      	r15
93f6852a:	f7ff      	br      	0x93f6852a	// 0x93f6852a
93f6852c:	f7ff      	br      	0x93f6852c	// 0x93f6852c
93f6852e:	1200      	mov      	r0, r0
93f68530:	b59c      	st.b      	r5, (r12, 0x9)
93f68532:	93f7      	st.w      	r3, (r7, 0x3c)
