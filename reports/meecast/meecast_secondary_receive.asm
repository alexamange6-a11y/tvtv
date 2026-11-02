
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90013324 <.data+0x13324>:
90013324:	25f0      	subi      	r0, r0, 32
90013326:	9800      	st.w      	r8, (r0, 0x0)
90013328:	9910      	st.w      	r9, (r0, 0x4)
9001332a:	9a20      	st.w      	r10, (r0, 0x8)
9001332c:	9b30      	st.w      	r11, (r0, 0xc)
9001332e:	9c40      	st.w      	r12, (r0, 0x10)
90013330:	9d50      	st.w      	r13, (r0, 0x14)
90013332:	9e60      	st.w      	r14, (r0, 0x18)
90013334:	9f70      	st.w      	r15, (r0, 0x1c)
90013336:	7128      	lrw      	r1, 0x90	// 0x900133d8
90013338:	0510      	subu      	r0, r0, r1
9001333a:	120e      	mov      	r14, r0
9001333c:	207e      	addi      	r14, r14, 8
9001333e:	6015      	movi      	r5, 1
90013340:	9510      	st.w      	r5, (r0, 0x4)
90013342:	32e2      	bgeni      	r2, 14
90013344:	7f26      	jsri      	0x90081100	// 0x90081100
90013346:	122c      	mov      	r12, r2
90013348:	6206      	movi      	r6, 32
9001334a:	9600      	st.w      	r6, (r0, 0x0)
9001334c:	2c0a      	bmaski      	r10, 0
9001334e:	120b      	mov      	r11, r0
90013350:	203b      	addi      	r11, r11, 4
90013352:	12e9      	mov      	r9, r14
90013354:	7823      	lrw      	r8, 0xfffffc49	// 0x900133e0
90013356:	6642      	movi      	r2, 100
90013358:	7f23      	jsri      	0x900785B8	// 0x900785b8
9001335a:	7f23      	jsri      	0x900753EC	// 0x900753ec
9001335c:	2a02      	cmpnei      	r2, 0
9001335e:	effb      	bf      	0x90013356	// 0x90013356
90013360:	6642      	movi      	r2, 100
90013362:	7f20      	jsri      	0x900785B8	// 0x900785b8
90013364:	6022      	movi      	r2, 2
90013366:	1223      	mov      	r3, r2
90013368:	6004      	movi      	r4, 0
9001336a:	7f20      	jsri      	0x900DC4FC	// 0x900dc4fc
9001336c:	122d      	mov      	r13, r2
9001336e:	0fa2      	cmpne      	r2, r10
90013370:	eff2      	bf      	0x90013356	// 0x90013356
90013372:	2d03      	bmaski      	r3, 16
90013374:	6044      	movi      	r4, 4
90013376:	12b5      	mov      	r5, r11
90013378:	1246      	mov      	r6, r4
9001337a:	7f1d      	jsri      	0x900DCE9C	// 0x900dce9c
9001337c:	1292      	mov      	r2, r9
9001337e:	6003      	movi      	r3, 0
90013380:	6204      	movi      	r4, 32
90013382:	7f1c      	jsri      	0x9047768C	// 0x9047768c
90013384:	d81e      	st.h      	r8, (r14, 0x2)
90013386:	6025      	movi      	r5, 2
90013388:	b51e      	st.b      	r5, (r14, 0x1)
9001338a:	12d2      	mov      	r2, r13
9001338c:	12e3      	mov      	r3, r14
9001338e:	6204      	movi      	r4, 32
90013390:	7f1a      	jsri      	0x900DC7E4	// 0x900dc7e4
90013392:	12d2      	mov      	r2, r13
90013394:	12c3      	mov      	r3, r12
90013396:	32e4      	bgeni      	r4, 14
90013398:	6005      	movi      	r5, 0
9001339a:	12e6      	mov      	r6, r14
9001339c:	1207      	mov      	r7, r0
9001339e:	7f17      	jsri      	0x900DCC70	// 0x900dcc70
900133a0:	1227      	mov      	r7, r2
900133a2:	2202      	cmplti      	r2, 1
900133a4:	e012      	bt      	0x900133ca	// 0x900133ca
900133a6:	12c2      	mov      	r2, r12
900133a8:	7316      	lrw      	r3, 0x904bc4a0	// 0x90013400
900133aa:	7616      	lrw      	r6, 0x88	// 0x90013404
900133ac:	1c06      	addu      	r6, r6, r0
900133ae:	9706      	st.w      	r7, (r6, 0x0)
900133b0:	7f16      	jsri      	0x900D2FA0	// 0x900d2fa0
900133b2:	2a02      	cmpnei      	r2, 0
900133b4:	7614      	lrw      	r6, 0x88	// 0x90013404
900133b6:	1c06      	addu      	r6, r6, r0
900133b8:	8706      	ld.w      	r7, (r6, 0x0)
900133ba:	e7eb      	bt      	0x90013392	// 0x90013392
900133bc:	12c2      	mov      	r2, r12
900133be:	1273      	mov      	r3, r7
900133c0:	ff55      	bsr      	0x9001326c	// 0x9001326c
900133c2:	12d2      	mov      	r2, r13
900133c4:	12e3      	mov      	r3, r14
900133c6:	feb2      	bsr      	0x9001312c	// 0x9001312c
900133c8:	f7e4      	br      	0x90013392	// 0x90013392
900133ca:	2a02      	cmpnei      	r2, 0
900133cc:	efe2      	bf      	0x90013392	// 0x90013392
900133ce:	12d2      	mov      	r2, r13
900133d0:	7f11      	jsri      	0x900DB430	// 0x900db430
900133d2:	f7c1      	br      	0x90013356	// 0x90013356
900133d4:	f7ff      	br      	0x900133d4	// 0x900133d4
900133d6:	f7ff      	br      	0x900133d6	// 0x900133d6
900133d8:	0090      	decf      	r0, r0, 1
900133da:	0000      	bkpt
900133dc:	1100      	mfcr      	r0, cr16
900133de:	9008      	st.w      	r0, (r8, 0x0)
900133e0:	fc49      	bsr      	0x90012c74	// 0x90012c74
900133e2:	ffff      	bsr      	0x900133e2	// 0x900133e2
900133e4:	85b8      	ld.w      	r5, (r8, 0x2c)
900133e6:	9007      	st.w      	r0, (r7, 0x0)
900133e8:	53ec      	stex      	r3, (r12, 0xe)
900133ea:	9007      	st.w      	r0, (r7, 0x0)
900133ec:	c4fc      	ld.h      	r4, (r12, 0x1e)
900133ee:	900d      	st.w      	r0, (r13, 0x0)
900133f0:	ce9c      	ld.h      	r14, (r12, 0x12)
900133f2:	900d      	st.w      	r0, (r13, 0x0)
900133f4:	768c      	lrw      	r6, 0x92061c96	// 0x90013624
900133f6:	9047      	st.w      	r0, (r7, 0x10)
900133f8:	c7e4      	ld.h      	r7, (r4, 0x1c)
900133fa:	900d      	st.w      	r0, (r13, 0x0)
900133fc:	cc70      	ld.h      	r12, (r0, 0xe)
900133fe:	900d      	st.w      	r0, (r13, 0x0)
90013400:	c4a0      	ld.h      	r4, (r0, 0x14)
90013402:	904b      	st.w      	r0, (r11, 0x10)
90013404:	0088      	dect      	r8, r8, 1
	...
