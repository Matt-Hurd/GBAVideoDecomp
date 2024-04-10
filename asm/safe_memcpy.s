    INCLUDE asm/macros.inc
    AREA text, CODE
    IMPORT __16__rt_memcpy

    thumb_func_start safe_memcpy
safe_memcpy ;@ 0x08000864
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
    END
