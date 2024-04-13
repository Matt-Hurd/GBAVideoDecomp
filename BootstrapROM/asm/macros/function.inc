	MACRO
$l	arm_func_start $name
	ALIGN 2, 0
	GLOBAL $name
	CODE32
	MEND

	MACRO
$l	arm_func_end $name
	SIZE $name, .-$name
	MEND

	MACRO
$l	thumb_func_start $name
	ALIGN 2, 0
	GLOBAL $name
	CODE16
	MEND

	MACRO
$l	non_word_aligned_thumb_func_start $name
	GLOBAL $name
	CODE16
	MEND

	MACRO
$l	thumb_func_end $name
	SIZE $name, .-$name
	MEND

	MACRO
$l	mov32 $reg, $addr
	IF $addr == 0x08800000
		movs $reg, #0x88
		lsls $reg, $reg, #0x14
	ELSE
		ldr $reg, =#$addr
	ENDIF
	MEND
	END
