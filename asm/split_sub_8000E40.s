    INCLUDE asm/macros.inc
    AREA text, CODE

	IMPORT sub_80005F4

	arm_func_start __user_initial_stackheap
__user_initial_stackheap ;@ 0x08000E40
	LDR ip, _08000E48 ;@ =sub_80005F4
	bx ip
	ALIGN
_08000E48 DCDU sub_80005F4
	END
