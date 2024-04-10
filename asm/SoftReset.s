    INCLUDE asm/macros.inc
    AREA text, CODE

	thumb_func_start SoftReset
SoftReset ;@ 0x08000E10
	ldr r3, _08000E20 ;@ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _08000E24 ;@ =0x03007F00
	mov sp, r1
	SWI 1
	SWI 0
	ALIGN 4
_08000E20 DCDU 0x04000208
_08000E24 DCDU 0x03007F00
	END
