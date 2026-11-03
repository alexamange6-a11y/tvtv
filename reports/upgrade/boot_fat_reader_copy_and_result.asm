
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f735c4 <.data+0x155c4>:
93f735c4:	034c      	mult      	r12, r12, r4
93f735c6:	1c5e      	addu      	r14, r14, r5
93f735c8:	12cb      	mov      	r11, r12
93f735ca:	62ca      	movi      	r10, 44
93f735cc:	1c0a      	addu      	r10, r10, r0
93f735ce:	6018      	movi      	r8, 1
93f735d0:	6209      	movi      	r9, 32
93f735d2:	12e3      	mov      	r3, r14
93f735d4:	f00e      	br      	0x93f735f2	// 0x93f735f2
93f735d6:	12a2      	mov      	r2, r10
93f735d8:	7f59      	jsri      	0x93F72664	// 0x93f72664
93f735da:	1223      	mov      	r3, r2
93f735dc:	0c28      	cmphs      	r8, r2
93f735de:	e092      	bt      	0x93f73704	// 0x93f73704
93f735e0:	871a      	ld.w      	r7, (r10, 0x4)
93f735e2:	0f97      	cmpne      	r7, r9
93f735e4:	e802      	bf      	0x93f735ea	// 0x93f735ea
93f735e6:	7756      	lrw      	r7, 0xfff0	// 0x93f73740
93f735e8:	f001      	br      	0x93f735ec	// 0x93f735ec
93f735ea:	7756      	lrw      	r7, 0xffffff0	// 0x93f73744
93f735ec:	0c73      	cmphs      	r3, r7
93f735ee:	e08a      	bt      	0x93f73704	// 0x93f73704
93f735f0:	1ccb      	addu      	r11, r11, r12
93f735f2:	7750      	lrw      	r7, 0xaa8	// 0x93f73734
93f735f4:	1c07      	addu      	r7, r7, r0
93f735f6:	8707      	ld.w      	r7, (r7, 0x0)
93f735f8:	0cb7      	cmphs      	r7, r11
93f735fa:	e7ed      	bt      	0x93f735d6	// 0x93f735d6
93f735fc:	123e      	mov      	r14, r3
93f735fe:	7252      	lrw      	r2, 0xaac	// 0x93f73748
93f73600:	1c02      	addu      	r2, r2, r0
93f73602:	8802      	ld.w      	r8, (r2, 0x0)
93f73604:	05cb      	subu      	r11, r11, r12
93f73606:	05bd      	subu      	r13, r13, r11
93f73608:	147b      	rsub      	r11, r11, r7
93f7360a:	2a0b      	cmpnei      	r11, 0
93f7360c:	e82c      	bf      	0x93f73666	// 0x93f73666
93f7360e:	0ccd      	cmphs      	r13, r12
93f73610:	02c9      	movt      	r9, r12
93f73612:	0ad9      	movf      	r9, r13
93f73614:	62ca      	movi      	r10, 44
93f73616:	1c0a      	addu      	r10, r10, r0
93f73618:	784d      	lrw      	r8, 0x93fa6aa0	// 0x93f7374c
93f7361a:	12a2      	mov      	r2, r10
93f7361c:	1284      	mov      	r4, r8
93f7361e:	1295      	mov      	r5, r9
93f73620:	7f4c      	jsri      	0x93F729D8	// 0x93f729d8
93f73622:	2a02      	cmpnei      	r2, 0
93f73624:	e053      	bt      	0x93f736cc	// 0x93f736cc
93f73626:	059d      	subu      	r13, r13, r9
93f73628:	05b9      	subu      	r9, r9, r11
93f7362a:	7547      	lrw      	r5, 0xaac	// 0x93f73748
93f7362c:	1c05      	addu      	r5, r5, r0
93f7362e:	8205      	ld.w      	r2, (r5, 0x0)
93f73630:	1283      	mov      	r3, r8
93f73632:	1cb3      	addu      	r3, r3, r11
93f73634:	1294      	mov      	r4, r9
93f73636:	7f47      	jsri      	0x93F63DE4	// 0x93f63de4
93f73638:	2a0d      	cmpnei      	r13, 0
93f7363a:	e867      	bf      	0x93f7370a	// 0x93f7370a
93f7363c:	12a2      	mov      	r2, r10
93f7363e:	12e3      	mov      	r3, r14
93f73640:	7f3f      	jsri      	0x93F72664	// 0x93f72664
93f73642:	122e      	mov      	r14, r2
93f73644:	6017      	movi      	r7, 1
93f73646:	0c27      	cmphs      	r7, r2
93f73648:	e060      	bt      	0x93f7370a	// 0x93f7370a
93f7364a:	861a      	ld.w      	r6, (r10, 0x4)
93f7364c:	6207      	movi      	r7, 32
93f7364e:	0f76      	cmpne      	r6, r7
93f73650:	e802      	bf      	0x93f73656	// 0x93f73656
93f73652:	773b      	lrw      	r7, 0xfff0	// 0x93f73740
93f73654:	f001      	br      	0x93f73658	// 0x93f73658
93f73656:	773b      	lrw      	r7, 0xffffff0	// 0x93f73744
93f73658:	0c7e      	cmphs      	r14, r7
93f7365a:	e057      	bt      	0x93f7370a	// 0x93f7370a
93f7365c:	763b      	lrw      	r6, 0xaac	// 0x93f73748
93f7365e:	1c06      	addu      	r6, r6, r0
93f73660:	8806      	ld.w      	r8, (r6, 0x0)
93f73662:	1c98      	addu      	r8, r8, r9
93f73664:	f001      	br      	0x93f73668	// 0x93f73668
93f73666:	12b9      	mov      	r9, r11
93f73668:	12cb      	mov      	r11, r12
93f7366a:	12e7      	mov      	r7, r14
93f7366c:	62ca      	movi      	r10, 44
93f7366e:	1c0a      	addu      	r10, r10, r0
93f73670:	f01b      	br      	0x93f736a8	// 0x93f736a8
93f73672:	12a2      	mov      	r2, r10
93f73674:	12e3      	mov      	r3, r14
93f73676:	7438      	lrw      	r4, 0xac4	// 0x93f73758
93f73678:	1c04      	addu      	r4, r4, r0
93f7367a:	9704      	st.w      	r7, (r4, 0x0)
93f7367c:	7f30      	jsri      	0x93F72664	// 0x93f72664
93f7367e:	1226      	mov      	r6, r2
93f73680:	2406      	subi      	r6, r6, 1
93f73682:	0fe6      	cmpne      	r6, r14
93f73684:	7635      	lrw      	r6, 0xac4	// 0x93f73758
93f73686:	1c06      	addu      	r6, r6, r0
93f73688:	8706      	ld.w      	r7, (r6, 0x0)
93f7368a:	e019      	bt      	0x93f736be	// 0x93f736be
93f7368c:	601f      	movi      	r15, 1
93f7368e:	0c2f      	cmphs      	r15, r2
93f73690:	e03c      	bt      	0x93f7370a	// 0x93f7370a
93f73692:	861a      	ld.w      	r6, (r10, 0x4)
93f73694:	6203      	movi      	r3, 32
93f73696:	0f36      	cmpne      	r6, r3
93f73698:	e802      	bf      	0x93f7369e	// 0x93f7369e
93f7369a:	7629      	lrw      	r6, 0xfff0	// 0x93f73740
93f7369c:	f001      	br      	0x93f736a0	// 0x93f736a0
93f7369e:	7629      	lrw      	r6, 0xffffff0	// 0x93f73744
93f736a0:	0c62      	cmphs      	r2, r6
93f736a2:	e033      	bt      	0x93f7370a	// 0x93f7370a
93f736a4:	1ccb      	addu      	r11, r11, r12
93f736a6:	122e      	mov      	r14, r2
93f736a8:	0cdb      	cmphs      	r11, r13
93f736aa:	efe3      	bf      	0x93f73672	// 0x93f73672
93f736ac:	12a2      	mov      	r2, r10
93f736ae:	1273      	mov      	r3, r7
93f736b0:	1284      	mov      	r4, r8
93f736b2:	12d5      	mov      	r5, r13
93f736b4:	7f27      	jsri      	0x93F729D8	// 0x93f729d8
93f736b6:	2a02      	cmpnei      	r2, 0
93f736b8:	e009      	bt      	0x93f736cc	// 0x93f736cc
93f736ba:	1cd9      	addu      	r9, r9, r13
93f736bc:	f026      	br      	0x93f7370a	// 0x93f7370a
93f736be:	12a2      	mov      	r2, r10
93f736c0:	1273      	mov      	r3, r7
93f736c2:	1284      	mov      	r4, r8
93f736c4:	12b5      	mov      	r5, r11
93f736c6:	7f22      	jsri      	0x93F729D8	// 0x93f729d8
93f736c8:	2a02      	cmpnei      	r2, 0
93f736ca:	e803      	bf      	0x93f736d2	// 0x93f736d2
93f736cc:	7224      	lrw      	r2, 0x93f79b24	// 0x93f7375c
93f736ce:	7f24      	jsri      	0x93F638DC	// 0x93f638dc
93f736d0:	f01b      	br      	0x93f73708	// 0x93f73708
93f736d2:	1cb9      	addu      	r9, r9, r11
93f736d4:	12a2      	mov      	r2, r10
93f736d6:	12e3      	mov      	r3, r14
93f736d8:	7f19      	jsri      	0x93F72664	// 0x93f72664
93f736da:	1227      	mov      	r7, r2
93f736dc:	6014      	movi      	r4, 1
93f736de:	0c24      	cmphs      	r4, r2
93f736e0:	e00e      	bt      	0x93f736fe	// 0x93f736fe
93f736e2:	861a      	ld.w      	r6, (r10, 0x4)
93f736e4:	6205      	movi      	r5, 32
93f736e6:	0f56      	cmpne      	r6, r5
93f736e8:	e802      	bf      	0x93f736ee	// 0x93f736ee
93f736ea:	7615      	lrw      	r6, 0xfff0	// 0x93f73740
93f736ec:	f001      	br      	0x93f736f0	// 0x93f736f0
93f736ee:	7615      	lrw      	r6, 0xffffff0	// 0x93f73744
93f736f0:	0c67      	cmphs      	r7, r6
93f736f2:	e005      	bt      	0x93f736fe	// 0x93f736fe
93f736f4:	05bd      	subu      	r13, r13, r11
93f736f6:	1cb8      	addu      	r8, r8, r11
93f736f8:	12cb      	mov      	r11, r12
93f736fa:	1272      	mov      	r2, r7
93f736fc:	f7d4      	br      	0x93f736a6	// 0x93f736a6
93f736fe:	7219      	lrw      	r2, 0x93f79a8c	// 0x93f73764
93f73700:	7f18      	jsri      	0x93F638DC	// 0x93f638dc
93f73702:	f003      	br      	0x93f7370a	// 0x93f7370a
93f73704:	6009      	movi      	r9, 0
93f73706:	f001      	br      	0x93f7370a	// 0x93f7370a
93f73708:	2c09      	bmaski      	r9, 0
93f7370a:	82b0      	ld.w      	r2, (r0, 0x2c)
93f7370c:	7f17      	jsri      	0x93F636A0	// 0x93f636a0
93f7370e:	f001      	br      	0x93f73712	// 0x93f73712
93f73710:	2c09      	bmaski      	r9, 0
93f73712:	1292      	mov      	r2, r9
93f73714:	7116      	lrw      	r1, 0xac8	// 0x93f7376c
93f73716:	1c10      	addu      	r0, r0, r1
93f73718:	8f70      	ld.w      	r15, (r0, 0x1c)
93f7371a:	8e60      	ld.w      	r14, (r0, 0x18)
93f7371c:	8d50      	ld.w      	r13, (r0, 0x14)
93f7371e:	8c40      	ld.w      	r12, (r0, 0x10)
93f73720:	8b30      	ld.w      	r11, (r0, 0xc)
93f73722:	8a20      	ld.w      	r10, (r0, 0x8)
93f73724:	8910      	ld.w      	r9, (r0, 0x4)
93f73726:	8800      	ld.w      	r8, (r0, 0x0)
93f73728:	21f0      	addi      	r0, r0, 32
93f7372a:	00cf      	jmp      	r15
93f7372c:	f7ff      	br      	0x93f7372c	// 0x93f7372c
93f7372e:	f7ff      	br      	0x93f7372e	// 0x93f7372e
93f73730:	0ab0      	movf      	r0, r11
93f73732:	0000      	bkpt
93f73734:	0aa8      	movf      	r8, r10
93f73736:	0000      	bkpt
93f73738:	0abc      	movf      	r12, r11
93f7373a:	0000      	bkpt
93f7373c:	2664      	cpwgr      	r4, cpr6
93f7373e:	93f7      	st.w      	r3, (r7, 0x3c)
93f73740:	fff0      	bsr      	0x93f73722	// 0x93f73722
93f73742:	0000      	bkpt
93f73744:	fff0      	bsr      	0x93f73726	// 0x93f73726
93f73746:	0fff      	cmpne      	r15, r15
93f73748:	0aac      	movf      	r12, r10
93f7374a:	0000      	bkpt
93f7374c:	6aa0      	mulshs      	r0, r10
93f7374e:	93fa      	st.w      	r3, (r10, 0x3c)
93f73750:	29d8      	rsubi      	r8, r8, 29
93f73752:	93f7      	st.w      	r3, (r7, 0x3c)
93f73754:	3de4      	lsli      	r4, r4, 30
93f73756:	93f6      	st.w      	r3, (r6, 0x3c)
93f73758:	0ac4      	movf      	r4, r12
93f7375a:	0000      	bkpt
93f7375c:	9b24      	st.w      	r11, (r4, 0x8)
93f7375e:	93f7      	st.w      	r3, (r7, 0x3c)
93f73760:	38dc      	rotli      	r12, r12, 13
93f73762:	93f6      	st.w      	r3, (r6, 0x3c)
93f73764:	9a8c      	st.w      	r10, (r12, 0x20)
93f73766:	93f7      	st.w      	r3, (r7, 0x3c)
93f73768:	36a0      	btsti      	r0, 10
93f7376a:	93f6      	st.w      	r3, (r6, 0x3c)
93f7376c:	0ac8      	movf      	r8, r12
	...
