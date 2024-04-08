    INCLUDE asm/macros.inc
    AREA text, CODE

	IMPORT sub_80006B8
	IMPORT sub_80007B4
	IMPORT __16__rt_memclr_w
	IMPORT __16__rt_memcpy
	IMPORT __16strcmp
	IMPORT strchr
	IMPORT strlen
	IMPORT strncpy
	IMPORT sub_80007FC
	IMPORT sub_8000810
	IMPORT sub_8000864
	IMPORT sub_800087E

	thumb_func_start sub_80002F4
sub_80002F4 ;@ 0x080002F4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08000312
_080002FA
	movs r3, #0
	ldrsb r1, [r0, r3]
	adds r2, r1, #0
	subs r2, #0x41
	cmp r2, #0x19
	bhi _0800030A
	adds r1, #0x20
	strb r1, [r0]
_0800030A
	adds r0, #1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080002FA
_08000312
	bx lr

	thumb_func_start sub_8000314
sub_8000314 ;@ 0x08000314
	adds r0, r1, #0
_08000316
	ldrb r1, [r0]
	cmp r1, #0x53
	bne _0800032E
	ldrb r1, [r0, #1]
	cmp r1, #0x46
	bne _0800032E
	ldrb r1, [r0, #2]
	cmp r1, #0x43
	bne _0800032E
	ldrb r1, [r0, #3]
	cmp r1, #0x44
	beq _08000338
_0800032E
	adds r0, #4
	subs r2, #4
	cmp r2, #0
	bgt _08000316
	movs r0, #0
_08000338
	bx lr

	non_word_aligned_thumb_func_start sub_800033A
sub_800033A ;@ 0x0800033A
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	bne _08000356
	movs r0, #8
	bl sub_80007FC
	adds r7, r0, #0
	bne _08000356
	adds r0, r7, #0
_0800034E
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r3}
	bx r3
_08000356
	ldr r0, _08000558 ;@ =0x0300000C
	movs r4, #1
	lsls r4, r4, #0x1b
	lsrs r5, r4, #0xb
	str r7, [r0]
_08000360
	movs r2, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_8000864
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_800087E
	adds r2, r0, #0
	adds r1, r6, #0
_08000378
	ldrb r3, [r1]
	cmp r3, #0x53
	bne _08000390
	ldrb r3, [r1, #1]
	cmp r3, #0x46
	bne _08000390
	ldrb r3, [r1, #2]
	cmp r3, #0x43
	bne _08000390
	ldrb r3, [r1, #3]
	cmp r3, #0x44
	beq _0800039A
_08000390
	adds r1, #4
	subs r0, #4
	cmp r0, #0
	bgt _08000378
	movs r1, #0
_0800039A
	cmp r1, #0
	beq _080003A4
	subs r0, r1, r6
	adds r4, r0, r4
	b _080003AC
_080003A4
	adds r4, r4, r2
	subs r5, r5, r2
	cmp r5, #0
	bgt _08000360
_080003AC
	ldr r0, [r1, #4]
	ldr r2, [r1]
	str r0, [sp, #0x10]
	movs r1, #8
	adds r0, r4, #0
	str r2, [sp, #0xc]
	bl sub_800087E
	adds r5, r0, #0
	cmp r0, #8
	bhs _080003DA
	adds r0, r4, r5
	movs r2, #0
	movs r1, #8
	bl sub_8000864
	adds r1, r0, #0
	movs r0, #8
	subs r2, r0, r5
	add r0, sp, #0xc
	adds r0, r0, r5
	bl __16__rt_memcpy
_080003DA
	ldr r0, [sp, #0x10]
	adds r6, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, #8
	adds r0, r0, r6
	str r0, [r7, #4]
	ldr r0, [sp, #0x10]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, #8
	movs r2, #3
	ldr r0, _0800055C ;@ =0x03000000
	bl sub_80006B8
	str r0, [r7]
	add r2, sp, #0xc
	ldm r2!, {r1, r2}
	stm r0!, {r1, r2}
	ldr r0, [sp, #0x10]
	ldr r1, [r7]
	lsls r4, r0, #0x10
	lsrs r4, r4, #0x10
	adds r1, #8
	str r1, [sp, #8]
_0800040C
	movs r2, #0
	adds r1, r4, #0
	adds r0, r6, #0
	bl sub_8000864
	str r0, [sp, #4]
	adds r1, r4, #0
	adds r0, r6, #0
	bl sub_800087E
	adds r5, r0, #0
	adds r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl __16__rt_memcpy
	ldr r1, [sp, #8]
	adds r6, r6, r5
	adds r1, r1, r5
	subs r4, r4, r5
	cmp r4, #0
	str r1, [sp, #8]
	bgt _0800040C
	adds r0, r7, #0
	b _0800034E

	non_word_aligned_thumb_func_start sub_800043E
sub_800043E ;@ 0x0800043E
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08000558 ;@ =0x0300000C
	movs r5, #0
	str r5, [r0]
	adds r6, r1, #0
	ldr r1, [r4]
	movs r2, #3
	ldr r0, _0800055C ;@ =0x03000000
	bl sub_80007B4
	str r5, [r4]
	cmp r6, #0
	beq _08000460
	adds r0, r4, #0
	bl sub_8000810
_08000460
	pop {r4, r5, r6}
	pop {r3}
	bx r3

	non_word_aligned_thumb_func_start sub_8000466
sub_8000466 ;@ 0x08000466
	push {r0, r1, r2, r4, r5, r6, r7, lr}
	sub sp, #0x48
	ldr r0, [sp, #0x48]
	adds r7, r2, #0
	ldr r5, [r0]
	adds r6, r1, #0
	adds r5, #8
_08000474
	movs r4, #0
	movs r1, #0x40
	add r0, sp, #8
	bl __16__rt_memclr_w
	cmp r6, #0
	beq _080004B4
	movs r1, #0x5c
	adds r0, r6, #0
	bl strchr
	adds r4, r0, #0
	bne _080004A2
	movs r1, #0x2f
	adds r0, r6, #0
	bl strchr
	adds r4, r0, #0
	bne _080004A2
	adds r0, r6, #0
	bl strlen
	adds r4, r0, r6
_080004A2
	subs r2, r4, r6
	adds r1, r6, #0
	add r6, sp, #8
	adds r0, r6, #0
	bl strncpy
	adds r0, r6, #0
	bl sub_80002F4
_080004B4
	ldm r5!, {r0}
	lsls r6, r0, #0x10
	lsrs r6, r6, #0x10
_080004BA
	cmp r4, #0
	beq _080004EC
	adds r0, r5, #0
	adds r0, #8
	add r1, sp, #8
	bl __16strcmp
	cmp r0, #0
	bne _080004EC
	ldrb r0, [r4]
	cmp r0, #0
	beq _080004E2
	ldr r0, [r5, #4]
	lsls r0, r0, #3
	lsrs r0, r0, #3
	adds r5, r0, r5
	cmp r6, #0
	beq _0800051C
	adds r6, r4, #1
	b _08000474
_080004E2
	adds r0, r5, #0
_080004E4
	add sp, #0x54
	pop {r4, r5, r6, r7}
	pop {r3}
	bx r3
_080004EC
	cmp r7, #0
	beq _08000504
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #4]
	ldr r1, [r5, #4]
	lsls r1, r1, #3
	lsrs r1, r1, #3
	adds r0, r0, r1
	cmp r0, r7
	bne _08000504
	adds r0, r5, #0
	b _080004E4
_08000504
	adds r0, r5, #0
	adds r0, #8
	str r0, [sp, #4]
	bl strlen
	adds r0, #4
	lsrs r0, r0, #2
	ldr r1, [sp, #4]
	lsls r0, r0, #2
	adds r5, r0, r1
	subs r6, #1
	bne _080004BA
_0800051C
	movs r0, #0
	b _080004E4

	thumb_func_start sub_8000520
sub_8000520 ;@ 0x08000520
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	bl sub_8000466
	cmp r0, #0
	bne _08000534
_0800052E
	pop {r4}
	pop {r3}
	bx r3
_08000534
	ldr r1, [r4, #4]
	ldr r0, [r0, #4]
	lsls r0, r0, #3
	lsrs r0, r0, #3
	adds r0, r1, r0
	b _0800052E

	thumb_func_start sub_8000540
sub_8000540 ;@ 0x08000540
	push {r3, lr}
	movs r2, #0
	bl sub_8000466
	movs r1, #0
	cmp r0, #0
	beq _08000550
	ldr r1, [r0]
_08000550
	add sp, #4
	pop {r3}
	adds r0, r1, #0
	bx r3
	ALIGN
_08000558 DCDU 0x0300000C
_0800055C DCDU 0x03000000
	END
