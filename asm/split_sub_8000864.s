    INCLUDE asm/macros.inc
    AREA text, CODE

	IMPORT __16__rt_memcpy

	thumb_func_start sub_8000864
sub_8000864 ;@ 0x08000864
	push {r4, lr}
	adds r4, r2, #0
	beq _08000876
	adds r2, r1, #0
	adds r1, r0, #0
	adds r0, r4, #0
	bl __16__rt_memcpy
	adds r0, r4, #0
_08000876
	pop {r4}
	pop {r3}
	bx r3

	thumb_func_start fp_init
fp_init ;@ 0x0800087C
	bx lr

	non_word_aligned_thumb_func_start sub_800087E
sub_800087E ;@ 0x0800087E
	adds r0, r1, #0
	bx lr

	non_word_aligned_thumb_func_start nullsub_4
nullsub_4 ;@ 0x08000882
	bx lr

	thumb_func_start nullsub_5
nullsub_5 ;@ 0x08000884
	bx lr

	non_word_aligned_thumb_func_start nullsub_6
nullsub_6 ;@ 0x08000886
	bx lr
	END
