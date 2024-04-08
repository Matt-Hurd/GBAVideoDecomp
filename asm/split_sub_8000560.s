    INCLUDE asm/macros.inc
    AREA text, CODE

	IMPORT SoftReset
	IMPORT sub_800033A
	IMPORT sub_800043E
	IMPORT sub_8000520
	IMPORT sub_8000540
	IMPORT sub_8000864

	thumb_func_start sub_8000560
sub_8000560 ;@ 0x08000560
	ldr r1, _080005D0 ;@ =0x03007FE0
	movs r0, #1
	strh r0, [r1, #0x18]
	bx lr

	thumb_func_start main
main ;@ 0x08000568
	push {r4, r5, lr}
	ldr r0, _080005D4 ;@ =0x00004014
	ldr r1, _080005D8 ;@ =0x04000200
	sub sp, #0xc
	strh r0, [r1, #4]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #8]
	ldr r0, _080005DC ;@ =0x040000D4
	add r1, sp, #8
	str r1, [r0]
	movs r1, #3
	lsls r1, r1, #0x19
	str r1, [r0, #4]
	ldr r1, _080005E0 ;@ =0x85004B00
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_800033A
	add r1, pc, #0x50 ;@ =_080005E4
	adds r0, r4, #0
	bl sub_8000520
	adds r5, r0, #0
	adds r0, r4, #0
	add r1, pc, #0x44 ;@ =_080005E4
	bl sub_8000540
	movs r2, #1
	lsls r2, r2, #0x19
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8000864
	ldr r1, _080005F0 ;@ =0x03007FF0
	movs r0, #1
	strb r0, [r1, #0xa]
	movs r0, #0xe2
	bl SoftReset
	movs r5, #0
	movs r1, #0
	adds r0, r4, #0
	bl sub_800043E
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r3}
	bx r3
	ALIGN
_080005D0 DCDU 0x03007FE0
_080005D4 DCDU 0x00004014
_080005D8 DCDU 0x04000200
_080005DC DCDU 0x040000D4
_080005E0 DCDU 0x85004B00
_080005E4 DCDU 0x6E69616D
_080005E8 DCDU 0x6E69622E
_080005EC DCDU 0x00000000
_080005F0 DCDU 0x03007FF0
	END
