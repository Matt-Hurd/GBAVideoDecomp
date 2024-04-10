
    INCLUDE asm/macros.inc
    AREA text, CODE

	thumb_func_start strToLower
strToLower ;@ 0x080002F4
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
    END
