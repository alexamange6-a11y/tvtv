
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

9002e3e0 <.data+0x2e3e0>:
9002e3e0:	2570      	subi      	r0, r0, 24
9002e3e2:	9a00      	st.w      	r10, (r0, 0x0)
9002e3e4:	9b10      	st.w      	r11, (r0, 0x4)
9002e3e6:	9c20      	st.w      	r12, (r0, 0x8)
9002e3e8:	9d30      	st.w      	r13, (r0, 0xc)
9002e3ea:	9e40      	st.w      	r14, (r0, 0x10)
9002e3ec:	9f50      	st.w      	r15, (r0, 0x14)
9002e3ee:	122c      	mov      	r12, r2
9002e3f0:	123d      	mov      	r13, r3
9002e3f2:	7267      	lrw      	r2, 0x230	// 0x9002e590
9002e3f4:	7f68      	jsri      	0x90081100	// 0x90081100
9002e3f6:	122e      	mov      	r14, r2
9002e3f8:	2a02      	cmpnei      	r2, 0
9002e3fa:	e8be      	bf      	0x9002e578	// 0x9002e578
9002e3fc:	6003      	movi      	r3, 0
9002e3fe:	7464      	lrw      	r4, 0x230	// 0x9002e590
9002e400:	7f66      	jsri      	0x9047768C	// 0x9047768c
9002e402:	12e2      	mov      	r2, r14
9002e404:	7f66      	jsri      	0x9038200C	// 0x9038200c
9002e406:	37f2      	btsti      	r2, 31
9002e408:	e803      	bf      	0x9002e410	// 0x9002e410
9002e40a:	12e2      	mov      	r2, r14
9002e40c:	7f65      	jsri      	0x900811DC	// 0x900811dc
9002e40e:	f0b4      	br      	0x9002e578	// 0x9002e578
9002e410:	2a0c      	cmpnei      	r12, 0
9002e412:	e03b      	bt      	0x9002e48a	// 0x9002e48a
9002e414:	9c0d      	st.w      	r12, (r13, 0x0)
9002e416:	9c1d      	st.w      	r12, (r13, 0x4)
9002e418:	f034      	br      	0x9002e482	// 0x9002e482
9002e41a:	12c7      	mov      	r7, r12
9002e41c:	1dc7      	ixh      	r7, r7, r12
9002e41e:	127b      	mov      	r11, r7
9002e420:	3c4b      	lsli      	r11, r11, 4
9002e422:	057b      	subu      	r11, r11, r7
9002e424:	1ceb      	addu      	r11, r11, r14
9002e426:	12b2      	mov      	r2, r11
9002e428:	2042      	addi      	r2, r2, 5
9002e42a:	735e      	lrw      	r3, 0x904b8e9c	// 0x9002e5a4
9002e42c:	7f5f      	jsri      	0x900D2FA0	// 0x900d2fa0
9002e42e:	2a02      	cmpnei      	r2, 0
9002e430:	e027      	bt      	0x9002e480	// 0x9002e480
9002e432:	20fb      	addi      	r11, r11, 16
9002e434:	a7ab      	ld.b      	r7, (r11, 0xa)
9002e436:	3c87      	lsli      	r7, r7, 8
9002e438:	a49b      	ld.b      	r4, (r11, 0x9)
9002e43a:	1e47      	or      	r7, r7, r4
9002e43c:	a6bb      	ld.b      	r6, (r11, 0xb)
9002e43e:	3d06      	lsli      	r6, r6, 16
9002e440:	1e76      	or      	r6, r6, r7
9002e442:	a7cb      	ld.b      	r7, (r11, 0xc)
9002e444:	3d87      	lsli      	r7, r7, 24
9002e446:	1e67      	or      	r7, r7, r6
9002e448:	970d      	st.w      	r7, (r13, 0x0)
9002e44a:	12c6      	mov      	r6, r12
9002e44c:	f015      	br      	0x9002e478	// 0x9002e478
9002e44e:	1265      	mov      	r5, r6
9002e450:	1d65      	ixh      	r5, r5, r6
9002e452:	1257      	mov      	r7, r5
9002e454:	3c47      	lsli      	r7, r7, 4
9002e456:	0557      	subu      	r7, r7, r5
9002e458:	1ce7      	addu      	r7, r7, r14
9002e45a:	2077      	addi      	r7, r7, 8
9002e45c:	a567      	ld.b      	r5, (r7, 0x6)
9002e45e:	3c85      	lsli      	r5, r5, 8
9002e460:	a457      	ld.b      	r4, (r7, 0x5)
9002e462:	1e45      	or      	r5, r5, r4
9002e464:	a477      	ld.b      	r4, (r7, 0x7)
9002e466:	3d04      	lsli      	r4, r4, 16
9002e468:	1e54      	or      	r4, r4, r5
9002e46a:	a587      	ld.b      	r5, (r7, 0x8)
9002e46c:	3d85      	lsli      	r5, r5, 24
9002e46e:	1e45      	or      	r5, r5, r4
9002e470:	871d      	ld.w      	r7, (r13, 0x4)
9002e472:	1c57      	addu      	r7, r7, r5
9002e474:	971d      	st.w      	r7, (r13, 0x4)
9002e476:	2006      	addi      	r6, r6, 1
9002e478:	a74e      	ld.b      	r7, (r14, 0x4)
9002e47a:	2407      	subi      	r7, r7, 1
9002e47c:	0d76      	cmplt      	r6, r7
9002e47e:	e7e7      	bt      	0x9002e44e	// 0x9002e44e
9002e480:	200c      	addi      	r12, r12, 1
9002e482:	a64e      	ld.b      	r6, (r14, 0x4)
9002e484:	0d6c      	cmplt      	r12, r6
9002e486:	e7c9      	bt      	0x9002e41a	// 0x9002e41a
9002e488:	f03e      	br      	0x9002e506	// 0x9002e506
9002e48a:	2a1c      	cmpnei      	r12, 1
9002e48c:	e03e      	bt      	0x9002e50a	// 0x9002e50a
9002e48e:	6007      	movi      	r7, 0
9002e490:	970d      	st.w      	r7, (r13, 0x0)
9002e492:	971d      	st.w      	r7, (r13, 0x4)
9002e494:	127c      	mov      	r12, r7
9002e496:	f034      	br      	0x9002e500	// 0x9002e500
9002e498:	12c7      	mov      	r7, r12
9002e49a:	1dc7      	ixh      	r7, r7, r12
9002e49c:	127b      	mov      	r11, r7
9002e49e:	3c4b      	lsli      	r11, r11, 4
9002e4a0:	057b      	subu      	r11, r11, r7
9002e4a2:	1ceb      	addu      	r11, r11, r14
9002e4a4:	12b2      	mov      	r2, r11
9002e4a6:	2042      	addi      	r2, r2, 5
9002e4a8:	733f      	lrw      	r3, 0x904b8e9c	// 0x9002e5a4
9002e4aa:	7f3f      	jsri      	0x900D2FA0	// 0x900d2fa0
9002e4ac:	2a02      	cmpnei      	r2, 0
9002e4ae:	e027      	bt      	0x9002e4fe	// 0x9002e4fe
9002e4b0:	20fb      	addi      	r11, r11, 16
9002e4b2:	a7ab      	ld.b      	r7, (r11, 0xa)
9002e4b4:	3c87      	lsli      	r7, r7, 8
9002e4b6:	a49b      	ld.b      	r4, (r11, 0x9)
9002e4b8:	1e47      	or      	r7, r7, r4
9002e4ba:	a6bb      	ld.b      	r6, (r11, 0xb)
9002e4bc:	3d06      	lsli      	r6, r6, 16
9002e4be:	1e76      	or      	r6, r6, r7
9002e4c0:	a7cb      	ld.b      	r7, (r11, 0xc)
9002e4c2:	3d87      	lsli      	r7, r7, 24
9002e4c4:	1e67      	or      	r7, r7, r6
9002e4c6:	970d      	st.w      	r7, (r13, 0x0)
9002e4c8:	12c6      	mov      	r6, r12
9002e4ca:	f015      	br      	0x9002e4f6	// 0x9002e4f6
9002e4cc:	1265      	mov      	r5, r6
9002e4ce:	1d65      	ixh      	r5, r5, r6
9002e4d0:	1257      	mov      	r7, r5
9002e4d2:	3c47      	lsli      	r7, r7, 4
9002e4d4:	0557      	subu      	r7, r7, r5
9002e4d6:	1ce7      	addu      	r7, r7, r14
9002e4d8:	2077      	addi      	r7, r7, 8
9002e4da:	a567      	ld.b      	r5, (r7, 0x6)
9002e4dc:	3c85      	lsli      	r5, r5, 8
9002e4de:	a457      	ld.b      	r4, (r7, 0x5)
9002e4e0:	1e45      	or      	r5, r5, r4
9002e4e2:	a477      	ld.b      	r4, (r7, 0x7)
9002e4e4:	3d04      	lsli      	r4, r4, 16
9002e4e6:	1e54      	or      	r4, r4, r5
9002e4e8:	a587      	ld.b      	r5, (r7, 0x8)
9002e4ea:	3d85      	lsli      	r5, r5, 24
9002e4ec:	1e45      	or      	r5, r5, r4
9002e4ee:	871d      	ld.w      	r7, (r13, 0x4)
9002e4f0:	1c57      	addu      	r7, r7, r5
9002e4f2:	971d      	st.w      	r7, (r13, 0x4)
9002e4f4:	2006      	addi      	r6, r6, 1
9002e4f6:	a74e      	ld.b      	r7, (r14, 0x4)
9002e4f8:	2417      	subi      	r7, r7, 2
9002e4fa:	0d76      	cmplt      	r6, r7
9002e4fc:	e7e7      	bt      	0x9002e4cc	// 0x9002e4cc
9002e4fe:	200c      	addi      	r12, r12, 1
9002e500:	a64e      	ld.b      	r6, (r14, 0x4)
9002e502:	0d6c      	cmplt      	r12, r6
9002e504:	e7c9      	bt      	0x9002e498	// 0x9002e498
9002e506:	600d      	movi      	r13, 0
9002e508:	f034      	br      	0x9002e572	// 0x9002e572
9002e50a:	2a2c      	cmpnei      	r12, 2
9002e50c:	e031      	bt      	0x9002e570	// 0x9002e570
9002e50e:	600a      	movi      	r10, 0
9002e510:	12ab      	mov      	r11, r10
9002e512:	f027      	br      	0x9002e562	// 0x9002e562
9002e514:	12b7      	mov      	r7, r11
9002e516:	1db7      	ixh      	r7, r7, r11
9002e518:	127c      	mov      	r12, r7
9002e51a:	3c4c      	lsli      	r12, r12, 4
9002e51c:	057c      	subu      	r12, r12, r7
9002e51e:	1cec      	addu      	r12, r12, r14
9002e520:	12c2      	mov      	r2, r12
9002e522:	2042      	addi      	r2, r2, 5
9002e524:	7322      	lrw      	r3, 0x904daea0	// 0x9002e5ac
9002e526:	7f20      	jsri      	0x900D2FA0	// 0x900d2fa0
9002e528:	2a02      	cmpnei      	r2, 0
9002e52a:	e01a      	bt      	0x9002e560	// 0x9002e560
9002e52c:	12c7      	mov      	r7, r12
9002e52e:	20f7      	addi      	r7, r7, 16
9002e530:	a5a7      	ld.b      	r5, (r7, 0xa)
9002e532:	3c85      	lsli      	r5, r5, 8
9002e534:	a497      	ld.b      	r4, (r7, 0x9)
9002e536:	1e45      	or      	r5, r5, r4
9002e538:	a6b7      	ld.b      	r6, (r7, 0xb)
9002e53a:	3d06      	lsli      	r6, r6, 16
9002e53c:	1e56      	or      	r6, r6, r5
9002e53e:	a7c7      	ld.b      	r7, (r7, 0xc)
9002e540:	3d87      	lsli      	r7, r7, 24
9002e542:	1e67      	or      	r7, r7, r6
9002e544:	970d      	st.w      	r7, (r13, 0x0)
9002e546:	207c      	addi      	r12, r12, 8
9002e548:	a76c      	ld.b      	r7, (r12, 0x6)
9002e54a:	3c87      	lsli      	r7, r7, 8
9002e54c:	a65c      	ld.b      	r6, (r12, 0x5)
9002e54e:	1e67      	or      	r7, r7, r6
9002e550:	a67c      	ld.b      	r6, (r12, 0x7)
9002e552:	3d06      	lsli      	r6, r6, 16
9002e554:	1e76      	or      	r6, r6, r7
9002e556:	a78c      	ld.b      	r7, (r12, 0x8)
9002e558:	3d87      	lsli      	r7, r7, 24
9002e55a:	1e67      	or      	r7, r7, r6
9002e55c:	971d      	st.w      	r7, (r13, 0x4)
9002e55e:	601a      	movi      	r10, 1
9002e560:	200b      	addi      	r11, r11, 1
9002e562:	a74e      	ld.b      	r7, (r14, 0x4)
9002e564:	0d7b      	cmplt      	r11, r7
9002e566:	e7d6      	bt      	0x9002e514	// 0x9002e514
9002e568:	2a0a      	cmpnei      	r10, 0
9002e56a:	003d      	mvcv      	r13
9002e56c:	280d      	rsubi      	r13, r13, 0
9002e56e:	f001      	br      	0x9002e572	// 0x9002e572
9002e570:	2c0d      	bmaski      	r13, 0
9002e572:	12e2      	mov      	r2, r14
9002e574:	7f0b      	jsri      	0x900811DC	// 0x900811dc
9002e576:	f001      	br      	0x9002e57a	// 0x9002e57a
9002e578:	2c0d      	bmaski      	r13, 0
9002e57a:	12d2      	mov      	r2, r13
9002e57c:	8f50      	ld.w      	r15, (r0, 0x14)
9002e57e:	8e40      	ld.w      	r14, (r0, 0x10)
9002e580:	8d30      	ld.w      	r13, (r0, 0xc)
9002e582:	8c20      	ld.w      	r12, (r0, 0x8)
9002e584:	8b10      	ld.w      	r11, (r0, 0x4)
9002e586:	8a00      	ld.w      	r10, (r0, 0x0)
9002e588:	2170      	addi      	r0, r0, 24
9002e58a:	00cf      	jmp      	r15
9002e58c:	f7ff      	br      	0x9002e58c	// 0x9002e58c
9002e58e:	f7ff      	br      	0x9002e58e	// 0x9002e58e
9002e590:	0230      	movt      	r0, r3
9002e592:	0000      	bkpt
9002e594:	1100      	mfcr      	r0, cr16
9002e596:	9008      	st.w      	r0, (r8, 0x0)
9002e598:	768c      	lrw      	r6, 0x7f433284	// 0x9002e7c8
9002e59a:	9047      	st.w      	r0, (r7, 0x10)
9002e59c:	200c      	addi      	r12, r12, 1
9002e59e:	9038      	st.w      	r0, (r8, 0xc)
9002e5a0:	11dc      	mfcr      	r12, cr29
9002e5a2:	9008      	st.w      	r0, (r8, 0x0)
9002e5a4:	8e9c      	ld.w      	r14, (r12, 0x24)
9002e5a6:	904b      	st.w      	r0, (r11, 0x10)
9002e5a8:	2fa0      	andi      	r0, r0, 26
9002e5aa:	900d      	st.w      	r0, (r13, 0x0)
9002e5ac:	aea0      	ld.b      	r14, (r0, 0xa)
9002e5ae:	904d      	st.w      	r0, (r13, 0x10)
