    INCLUDE asm/macros.inc
    AREA text, CODE


	thumb_func_start sub_80005F4
sub_80005F4 ;@ 0x080005F4
	push {r7}
	pop {r7}
	ldr r1, _08000600 ;@ =0x03007F00
	ldr r3, _08000604 ;@ =0x03000070
	bx lr
	ALIGN
_08000600 DCDU 0x03007F00
_08000604 DCDU 0x03000070
	END
