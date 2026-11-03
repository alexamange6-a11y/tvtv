
/workspace/tvtv/inputs/firmware/original_firmware.bin:     file format binary


Disassembly of section .data:

001005cc <.data+0x5cc>:
  1005cc:	7546      	lrw      	r5, 0x93f60000	// 0x1006e4
  1005ce:	7746      	lrw      	r7, 0xa0302000	// 0x1006e8
  1005d0:	7647      	lrw      	r6, 0x8420c002	// 0x1006ec
  1005d2:	9607      	st.w      	r6, (r7, 0x0)
  1005d4:	8607      	ld.w      	r6, (r7, 0x0)
  1005d6:	3506      	bseti      	r6, r6, 16
  1005d8:	9607      	st.w      	r6, (r7, 0x0)
  1005da:	8607      	ld.w      	r6, (r7, 0x0)
  1005dc:	30a6      	bclri      	r6, r6, 10
  1005de:	9607      	st.w      	r6, (r7, 0x0)
  1005e0:	8607      	ld.w      	r6, (r7, 0x0)
  1005e2:	3516      	bseti      	r6, r6, 17
  1005e4:	9607      	st.w      	r6, (r7, 0x0)
  1005e6:	7642      	lrw      	r6, 0x3000000	// 0x1006f0
  1005e8:	9627      	st.w      	r6, (r7, 0x8)
  1005ea:	8607      	ld.w      	r6, (r7, 0x0)
  1005ec:	34c6      	bseti      	r6, r6, 12
  1005ee:	9607      	st.w      	r6, (r7, 0x0)
  1005f0:	763e      	lrw      	r6, 0xa0302000	// 0x1006e8
  1005f2:	8417      	ld.w      	r4, (r7, 0x4)
  1005f4:	2e14      	andi      	r4, r4, 1
  1005f6:	2a04      	cmpnei      	r4, 0
  1005f8:	effb      	bf      	0x1005f0	// 0x1005f0
  1005fa:	8706      	ld.w      	r7, (r6, 0x0)
  1005fc:	30c7      	bclri      	r7, r7, 12
  1005fe:	9706      	st.w      	r7, (r6, 0x0)
  100600:	2c07      	bmaski      	r7, 0
  100602:	9726      	st.w      	r7, (r6, 0x8)
  100604:	8706      	ld.w      	r7, (r6, 0x0)
  100606:	34c7      	bseti      	r7, r7, 12
  100608:	9706      	st.w      	r7, (r6, 0x0)
  10060a:	7737      	lrw      	r7, 0xa0302000	// 0x1006e8
  10060c:	8416      	ld.w      	r4, (r6, 0x4)
  10060e:	2e14      	andi      	r4, r4, 1
  100610:	2a04      	cmpnei      	r4, 0
  100612:	effb      	bf      	0x10060a	// 0x10060a
  100614:	8607      	ld.w      	r6, (r7, 0x0)
  100616:	30c6      	bclri      	r6, r6, 12
  100618:	9607      	st.w      	r6, (r7, 0x0)
  10061a:	8437      	ld.w      	r4, (r7, 0xc)
  10061c:	8607      	ld.w      	r6, (r7, 0x0)
  10061e:	3116      	bclri      	r6, r6, 17
  100620:	9607      	st.w      	r6, (r7, 0x0)
  100622:	8607      	ld.w      	r6, (r7, 0x0)
  100624:	3516      	bseti      	r6, r6, 17
  100626:	9607      	st.w      	r6, (r7, 0x0)
  100628:	7633      	lrw      	r6, 0xaa55aa55	// 0x1006f4
  10062a:	0f64      	cmpne      	r4, r6
  10062c:	e820      	bf      	0x10066e	// 0x10066e
  10062e:	8607      	ld.w      	r6, (r7, 0x0)
  100630:	30e6      	bclri      	r6, r6, 14
  100632:	30f6      	bclri      	r6, r6, 15
  100634:	9607      	st.w      	r6, (r7, 0x0)
  100636:	6036      	movi      	r6, 3
  100638:	9627      	st.w      	r6, (r7, 0x8)
  10063a:	8607      	ld.w      	r6, (r7, 0x0)
  10063c:	34c6      	bseti      	r6, r6, 12
  10063e:	9607      	st.w      	r6, (r7, 0x0)
  100640:	762a      	lrw      	r6, 0xa0302000	// 0x1006e8
  100642:	8417      	ld.w      	r4, (r7, 0x4)
  100644:	2e14      	andi      	r4, r4, 1
  100646:	2a04      	cmpnei      	r4, 0
  100648:	effb      	bf      	0x100640	// 0x100640
  10064a:	8706      	ld.w      	r7, (r6, 0x0)
  10064c:	30c7      	bclri      	r7, r7, 12
  10064e:	9706      	st.w      	r7, (r6, 0x0)
  100650:	8706      	ld.w      	r7, (r6, 0x0)
  100652:	34e7      	bseti      	r7, r7, 14
  100654:	34f7      	bseti      	r7, r7, 15
  100656:	9706      	st.w      	r7, (r6, 0x0)
  100658:	32d7      	bgeni      	r7, 13
  10065a:	9726      	st.w      	r7, (r6, 0x8)
  10065c:	8706      	ld.w      	r7, (r6, 0x0)
  10065e:	34c7      	bseti      	r7, r7, 12
  100660:	9706      	st.w      	r7, (r6, 0x0)
  100662:	7421      	lrw      	r4, 0xa0302000	// 0x1006e8
  100664:	8716      	ld.w      	r7, (r6, 0x4)
  100666:	2e17      	andi      	r7, r7, 1
  100668:	2a07      	cmpnei      	r7, 0
  10066a:	effb      	bf      	0x100662	// 0x100662
  10066c:	f00e      	br      	0x10068a	// 0x10068a
  10066e:	8607      	ld.w      	r6, (r7, 0x0)
  100670:	34e6      	bseti      	r6, r6, 14
  100672:	34f6      	bseti      	r6, r6, 15
  100674:	9607      	st.w      	r6, (r7, 0x0)
  100676:	7620      	lrw      	r6, 0x3002000	// 0x1006f8
  100678:	9627      	st.w      	r6, (r7, 0x8)
  10067a:	8607      	ld.w      	r6, (r7, 0x0)
  10067c:	34c6      	bseti      	r6, r6, 12
  10067e:	9607      	st.w      	r6, (r7, 0x0)
  100680:	741a      	lrw      	r4, 0xa0302000	// 0x1006e8
  100682:	8617      	ld.w      	r6, (r7, 0x4)
  100684:	2e16      	andi      	r6, r6, 1
  100686:	2a06      	cmpnei      	r6, 0
  100688:	effb      	bf      	0x100680	// 0x100680
  10068a:	8704      	ld.w      	r7, (r4, 0x0)
  10068c:	30c7      	bclri      	r7, r7, 12
  10068e:	9704      	st.w      	r7, (r4, 0x0)
  100690:	731b      	lrw      	r3, 0x93f7dffc	// 0x1006fc
  100692:	7615      	lrw      	r6, 0xa0302000	// 0x1006e8
  100694:	2c07      	bmaski      	r7, 0
  100696:	9726      	st.w      	r7, (r6, 0x8)
  100698:	8706      	ld.w      	r7, (r6, 0x0)
  10069a:	34c7      	bseti      	r7, r7, 12
  10069c:	9706      	st.w      	r7, (r6, 0x0)
  10069e:	7712      	lrw      	r7, 0xa0302000	// 0x1006e8
  1006a0:	8416      	ld.w      	r4, (r6, 0x4)
  1006a2:	2e14      	andi      	r4, r4, 1
  1006a4:	2a04      	cmpnei      	r4, 0
  1006a6:	effb      	bf      	0x10069e	// 0x10069e
  1006a8:	8407      	ld.w      	r4, (r7, 0x0)
  1006aa:	30c4      	bclri      	r4, r4, 12
  1006ac:	9407      	st.w      	r4, (r7, 0x0)
  1006ae:	8437      	ld.w      	r4, (r7, 0xc)
  1006b0:	1242      	mov      	r2, r4
  1006b2:	3f82      	lsri      	r2, r2, 24
  1006b4:	b205      	st.b      	r2, (r5, 0x0)
  1006b6:	1242      	mov      	r2, r4
  1006b8:	3f02      	lsri      	r2, r2, 16
  1006ba:	b215      	st.b      	r2, (r5, 0x1)
  1006bc:	1242      	mov      	r2, r4
  1006be:	3e82      	lsri      	r2, r2, 8
  1006c0:	b225      	st.b      	r2, (r5, 0x2)
  1006c2:	b435      	st.b      	r4, (r5, 0x3)
  1006c4:	0f35      	cmpne      	r5, r3
  1006c6:	e802      	bf      	0x1006cc	// 0x1006cc
  1006c8:	2035      	addi      	r5, r5, 4
  1006ca:	f7e4      	br      	0x100694	// 0x100694
  1006cc:	7608      	lrw      	r6, 0x8420c002	// 0x1006ec
  1006ce:	9607      	st.w      	r6, (r7, 0x0)
  1006d0:	8607      	ld.w      	r6, (r7, 0x0)
  1006d2:	3116      	bclri      	r6, r6, 17
  1006d4:	9607      	st.w      	r6, (r7, 0x0)
  1006d6:	8607      	ld.w      	r6, (r7, 0x0)
  1006d8:	3106      	bclri      	r6, r6, 16
  1006da:	9607      	st.w      	r6, (r7, 0x0)
  1006dc:	00cf      	jmp      	r15
  1006de:	f7ff      	br      	0x1006de	// 0x1006de
  1006e0:	f7ff      	br      	0x1006e0	// 0x1006e0
  1006e2:	1200      	mov      	r0, r0
  1006e4:	0000      	bkpt
  1006e6:	93f6      	st.w      	r3, (r6, 0x3c)
  1006e8:	2000      	addi      	r0, r0, 1
  1006ea:	a030      	ld.b      	r0, (r0, 0x3)
  1006ec:	c002      	ld.h      	r0, (r2, 0x0)
  1006ee:	8420      	ld.w      	r4, (r0, 0x8)
  1006f0:	0000      	bkpt
  1006f2:	0300      	mult      	r0, r0, r0
  1006f4:	aa55      	ld.b      	r10, (r5, 0x5)
  1006f6:	aa55      	ld.b      	r10, (r5, 0x5)
  1006f8:	2000      	addi      	r0, r0, 1
  1006fa:	0300      	mult      	r0, r0, r0
  1006fc:	dffc      	st.h      	r15, (r12, 0x1e)
  1006fe:	93f7      	st.w      	r3, (r7, 0x3c)
