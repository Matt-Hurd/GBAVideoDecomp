        arm_func_start decompressimage
decompressimage: @ 0x0800A8D4
        push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
        sub sp, sp, #8
        str r0, [sp]
        ldr lr, [r0, #0x1c]
        cmp lr, #0
        ble _0800B700
        orr lr, lr, #0x80000
        lsl r2, lr, #0xc
        lsr lr, r2, #0xc
        ldr r6, [r0, #8]
        ldr r7, [r0, #0xc]
        lsl r7, r7, #0xf
        orr r7, r7, #0x2000
        ldr sl, [r0, #0x28]
        ldr fp, [r0, #0x30]
        ldr ip, [r0, #0x34]
        ldrb r2, [r0, #0x58]
        cmp r2, #0
        orrne r7, r7, #0x1000
        add sb, r0, #0x3c
        ldr r5, [r0, #0x38]
        ldrb r2, [r0, #0x59]
        add lr, lr, r2, lsl #20
        ldr r2, [r0, #0x54]
        add lr, lr, r2, lsl #28
        ldr r8, [r0, #0x20]
        add r2, sl, r1
        str r2, [sp, #4]
_0800A944:
        ldr r0, _0800B70C @ =0x03002E0C
        ldr r0, [r0]
        cmp r0, #1
        beq _0800B6B4
        ldr r0, [sp, #4]
        cmp sl, r0
        bhs _0800B6B4
        lsr r1, lr, #0x1c
        add r1, r8, r1, lsl #5
        and r0, r7, #0x18000
        add r0, r1, r0, lsr #14
        ldrh r3, [r0]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800A9B0
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800A9A8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800A9D8
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800A9D4
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bhs _0800ABDC
        add r0, r8, #0x26c
        add r0, r0, #0xc00
        cmp lr, #0x40000000
        biclo lr, lr, #0xf0000000
        blo _0800AA00
        cmp lr, #-0x60000000
        sublo lr, lr, #0x30000000
        blo _0800AA00
        sub lr, lr, #0x60000000
_0800AA00:
        tst r7, #0x1000
        beq _0800AB3C
        sub r4, r7, r5, lsl #15
        ldrb r4, [r6, r4, lsr #15]
        mov r1, #1
        lsl r1, r1, #1
        and r3, r4, #0x80
        add r3, r3, #0x80
        lsl r4, r4, #1
        add r1, r1, r3, lsl #2
        bic r4, r4, #0x80000000
        orr r4, r4, r3, lsl #23
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AA70
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AA68
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AA98
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AA94
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bic r1, r1, #0x600
        adc r1, r1, #0
        eor r3, r1, r4, lsr #31
        tst r3, #1
        add pc, pc, #0x78 @ =0x0800AB28
        cmp r1, #0x100
        add pc, pc, #0x78 @ =0x0800AB30
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AAF8
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AAF0
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AB20
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AB1C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        sub pc, pc, #0x80
        cmp r1, #0x100
        sublo pc, pc, #0x120
        and r1, r1, #0xff
        bic r7, r7, #0x1000
        b _0800ABBC
_0800AB3C:
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AB84
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AB7C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800ABAC
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800ABA8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #0x100
        sublo pc, pc, #0x7c
        bic r1, r1, #0x100
_0800ABBC:
        bic lr, lr, #0xff00000
        orr lr, lr, r1, lsl #20
        strb r1, [r6, r7, lsr #15]
        add r7, r7, #0x8000
        subs lr, lr, #1
        lsls r1, lr, #0xd
        bgt _0800A944
        b _0800B6B4
_0800ABDC:
        orr r7, r7, #0x1000
        lsr r0, lr, #0x1c
        add r0, r8, r0, lsl #1
        add r1, r0, #0x180
        ldrh r3, [r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AC2C
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AC24
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AC54
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AC50
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        blo _0800B13C
        add r1, r0, #0x198
        ldrh r3, [r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AC9C
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AC94
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800ACC4
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800ACC0
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bhs _0800AD80
        lsr r1, lr, #0x1c
        add r1, r8, r1, lsl #5
        and r0, r7, #0x18000
        add r0, r1, r0, lsr #14
        add r0, r0, #0x1e0
        ldrh r3, [r0]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AD1C
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AD14
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AD44
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AD40
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bhs _0800AE94
        cmp lr, #0x70000000
        bic lr, lr, #0xf0000000
        addlo lr, lr, #-0x70000000
        addhs lr, lr, #-0x50000000
        sub r0, r7, r5, lsl #15
        ldrb r0, [r6, r0, lsr #15]
        bic lr, lr, #0xff00000
        orr lr, lr, r0, lsl #20
        strb r0, [r6, r7, lsr #15]
        add r7, r7, #0x8000
        subs lr, lr, #1
        lsls r1, lr, #0xd
        bgt _0800A944
        b _0800B6B4
_0800AD80:
        add r1, r0, #0x1b0
        ldrh r3, [r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800ADC4
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800ADBC
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800ADEC
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800ADE8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bhs _0800AE00
        ldr r0, [sb]
        str r5, [sb]
        mov r5, r0
        b _0800AE94
_0800AE00:
        add r1, r0, #0x1c8
        ldrh r3, [r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AE44
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AE3C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AE6C
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AE68
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        bhs _0800AE84
        ldm sb, {r1, r2}
        mov r0, r5
        stm sb, {r0, r1}
        mov r5, r2
        b _0800AE94
_0800AE84:
        ldm sb, {r1, r2, r3}
        mov r0, r5
        stm sb, {r0, r1, r2}
        mov r5, r3
_0800AE94:
        add r0, r8, #0xa00
        add r0, r0, #0x68
        ldrh r3, [r0]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AEDC
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AED4
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AF04
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AF00
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        add pc, pc, #0x90 @ =0x0800AF9C
        and r3, r7, #0x18000
        lsr r3, r3, #0xf
        add r0, r0, r3, lsl #4
        add r0, r0, #4
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AF60
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AF58
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800AF88
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AF84
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #8
        sublo pc, pc, #0x7c
        bic r1, r1, #8
        add pc, pc, #0x188 @ =0x0800B128
        ldrh r3, [r0, #2]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800AFDC
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, #2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800AFD4
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B004
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, #2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B000
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        add pc, pc, #0x94 @ =0x0800B0A0
        and r3, r7, #0x18000
        lsr r3, r3, #0xf
        add r0, r0, r3, lsl #4
        add r0, r0, #0x104
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B060
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B058
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B088
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B084
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #8
        sublo pc, pc, #0x7c
        bic r1, r1, #8
        add r1, r1, #8
        add pc, pc, #0x84 @ =0x0800B128
        add r0, r0, #0x204
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B0EC
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B0E4
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B114
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B110
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #0x100
        sublo pc, pc, #0x7c
        bic r1, r1, #0x100
        add r1, r1, #0x10
        cmp lr, #0x70000000
        bic lr, lr, #0xf0000000
        addlo lr, lr, #-0x80000000
        addhs lr, lr, #-0x50000000
        b _0800B67C
_0800B13C:
        ldm sb, {r1, r2}
        mov r0, r5
        stm sb, {r0, r1, r2}
        mov r5, #0
        cmp lr, #0x70000000
        bic lr, lr, #0xf0000000
        addlo lr, lr, #0x70000000
        addhs lr, lr, #-0x60000000
        add r0, r8, #0x660
        add r0, r0, #4
        ldrh r3, [r0]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B1A4
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B19C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B1CC
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B1C8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        add pc, pc, #0x90 @ =0x0800B264
        and r3, r7, #0x18000
        lsr r3, r3, #0xf
        add r0, r0, r3, lsl #4
        add r0, r0, #4
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B228
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B220
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B250
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B24C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #8
        sublo pc, pc, #0x7c
        bic r1, r1, #8
        add pc, pc, #0x188 @ =0x0800B3F0
        ldrh r3, [r0, #2]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B2A4
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, #2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B29C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B2CC
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, #2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B2C8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        add pc, pc, #0x94 @ =0x0800B368
        and r3, r7, #0x18000
        lsr r3, r3, #0xf
        add r0, r0, r3, lsl #4
        add r0, r0, #0x104
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B328
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B320
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B350
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B34C
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #8
        sublo pc, pc, #0x7c
        bic r1, r1, #8
        add r1, r1, #8
        add pc, pc, #0x84 @ =0x0800B3F0
        add r0, r0, #0x204
        mov r1, #1
        lsl r1, r1, #1
        ldrh r3, [r0, r1]
        lsr r2, fp, #0xb
        mul r2, r3, r2
        cmp ip, r2
        add pc, pc, #0x28 @ =0x0800B3B4
        mov fp, r2
        rsb r2, r3, #0x800
        add r3, r3, r2, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B3AC
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmn r3, #0
        add pc, pc, #0x24 @ =0x0800B3DC
        sub fp, fp, r2
        sub ip, ip, r2
        sub r3, r3, r3, lsr #5
        strh r3, [r0, r1]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B3D8
        lsl fp, fp, #8
        ldrb r3, [sl], #1
        add ip, r3, ip, lsl #8
        cmp r3, #0
        adc r1, r1, #0
        cmp r1, #0x100
        sublo pc, pc, #0x7c
        bic r1, r1, #0x100
        add r1, r1, #0x10
        add r0, r8, #0x360
        cmp r1, #4
        addlo r0, r0, r1, lsl #7
        addhs r0, r0, #0x180
        mov r2, #1
        lsl r2, r2, #1
        ldrh r4, [r0, r2]
        lsr r3, fp, #0xb
        mul r3, r4, r3
        cmp ip, r3
        add pc, pc, #0x28 @ =0x0800B448
        mov fp, r3
        rsb r3, r4, #0x800
        add r4, r4, r3, lsr #5
        strh r4, [r0, r2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B440
        lsl fp, fp, #8
        ldrb r4, [sl], #1
        add ip, r4, ip, lsl #8
        cmn r4, #0
        add pc, pc, #0x24 @ =0x0800B470
        sub fp, fp, r3
        sub ip, ip, r3
        sub r4, r4, r4, lsr #5
        strh r4, [r0, r2]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B46C
        lsl fp, fp, #8
        ldrb r4, [sl], #1
        add ip, r4, ip, lsl #8
        cmp r4, #0
        adc r2, r2, #0
        cmp r2, #0x40
        sublo pc, pc, #0x7c
        bic r2, r2, #0x40
        cmp r2, #4
        blo _0800B674
        add r7, r7, r1
        mov r0, #1
        rsb r4, r0, r2, lsr #1
        and r3, r2, #1
        add r3, r3, #2
        add r3, r0, r3, lsl r4
        add r5, r5, r3
        cmp r2, #0xe
        bhs _0800B578
        mov r0, #0x2b0
        add r0, r0, r3
        sub r0, r0, r2
        sub r0, r0, #2
        add r5, r5, r0, lsl #19
        add r8, r8, r0, lsl #1
        mov r0, #1
        mov r3, #0
        lsl r0, r0, #1
        ldrh r2, [r8, r0]
        lsr r1, fp, #0xb
        mul r1, r2, r1
        cmp ip, r1
        add pc, pc, #0x28 @ =0x0800B510
        mov fp, r1
        rsb r1, r2, #0x800
        add r2, r2, r1, lsr #5
        strh r2, [r8, r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B508
        lsl fp, fp, #8
        ldrb r2, [sl], #1
        add ip, r2, ip, lsl #8
        cmn r2, #0
        add pc, pc, #0x24 @ =0x0800B538
        sub fp, fp, r1
        sub ip, ip, r1
        sub r2, r2, r2, lsr #5
        strh r2, [r8, r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B534
        lsl fp, fp, #8
        ldrb r2, [sl], #1
        add ip, r2, ip, lsl #8
        cmp r2, #0
        adc r0, r0, #0
        rrx r3, r3
        mov r2, #1
        cmp r0, r2, lsl r4
        sublo pc, pc, #0x84
        rsb r2, r4, #0x20
        lsr r3, r3, r2
        add r5, r5, r3
        sub r8, r8, r5, lsr #18
        lsl r0, r5, #0xe
        lsr r5, r0, #0xe
        lsl r0, r7, #0x17
        lsr r1, r0, #0x17
        lsr r0, r7, #0xb
        lsl r7, r0, #0xb
        b _0800B67C
_0800B578:
        sub r1, r4, #4
        mov r3, #1
        lsr fp, fp, #1
        lsl r3, r3, #1
        cmp ip, fp
        subhs ip, ip, fp
        orrhs r3, r3, #1
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B5A8
        lsl fp, fp, #8
        ldrb r4, [sl], #1
        add ip, r4, ip, lsl #8
        cmp r3, r0, lsl r1
        sublo pc, pc, #0x34
        bic r3, r3, r0, lsl r1
        add r5, r5, r3, lsl #4
        add r8, r8, #0x640
        add r8, r8, #4
        mov r4, #4
        mov r0, #1
        mov r3, #0
        lsl r0, r0, #1
        ldrh r2, [r8, r0]
        lsr r1, fp, #0xb
        mul r1, r2, r1
        cmp ip, r1
        add pc, pc, #0x28 @ =0x0800B610
        mov fp, r1
        rsb r1, r2, #0x800
        add r2, r2, r1, lsr #5
        strh r2, [r8, r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B608
        lsl fp, fp, #8
        ldrb r2, [sl], #1
        add ip, r2, ip, lsl #8
        cmn r2, #0
        add pc, pc, #0x24 @ =0x0800B638
        sub fp, fp, r1
        sub ip, ip, r1
        sub r2, r2, r2, lsr #5
        strh r2, [r8, r0]
        cmp fp, #0x1000000
        add pc, pc, #0x8 @ =0x0800B634
        lsl fp, fp, #8
        ldrb r2, [sl], #1
        add ip, r2, ip, lsl #8
        cmp r2, #0
        adc r0, r0, #0
        rrx r3, r3
        mov r2, #1
        cmp r0, r2, lsl r4
        sublo pc, pc, #0x84
        rsb r2, r4, #0x20
        lsr r3, r3, r2
        add r5, r5, r3
        sub r8, r8, #0x640
        sub r8, r8, #4
        lsl r0, r7, #0x17
        lsr r1, r0, #0x17
        lsr r0, r7, #0xb
        lsl r7, r0, #0xb
        b _0800B67C
_0800B674:
        add r3, r2, #1
        add r5, r5, r3
_0800B67C:
        mov r3, r5
        add r1, r1, #2
        sub lr, lr, r1
        sub r3, r7, r3, lsl #15
        ldrb r2, [r6, r3, lsr #15]
        strb r2, [r6, r7, lsr #15]
        add r7, r7, #0x8000
        add r3, r3, #0x8000
        subs r1, r1, #1
        subne pc, pc, #0x1c
        bic lr, lr, #0xff00000
        orr lr, lr, r2, lsl #20
        lsls r1, lr, #0xd
        bgt _0800A944
_0800B6B4:
        ldr r0, [sp]
        lsr r1, r7, #0xf
        str r1, [r0, #0xc]
        str sl, [r0, #0x28]
        str fp, [r0, #0x30]
        str ip, [r0, #0x34]
        lsl r1, lr, #0xd
        asr r1, r1, #0xd
        str r1, [r0, #0x1c]
        tst r7, #0x1000
        moveq r1, #0
        movne r1, #1
        strb r1, [r0, #0x58]
        lsr r1, lr, #0x1c
        str r1, [r0, #0x54]
        str r5, [r0, #0x38]
        and r1, lr, #0xff00000
        lsr r1, r1, #0x14
        strb r1, [r0, #0x59]
_0800B700:
        add sp, sp, #8
        pop {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
        bx lr
        .align 2, 0
_0800B70C: .4byte 0x03002E0C