
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

900ccbcc <.data+0xccbcc>:
900ccbcc:	2570      	subi      	r0, r0, 24
900ccbce:	9b00      	st.w      	r11, (r0, 0x0)
900ccbd0:	9c10      	st.w      	r12, (r0, 0x4)
900ccbd2:	9d20      	st.w      	r13, (r0, 0x8)
900ccbd4:	9e30      	st.w      	r14, (r0, 0xc)
900ccbd6:	9f40      	st.w      	r15, (r0, 0x10)
900ccbd8:	2470      	subi      	r0, r0, 8
900ccbda:	2a03      	cmpnei      	r3, 0
900ccbdc:	e97f      	bf      	0x900ccedc	// 0x900ccedc
900ccbde:	6015      	movi      	r5, 1
900ccbe0:	9500      	st.w      	r5, (r0, 0x0)
900ccbe2:	01f2      	not      	r2, r2
900ccbe4:	2a04      	cmpnei      	r4, 0
900ccbe6:	e96c      	bf      	0x900ccec0	// 0x900ccec0
900ccbe8:	1237      	mov      	r7, r3
900ccbea:	2e37      	andi      	r7, r7, 3
900ccbec:	2a07      	cmpnei      	r7, 0
900ccbee:	e812      	bf      	0x900ccc14	// 0x900ccc14
900ccbf0:	77ba      	lrw      	r7, 0x904d2b08	// 0x900cced8
900ccbf2:	a603      	ld.b      	r6, (r3, 0x0)
900ccbf4:	1726      	xor      	r6, r6, r2
900ccbf6:	2c8b      	bmaski      	r11, 8
900ccbf8:	16b6      	and      	r6, r6, r11
900ccbfa:	3c26      	lsli      	r6, r6, 2
900ccbfc:	1c76      	addu      	r6, r6, r7
900ccbfe:	8606      	ld.w      	r6, (r6, 0x0)
900ccc00:	3e82      	lsri      	r2, r2, 8
900ccc02:	1762      	xor      	r2, r2, r6
900ccc04:	2003      	addi      	r3, r3, 1
900ccc06:	2404      	subi      	r4, r4, 1
900ccc08:	2a04      	cmpnei      	r4, 0
900ccc0a:	e95a      	bf      	0x900ccec0	// 0x900ccec0
900ccc0c:	1236      	mov      	r6, r3
900ccc0e:	2e36      	andi      	r6, r6, 3
900ccc10:	2a06      	cmpnei      	r6, 0
900ccc12:	e7ef      	bt      	0x900ccbf2	// 0x900ccbf2
900ccc14:	123d      	mov      	r13, r3
900ccc16:	61fe      	movi      	r14, 31
900ccc18:	0c4e      	cmphs      	r14, r4
900ccc1a:	e10e      	bt      	0x900cce38	// 0x900cce38
900ccc1c:	124f      	mov      	r15, r4
900ccc1e:	1235      	mov      	r5, r3
900ccc20:	77ae      	lrw      	r7, 0x904d2b08	// 0x900cced8
900ccc22:	8d05      	ld.w      	r13, (r5, 0x0)
900ccc24:	172d      	xor      	r13, r13, r2
900ccc26:	011d      	xtrb2      	r1, r13
900ccc28:	1216      	mov      	r6, r1
900ccc2a:	3292      	bgeni      	r2, 9
900ccc2c:	1c26      	addu      	r6, r6, r2
900ccc2e:	3c26      	lsli      	r6, r6, 2
900ccc30:	1c76      	addu      	r6, r6, r7
900ccc32:	8c06      	ld.w      	r12, (r6, 0x0)
900ccc34:	012d      	xtrb1      	r1, r13
900ccc36:	1216      	mov      	r6, r1
900ccc38:	328b      	bgeni      	r11, 8
900ccc3a:	1cb6      	addu      	r6, r6, r11
900ccc3c:	3c26      	lsli      	r6, r6, 2
900ccc3e:	1c76      	addu      	r6, r6, r7
900ccc40:	8206      	ld.w      	r2, (r6, 0x0)
900ccc42:	2c86      	bmaski      	r6, 8
900ccc44:	16d6      	and      	r6, r6, r13
900ccc46:	328b      	bgeni      	r11, 8
900ccc48:	349b      	bseti      	r11, r11, 9
900ccc4a:	1cb6      	addu      	r6, r6, r11
900ccc4c:	3c26      	lsli      	r6, r6, 2
900ccc4e:	1c76      	addu      	r6, r6, r7
900ccc50:	3f8d      	lsri      	r13, r13, 24
900ccc52:	3c2d      	lsli      	r13, r13, 2
900ccc54:	1c7d      	addu      	r13, r13, r7
900ccc56:	8606      	ld.w      	r6, (r6, 0x0)
900ccc58:	8d0d      	ld.w      	r13, (r13, 0x0)
900ccc5a:	17d6      	xor      	r6, r6, r13
900ccc5c:	8d15      	ld.w      	r13, (r5, 0x4)
900ccc5e:	17d6      	xor      	r6, r6, r13
900ccc60:	17c6      	xor      	r6, r6, r12
900ccc62:	1726      	xor      	r6, r6, r2
900ccc64:	0116      	xtrb2      	r1, r6
900ccc66:	1212      	mov      	r2, r1
900ccc68:	329d      	bgeni      	r13, 9
900ccc6a:	1cd2      	addu      	r2, r2, r13
900ccc6c:	3c22      	lsli      	r2, r2, 2
900ccc6e:	1c72      	addu      	r2, r2, r7
900ccc70:	8b02      	ld.w      	r11, (r2, 0x0)
900ccc72:	0126      	xtrb1      	r1, r6
900ccc74:	1212      	mov      	r2, r1
900ccc76:	328d      	bgeni      	r13, 8
900ccc78:	1cd2      	addu      	r2, r2, r13
900ccc7a:	3c22      	lsli      	r2, r2, 2
900ccc7c:	1c72      	addu      	r2, r2, r7
900ccc7e:	8c02      	ld.w      	r12, (r2, 0x0)
900ccc80:	2c82      	bmaski      	r2, 8
900ccc82:	1662      	and      	r2, r2, r6
900ccc84:	328d      	bgeni      	r13, 8
900ccc86:	349d      	bseti      	r13, r13, 9
900ccc88:	1cd2      	addu      	r2, r2, r13
900ccc8a:	3c22      	lsli      	r2, r2, 2
900ccc8c:	1c72      	addu      	r2, r2, r7
900ccc8e:	126d      	mov      	r13, r6
900ccc90:	3f8d      	lsri      	r13, r13, 24
900ccc92:	3c2d      	lsli      	r13, r13, 2
900ccc94:	1c7d      	addu      	r13, r13, r7
900ccc96:	8602      	ld.w      	r6, (r2, 0x0)
900ccc98:	820d      	ld.w      	r2, (r13, 0x0)
900ccc9a:	1726      	xor      	r6, r6, r2
900ccc9c:	8225      	ld.w      	r2, (r5, 0x8)
900ccc9e:	1726      	xor      	r6, r6, r2
900ccca0:	17b6      	xor      	r6, r6, r11
900ccca2:	17c6      	xor      	r6, r6, r12
900ccca4:	0116      	xtrb2      	r1, r6
900ccca6:	1212      	mov      	r2, r1
900ccca8:	329b      	bgeni      	r11, 9
900cccaa:	1cb2      	addu      	r2, r2, r11
900cccac:	3c22      	lsli      	r2, r2, 2
900cccae:	1c72      	addu      	r2, r2, r7
900cccb0:	8b02      	ld.w      	r11, (r2, 0x0)
900cccb2:	0126      	xtrb1      	r1, r6
900cccb4:	1212      	mov      	r2, r1
900cccb6:	328d      	bgeni      	r13, 8
900cccb8:	1cd2      	addu      	r2, r2, r13
900cccba:	3c22      	lsli      	r2, r2, 2
900cccbc:	1c72      	addu      	r2, r2, r7
900cccbe:	8c02      	ld.w      	r12, (r2, 0x0)
900cccc0:	2c82      	bmaski      	r2, 8
900cccc2:	1662      	and      	r2, r2, r6
900cccc4:	328d      	bgeni      	r13, 8
900cccc6:	349d      	bseti      	r13, r13, 9
900cccc8:	1cd2      	addu      	r2, r2, r13
900cccca:	3c22      	lsli      	r2, r2, 2
900ccccc:	1c72      	addu      	r2, r2, r7
900cccce:	126d      	mov      	r13, r6
900cccd0:	3f8d      	lsri      	r13, r13, 24
900cccd2:	3c2d      	lsli      	r13, r13, 2
900cccd4:	1c7d      	addu      	r13, r13, r7
900cccd6:	8602      	ld.w      	r6, (r2, 0x0)
900cccd8:	820d      	ld.w      	r2, (r13, 0x0)
900cccda:	1726      	xor      	r6, r6, r2
900cccdc:	8235      	ld.w      	r2, (r5, 0xc)
900cccde:	1726      	xor      	r6, r6, r2
900ccce0:	17b6      	xor      	r6, r6, r11
900ccce2:	17c6      	xor      	r6, r6, r12
900ccce4:	0116      	xtrb2      	r1, r6
900ccce6:	1212      	mov      	r2, r1
900ccce8:	329b      	bgeni      	r11, 9
900cccea:	1cb2      	addu      	r2, r2, r11
900cccec:	3c22      	lsli      	r2, r2, 2
900cccee:	1c72      	addu      	r2, r2, r7
900cccf0:	8b02      	ld.w      	r11, (r2, 0x0)
900cccf2:	0126      	xtrb1      	r1, r6
900cccf4:	1212      	mov      	r2, r1
900cccf6:	328d      	bgeni      	r13, 8
900cccf8:	1cd2      	addu      	r2, r2, r13
900cccfa:	3c22      	lsli      	r2, r2, 2
900cccfc:	1c72      	addu      	r2, r2, r7
900cccfe:	8c02      	ld.w      	r12, (r2, 0x0)
900ccd00:	2c82      	bmaski      	r2, 8
900ccd02:	1662      	and      	r2, r2, r6
900ccd04:	328d      	bgeni      	r13, 8
900ccd06:	349d      	bseti      	r13, r13, 9
900ccd08:	1cd2      	addu      	r2, r2, r13
900ccd0a:	3c22      	lsli      	r2, r2, 2
900ccd0c:	1c72      	addu      	r2, r2, r7
900ccd0e:	126d      	mov      	r13, r6
900ccd10:	3f8d      	lsri      	r13, r13, 24
900ccd12:	3c2d      	lsli      	r13, r13, 2
900ccd14:	1c7d      	addu      	r13, r13, r7
900ccd16:	8602      	ld.w      	r6, (r2, 0x0)
900ccd18:	820d      	ld.w      	r2, (r13, 0x0)
900ccd1a:	1726      	xor      	r6, r6, r2
900ccd1c:	8245      	ld.w      	r2, (r5, 0x10)
900ccd1e:	1726      	xor      	r6, r6, r2
900ccd20:	17b6      	xor      	r6, r6, r11
900ccd22:	17c6      	xor      	r6, r6, r12
900ccd24:	0116      	xtrb2      	r1, r6
900ccd26:	1212      	mov      	r2, r1
900ccd28:	329b      	bgeni      	r11, 9
900ccd2a:	1cb2      	addu      	r2, r2, r11
900ccd2c:	3c22      	lsli      	r2, r2, 2
900ccd2e:	1c72      	addu      	r2, r2, r7
900ccd30:	8b02      	ld.w      	r11, (r2, 0x0)
900ccd32:	0126      	xtrb1      	r1, r6
900ccd34:	1212      	mov      	r2, r1
900ccd36:	328d      	bgeni      	r13, 8
900ccd38:	1cd2      	addu      	r2, r2, r13
900ccd3a:	3c22      	lsli      	r2, r2, 2
900ccd3c:	1c72      	addu      	r2, r2, r7
900ccd3e:	8c02      	ld.w      	r12, (r2, 0x0)
900ccd40:	2c82      	bmaski      	r2, 8
900ccd42:	1662      	and      	r2, r2, r6
900ccd44:	328d      	bgeni      	r13, 8
900ccd46:	349d      	bseti      	r13, r13, 9
900ccd48:	1cd2      	addu      	r2, r2, r13
900ccd4a:	3c22      	lsli      	r2, r2, 2
900ccd4c:	1c72      	addu      	r2, r2, r7
900ccd4e:	126d      	mov      	r13, r6
900ccd50:	3f8d      	lsri      	r13, r13, 24
900ccd52:	3c2d      	lsli      	r13, r13, 2
900ccd54:	1c7d      	addu      	r13, r13, r7
900ccd56:	8602      	ld.w      	r6, (r2, 0x0)
900ccd58:	820d      	ld.w      	r2, (r13, 0x0)
900ccd5a:	1726      	xor      	r6, r6, r2
900ccd5c:	8255      	ld.w      	r2, (r5, 0x14)
900ccd5e:	1726      	xor      	r6, r6, r2
900ccd60:	17b6      	xor      	r6, r6, r11
900ccd62:	17c6      	xor      	r6, r6, r12
900ccd64:	0116      	xtrb2      	r1, r6
900ccd66:	1212      	mov      	r2, r1
900ccd68:	329b      	bgeni      	r11, 9
900ccd6a:	1cb2      	addu      	r2, r2, r11
900ccd6c:	3c22      	lsli      	r2, r2, 2
900ccd6e:	1c72      	addu      	r2, r2, r7
900ccd70:	8b02      	ld.w      	r11, (r2, 0x0)
900ccd72:	0126      	xtrb1      	r1, r6
900ccd74:	1212      	mov      	r2, r1
900ccd76:	328d      	bgeni      	r13, 8
900ccd78:	1cd2      	addu      	r2, r2, r13
900ccd7a:	3c22      	lsli      	r2, r2, 2
900ccd7c:	1c72      	addu      	r2, r2, r7
900ccd7e:	8c02      	ld.w      	r12, (r2, 0x0)
900ccd80:	2c82      	bmaski      	r2, 8
900ccd82:	1662      	and      	r2, r2, r6
900ccd84:	328d      	bgeni      	r13, 8
900ccd86:	349d      	bseti      	r13, r13, 9
900ccd88:	1cd2      	addu      	r2, r2, r13
900ccd8a:	3c22      	lsli      	r2, r2, 2
900ccd8c:	1c72      	addu      	r2, r2, r7
900ccd8e:	126d      	mov      	r13, r6
900ccd90:	3f8d      	lsri      	r13, r13, 24
900ccd92:	3c2d      	lsli      	r13, r13, 2
900ccd94:	1c7d      	addu      	r13, r13, r7
900ccd96:	8602      	ld.w      	r6, (r2, 0x0)
900ccd98:	820d      	ld.w      	r2, (r13, 0x0)
900ccd9a:	1726      	xor      	r6, r6, r2
900ccd9c:	8265      	ld.w      	r2, (r5, 0x18)
900ccd9e:	1726      	xor      	r6, r6, r2
900ccda0:	17b6      	xor      	r6, r6, r11
900ccda2:	17c6      	xor      	r6, r6, r12
900ccda4:	0116      	xtrb2      	r1, r6
900ccda6:	1212      	mov      	r2, r1
900ccda8:	329b      	bgeni      	r11, 9
900ccdaa:	1cb2      	addu      	r2, r2, r11
900ccdac:	3c22      	lsli      	r2, r2, 2
900ccdae:	1c72      	addu      	r2, r2, r7
900ccdb0:	8b02      	ld.w      	r11, (r2, 0x0)
900ccdb2:	0126      	xtrb1      	r1, r6
900ccdb4:	1212      	mov      	r2, r1
900ccdb6:	328d      	bgeni      	r13, 8
900ccdb8:	1cd2      	addu      	r2, r2, r13
900ccdba:	3c22      	lsli      	r2, r2, 2
900ccdbc:	1c72      	addu      	r2, r2, r7
900ccdbe:	8c02      	ld.w      	r12, (r2, 0x0)
900ccdc0:	2c82      	bmaski      	r2, 8
900ccdc2:	1662      	and      	r2, r2, r6
900ccdc4:	328d      	bgeni      	r13, 8
900ccdc6:	349d      	bseti      	r13, r13, 9
900ccdc8:	1cd2      	addu      	r2, r2, r13
900ccdca:	3c22      	lsli      	r2, r2, 2
900ccdcc:	1c72      	addu      	r2, r2, r7
900ccdce:	126d      	mov      	r13, r6
900ccdd0:	3f8d      	lsri      	r13, r13, 24
900ccdd2:	3c2d      	lsli      	r13, r13, 2
900ccdd4:	1c7d      	addu      	r13, r13, r7
900ccdd6:	8602      	ld.w      	r6, (r2, 0x0)
900ccdd8:	820d      	ld.w      	r2, (r13, 0x0)
900ccdda:	1726      	xor      	r6, r6, r2
900ccddc:	8275      	ld.w      	r2, (r5, 0x1c)
900ccdde:	1726      	xor      	r6, r6, r2
900ccde0:	17b6      	xor      	r6, r6, r11
900ccde2:	17c6      	xor      	r6, r6, r12
900ccde4:	21f5      	addi      	r5, r5, 32
900ccde6:	0126      	xtrb1      	r1, r6
900ccde8:	1212      	mov      	r2, r1
900ccdea:	328b      	bgeni      	r11, 8
900ccdec:	1cb2      	addu      	r2, r2, r11
900ccdee:	3c22      	lsli      	r2, r2, 2
900ccdf0:	1c72      	addu      	r2, r2, r7
900ccdf2:	8c02      	ld.w      	r12, (r2, 0x0)
900ccdf4:	1262      	mov      	r2, r6
900ccdf6:	3f82      	lsri      	r2, r2, 24
900ccdf8:	3c22      	lsli      	r2, r2, 2
900ccdfa:	1c72      	addu      	r2, r2, r7
900ccdfc:	2c8d      	bmaski      	r13, 8
900ccdfe:	166d      	and      	r13, r13, r6
900cce00:	328b      	bgeni      	r11, 8
900cce02:	349b      	bseti      	r11, r11, 9
900cce04:	1cbd      	addu      	r13, r13, r11
900cce06:	3c2d      	lsli      	r13, r13, 2
900cce08:	1c7d      	addu      	r13, r13, r7
900cce0a:	8202      	ld.w      	r2, (r2, 0x0)
900cce0c:	8d0d      	ld.w      	r13, (r13, 0x0)
900cce0e:	17d2      	xor      	r2, r2, r13
900cce10:	0116      	xtrb2      	r1, r6
900cce12:	1216      	mov      	r6, r1
900cce14:	329d      	bgeni      	r13, 9
900cce16:	1cd6      	addu      	r6, r6, r13
900cce18:	3c26      	lsli      	r6, r6, 2
900cce1a:	1c76      	addu      	r6, r6, r7
900cce1c:	8606      	ld.w      	r6, (r6, 0x0)
900cce1e:	1762      	xor      	r2, r2, r6
900cce20:	17c2      	xor      	r2, r2, r12
900cce22:	25ff      	subi      	r15, r15, 32
900cce24:	0cfe      	cmphs      	r14, r15
900cce26:	eefd      	bf      	0x900ccc22	// 0x900ccc22
900cce28:	25f4      	subi      	r4, r4, 32
900cce2a:	61f5      	movi      	r5, 31
900cce2c:	01f5      	not      	r5, r5
900cce2e:	125d      	mov      	r13, r5
900cce30:	164d      	and      	r13, r13, r4
900cce32:	21fd      	addi      	r13, r13, 32
900cce34:	1c3d      	addu      	r13, r13, r3
900cce36:	2ff4      	andi      	r4, r4, 31
900cce38:	603c      	movi      	r12, 3
900cce3a:	0c4c      	cmphs      	r12, r4
900cce3c:	e031      	bt      	0x900ccea0	// 0x900ccea0
900cce3e:	600f      	movi      	r15, 0
900cce40:	7726      	lrw      	r7, 0x904d2b08	// 0x900cced8
900cce42:	12d6      	mov      	r6, r13
900cce44:	1cf6      	addu      	r6, r6, r15
900cce46:	8606      	ld.w      	r6, (r6, 0x0)
900cce48:	1726      	xor      	r6, r6, r2
900cce4a:	0126      	xtrb1      	r1, r6
900cce4c:	1215      	mov      	r5, r1
900cce4e:	328b      	bgeni      	r11, 8
900cce50:	1cb5      	addu      	r5, r5, r11
900cce52:	3c25      	lsli      	r5, r5, 2
900cce54:	1c75      	addu      	r5, r5, r7
900cce56:	8e05      	ld.w      	r14, (r5, 0x0)
900cce58:	1263      	mov      	r3, r6
900cce5a:	3f83      	lsri      	r3, r3, 24
900cce5c:	3c23      	lsli      	r3, r3, 2
900cce5e:	1c73      	addu      	r3, r3, r7
900cce60:	2c85      	bmaski      	r5, 8
900cce62:	1665      	and      	r5, r5, r6
900cce64:	3282      	bgeni      	r2, 8
900cce66:	3492      	bseti      	r2, r2, 9
900cce68:	1c25      	addu      	r5, r5, r2
900cce6a:	3c25      	lsli      	r5, r5, 2
900cce6c:	1c75      	addu      	r5, r5, r7
900cce6e:	8203      	ld.w      	r2, (r3, 0x0)
900cce70:	8505      	ld.w      	r5, (r5, 0x0)
900cce72:	1752      	xor      	r2, r2, r5
900cce74:	0116      	xtrb2      	r1, r6
900cce76:	1216      	mov      	r6, r1
900cce78:	3293      	bgeni      	r3, 9
900cce7a:	1c36      	addu      	r6, r6, r3
900cce7c:	3c26      	lsli      	r6, r6, 2
900cce7e:	1c76      	addu      	r6, r6, r7
900cce80:	8606      	ld.w      	r6, (r6, 0x0)
900cce82:	1762      	xor      	r2, r2, r6
900cce84:	17e2      	xor      	r2, r2, r14
900cce86:	203f      	addi      	r15, r15, 4
900cce88:	1246      	mov      	r6, r4
900cce8a:	05f6      	subu      	r6, r6, r15
900cce8c:	0c6c      	cmphs      	r12, r6
900cce8e:	efd9      	bf      	0x900cce42	// 0x900cce42
900cce90:	2434      	subi      	r4, r4, 4
900cce92:	6035      	movi      	r5, 3
900cce94:	01f5      	not      	r5, r5
900cce96:	1257      	mov      	r7, r5
900cce98:	1647      	and      	r7, r7, r4
900cce9a:	2037      	addi      	r7, r7, 4
900cce9c:	1c7d      	addu      	r13, r13, r7
900cce9e:	2e34      	andi      	r4, r4, 3
900ccea0:	2a04      	cmpnei      	r4, 0
900ccea2:	e80e      	bf      	0x900ccec0	// 0x900ccec0
900ccea4:	770d      	lrw      	r7, 0x904d2b08	// 0x900cced8
900ccea6:	a60d      	ld.b      	r6, (r13, 0x0)
900ccea8:	1726      	xor      	r6, r6, r2
900cceaa:	2c8b      	bmaski      	r11, 8
900cceac:	16b6      	and      	r6, r6, r11
900cceae:	3c26      	lsli      	r6, r6, 2
900cceb0:	1c76      	addu      	r6, r6, r7
900cceb2:	8606      	ld.w      	r6, (r6, 0x0)
900cceb4:	3e82      	lsri      	r2, r2, 8
900cceb6:	1762      	xor      	r2, r2, r6
900cceb8:	200d      	addi      	r13, r13, 1
900cceba:	2404      	subi      	r4, r4, 1
900ccebc:	2a04      	cmpnei      	r4, 0
900ccebe:	e7f3      	bt      	0x900ccea6	// 0x900ccea6
900ccec0:	01f2      	not      	r2, r2
900ccec2:	2070      	addi      	r0, r0, 8
900ccec4:	8f40      	ld.w      	r15, (r0, 0x10)
900ccec6:	8e30      	ld.w      	r14, (r0, 0xc)
900ccec8:	8d20      	ld.w      	r13, (r0, 0x8)
900cceca:	8c10      	ld.w      	r12, (r0, 0x4)
900ccecc:	8b00      	ld.w      	r11, (r0, 0x0)
900ccece:	2170      	addi      	r0, r0, 24
900cced0:	00cf      	jmp      	r15
900cced2:	f7ff      	br      	0x900cced2	// 0x900cced2
900cced4:	f7ff      	br      	0x900cced4	// 0x900cced4
900cced6:	1200      	mov      	r0, r0
900cced8:	2b08      	cmpnei      	r8, 16
900cceda:	904d      	st.w      	r0, (r13, 0x10)
900ccedc:	1232      	mov      	r2, r3
900ccede:	2070      	addi      	r0, r0, 8
900ccee0:	8f40      	ld.w      	r15, (r0, 0x10)
900ccee2:	8e30      	ld.w      	r14, (r0, 0xc)
900ccee4:	8d20      	ld.w      	r13, (r0, 0x8)
900ccee6:	8c10      	ld.w      	r12, (r0, 0x4)
900ccee8:	8b00      	ld.w      	r11, (r0, 0x0)
900cceea:	2170      	addi      	r0, r0, 24
900cceec:	00cf      	jmp      	r15
900cceee:	0000      	bkpt
900ccef0:	24f0      	subi      	r0, r0, 16
900ccef2:	9d00      	st.w      	r13, (r0, 0x0)
900ccef4:	9e10      	st.w      	r14, (r0, 0x4)
900ccef6:	9f20      	st.w      	r15, (r0, 0x8)
900ccef8:	2a02      	cmpnei      	r2, 0
900ccefa:	e810      	bf      	0x900ccf1c	// 0x900ccf1c
900ccefc:	8d82      	ld.w      	r13, (r2, 0x20)
900ccefe:	100e      	mfcr      	r14, cr0
900ccf00:	11f1      	psrclr      	ie
900ccf02:	7f0f      	jsri      	0x900CE364	// 0x900ce364
900ccf04:	7710      	lrw      	r7, 0x9000008c	// 0x900ccf44
900ccf06:	8707      	ld.w      	r7, (r7, 0x0)
900ccf08:	12d2      	mov      	r2, r13
900ccf0a:	00d7      	jsr      	r7
900ccf0c:	7f0f      	jsri      	0x900CE378	// 0x900ce378
900ccf0e:	12e7      	mov      	r7, r14
900ccf10:	1807      	mtcr      	r7, cr0
900ccf12:	8f20      	ld.w      	r15, (r0, 0x8)
900ccf14:	8e10      	ld.w      	r14, (r0, 0x4)
900ccf16:	8d00      	ld.w      	r13, (r0, 0x0)
900ccf18:	20f0      	addi      	r0, r0, 16
900ccf1a:	00cf      	jmp      	r15
900ccf1c:	122d      	mov      	r13, r2
900ccf1e:	100e      	mfcr      	r14, cr0
900ccf20:	11f1      	psrclr      	ie
900ccf22:	7f07      	jsri      	0x900CE364	// 0x900ce364
900ccf24:	7708      	lrw      	r7, 0x9000008c	// 0x900ccf44
900ccf26:	8707      	ld.w      	r7, (r7, 0x0)
900ccf28:	12d2      	mov      	r2, r13
900ccf2a:	00d7      	jsr      	r7
900ccf2c:	7f07      	jsri      	0x900CE378	// 0x900ce378
900ccf2e:	12e7      	mov      	r7, r14
900ccf30:	1807      	mtcr      	r7, cr0
900ccf32:	8f20      	ld.w      	r15, (r0, 0x8)
900ccf34:	8e10      	ld.w      	r14, (r0, 0x4)
900ccf36:	8d00      	ld.w      	r13, (r0, 0x0)
900ccf38:	20f0      	addi      	r0, r0, 16
900ccf3a:	00cf      	jmp      	r15
900ccf3c:	f7ff      	br      	0x900ccf3c	// 0x900ccf3c
900ccf3e:	f7ff      	br      	0x900ccf3e	// 0x900ccf3e
900ccf40:	e364      	bt      	0x900cd60a	// 0x900cd60a
900ccf42:	900c      	st.w      	r0, (r12, 0x0)
900ccf44:	008c      	dect      	r12, r12, 1
900ccf46:	9000      	st.w      	r0, (r0, 0x0)
900ccf48:	e378      	bt      	0x900cd63a	// 0x900cd63a
900ccf4a:	900c      	st.w      	r0, (r12, 0x0)
900ccf4c:	2570      	subi      	r0, r0, 24
900ccf4e:	9b00      	st.w      	r11, (r0, 0x0)
900ccf50:	9c10      	st.w      	r12, (r0, 0x4)
900ccf52:	9d20      	st.w      	r13, (r0, 0x8)
900ccf54:	9e30      	st.w      	r14, (r0, 0xc)
900ccf56:	9f40      	st.w      	r15, (r0, 0x10)
900ccf58:	122e      	mov      	r14, r2
900ccf5a:	123d      	mov      	r13, r3
900ccf5c:	7618      	lrw      	r6, 0x90000000	// 0x900ccfbc
900ccf5e:	8706      	ld.w      	r7, (r6, 0x0)
900ccf60:	2d05      	bmaski      	r5, 16
900ccf62:	1657      	and      	r7, r7, r5
900ccf64:	6415      	movi      	r5, 65
900ccf66:	0f57      	cmpne      	r7, r5
900ccf68:	e816      	bf      	0x900ccf96	// 0x900ccf96
900ccf6a:	2c0b      	bmaski      	r11, 0
900ccf6c:	0fbe      	cmpne      	r14, r11
900ccf6e:	e80a      	bf      	0x900ccf84	// 0x900ccf84
900ccf70:	12e2      	mov      	r2, r14
900ccf72:	12d3      	mov      	r3, r13
900ccf74:	7f13      	jsri      	0x900C9C74	// 0x900c9c74
900ccf76:	8f40      	ld.w      	r15, (r0, 0x10)
900ccf78:	8e30      	ld.w      	r14, (r0, 0xc)
900ccf7a:	8d20      	ld.w      	r13, (r0, 0x8)
900ccf7c:	8c10      	ld.w      	r12, (r0, 0x4)
900ccf7e:	8b00      	ld.w      	r11, (r0, 0x0)
900ccf80:	2170      	addi      	r0, r0, 24
900ccf82:	00cf      	jmp      	r15
900ccf84:	12e2      	mov      	r2, r14
900ccf86:	12d3      	mov      	r3, r13
900ccf88:	7f0f      	jsri      	0x90102AD4	// 0x90102ad4
900ccf8a:	2a02      	cmpnei      	r2, 0
900ccf8c:	e7f4      	bt      	0x900ccf76	// 0x900ccf76
900ccf8e:	12e2      	mov      	r2, r14
900ccf90:	12d3      	mov      	r3, r13
900ccf92:	7f0b      	jsri      	0x900C9C74	// 0x900c9c74
900ccf94:	f7f0      	br      	0x900ccf76	// 0x900ccf76
900ccf96:	8b66      	ld.w      	r11, (r6, 0x18)
900ccf98:	2a0b      	cmpnei      	r11, 0
900ccf9a:	efe7      	bf      	0x900ccf6a	// 0x900ccf6a
900ccf9c:	100c      	mfcr      	r12, cr0
900ccf9e:	11f1      	psrclr      	ie
900ccfa0:	7f0a      	jsri      	0x900CE364	// 0x900ce364
900ccfa2:	875b      	ld.w      	r7, (r11, 0x14)
900ccfa4:	820b      	ld.w      	r2, (r11, 0x0)
900ccfa6:	6063      	movi      	r3, 6
900ccfa8:	00d7      	jsr      	r7
900ccfaa:	122b      	mov      	r11, r2
900ccfac:	7f08      	jsri      	0x900CE378	// 0x900ce378
900ccfae:	12c7      	mov      	r7, r12
900ccfb0:	1807      	mtcr      	r7, cr0
900ccfb2:	0fbe      	cmpne      	r14, r11
900ccfb4:	e7dd      	bt      	0x900ccf70	// 0x900ccf70
900ccfb6:	f7e6      	br      	0x900ccf84	// 0x900ccf84
900ccfb8:	f7ff      	br      	0x900ccfb8	// 0x900ccfb8
900ccfba:	f7ff      	br      	0x900ccfba	// 0x900ccfba
900ccfbc:	0000      	bkpt
900ccfbe:	9000      	st.w      	r0, (r0, 0x0)
900ccfc0:	9c74      	st.w      	r12, (r4, 0x1c)
900ccfc2:	900c      	st.w      	r0, (r12, 0x0)
900ccfc4:	2ad4      	cmpnei      	r4, 13
900ccfc6:	9010      	st.w      	r0, (r0, 0x4)
900ccfc8:	e364      	bt      	0x900cd692	// 0x900cd692
900ccfca:	900c      	st.w      	r0, (r12, 0x0)
900ccfcc:	e378      	bt      	0x900cd6be	// 0x900cd6be
900ccfce:	900c      	st.w      	r0, (r12, 0x0)
900ccfd0:	2470      	subi      	r0, r0, 8
900ccfd2:	9f00      	st.w      	r15, (r0, 0x0)
900ccfd4:	f80b      	bsr      	0x900ccfec	// 0x900ccfec
900ccfd6:	f80c      	bsr      	0x900ccff0	// 0x900ccff0
900ccfd8:	7f04      	jsri      	0x900D04D8	// 0x900d04d8
900ccfda:	f7ff      	br      	0x900ccfda	// 0x900ccfda
900ccfdc:	f7ff      	br      	0x900ccfdc	// 0x900ccfdc
900ccfde:	1200      	mov      	r0, r0
900ccfe0:	cfec      	ld.h      	r15, (r12, 0x1c)
900ccfe2:	900c      	st.w      	r0, (r12, 0x0)
900ccfe4:	cff0      	ld.h      	r15, (r0, 0x1e)
900ccfe6:	900c      	st.w      	r0, (r12, 0x0)
900ccfe8:	04d8      	mac      	r8, r13
900ccfea:	900d      	st.w      	r0, (r13, 0x0)
900ccfec:	00cf      	jmp      	r15
900ccfee:	0000      	bkpt
900ccff0:	00cf      	jmp      	r15
900ccff2:	0000      	bkpt
900ccff4:	0142      	zextb      	r2, r2
900ccff6:	8713      	ld.w      	r7, (r3, 0x4)
900ccff8:	2407      	subi      	r7, r7, 1
900ccffa:	8623      	ld.w      	r6, (r3, 0x8)
900ccffc:	0d76      	cmplt      	r6, r7
900ccffe:	e809      	bf      	0x900cd012	// 0x900cd012
900cd000:	8703      	ld.w      	r7, (r3, 0x0)
900cd002:	b207      	st.b      	r2, (r7, 0x0)
900cd004:	2007      	addi      	r7, r7, 1
900cd006:	9703      	st.w      	r7, (r3, 0x0)
900cd008:	6006      	movi      	r6, 0
900cd00a:	b607      	st.b      	r6, (r7, 0x0)
900cd00c:	8723      	ld.w      	r7, (r3, 0x8)
900cd00e:	2007      	addi      	r7, r7, 1
900cd010:	9723      	st.w      	r7, (r3, 0x8)
900cd012:	00cf      	jmp      	r15
900cd014:	25f0      	subi      	r0, r0, 32
900cd016:	9770      	st.w      	r7, (r0, 0x1c)
900cd018:	9660      	st.w      	r6, (r0, 0x18)
900cd01a:	9550      	st.w      	r5, (r0, 0x14)
900cd01c:	9440      	st.w      	r4, (r0, 0x10)
900cd01e:	9330      	st.w      	r3, (r0, 0xc)
900cd020:	9220      	st.w      	r2, (r0, 0x8)
900cd022:	9f00      	st.w      	r15, (r0, 0x0)
