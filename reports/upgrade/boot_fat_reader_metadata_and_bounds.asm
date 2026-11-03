
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f734e0 <.data+0x154e0>:
93f734e0:	7628      	lrw      	r6, 0x97	// 0x93f73580
93f734e2:	1c06      	addu      	r6, r6, r0
93f734e4:	a706      	ld.b      	r7, (r6, 0x0)
93f734e6:	2f07      	andi      	r7, r7, 16
93f734e8:	2a07      	cmpnei      	r7, 0
93f734ea:	e90e      	bf      	0x93f73708	// 0x93f73708
93f734ec:	7226      	lrw      	r2, 0xaa0	// 0x93f73584
93f734ee:	1c02      	addu      	r2, r2, r0
93f734f0:	8202      	ld.w      	r2, (r2, 0x0)
93f734f2:	37f2      	btsti      	r2, 31
93f734f4:	0abc      	movf      	r12, r11
93f734f6:	741c      	lrw      	r4, 0x8c	// 0x93f73568
93f734f8:	1243      	mov      	r3, r4
93f734fa:	1c03      	addu      	r3, r3, r0
93f734fc:	2a09      	cmpnei      	r9, 0
93f734fe:	e67a      	bt      	0x93f731f4	// 0x93f731f4
93f73500:	123b      	mov      	r11, r3
93f73502:	7521      	lrw      	r5, 0xab0	// 0x93f73588
93f73504:	1c05      	addu      	r5, r5, r0
93f73506:	8505      	ld.w      	r5, (r5, 0x0)
93f73508:	2a05      	cmpnei      	r5, 0
93f7350a:	8773      	ld.w      	r7, (r3, 0x1c)
93f7350c:	e802      	bf      	0x93f73512	// 0x93f73512
93f7350e:	9705      	st.w      	r7, (r5, 0x0)
93f73510:	f0fc      	br      	0x93f7370a	// 0x93f7370a
93f73512:	127d      	mov      	r13, r7
93f73514:	62c6      	movi      	r6, 44
93f73516:	f03a      	br      	0x93f7358c	// 0x93f7358c
93f73518:	f7ff      	br      	0x93f73518	// 0x93f73518
93f7351a:	1200      	mov      	r0, r0
93f7351c:	0ab8      	movf      	r8, r11
93f7351e:	0000      	bkpt
93f73520:	0a98      	movf      	r8, r9
93f73522:	0000      	bkpt
93f73524:	6aa0      	mulshs      	r0, r10
93f73526:	93f9      	st.w      	r3, (r9, 0x3c)
93f73528:	29d8      	rsubi      	r8, r8, 29
93f7352a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7352c:	018c      	declt      	r12, r12, 1
93f7352e:	0000      	bkpt
93f73530:	00e5      	ff1      	r5, r5
93f73532:	0000      	bkpt
93f73534:	0aa4      	movf      	r4, r10
93f73536:	0000      	bkpt
93f73538:	2b18      	cmpnei      	r8, 17
93f7353a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7353c:	0a94      	movf      	r4, r9
93f7353e:	0000      	bkpt
93f73540:	0a90      	movf      	r0, r9
93f73542:	0000      	bkpt
93f73544:	9ae4      	st.w      	r10, (r4, 0x38)
93f73546:	93f7      	st.w      	r3, (r7, 0x3c)
93f73548:	0a9c      	movf      	r12, r9
93f7354a:	0000      	bkpt
93f7354c:	9af8      	st.w      	r10, (r8, 0x3c)
93f7354e:	93f7      	st.w      	r3, (r7, 0x3c)
93f73550:	9b08      	st.w      	r11, (r8, 0x0)
93f73552:	93f7      	st.w      	r3, (r7, 0x3c)
93f73554:	38dc      	rotli      	r12, r12, 13
93f73556:	93f6      	st.w      	r3, (r6, 0x3c)
93f73558:	27fc      	cpwgr      	r12, cpr31
93f7355a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7355c:	293c      	rsubi      	r12, r12, 19
93f7355e:	93f7      	st.w      	r3, (r7, 0x3c)
93f73560:	3cc8      	lsli      	r8, r8, 12
93f73562:	93f6      	st.w      	r3, (r6, 0x3c)
93f73564:	0ab4      	movf      	r4, r11
93f73566:	0000      	bkpt
93f73568:	008c      	dect      	r12, r12, 1
93f7356a:	0000      	bkpt
93f7356c:	3de4      	lsli      	r4, r4, 30
93f7356e:	93f6      	st.w      	r3, (r6, 0x3c)
93f73570:	2664      	cpwgr      	r4, cpr6
93f73572:	93f7      	st.w      	r3, (r7, 0x3c)
93f73574:	fff0      	bsr      	0x93f73556	// 0x93f73556
93f73576:	0000      	bkpt
93f73578:	fff0      	bsr      	0x93f7355a	// 0x93f7355a
93f7357a:	0fff      	cmpne      	r15, r15
93f7357c:	9a8c      	st.w      	r10, (r12, 0x20)
93f7357e:	93f7      	st.w      	r3, (r7, 0x3c)
93f73580:	0097      	decf      	r7, r7, 1
93f73582:	0000      	bkpt
93f73584:	0aa0      	movf      	r0, r10
93f73586:	0000      	bkpt
93f73588:	0ab0      	movf      	r0, r11
93f7358a:	0000      	bkpt
93f7358c:	1c06      	addu      	r6, r6, r0
93f7358e:	c4b6      	ld.h      	r4, (r6, 0x16)
93f73590:	cca6      	ld.h      	r12, (r6, 0x14)
93f73592:	c5d3      	ld.h      	r5, (r3, 0x1a)
93f73594:	8316      	ld.w      	r3, (r6, 0x4)
93f73596:	6206      	movi      	r6, 32
93f73598:	0f63      	cmpne      	r3, r6
93f7359a:	e003      	bt      	0x93f735a2	// 0x93f735a2
93f7359c:	ceab      	ld.h      	r14, (r11, 0x14)
93f7359e:	3d0e      	lsli      	r14, r14, 16
93f735a0:	f003      	br      	0x93f735a8	// 0x93f735a8
93f735a2:	7263      	lrw      	r2, 0xab0	// 0x93f73730
93f735a4:	1c02      	addu      	r2, r2, r0
93f735a6:	8e02      	ld.w      	r14, (r2, 0x0)
93f735a8:	7363      	lrw      	r3, 0xaa8	// 0x93f73734
93f735aa:	1c03      	addu      	r3, r3, r0
93f735ac:	8303      	ld.w      	r3, (r3, 0x0)
93f735ae:	0c73      	cmphs      	r3, r7
93f735b0:	e0a9      	bt      	0x93f73704	// 0x93f73704
93f735b2:	7661      	lrw      	r6, 0xabc	// 0x93f73738
93f735b4:	1c06      	addu      	r6, r6, r0
93f735b6:	8606      	ld.w      	r6, (r6, 0x0)
93f735b8:	2a06      	cmpnei      	r6, 0
93f735ba:	e804      	bf      	0x93f735c4	// 0x93f735c4
93f735bc:	126d      	mov      	r13, r6
93f735be:	1c3d      	addu      	r13, r13, r3
93f735c0:	0cd7      	cmphs      	r7, r13
93f735c2:	0a7d      	movf      	r13, r7
