    INCLUDE asm/macros.inc
    AREA text, CODE

	IMPORT __16__rt_memclr
	IMPORT __16__rt_memclr_w

	thumb_func_start sub_8000608
sub_8000608 ;@ 0x08000608
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	lsrs r0, r1, #2
	lsrs r1, r2, #2
	lsls r1, r1, #2
	lsls r0, r0, #2
	stm r4!, {r0, r1}
	subs r4, #8
	ldr r2, [r4, #8]
	ldr r5, _08000858 ;@ =0xF00003FF
	ands r2, r5
	str r2, [r4, #8]
	subs r1, r1, r0
	bl __16__rt_memclr
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #4]
	movs r2, #0
	str r2, [r0]
	ldr r1, [r0, #8]
	lsrs r1, r1, #0x12
	lsls r1, r1, #0x12
	orrs r1, r2
	str r1, [r0, #8]
	ldr r0, [r4, #4]
	ldr r1, [r4]
	subs r0, #0xc
	str r1, [r0, #4]
	cmp r1, #0
	beq _08000656
	ldr r3, [r1]
	str r3, [r0]
	str r0, [r1]
	ldr r1, [r0]
	cmp r1, #0
	beq _08000658
	str r0, [r1, #4]
	b _08000658
_08000656
	str r2, [r0]
_08000658
	ldr r1, [r0, #8]
	lsrs r1, r1, #0x12
	lsls r1, r1, #0x12
	orrs r1, r2
	str r1, [r0, #8]
	ldr r0, [r4, #8]
	movs r1, #3
	lsls r1, r1, #0xd
	ands r0, r5
	adds r0, r0, r1
	movs r1, #0xff
	lsls r1, r1, #2
	bics r0, r1
	adds r0, #8
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #8]
	pop {r3, r4, r5}
	pop {r3}
	bx r3

	thumb_func_start sub_8000680
sub_8000680 ;@ 0x08000680
	ldr r2, [r0, #8]
	lsls r3, r2, #0x1e
	lsrs r3, r3, #0x1f
	cmp r3, r1
	beq _080006AE
	movs r3, #2
	bics r2, r3
	lsls r3, r1, #1
	orrs r2, r3
	str r2, [r0, #8]
	cmp r1, #0
	bne _080006AE
	lsrs r1, r2, #1
	movs r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	movs r2, #0xff
	lsls r1, r1, #1
	lsls r2, r2, #2
	bics r1, r2
	ldr r2, _08000858 ;@ =0xF00003FF
	ands r1, r2
	str r1, [r0, #8]
_080006AE
	bx lr

	thumb_func_start sub_80006B0
sub_80006B0 ;@ 0x080006B0
	ldr r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bx lr

	thumb_func_start sub_80006B8
sub_80006B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r0, #8]
	adds r7, r1, #0
	adds r6, r2, #0
	lsls r1, r0, #0x1e
	bmi _080006CE
	movs r0, #0
_080006C8
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	bx r3
_080006CE
	lsls r0, r0, #0x1f
	bmi _080006DE
	movs r2, #0x81
	lsls r2, r2, #0x12
	lsls r1, r2, #7
	ldr r0, _0800085C ;@ =0x03000000
	bl sub_8000608
_080006DE
	adds r0, r7, #3
	lsrs r1, r0, #2
	ldr r0, [r5]
	lsls r1, r1, #2
	ldr r2, [r0]
	cmp r2, #0
	beq _08000746
	adds r4, r1, #0
	adds r4, #0xc
_080006F0
	ldr r2, [r0, #8]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0xe
	adds r2, #3
	lsrs r2, r2, #2
	lsls r2, r2, #2
	adds r3, r2, r0
	ldr r2, [r0]
	adds r3, #0xc
	subs r3, r2, r3
	cmp r3, r4
	blt _0800074A
	ldr r2, [r0, #8]
	lsls r2, r2, #0xe
	lsrs r2, r2, #0xe
	adds r2, #3
	lsrs r2, r2, #2
	lsls r2, r2, #2
	adds r4, r2, r0
	adds r4, #0xc
	str r0, [r4, #4]
	cmp r0, #0
	beq _0800072E
	ldr r2, [r0]
	str r2, [r4]
	str r4, [r0]
	ldr r2, [r4]
	cmp r2, #0
	beq _08000732
	str r4, [r2, #4]
	b _08000732
_0800072E
	movs r2, #0
	str r2, [r4]
_08000732
	ldr r2, [r4, #8]
	lsls r3, r7, #0xe
	lsrs r2, r2, #0x12
	lsls r2, r2, #0x12
	lsrs r3, r3, #0xe
	orrs r2, r3
	str r2, [r4, #8]
	ldr r0, [r0]
	cmp r0, #0
	bne _08000754
_08000746
	movs r0, #0
	b _080006C8
_0800074A
	adds r0, r2, #0
	ldr r2, [r2]
	cmp r2, #0
	beq _08000746
	b _080006F0
_08000754
	lsls r0, r2, #0xe
	lsrs r0, r0, #0xe
	adds r0, #3
	lsrs r2, r0, #2
	lsls r2, r2, #2
	adds r2, #0xc
	ldr r0, [r5, #8]
	lsls r2, r2, #0xa
	ldr r3, _08000860 ;@ =0x0FFFFC00
	adds r2, r0, r2
	ands r2, r3
	mvns r3, r3
	ands r0, r3
	orrs r0, r2
	adds r2, r0, #0
	movs r3, #0xff
	lsls r3, r3, #2
	adds r0, #4
	ands r0, r3
	bics r2, r3
	orrs r0, r2
	str r0, [r5, #8]
	ldr r0, [r4, #8]
	movs r2, #0x3f
	lsls r2, r2, #0x12
	bics r0, r2
	lsls r2, r6, #0x1a
	lsrs r2, r2, #8
	orrs r2, r0
	movs r0, #0xff
	cmp r6, #2
	str r2, [r4, #8]
	beq _08000798
	movs r0, #0
_08000798
	lsls r2, r2, #8
	lsrs r2, r2, #8
	lsls r0, r0, #0x18
	orrs r0, r2
	str r0, [r4, #8]
	cmp r6, #4
	bne _080007AE
	adds r0, r4, #0
	adds r0, #0xc
	bl __16__rt_memclr_w
_080007AE
	adds r0, r4, #0
	adds r0, #0xc
	b _080006C8

	thumb_func_start sub_80007B4
sub_80007B4
	push {r4}
	ldr r2, [r0, #8]
	lsls r3, r2, #0x1e
	bpl _080007F8
	subs r1, #0xc
	ldr r3, [r1, #8]
	ldr r4, _08000860 ;@ =0x0FFFFC00
	lsls r3, r3, #0xe
	lsrs r3, r3, #0xe
	adds r3, #3
	lsrs r3, r3, #2
	lsls r3, r3, #2
	adds r3, #0xc
	lsls r3, r3, #0xa
	subs r3, r2, r3
	ands r3, r4
	mvns r4, r4
	ands r2, r4
	orrs r2, r3
	str r2, [r0, #8]
	ldm r1!, {r2, r3}
	subs r1, #8
	str r2, [r3]
	ldm r1!, {r1, r2}
	str r2, [r1, #4]
	ldr r1, [r0, #8]
	movs r2, #0xff
	lsls r2, r2, #2
	adds r3, r1, #0
	subs r1, #4
	ands r1, r2
	bics r3, r2
	orrs r1, r3
	str r1, [r0, #8]
_080007F8
	pop {r4}
	bx lr

	thumb_func_start sub_80007FC
sub_80007FC ;@ 0x080007FC
	ldr r3, _0800085C ;@ =0x03000000
	ldr r1, [r3, #8]
	lsls r1, r1, #0x1e
	bmi _08000808
	movs r0, #0
	bx lr
_08000808
	movs r2, #1
	adds r1, r0, #0
	adds r0, r3, #0
	b sub_80006B8

	thumb_func_start sub_8000810
sub_8000810 ;@ 0x08000810
	ldr r3, _0800085C ;@ =0x03000000
	ldr r1, [r3, #8]
	lsls r1, r1, #0x1e
	bpl _08000824
	cmp r0, #0
	beq _08000824
	movs r2, #1
	adds r1, r0, #0
	adds r0, r3, #0
	b sub_80007B4
_08000824
	bx lr

	non_word_aligned_thumb_func_start sub_8000826
sub_8000826 ;@ 0x08000826
	ldr r3, _0800085C ;@ =0x03000000
	ldr r1, [r3, #8]
	lsls r1, r1, #0x1e
	bmi _08000832
	movs r0, #0
	bx lr
_08000832
	movs r2, #2
	adds r1, r0, #0
	adds r0, r3, #0
	b sub_80006B8

	non_word_aligned_thumb_func_start sub_800083A
sub_800083A ;@ 0x0800083A
	ldr r3, _0800085C ;@ =0x03000000
	ldr r1, [r3, #8]
	lsls r1, r1, #0x1e
	bpl _08000856
	cmp r0, #0
	beq _08000856
	movs r1, #3
	mvns r1, r1
	ldr r1, [r1, r0]
	movs r2, #2
	lsrs r1, r1, #0x18
	adds r1, r0, #0
	adds r0, r3, #0
	b sub_80007B4
_08000856
	bx lr
	ALIGN
_08000858 DCDU 0xF00003FF
_0800085C DCDU 0x03000000
_08000860 DCDU 0x0FFFFC00
	END
