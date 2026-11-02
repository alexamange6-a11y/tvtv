
/workspace/tvtv/inputs/extracted/ecos.bin:     file format binary


Disassembly of section .data:

90072b46 <.data+0x72b46>:
90072b46:	7c6a      	lrw      	r12, 0x904cde60	// 0x90072cf0
90072b48:	7d6b      	lrw      	r13, 0x90026760	// 0x90072cf4
90072b4a:	12c2      	mov      	r2, r12
90072b4c:	12d3      	mov      	r3, r13
90072b4e:	7f0b      	jsri      	0x9024EC58	// 0x9024ec58
90072b50:	1e2e      	or      	r14, r14, r2
90072b52:	12c2      	mov      	r2, r12
90072b54:	12d3      	mov      	r3, r13
90072b56:	7f09      	jsri      	0x9024EC58	// 0x9024ec58
90072b58:	1e2e      	or      	r14, r14, r2
90072b5a:	7c67      	lrw      	r12, 0x904cde7c	// 0x90072cf8
90072b5c:	7d68      	lrw      	r13, 0x900265c0	// 0x90072cfc
90072b5e:	12c2      	mov      	r2, r12
90072b60:	12d3      	mov      	r3, r13
90072b62:	7f06      	jsri      	0x9024EC58	// 0x9024ec58
90072b64:	1e2e      	or      	r14, r14, r2
90072b66:	12c2      	mov      	r2, r12
90072b68:	12d3      	mov      	r3, r13
90072b6a:	7f04      	jsri      	0x9024EC58	// 0x9024ec58
90072b6c:	1e2e      	or      	r14, r14, r2
90072b6e:	7c64      	lrw      	r12, 0x904cde98	// 0x90072d00
90072b70:	f0c9      	br      	0x90072d04	// 0x90072d04
90072b72:	f7ff      	br      	0x90072b72	// 0x90072b72
90072b74:	d990      	st.h      	r9, (r0, 0x12)
90072b76:	904c      	st.w      	r0, (r12, 0x10)
90072b78:	2688      	cpwgr      	r8, cpr8
90072b7a:	9003      	st.w      	r0, (r3, 0x0)
90072b7c:	ec58      	bf      	0x9007242e	// 0x9007242e
90072b7e:	9024      	st.w      	r0, (r4, 0x8)
90072b80:	d9a4      	st.h      	r9, (r4, 0x14)
90072b82:	904c      	st.w      	r0, (r12, 0x10)
90072b84:	2628      	cpwgr      	r8, cpr2
90072b86:	9003      	st.w      	r0, (r3, 0x0)
90072b88:	d9b4      	st.h      	r9, (r4, 0x16)
90072b8a:	904c      	st.w      	r0, (r12, 0x10)
90072b8c:	26c4      	cpwgr      	r4, cpr12
90072b8e:	9003      	st.w      	r0, (r3, 0x0)
90072b90:	d9c8      	st.h      	r9, (r8, 0x18)
90072b92:	904c      	st.w      	r0, (r12, 0x10)
90072b94:	260c      	cpwgr      	r12, cpr0
90072b96:	9003      	st.w      	r0, (r3, 0x0)
90072b98:	d9dc      	st.h      	r9, (r12, 0x1a)
90072b9a:	904c      	st.w      	r0, (r12, 0x10)
90072b9c:	6f94      	cpwcr      	r4, cpcr18
90072b9e:	9003      	st.w      	r0, (r3, 0x0)
90072ba0:	d9f0      	st.h      	r9, (r0, 0x1e)
90072ba2:	904c      	st.w      	r0, (r12, 0x10)
90072ba4:	714c      	lrw      	r1, 0x90059c6c	// 0x90072cd4
90072ba6:	9003      	st.w      	r0, (r3, 0x0)
90072ba8:	da04      	st.h      	r10, (r4, 0x0)
90072baa:	904c      	st.w      	r0, (r12, 0x10)
90072bac:	6e3c      	mulsws      	r12, r3
90072bae:	9003      	st.w      	r0, (r3, 0x0)
90072bb0:	da14      	st.h      	r10, (r4, 0x2)
90072bb2:	904c      	st.w      	r0, (r12, 0x10)
90072bb4:	7054      	jmpi      	0x12C27D9F	// 0x12c27d9f
90072bb6:	9003      	st.w      	r0, (r3, 0x0)
90072bb8:	da28      	st.h      	r10, (r8, 0x4)
90072bba:	904c      	st.w      	r0, (r12, 0x10)
90072bbc:	716c      	lrw      	r1, 0x72901e2e	// 0x90072d6c
90072bbe:	9003      	st.w      	r0, (r3, 0x0)
90072bc0:	da40      	st.h      	r10, (r0, 0x8)
90072bc2:	904c      	st.w      	r0, (r12, 0x10)
90072bc4:	6d0c      	mulswa      	r12, r0
90072bc6:	9003      	st.w      	r0, (r3, 0x0)
90072bc8:	da54      	st.h      	r10, (r4, 0xa)
90072bca:	904c      	st.w      	r0, (r12, 0x10)
90072bcc:	28ac      	rsubi      	r12, r12, 10
90072bce:	9004      	st.w      	r0, (r4, 0x0)
90072bd0:	da64      	st.h      	r10, (r4, 0xc)
90072bd2:	904c      	st.w      	r0, (r12, 0x10)
90072bd4:	285c      	rsubi      	r12, r12, 5
90072bd6:	9004      	st.w      	r0, (r4, 0x0)
90072bd8:	da70      	st.h      	r10, (r0, 0xe)
90072bda:	904c      	st.w      	r0, (r12, 0x10)
90072bdc:	2904      	rsubi      	r4, r4, 16
90072bde:	9004      	st.w      	r0, (r4, 0x0)
90072be0:	da80      	st.h      	r10, (r0, 0x10)
90072be2:	904c      	st.w      	r0, (r12, 0x10)
90072be4:	2834      	rsubi      	r4, r4, 3
90072be6:	9004      	st.w      	r0, (r4, 0x0)
90072be8:	da90      	st.h      	r10, (r0, 0x12)
90072bea:	904c      	st.w      	r0, (r12, 0x10)
90072bec:	97f0      	st.w      	r7, (r0, 0x3c)
90072bee:	9004      	st.w      	r0, (r4, 0x0)
90072bf0:	daa4      	st.h      	r10, (r4, 0x14)
90072bf2:	904c      	st.w      	r0, (r12, 0x10)
90072bf4:	985c      	st.w      	r8, (r12, 0x14)
90072bf6:	9004      	st.w      	r0, (r4, 0x0)
90072bf8:	dabc      	st.h      	r10, (r12, 0x16)
90072bfa:	904c      	st.w      	r0, (r12, 0x10)
90072bfc:	9900      	st.w      	r9, (r0, 0x0)
90072bfe:	9004      	st.w      	r0, (r4, 0x0)
90072c00:	dad8      	st.h      	r10, (r8, 0x1a)
90072c02:	904c      	st.w      	r0, (r12, 0x10)
90072c04:	9860      	st.w      	r8, (r0, 0x18)
90072c06:	9004      	st.w      	r0, (r4, 0x0)
90072c08:	daf4      	st.h      	r10, (r4, 0x1e)
90072c0a:	904c      	st.w      	r0, (r12, 0x10)
90072c0c:	9858      	st.w      	r8, (r8, 0x14)
90072c0e:	9004      	st.w      	r0, (r4, 0x0)
90072c10:	db0c      	st.h      	r11, (r12, 0x0)
90072c12:	904c      	st.w      	r0, (r12, 0x10)
90072c14:	9744      	st.w      	r7, (r4, 0x10)
90072c16:	9001      	st.w      	r0, (r1, 0x0)
90072c18:	db20      	st.h      	r11, (r0, 0x4)
90072c1a:	904c      	st.w      	r0, (r12, 0x10)
90072c1c:	94c4      	st.w      	r4, (r4, 0x30)
90072c1e:	9001      	st.w      	r0, (r1, 0x0)
90072c20:	db48      	st.h      	r11, (r8, 0x8)
90072c22:	904c      	st.w      	r0, (r12, 0x10)
90072c24:	95ec      	st.w      	r5, (r12, 0x38)
90072c26:	9001      	st.w      	r0, (r1, 0x0)
90072c28:	db74      	st.h      	r11, (r4, 0xe)
90072c2a:	904c      	st.w      	r0, (r12, 0x10)
90072c2c:	8e54      	ld.w      	r14, (r4, 0x14)
90072c2e:	9001      	st.w      	r0, (r1, 0x0)
90072c30:	db94      	st.h      	r11, (r4, 0x12)
90072c32:	904c      	st.w      	r0, (r12, 0x10)
90072c34:	8e44      	ld.w      	r14, (r4, 0x10)
90072c36:	9001      	st.w      	r0, (r1, 0x0)
90072c38:	dbb4      	st.h      	r11, (r4, 0x16)
90072c3a:	904c      	st.w      	r0, (r12, 0x10)
90072c3c:	94a4      	st.w      	r4, (r4, 0x28)
90072c3e:	9001      	st.w      	r0, (r1, 0x0)
90072c40:	dbd4      	st.h      	r11, (r4, 0x1a)
90072c42:	904c      	st.w      	r0, (r12, 0x10)
90072c44:	89e0      	ld.w      	r9, (r0, 0x38)
90072c46:	9001      	st.w      	r0, (r1, 0x0)
90072c48:	dbf8      	st.h      	r11, (r8, 0x1e)
90072c4a:	904c      	st.w      	r0, (r12, 0x10)
90072c4c:	86a8      	ld.w      	r6, (r8, 0x28)
90072c4e:	9001      	st.w      	r0, (r1, 0x0)
90072c50:	dc20      	st.h      	r12, (r0, 0x4)
90072c52:	904c      	st.w      	r0, (r12, 0x10)
90072c54:	856c      	ld.w      	r5, (r12, 0x18)
90072c56:	9001      	st.w      	r0, (r1, 0x0)
90072c58:	dc48      	st.h      	r12, (r8, 0x8)
90072c5a:	904c      	st.w      	r0, (r12, 0x10)
90072c5c:	8b18      	ld.w      	r11, (r8, 0x4)
90072c5e:	9001      	st.w      	r0, (r1, 0x0)
90072c60:	dc70      	st.h      	r12, (r0, 0xe)
90072c62:	904c      	st.w      	r0, (r12, 0x10)
90072c64:	82cc      	ld.w      	r2, (r12, 0x30)
90072c66:	9001      	st.w      	r0, (r1, 0x0)
90072c68:	dc88      	st.h      	r12, (r8, 0x10)
90072c6a:	904c      	st.w      	r0, (r12, 0x10)
90072c6c:	849c      	ld.w      	r4, (r12, 0x24)
90072c6e:	9001      	st.w      	r0, (r1, 0x0)
90072c70:	dca0      	st.h      	r12, (r0, 0x14)
90072c72:	904c      	st.w      	r0, (r12, 0x10)
90072c74:	90e0      	st.w      	r0, (r0, 0x38)
90072c76:	9001      	st.w      	r0, (r1, 0x0)
90072c78:	dcbc      	st.h      	r12, (r12, 0x16)
90072c7a:	904c      	st.w      	r0, (r12, 0x10)
90072c7c:	50c4      	stex      	r0, (r4, 0xc)
90072c7e:	9004      	st.w      	r0, (r4, 0x0)
90072c80:	dcd4      	st.h      	r12, (r4, 0x1a)
90072c82:	904c      	st.w      	r0, (r12, 0x10)
90072c84:	50c0      	stex      	r0, (r0, 0xc)
90072c86:	9004      	st.w      	r0, (r4, 0x0)
90072c88:	dce8      	st.h      	r12, (r8, 0x1c)
90072c8a:	904c      	st.w      	r0, (r12, 0x10)
90072c8c:	4f34      	ldex      	r15, (r4, 0x3)
90072c8e:	9004      	st.w      	r0, (r4, 0x0)
90072c90:	dcfc      	st.h      	r12, (r12, 0x1e)
90072c92:	904c      	st.w      	r0, (r12, 0x10)
90072c94:	4f8c      	ldex      	r15, (r12, 0x8)
90072c96:	9004      	st.w      	r0, (r4, 0x0)
90072c98:	dd10      	st.h      	r13, (r0, 0x2)
90072c9a:	904c      	st.w      	r0, (r12, 0x10)
90072c9c:	4fb0      	ldex      	r15, (r0, 0xb)
90072c9e:	9004      	st.w      	r0, (r4, 0x0)
90072ca0:	dd28      	st.h      	r13, (r8, 0x4)
90072ca2:	904c      	st.w      	r0, (r12, 0x10)
90072ca4:	4fb8      	ldex      	r15, (r8, 0xb)
90072ca6:	9004      	st.w      	r0, (r4, 0x0)
90072ca8:	dd3c      	st.h      	r13, (r12, 0x6)
90072caa:	904c      	st.w      	r0, (r12, 0x10)
90072cac:	4fb4      	ldex      	r15, (r4, 0xb)
90072cae:	9004      	st.w      	r0, (r4, 0x0)
90072cb0:	dd54      	st.h      	r13, (r4, 0xa)
90072cb2:	904c      	st.w      	r0, (r12, 0x10)
90072cb4:	92d0      	st.w      	r2, (r0, 0x34)
90072cb6:	9005      	st.w      	r0, (r5, 0x0)
90072cb8:	dd74      	st.h      	r13, (r4, 0xe)
90072cba:	904c      	st.w      	r0, (r12, 0x10)
90072cbc:	9420      	st.w      	r4, (r0, 0x8)
90072cbe:	9005      	st.w      	r0, (r5, 0x0)
90072cc0:	dd94      	st.h      	r13, (r4, 0x12)
90072cc2:	904c      	st.w      	r0, (r12, 0x10)
90072cc4:	947c      	st.w      	r4, (r12, 0x1c)
90072cc6:	9005      	st.w      	r0, (r5, 0x0)
90072cc8:	ddb4      	st.h      	r13, (r4, 0x16)
90072cca:	904c      	st.w      	r0, (r12, 0x10)
90072ccc:	9548      	st.w      	r5, (r8, 0x10)
90072cce:	9005      	st.w      	r0, (r5, 0x0)
90072cd0:	ddd4      	st.h      	r13, (r4, 0x1a)
90072cd2:	904c      	st.w      	r0, (r12, 0x10)
90072cd4:	9c6c      	st.w      	r12, (r12, 0x18)
90072cd6:	9005      	st.w      	r0, (r5, 0x0)
90072cd8:	ddf4      	st.h      	r13, (r4, 0x1e)
90072cda:	904c      	st.w      	r0, (r12, 0x10)
90072cdc:	9550      	st.w      	r5, (r0, 0x14)
90072cde:	9005      	st.w      	r0, (r5, 0x0)
90072ce0:	de18      	st.h      	r14, (r8, 0x2)
90072ce2:	904c      	st.w      	r0, (r12, 0x10)
90072ce4:	954c      	st.w      	r5, (r12, 0x10)
90072ce6:	9005      	st.w      	r0, (r5, 0x0)
90072ce8:	de3c      	st.h      	r14, (r12, 0x6)
90072cea:	904c      	st.w      	r0, (r12, 0x10)
90072cec:	9acc      	st.w      	r10, (r12, 0x30)
90072cee:	9005      	st.w      	r0, (r5, 0x0)
90072cf0:	de60      	st.h      	r14, (r0, 0xc)
90072cf2:	904c      	st.w      	r0, (r12, 0x10)
90072cf4:	6760      	movi      	r0, 118
90072cf6:	9002      	st.w      	r0, (r2, 0x0)
90072cf8:	de7c      	st.h      	r14, (r12, 0xe)
90072cfa:	904c      	st.w      	r0, (r12, 0x10)
90072cfc:	65c0      	movi      	r0, 92
90072cfe:	9002      	st.w      	r0, (r2, 0x0)
90072d00:	de98      	st.h      	r14, (r8, 0x12)
90072d02:	904c      	st.w      	r0, (r12, 0x10)
90072d04:	7d9f      	lrw      	r13, 0x90026638	// 0x90072f80
90072d06:	12c2      	mov      	r2, r12
90072d08:	12d3      	mov      	r3, r13
90072d0a:	7f9e      	jsri      	0x9024EC58	// 0x9024ec58
90072d0c:	1e2e      	or      	r14, r14, r2
90072d0e:	12c2      	mov      	r2, r12
90072d10:	12d3      	mov      	r3, r13
90072d12:	7f9c      	jsri      	0x9024EC58	// 0x9024ec58
90072d14:	1e2e      	or      	r14, r14, r2
90072d16:	7c9c      	lrw      	r12, 0x904cdeb4	// 0x90072f88
90072d18:	7d9d      	lrw      	r13, 0x900261a8	// 0x90072f8c
90072d1a:	12c2      	mov      	r2, r12
90072d1c:	12d3      	mov      	r3, r13
90072d1e:	7f99      	jsri      	0x9024EC58	// 0x9024ec58
90072d20:	1e2e      	or      	r14, r14, r2
90072d22:	12c2      	mov      	r2, r12
90072d24:	12d3      	mov      	r3, r13
90072d26:	7f97      	jsri      	0x9024EC58	// 0x9024ec58
90072d28:	1e2e      	or      	r14, r14, r2
90072d2a:	7c99      	lrw      	r12, 0x904cded0	// 0x90072f90
90072d2c:	7d9a      	lrw      	r13, 0x90025be4	// 0x90072f94
90072d2e:	12c2      	mov      	r2, r12
90072d30:	12d3      	mov      	r3, r13
90072d32:	7f94      	jsri      	0x9024EC58	// 0x9024ec58
90072d34:	1e2e      	or      	r14, r14, r2
90072d36:	12c2      	mov      	r2, r12
90072d38:	12d3      	mov      	r3, r13
90072d3a:	7f92      	jsri      	0x9024EC58	// 0x9024ec58
90072d3c:	1e2e      	or      	r14, r14, r2
90072d3e:	7c96      	lrw      	r12, 0x904cdee8	// 0x90072f98
90072d40:	7d97      	lrw      	r13, 0x90025e14	// 0x90072f9c
90072d42:	12c2      	mov      	r2, r12
90072d44:	12d3      	mov      	r3, r13
90072d46:	7f8f      	jsri      	0x9024EC58	// 0x9024ec58
90072d48:	1e2e      	or      	r14, r14, r2
90072d4a:	12c2      	mov      	r2, r12
90072d4c:	12d3      	mov      	r3, r13
90072d4e:	7f8d      	jsri      	0x9024EC58	// 0x9024ec58
90072d50:	1e2e      	or      	r14, r14, r2
90072d52:	7c93      	lrw      	r12, 0x904cdf04	// 0x90072fa0
90072d54:	7d94      	lrw      	r13, 0x90025ed8	// 0x90072fa4
90072d56:	12c2      	mov      	r2, r12
90072d58:	12d3      	mov      	r3, r13
90072d5a:	7f8a      	jsri      	0x9024EC58	// 0x9024ec58
90072d5c:	1e2e      	or      	r14, r14, r2
90072d5e:	12c2      	mov      	r2, r12
90072d60:	12d3      	mov      	r3, r13
90072d62:	7f88      	jsri      	0x9024EC58	// 0x9024ec58
90072d64:	1e2e      	or      	r14, r14, r2
90072d66:	7290      	lrw      	r2, 0x904cdf20	// 0x90072fa8
90072d68:	7391      	lrw      	r3, 0x9005097c	// 0x90072fac
90072d6a:	7f86      	jsri      	0x9024EC58	// 0x9024ec58
90072d6c:	1e2e      	or      	r14, r14, r2
90072d6e:	7290      	lrw      	r2, 0x904cdf44	// 0x90072fb0
90072d70:	7391      	lrw      	r3, 0x90050a9c	// 0x90072fb4
90072d72:	7f84      	jsri      	0x9024EC58	// 0x9024ec58
90072d74:	1e2e      	or      	r14, r14, r2
90072d76:	7290      	lrw      	r2, 0x904cdf68	// 0x90072fb8
90072d78:	7391      	lrw      	r3, 0x90050a84	// 0x90072fbc
90072d7a:	7f82      	jsri      	0x9024EC58	// 0x9024ec58
