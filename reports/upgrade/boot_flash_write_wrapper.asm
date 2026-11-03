
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f68534 <.data+0xa534>:
93f68534:	2470      	subi      	r0, r0, 8
93f68536:	9f00      	st.w      	r15, (r0, 0x0)
93f68538:	7707      	lrw      	r7, 0x93f7b59c	// 0x93f68554
93f6853a:	8707      	ld.w      	r7, (r7, 0x0)
93f6853c:	8747      	ld.w      	r7, (r7, 0x10)
93f6853e:	2a07      	cmpnei      	r7, 0
93f68540:	e802      	bf      	0x93f68546	// 0x93f68546
93f68542:	00d7      	jsr      	r7
93f68544:	f001      	br      	0x93f68548	// 0x93f68548
93f68546:	2c02      	bmaski      	r2, 0
93f68548:	8f00      	ld.w      	r15, (r0, 0x0)
93f6854a:	2070      	addi      	r0, r0, 8
93f6854c:	00cf      	jmp      	r15
93f6854e:	f7ff      	br      	0x93f6854e	// 0x93f6854e
93f68550:	f7ff      	br      	0x93f68550	// 0x93f68550
93f68552:	1200      	mov      	r0, r0
93f68554:	b59c      	st.b      	r5, (r12, 0x9)
93f68556:	93f7      	st.w      	r3, (r7, 0x3c)
