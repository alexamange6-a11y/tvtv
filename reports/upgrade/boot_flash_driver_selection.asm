
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f68454 <.data+0xa454>:
93f68454:	24f0      	subi      	r0, r0, 16
93f68456:	9d00      	st.w      	r13, (r0, 0x0)
93f68458:	9e10      	st.w      	r14, (r0, 0x4)
93f6845a:	9f20      	st.w      	r15, (r0, 0x8)
93f6845c:	7f0d      	jsri      	0x93F6D03C	// 0x93f6d03c
93f6845e:	7f0d      	jsri      	0x93F6D5B8	// 0x93f6d5b8
93f68460:	7d0e      	lrw      	r13, 0x93f74714	// 0x93f68498
93f68462:	870d      	ld.w      	r7, (r13, 0x0)
93f68464:	6002      	movi      	r2, 0
93f68466:	00d7      	jsr      	r7
93f68468:	122e      	mov      	r14, r2
93f6846a:	37f2      	btsti      	r2, 31
93f6846c:	e003      	bt      	0x93f68474	// 0x93f68474
93f6846e:	770b      	lrw      	r7, 0x93f7b59c	// 0x93f6849c
93f68470:	9d07      	st.w      	r13, (r7, 0x0)
93f68472:	f005      	br      	0x93f6847e	// 0x93f6847e
93f68474:	2c07      	bmaski      	r7, 0
93f68476:	0f72      	cmpne      	r2, r7
93f68478:	e002      	bt      	0x93f6847e	// 0x93f6847e
93f6847a:	7209      	lrw      	r2, 0x93f76a14	// 0x93f684a0
93f6847c:	7f0a      	jsri      	0x93F638DC	// 0x93f638dc
93f6847e:	12e2      	mov      	r2, r14
93f68480:	8f20      	ld.w      	r15, (r0, 0x8)
93f68482:	8e10      	ld.w      	r14, (r0, 0x4)
93f68484:	8d00      	ld.w      	r13, (r0, 0x0)
93f68486:	20f0      	addi      	r0, r0, 16
93f68488:	00cf      	jmp      	r15
93f6848a:	f7ff      	br      	0x93f6848a	// 0x93f6848a
93f6848c:	f7ff      	br      	0x93f6848c	// 0x93f6848c
93f6848e:	1200      	mov      	r0, r0
93f68490:	d03c      	st.h      	r0, (r12, 0x6)
93f68492:	93f6      	st.w      	r3, (r6, 0x3c)
93f68494:	d5b8      	st.h      	r5, (r8, 0x16)
93f68496:	93f6      	st.w      	r3, (r6, 0x3c)
93f68498:	4714      	ldex      	r7, (r4, 0x1)
93f6849a:	93f7      	st.w      	r3, (r7, 0x3c)
93f6849c:	b59c      	st.b      	r5, (r12, 0x9)
93f6849e:	93f7      	st.w      	r3, (r7, 0x3c)
