
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

93f60400 <.data+0x2400>:
93f60400:	24f0      	subi      	r0, r0, 16
93f60402:	9d00      	st.w      	r13, (r0, 0x0)
93f60404:	9e10      	st.w      	r14, (r0, 0x4)
93f60406:	9f20      	st.w      	r15, (r0, 0x8)
93f60408:	2470      	subi      	r0, r0, 8
93f6040a:	7221      	lrw      	r2, 0x93f79d40	// 0x93f60490
93f6040c:	6003      	movi      	r3, 0
93f6040e:	7421      	lrw      	r4, 0x93fb6aa0	// 0x93f60494
93f60410:	0524      	subu      	r4, r4, r2
93f60412:	7f21      	jsri      	0x93F63D64	// 0x93f63d64
93f60414:	7f22      	jsri      	0x93F60AD0	// 0x93f60ad0
93f60416:	7f22      	jsri      	0x93F677DC	// 0x93f677dc
93f60418:	7f23      	jsri      	0x93F68684	// 0x93f68684
93f6041a:	122d      	mov      	r13, r2
93f6041c:	1202      	mov      	r2, r0
93f6041e:	7f22      	jsri      	0x93F68740	// 0x93f68740
93f60420:	7223      	lrw      	r2, 0x93f751c8	// 0x93f604ac
93f60422:	7f23      	jsri      	0x93F638DC	// 0x93f638dc
93f60424:	7224      	lrw      	r2, 0x93f751e8	// 0x93f604b4
93f60426:	7324      	lrw      	r3, 0x93f751fc	// 0x93f604b8
93f60428:	7f22      	jsri      	0x93F638DC	// 0x93f638dc
93f6042a:	7224      	lrw      	r2, 0x93f75204	// 0x93f604bc
93f6042c:	7325      	lrw      	r3, 0x93f75218	// 0x93f604c0
93f6042e:	7f20      	jsri      	0x93F638DC	// 0x93f638dc
93f60430:	7225      	lrw      	r2, 0x93f75220	// 0x93f604c4
93f60432:	7325      	lrw      	r3, 0x93f75234	// 0x93f604c8
93f60434:	7f1f      	jsri      	0x93F638DC	// 0x93f638dc
93f60436:	7225      	lrw      	r2, 0x93f7523c	// 0x93f604cc
93f60438:	6403      	movi      	r3, 64
93f6043a:	7f1d      	jsri      	0x93F638DC	// 0x93f638dc
93f6043c:	600e      	movi      	r14, 0
93f6043e:	1207      	mov      	r7, r0
93f60440:	1ce7      	addu      	r7, r7, r14
93f60442:	a707      	ld.b      	r7, (r7, 0x0)
93f60444:	2a17      	cmpnei      	r7, 1
93f60446:	e00b      	bt      	0x93f6045e	// 0x93f6045e
93f60448:	12e2      	mov      	r2, r14
93f6044a:	7f21      	jsri      	0x93F686B8	// 0x93f686b8
93f6044c:	7f22      	jsri      	0x93F685F0	// 0x93f685f0
93f6044e:	1223      	mov      	r3, r2
93f60450:	7222      	lrw      	r2, 0x93f75254	// 0x93f604d8
93f60452:	7f17      	jsri      	0x93F638DC	// 0x93f638dc
93f60454:	7f22      	jsri      	0x93F68610	// 0x93f68610
93f60456:	1223      	mov      	r3, r2
93f60458:	3f43      	lsri      	r3, r3, 20
93f6045a:	7221      	lrw      	r2, 0x93f75268	// 0x93f604e0
93f6045c:	7f15      	jsri      	0x93F638DC	// 0x93f638dc
93f6045e:	200e      	addi      	r14, r14, 1
93f60460:	2a3e      	cmpnei      	r14, 3
93f60462:	e7ed      	bt      	0x93f6043e	// 0x93f6043e
93f60464:	7f20      	jsri      	0x93F67718	// 0x93f67718
93f60466:	12d2      	mov      	r2, r13
93f60468:	7f1a      	jsri      	0x93F686B8	// 0x93f686b8
93f6046a:	7f1f      	jsri      	0x93F674C8	// 0x93f674c8
93f6046c:	7720      	lrw      	r7, 0x93f7af78	// 0x93f604ec
93f6046e:	9207      	st.w      	r2, (r7, 0x0)
93f60470:	7720      	lrw      	r7, 0x93f7b584	// 0x93f604f0
93f60472:	8227      	ld.w      	r2, (r7, 0x8)
93f60474:	2a02      	cmpnei      	r2, 0
93f60476:	e801      	bf      	0x93f6047a	// 0x93f6047a
93f60478:	00d2      	jsr      	r2
93f6047a:	7f1e      	jsri      	0x93F6276C	// 0x93f6276c
93f6047c:	7f1f      	jsri      	0x93F62BD0	// 0x93f62bd0
93f6047e:	6002      	movi      	r2, 0
93f60480:	2070      	addi      	r0, r0, 8
93f60482:	8f20      	ld.w      	r15, (r0, 0x8)
93f60484:	8e10      	ld.w      	r14, (r0, 0x4)
93f60486:	8d00      	ld.w      	r13, (r0, 0x0)
93f60488:	20f0      	addi      	r0, r0, 16
93f6048a:	00cf      	jmp      	r15
93f6048c:	f7ff      	br      	0x93f6048c	// 0x93f6048c
93f6048e:	f7ff      	br      	0x93f6048e	// 0x93f6048e
