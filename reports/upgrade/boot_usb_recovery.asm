
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f72360 <.data+0x14360>:
93f72360:	25f0      	subi      	r0, r0, 32
93f72362:	9800      	st.w      	r8, (r0, 0x0)
93f72364:	9910      	st.w      	r9, (r0, 0x4)
93f72366:	9a20      	st.w      	r10, (r0, 0x8)
93f72368:	9b30      	st.w      	r11, (r0, 0xc)
93f7236a:	9c40      	st.w      	r12, (r0, 0x10)
93f7236c:	9d50      	st.w      	r13, (r0, 0x14)
93f7236e:	9e60      	st.w      	r14, (r0, 0x18)
93f72370:	9f70      	st.w      	r15, (r0, 0x1c)
93f72372:	25f0      	subi      	r0, r0, 32
93f72374:	7f62      	jsri      	0x93F6FE5C	// 0x93f6fe5c
93f72376:	37f2      	btsti      	r2, 31
93f72378:	e0b1      	bt      	0x93f724dc	// 0x93f724dc
93f7237a:	7f61      	jsri      	0x93F70ACC	// 0x93f70acc
93f7237c:	37f2      	btsti      	r2, 31
93f7237e:	e802      	bf      	0x93f72384	// 0x93f72384
93f72380:	7261      	lrw      	r2, 0x93f771cc	// 0x93f72504
93f72382:	f0ad      	br      	0x93f724de	// 0x93f724de
93f72384:	6002      	movi      	r2, 0
93f72386:	7f60      	jsri      	0x93F675B8	// 0x93f675b8
93f72388:	122b      	mov      	r11, r2
93f7238a:	7c60      	lrw      	r12, 0x93f75114	// 0x93f7250c
93f7238c:	2c0d      	bmaski      	r13, 0
93f7238e:	7e60      	lrw      	r14, 0x55e	// 0x93f72510
93f72390:	6002      	movi      	r2, 0
93f72392:	ff1a      	bsr      	0x93f721c8	// 0x93f721c8
93f72394:	920c      	st.w      	r2, (r12, 0x0)
93f72396:	0fd2      	cmpne      	r2, r13
93f72398:	e006      	bt      	0x93f723a6	// 0x93f723a6
93f7239a:	6642      	movi      	r2, 100
93f7239c:	7f5f      	jsri      	0x93F675E8	// 0x93f675e8
93f7239e:	12b2      	mov      	r2, r11
93f723a0:	7f5a      	jsri      	0x93F675B8	// 0x93f675b8
93f723a2:	0c2e      	cmphs      	r14, r2
93f723a4:	e7f5      	bt      	0x93f72390	// 0x93f72390
93f723a6:	6002      	movi      	r2, 0
93f723a8:	7f5d      	jsri      	0x93F71D20	// 0x93f71d20
93f723aa:	122b      	mov      	r11, r2
93f723ac:	2a02      	cmpnei      	r2, 0
93f723ae:	e002      	bt      	0x93f723b4	// 0x93f723b4
93f723b0:	725c      	lrw      	r2, 0x93f77204	// 0x93f72520
93f723b2:	f006      	br      	0x93f723c0	// 0x93f723c0
93f723b4:	3362      	bgeni      	r2, 22
93f723b6:	7f5b      	jsri      	0x93F63674	// 0x93f63674
93f723b8:	122c      	mov      	r12, r2
93f723ba:	2a02      	cmpnei      	r2, 0
93f723bc:	e003      	bt      	0x93f723c4	// 0x93f723c4
93f723be:	725a      	lrw      	r2, 0x93f79970	// 0x93f72528
93f723c0:	7f5b      	jsri      	0x93F638DC	// 0x93f638dc
93f723c2:	f089      	br      	0x93f724d6	// 0x93f724d6
93f723c4:	601e      	movi      	r14, 1
93f723c6:	2c0a      	bmaski      	r10, 0
93f723c8:	12b2      	mov      	r2, r11
93f723ca:	12e3      	mov      	r3, r14
93f723cc:	7f59      	jsri      	0x93F72D3C	// 0x93f72d3c
93f723ce:	122d      	mov      	r13, r2
93f723d0:	2a02      	cmpnei      	r2, 0
93f723d2:	e006      	bt      	0x93f723e0	// 0x93f723e0
93f723d4:	7258      	lrw      	r2, 0x93f79980	// 0x93f72534
93f723d6:	12c3      	mov      	r3, r12
93f723d8:	3364      	bgeni      	r4, 22
93f723da:	7f57      	jsri      	0x93F73888	// 0x93f73888
93f723dc:	0fa2      	cmpne      	r2, r10
93f723de:	e004      	bt      	0x93f723e8	// 0x93f723e8
93f723e0:	200e      	addi      	r14, r14, 1
93f723e2:	2abe      	cmpnei      	r14, 11
93f723e4:	e7f1      	bt      	0x93f723c8	// 0x93f723c8
93f723e6:	f077      	br      	0x93f724d6	// 0x93f724d6
93f723e8:	12d2      	mov      	r2, r13
93f723ea:	7f54      	jsri      	0x93F70464	// 0x93f70464
93f723ec:	9260      	st.w      	r2, (r0, 0x18)
93f723ee:	7f54      	jsri      	0x93F71194	// 0x93f71194
93f723f0:	9270      	st.w      	r2, (r0, 0x1c)
93f723f2:	120e      	mov      	r14, r0
93f723f4:	207e      	addi      	r14, r14, 8
93f723f6:	f006      	br      	0x93f72404	// 0x93f72404
93f723f8:	200d      	addi      	r13, r13, 1
93f723fa:	8260      	ld.w      	r2, (r0, 0x18)
93f723fc:	12d3      	mov      	r3, r13
93f723fe:	7f51      	jsri      	0x93F7031C	// 0x93f7031c
93f72400:	b20e      	st.b      	r2, (r14, 0x0)
93f72402:	200e      	addi      	r14, r14, 1
93f72404:	8670      	ld.w      	r6, (r0, 0x1c)
93f72406:	0c6d      	cmphs      	r13, r6
93f72408:	eff7      	bf      	0x93f723f8	// 0x93f723f8
93f7240a:	7f4f      	jsri      	0x93F6C210	// 0x93f6c210
93f7240c:	7f50      	jsri      	0x93F6A918	// 0x93f6a918
93f7240e:	7f50      	jsri      	0x93F6C358	// 0x93f6c358
93f72410:	7f51      	jsri      	0x93F6865C	// 0x93f6865c
93f72412:	7251      	lrw      	r2, 0x93f79990	// 0x93f72558
93f72414:	7f46      	jsri      	0x93F638DC	// 0x93f638dc
93f72416:	7851      	lrw      	r8, 0x7f8057a8	// 0x93f7255c
93f72418:	7952      	lrw      	r9, 0xbfbfa758	// 0x93f72560
93f7241a:	7a52      	lrw      	r10, 0xcc47df20	// 0x93f72564
93f7241c:	7b53      	lrw      	r11, 0xeb149f60	// 0x93f72568
93f7241e:	7d53      	lrw      	r13, 0x7f809768	// 0x93f7256c
93f72420:	7e54      	lrw      	r14, 0xbfbf5fa0	// 0x93f72570
93f72422:	6047      	movi      	r7, 4
93f72424:	9700      	st.w      	r7, (r0, 0x0)
93f72426:	6642      	movi      	r2, 100
93f72428:	7f3c      	jsri      	0x93F675E8	// 0x93f675e8
93f7242a:	7f52      	jsri      	0x93F670FC	// 0x93f670fc
93f7242c:	1202      	mov      	r2, r0
93f7242e:	2032      	addi      	r2, r2, 4
93f72430:	1203      	mov      	r3, r0
93f72432:	7f51      	jsri      	0x93F67044	// 0x93f67044
93f72434:	2a02      	cmpnei      	r2, 0
93f72436:	e7f5      	bt      	0x93f72422	// 0x93f72422
93f72438:	7251      	lrw      	r2, 0x93f799b4	// 0x93f7257c
93f7243a:	8310      	ld.w      	r3, (r0, 0x4)
93f7243c:	7f3c      	jsri      	0x93F638DC	// 0x93f638dc
93f7243e:	8710      	ld.w      	r7, (r0, 0x4)
93f72440:	0f87      	cmpne      	r7, r8
93f72442:	e8ba      	bf      	0x93f725b8	// 0x93f725b8
93f72444:	0f97      	cmpne      	r7, r9
93f72446:	e8b8      	bf      	0x93f725b8	// 0x93f725b8
93f72448:	0fa7      	cmpne      	r7, r10
93f7244a:	e8b6      	bf      	0x93f725b8	// 0x93f725b8
93f7244c:	0fb7      	cmpne      	r7, r11
93f7244e:	e8b4      	bf      	0x93f725b8	// 0x93f725b8
93f72450:	0fd7      	cmpne      	r7, r13
93f72452:	e8be      	bf      	0x93f725d0	// 0x93f725d0
93f72454:	0fe7      	cmpne      	r7, r14
93f72456:	e8bc      	bf      	0x93f725d0	// 0x93f725d0
93f72458:	764a      	lrw      	r6, 0xcc473fc0	// 0x93f72580
93f7245a:	0f67      	cmpne      	r7, r6
93f7245c:	e8b9      	bf      	0x93f725d0	// 0x93f725d0
93f7245e:	7649      	lrw      	r6, 0xeb1417e8	// 0x93f72584
93f72460:	0f67      	cmpne      	r7, r6
93f72462:	e7df      	bt      	0x93f72422	// 0x93f72422
93f72464:	f0b5      	br      	0x93f725d0	// 0x93f725d0
93f72466:	12e2      	mov      	r2, r14
93f72468:	3303      	bgeni      	r3, 16
93f7246a:	7f47      	jsri      	0x93F68514	// 0x93f68514
93f7246c:	12e2      	mov      	r2, r14
93f7246e:	12c3      	mov      	r3, r12
93f72470:	1ce3      	addu      	r3, r3, r14
93f72472:	3304      	bgeni      	r4, 16
93f72474:	7f46      	jsri      	0x93F68534	// 0x93f68534
93f72476:	12db      	mov      	r11, r13
93f72478:	12a1      	mov      	r1, r10
93f7247a:	2c1b      	divu      	r11, r11, r1
93f7247c:	7245      	lrw      	r2, 0x93f799c0	// 0x93f72590
93f7247e:	7345      	lrw      	r3, 0x93f79a2c	// 0x93f72594
93f72480:	7446      	lrw      	r4, 0x107	// 0x93f72598
93f72482:	12b5      	mov      	r5, r11
93f72484:	7f2a      	jsri      	0x93F638DC	// 0x93f638dc
93f72486:	12b2      	mov      	r2, r11
93f72488:	7f45      	jsri      	0x93F6CC48	// 0x93f6cc48
93f7248a:	3307      	bgeni      	r7, 16
93f7248c:	1c7e      	addu      	r14, r14, r7
93f7248e:	6646      	movi      	r6, 100
93f72490:	1c6d      	addu      	r13, r13, r6
93f72492:	0f9e      	cmpne      	r14, r9
93f72494:	e7e8      	bt      	0x93f72466	// 0x93f72466
93f72496:	7242      	lrw      	r2, 0x93f799dc	// 0x93f725a0
93f72498:	733f      	lrw      	r3, 0x93f79a2c	// 0x93f72594
93f7249a:	7442      	lrw      	r4, 0x10c	// 0x93f725a4
93f7249c:	7f24      	jsri      	0x93F638DC	// 0x93f638dc
93f7249e:	6642      	movi      	r2, 100
93f724a0:	7f3f      	jsri      	0x93F6CC48	// 0x93f6cc48
93f724a2:	7f41      	jsri      	0x93F6CC6C	// 0x93f6cc6c
93f724a4:	7f16      	jsri      	0x93F6FE5C	// 0x93f6fe5c
93f724a6:	600e      	movi      	r14, 0
93f724a8:	120c      	mov      	r12, r0
93f724aa:	207c      	addi      	r12, r12, 8
93f724ac:	f00c      	br      	0x93f724c6	// 0x93f724c6
93f724ae:	12ed      	mov      	r13, r14
93f724b0:	200d      	addi      	r13, r13, 1
93f724b2:	8260      	ld.w      	r2, (r0, 0x18)
93f724b4:	12d3      	mov      	r3, r13
93f724b6:	7f23      	jsri      	0x93F7031C	// 0x93f7031c
93f724b8:	1cce      	addu      	r14, r14, r12
93f724ba:	ae0e      	ld.b      	r14, (r14, 0x0)
93f724bc:	17e2      	xor      	r2, r2, r14
93f724be:	2e12      	andi      	r2, r2, 1
93f724c0:	2a02      	cmpnei      	r2, 0
93f724c2:	e005      	bt      	0x93f724ce	// 0x93f724ce
93f724c4:	12de      	mov      	r14, r13
93f724c6:	8770      	ld.w      	r7, (r0, 0x1c)
93f724c8:	0c7e      	cmphs      	r14, r7
93f724ca:	e07e      	bt      	0x93f725c8	// 0x93f725c8
93f724cc:	f7f0      	br      	0x93f724ae	// 0x93f724ae
93f724ce:	7237      	lrw      	r2, 0x93f799f8	// 0x93f725ac
93f724d0:	7f17      	jsri      	0x93F638DC	// 0x93f638dc
93f724d2:	7f37      	jsri      	0x93F60B4C	// 0x93f60b4c
93f724d4:	f07b      	br      	0x93f725cc	// 0x93f725cc
93f724d6:	7f09      	jsri      	0x93F6FE5C	// 0x93f6fe5c
93f724d8:	37f2      	btsti      	r2, 31
93f724da:	e802      	bf      	0x93f724e0	// 0x93f724e0
93f724dc:	7236      	lrw      	r2, 0x93f771b8	// 0x93f725b4
93f724de:	7f13      	jsri      	0x93F638DC	// 0x93f638dc
93f724e0:	2c02      	bmaski      	r2, 0
93f724e2:	21f0      	addi      	r0, r0, 32
93f724e4:	8f70      	ld.w      	r15, (r0, 0x1c)
93f724e6:	8e60      	ld.w      	r14, (r0, 0x18)
93f724e8:	8d50      	ld.w      	r13, (r0, 0x14)
93f724ea:	8c40      	ld.w      	r12, (r0, 0x10)
93f724ec:	8b30      	ld.w      	r11, (r0, 0xc)
93f724ee:	8a20      	ld.w      	r10, (r0, 0x8)
93f724f0:	8910      	ld.w      	r9, (r0, 0x4)
93f724f2:	8800      	ld.w      	r8, (r0, 0x0)
93f724f4:	21f0      	addi      	r0, r0, 32
93f724f6:	00cf      	jmp      	r15
93f724f8:	f7ff      	br      	0x93f724f8	// 0x93f724f8
93f724fa:	f7ff      	br      	0x93f724fa	// 0x93f724fa
93f724fc:	fe5c      	bsr      	0x93f721b6	// 0x93f721b6
93f724fe:	93f6      	st.w      	r3, (r6, 0x3c)
93f72500:	0acc      	movf      	r12, r12
93f72502:	93f7      	st.w      	r3, (r7, 0x3c)
93f72504:	71cc      	lrw      	r1, 0xe7f32a36	// 0x93f72834
93f72506:	93f7      	st.w      	r3, (r7, 0x3c)
93f72508:	75b8      	lrw      	r5, 0x2007e804	// 0x93f727e8
93f7250a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7250c:	5114      	stex      	r1, (r4, 0x1)
93f7250e:	93f7      	st.w      	r3, (r7, 0x3c)
93f72510:	055e      	subu      	r14, r14, r5
93f72512:	0000      	bkpt
93f72514:	21c8      	addi      	r8, r8, 29
93f72516:	93f7      	st.w      	r3, (r7, 0x3c)
93f72518:	75e8      	lrw      	r5, 0xf00760c7	// 0x93f728b8
93f7251a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7251c:	1d20      	ixh      	r0, r0, r2
93f7251e:	93f7      	st.w      	r3, (r7, 0x3c)
93f72520:	7204      	lrw      	r2, 0x93f72d3c	// 0x93f72530
93f72522:	93f7      	st.w      	r3, (r7, 0x3c)
93f72524:	3674      	btsti      	r4, 7
93f72526:	93f6      	st.w      	r3, (r6, 0x3c)
93f72528:	9970      	st.w      	r9, (r0, 0x1c)
93f7252a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7252c:	38dc      	rotli      	r12, r12, 13
93f7252e:	93f6      	st.w      	r3, (r6, 0x3c)
93f72530:	2d3c      	bmaski      	r12, 19
93f72532:	93f7      	st.w      	r3, (r7, 0x3c)
93f72534:	9980      	st.w      	r9, (r0, 0x20)
93f72536:	93f7      	st.w      	r3, (r7, 0x3c)
93f72538:	3888      	rotli      	r8, r8, 8
93f7253a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7253c:	0464      	mac      	r4, r6
93f7253e:	93f7      	st.w      	r3, (r7, 0x3c)
93f72540:	1194      	mfcr      	r4, cr25
93f72542:	93f7      	st.w      	r3, (r7, 0x3c)
93f72544:	031c      	mult      	r12, r12, r1
93f72546:	93f7      	st.w      	r3, (r7, 0x3c)
93f72548:	c210      	ld.h      	r2, (r0, 0x2)
93f7254a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7254c:	a918      	ld.b      	r9, (r8, 0x1)
93f7254e:	93f6      	st.w      	r3, (r6, 0x3c)
93f72550:	c358      	ld.h      	r3, (r8, 0xa)
93f72552:	93f6      	st.w      	r3, (r6, 0x3c)
93f72554:	865c      	ld.w      	r6, (r12, 0x14)
93f72556:	93f6      	st.w      	r3, (r6, 0x3c)
93f72558:	9990      	st.w      	r9, (r0, 0x24)
93f7255a:	93f7      	st.w      	r3, (r7, 0x3c)
93f7255c:	57a8      	stex      	r7, (r8, 0xa)
93f7255e:	7f80      	jsri      	0x20F08C00	// 0x20f08c00
93f72560:	a758      	ld.b      	r7, (r8, 0x5)
93f72562:	bfbf      	st.b      	r15, (r15, 0xb)
93f72564:	df20      	st.h      	r15, (r0, 0x4)
93f72566:	cc47      	ld.h      	r12, (r7, 0x8)
93f72568:	9f60      	st.w      	r15, (r0, 0x18)
93f7256a:	eb14      	bf      	0x93f72b94	// 0x93f72b94
93f7256c:	9768      	st.w      	r7, (r8, 0x18)
93f7256e:	7f80      	jsri      	0x9F002470	// 0x9f002470
93f72570:	5fa0      	stex      	r15, (r0, 0xa)
93f72572:	bfbf      	st.b      	r15, (r15, 0xb)
93f72574:	70fc      	jmpi      	0xF67E802	// 0xf67e802
93f72576:	93f6      	st.w      	r3, (r6, 0x3c)
93f72578:	7044      	jmpi      	0xF0053A2D	// 0xf0053a2d
93f7257a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7257c:	99b4      	st.w      	r9, (r4, 0x2c)
93f7257e:	93f7      	st.w      	r3, (r7, 0x3c)
93f72580:	3fc0      	lsri      	r0, r0, 28
93f72582:	cc47      	ld.h      	r12, (r7, 0x8)
93f72584:	17e8      	xor      	r8, r8, r14
93f72586:	eb14      	bf      	0x93f72bb0	// 0x93f72bb0
93f72588:	8514      	ld.w      	r5, (r4, 0x4)
93f7258a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7258c:	8534      	ld.w      	r5, (r4, 0xc)
93f7258e:	93f6      	st.w      	r3, (r6, 0x3c)
93f72590:	99c0      	st.w      	r9, (r0, 0x30)
93f72592:	93f7      	st.w      	r3, (r7, 0x3c)
93f72594:	9a2c      	st.w      	r10, (r12, 0x8)
93f72596:	93f7      	st.w      	r3, (r7, 0x3c)
93f72598:	0107      	xtrb3      	r1, r7
93f7259a:	0000      	bkpt
93f7259c:	cc48      	ld.h      	r12, (r8, 0x8)
93f7259e:	93f6      	st.w      	r3, (r6, 0x3c)
93f725a0:	99dc      	st.w      	r9, (r12, 0x34)
93f725a2:	93f7      	st.w      	r3, (r7, 0x3c)
93f725a4:	010c      	xtrb3      	r1, r12
93f725a6:	0000      	bkpt
93f725a8:	cc6c      	ld.h      	r12, (r12, 0xc)
93f725aa:	93f6      	st.w      	r3, (r6, 0x3c)
93f725ac:	99f8      	st.w      	r9, (r8, 0x3c)
93f725ae:	93f7      	st.w      	r3, (r7, 0x3c)
93f725b0:	0b4c      	lsr      	r12, r12, r4
93f725b2:	93f6      	st.w      	r3, (r6, 0x3c)
93f725b4:	71b8      	lrw      	r1, 0x6207860d	// 0x93f72894
93f725b6:	93f7      	st.w      	r3, (r7, 0x3c)
93f725b8:	7f0b      	jsri      	0x93F6CA7C	// 0x93f6ca7c
93f725ba:	6002      	movi      	r2, 0
93f725bc:	7f0b      	jsri      	0x93F6CC48	// 0x93f6cc48
93f725be:	600d      	movi      	r13, 0
93f725c0:	331e      	bgeni      	r14, 17
93f725c2:	63da      	movi      	r10, 61
93f725c4:	790a      	lrw      	r9, 0x3f0000	// 0x93f725ec
93f725c6:	f74f      	br      	0x93f72466	// 0x93f72466
93f725c8:	720a      	lrw      	r2, 0x93f79a04	// 0x93f725f0
93f725ca:	7f0a      	jsri      	0x93F638DC	// 0x93f638dc
93f725cc:	600d      	movi      	r13, 0
93f725ce:	f77a      	br      	0x93f724c4	// 0x93f724c4
93f725d0:	6322      	movi      	r2, 50
93f725d2:	7309      	lrw      	r3, 0x8c	// 0x93f725f8
93f725d4:	6104      	movi      	r4, 16
93f725d6:	6145      	movi      	r5, 20
93f725d8:	7f09      	jsri      	0x93F6C238	// 0x93f6c238
93f725da:	7f09      	jsri      	0x93F6FE5C	// 0x93f6fe5c
93f725dc:	f781      	br      	0x93f724e0	// 0x93f724e0
93f725de:	f7ff      	br      	0x93f725de	// 0x93f725de
93f725e0:	f7ff      	br      	0x93f725e0	// 0x93f725e0
93f725e2:	1200      	mov      	r0, r0
93f725e4:	ca7c      	ld.h      	r10, (r12, 0xe)
93f725e6:	93f6      	st.w      	r3, (r6, 0x3c)
93f725e8:	cc48      	ld.h      	r12, (r8, 0x8)
93f725ea:	93f6      	st.w      	r3, (r6, 0x3c)
93f725ec:	0000      	bkpt
93f725ee:	003f      	mvcv      	r15
93f725f0:	9a04      	st.w      	r10, (r4, 0x0)
93f725f2:	93f7      	st.w      	r3, (r7, 0x3c)
93f725f4:	38dc      	rotli      	r12, r12, 13
93f725f6:	93f6      	st.w      	r3, (r6, 0x3c)
93f725f8:	008c      	dect      	r12, r12, 1
93f725fa:	0000      	bkpt
93f725fc:	c238      	ld.h      	r2, (r8, 0x6)
93f725fe:	93f6      	st.w      	r3, (r6, 0x3c)
93f72600:	fe5c      	bsr      	0x93f722ba	// 0x93f722ba
93f72602:	93f6      	st.w      	r3, (r6, 0x3c)
