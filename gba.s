	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"gba.c"
	.text
	.align	2
	.global	drawHorizontalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	cmp	r1, r2
	strh	r3, [sp, #6]	@ movhi
	bgt	.L1
	ldr	r3, .L7
	ldr	r3, [r3]
	rsb	r0, r0, r0, lsl #4
	add	ip, r1, r0, lsl #4
	add	r0, r2, r0, lsl #4
	add	r1, r3, #2
	add	r2, r3, ip, lsl #1
	add	r1, r1, r0, lsl #1
.L3:
	ldrh	r3, [sp, #6]
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L3
.L1:
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	cmp	r1, r2
	strh	r3, [sp, #6]	@ movhi
	bgt	.L9
	ldr	r3, .L14
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, r2, r2, lsl #4
	add	r2, r0, r1, lsl #4
	add	r1, r3, #480
	add	r0, r0, ip, lsl #4
	add	r3, r3, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L11:
	ldrh	r2, [sp, #6]
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L11
.L9:
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	mov	ip, r0
	ldr	r0, .L27
	add	r1, r1, r3
	ldr	r0, [r0]
	rsb	r1, r1, r1, lsl #4
	push	{r4, lr}
	add	r1, ip, r1, lsl #4
	sub	r4, r3, r3, lsl #4
	add	lr, r2, ip
	add	r0, r0, r1, lsl #1
	lsl	r4, r4, #5
.L18:
	cmp	r3, #0
	addgt	r2, r0, r4
	ble	.L21
.L19:
	ldrh	r1, [sp, #8]
	strh	r1, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r0
	bne	.L19
.L21:
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r0, #2
	bne	.L18
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	ldr	r3, .L34
	ldr	r2, [r3]
	add	ip, r2, #76800
	add	ip, ip, #480
	add	r2, r2, #480
.L30:
	sub	r3, r2, #480
.L31:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L31
	add	r2, r3, #480
	cmp	r2, ip
	bne	.L30
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L37:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L37
	mov	r2, #67108864
.L38:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L38
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawFrame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame1, %function
drawFrame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L172
	ldr	r1, [r3]
	add	r0, r1, #40448
	push	{r4, r5, r6, r7, r8, r9, lr}
	add	r4, r0, #72
	mov	r2, r4
	ldr	lr, .L172+4
	add	ip, r0, #152
.L43:
	sub	r3, r2, #16320
.L44:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L44
	add	r2, r2, #2
	cmp	ip, r2
	bne	.L43
	add	r5, r1, #23552
	add	r6, r5, #168
	mov	r2, r6
	mov	r3, #0
	add	lr, r5, #248
.L46:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r7]	@ movhi
	bne	.L46
	mov	r3, r4
	mov	r2, #0
.L47:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r4]	@ movhi
	bne	.L47
	mov	r3, #0
	add	r4, r1, #41472
	add	r7, r4, #6
	add	r2, r5, #166
.L48:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r7
	bne	.L48
	add	r2, r4, #8
.L49:
	strh	r3, [r6]	@ movhi
	add	r6, r6, #480
	cmp	r2, r6
	bne	.L49
	mov	r2, #0
	mov	r3, lr
	add	lr, r4, #88
.L50:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L50
	add	r3, r5, #250
	add	lr, r4, #90
.L51:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L51
	ldr	lr, .L172+8
	add	r2, r0, #74
	add	r4, r0, #88
.L52:
	sub	r3, r2, #15808
	sub	r3, r3, #32
.L53:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L53
	add	r2, r2, #2
	cmp	r4, r2
	bne	.L52
	ldr	r4, .L172+8
	add	r3, r1, #24576
	add	r2, r1, #36864
	add	r6, r3, #600
	strh	r4, [r3, #120]	@ movhi
	add	r5, r2, #2704
	strh	r4, [r6]	@ movhi
	strh	r4, [r3, #122]	@ movhi
	strh	r4, [r6, #2]	@ movhi
	add	r6, r2, #3184
	strh	r4, [r5, #8]	@ movhi
	strh	r4, [r6, #8]	@ movhi
	strh	r4, [r5, #10]	@ movhi
	add	r5, r3, #660
	strh	r4, [r6, #10]	@ movhi
	ldr	lr, .L172+12
	strh	r4, [r3, #180]	@ movhi
	add	r6, r2, #2768
	strh	r4, [r5]	@ movhi
	strh	r4, [r3, #182]	@ movhi
	strh	r4, [r5, #2]	@ movhi
	add	r5, r2, #3248
	strh	r4, [r6, #4]	@ movhi
	add	r7, r1, #37376
	strh	r4, [r5, #4]	@ movhi
	strh	r4, [r6, #6]	@ movhi
	strh	r4, [r5, #6]	@ movhi
	add	r5, r3, #584
	strh	lr, [r3, #106]	@ movhi
	add	r7, r7, #254
	strh	lr, [r5, #2]	@ movhi
	strh	lr, [r3, #108]	@ movhi
	add	r5, r3, #588
	add	r3, r2, #2688
	add	r2, r2, #3168
	strh	lr, [r5]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	strh	lr, [r2, #10]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	mov	lr, r7
	add	r5, r1, #37632
	add	r2, r5, #10
.L55:
	sub	r3, lr, #5760
.L56:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L56
	add	lr, lr, #2
	cmp	r2, lr
	bne	.L55
	ldr	lr, .L172+4
	add	r8, r5, #22
.L58:
	sub	r3, r2, #5760
.L59:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L59
	add	r2, r2, #2
	cmp	r8, r2
	bne	.L58
	add	r6, r1, #31744
	add	r4, r6, #126
	mov	r2, r4
	mov	r3, #0
	add	lr, r6, #150
.L61:
	strh	r3, [r2]	@ movhi
	add	r9, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r9]	@ movhi
	bne	.L61
	mov	r3, r7
	mov	r2, #0
.L62:
	strh	r2, [r3]	@ movhi
	add	r7, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r7]	@ movhi
	bne	.L62
	mov	r3, #0
	add	r7, r1, #38400
	add	r8, r7, #188
	add	r2, r6, #124
.L63:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r8
	bne	.L63
	add	r2, r7, #190
.L64:
	strh	r3, [r4]	@ movhi
	add	r4, r4, #480
	cmp	r4, r2
	bne	.L64
	mov	r2, #0
	mov	r3, lr
	add	lr, r7, #214
.L65:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L65
	add	lr, r7, #216
	add	r3, r6, #152
.L66:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L66
	add	r4, r5, #92
	mov	r2, r4
	mov	r7, #142
	ldr	lr, .L172+4
.L67:
	sub	r3, r2, #5760
.L68:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L68
	add	r7, r7, #1
	cmp	r7, #146
	add	r2, r3, #2
	bne	.L67
	mov	r3, #0
	add	r2, r6, #220
	add	lr, r6, #228
.L70:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r7]	@ movhi
	bne	.L70
	mov	r3, r4
	mov	r2, #0
	add	r5, r5, #100
.L71:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r4]	@ movhi
	bne	.L71
	mov	r3, #0
	add	r5, r1, #38656
	add	r4, r5, #24
	add	r2, r6, #216
.L72:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r4
	bne	.L72
	add	r2, r6, #218
	add	r4, r5, #26
.L73:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L73
	mov	r4, #0
	add	r2, r6, #226
	add	r3, r5, #34
.L74:
	strh	r4, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r3, r2
	bne	.L74
	mov	r3, lr
	add	r2, r5, #36
.L75:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L75
	add	r4, r1, #43776
	add	r5, r4, #110
	mov	r2, r5
	mov	lr, #25
	mov	r6, #103
.L76:
	sub	r3, r2, #2880
.L77:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L77
	add	r6, r6, #1
	cmp	r6, #107
	add	r2, r2, #2
	bne	.L76
	mov	lr, #31
	add	r2, r4, #118
	add	r6, r4, #136
.L79:
	sub	r3, r2, #2880
.L80:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L80
	add	r2, r2, #2
	cmp	r6, r2
	bne	.L79
	mov	r2, #0
	add	r3, r0, #78
	add	r7, r0, #104
.L82:
	strh	r2, [r3]	@ movhi
	add	lr, r3, #480
	add	r3, r3, #2
	cmp	r7, r3
	strh	r2, [lr]	@ movhi
	bne	.L82
	mov	r2, #0
	mov	r3, r5
.L83:
	strh	r2, [r3]	@ movhi
	add	lr, r3, #480
	add	r3, r3, #2
	cmp	r6, r3
	strh	r2, [lr]	@ movhi
	bne	.L83
	mov	r2, #0
	add	r9, r1, #40960
	add	r3, r9, #42
	add	lr, r4, #106
.L84:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L84
	add	r3, r9, #44
	add	lr, r4, #108
.L85:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L85
	mov	r2, #0
	add	r3, r9, #72
.L86:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L86
	add	r3, r9, #74
	add	lr, r4, #138
.L87:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L87
	add	r8, r4, #150
	mov	r2, r8
	mov	lr, #25
	add	r7, r4, #176
.L88:
	sub	r3, r2, #2880
.L89:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L89
	add	r2, r2, #2
	cmp	r7, r2
	bne	.L88
	mov	r7, #31
	add	r2, r4, #174
	add	lr, r4, #184
.L91:
	sub	r3, r2, #2880
.L92:
	strh	r7, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L92
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L91
	mov	r3, #0
	add	r0, r0, #118
.L94:
	strh	r3, [r0]	@ movhi
	add	r2, r0, #480
	add	r0, r0, #2
	cmp	r0, ip
	strh	r3, [r2]	@ movhi
	bne	.L94
	mov	r2, #0
	mov	r3, r8
.L95:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r0]	@ movhi
	bne	.L95
	mov	r2, #0
	add	r3, r9, #82
	add	r0, r4, #146
.L96:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L96
	add	r3, r9, #84
	add	r0, r4, #148
.L97:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L97
	mov	r2, #0
	add	r3, r9, #120
.L98:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L98
	add	r9, r9, #122
	add	r3, r4, #186
.L99:
	strh	r2, [r9]	@ movhi
	add	r9, r9, #480
	cmp	r3, r9
	bne	.L99
	ldr	r2, .L172+12
	add	r3, r4, #100
.L100:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r0]	@ movhi
	bne	.L100
	mov	r3, r6
	ldr	r2, .L172+12
.L101:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r0]	@ movhi
	bne	.L101
	mov	r3, lr
	ldr	r2, .L172+12
	add	r4, r4, #194
.L102:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r4, r3
	strh	r2, [r0]	@ movhi
	bne	.L102
	ldr	r3, .L172+16
	add	r7, r1, #28672
	add	r0, r7, #840
	add	r2, r7, #1312
	add	lr, r7, #360
	add	ip, r1, #30464
	strh	r3, [lr, #2]	@ movhi
	add	r6, r1, #28928
	strh	r3, [r0, #2]	@ movhi
	add	r5, r1, #30720
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [ip, #10]	@ movhi
	add	r0, r6, #108
	add	r2, r5, #236
.L103:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L103
	mov	r3, #0
	add	r2, r7, #364
	strh	r3, [r2, #2]	@ movhi
	add	r0, r7, #844
	add	r2, r7, #1312
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [ip, #14]	@ movhi
	add	r0, r6, #112
	add	r2, r5, #240
.L104:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L104
	mov	r3, #0
	add	r2, r5, #234
	add	ip, r5, #242
.L105:
	strh	r3, [r2]	@ movhi
	add	r0, r2, #480
	add	r2, r2, #2
	cmp	ip, r2
	strh	r3, [r0]	@ movhi
	bne	.L105
	add	ip, r1, #33792
	add	lr, ip, #42
	mov	r2, lr
	mov	r4, #117
	ldr	r0, .L172+20
.L106:
	sub	r3, r2, #1920
.L107:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L107
	add	r4, r4, #1
	cmp	r4, #121
	add	r2, r3, #2
	bne	.L106
	ldr	r3, .L172+16
	add	r2, r7, #380
	strh	r3, [r2, #2]	@ movhi
	add	r4, r7, #860
	add	r0, r7, #1328
	add	r2, r7, #1808
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	add	r0, r6, #128
	add	r4, r1, #30976
.L109:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r4
	bne	.L109
	mov	r3, #0
	add	r2, r7, #384
	strh	r3, [r2, #2]	@ movhi
	add	r0, r7, #864
	add	r2, r7, #1344
	add	r7, r7, #1824
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	add	r2, r6, #132
	add	r0, r4, #4
.L110:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L110
	mov	r0, #0
	add	r3, r5, #254
	add	r2, r4, #6
.L111:
	strh	r0, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	r3, r2
	strh	r0, [r4]	@ movhi
	bne	.L111
	mov	r4, #127
	ldr	r0, .L172+20
	add	r2, ip, #62
.L112:
	sub	r3, r2, #1920
.L113:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L113
	add	r4, r4, #1
	cmp	r4, #131
	add	r2, r2, #2
	bne	.L112
	mov	r0, #0
	add	r2, r1, #34560
	add	r3, r2, #244
	add	r2, r2, #254
.L115:
	strh	r0, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r0, [r1]	@ movhi
	bne	.L115
	ldr	r2, .L172+12
	add	r3, ip, #34
.L116:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r1]	@ movhi
	bne	.L116
	ldr	r2, .L172+12
	add	r3, ip, #70
	add	ip, ip, #78
.L117:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L117
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L173:
	.align	2
.L172:
	.word	.LANCHOR0
	.word	21023
	.word	15646
	.word	10392
	.word	32767
	.word	29189
	.size	drawFrame1, .-drawFrame1
	.align	2
	.global	drawFrame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame2, %function
drawFrame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L280
	ldr	r0, [r3]
	add	r1, r0, #41472
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r1, #8
	mov	r2, r4
	ldr	lr, .L280+4
	add	ip, r1, #88
.L175:
	sub	r3, r2, #16320
.L176:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L176
	add	r2, r2, #2
	cmp	r2, ip
	bne	.L175
	add	r6, r0, #24576
	add	r5, r6, #104
	mov	r2, r5
	mov	r3, #0
	add	lr, r6, #184
.L178:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r2, lr
	strh	r3, [r7]	@ movhi
	bne	.L178
	mov	r3, r4
	mov	r2, #0
.L179:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r4]	@ movhi
	bne	.L179
	mov	r3, #0
	add	r4, r0, #42240
	add	r7, r4, #198
	add	r2, r6, #102
.L180:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r7, r2
	bne	.L180
	add	r2, r4, #200
.L181:
	strh	r3, [r5]	@ movhi
	add	r5, r5, #480
	cmp	r5, r2
	bne	.L181
	mov	r2, #0
	mov	r3, lr
	add	lr, r0, #42496
	add	r4, lr, #24
.L182:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L182
	add	lr, lr, #26
	add	r3, r6, #186
.L183:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L183
	ldr	lr, .L280+8
	add	r2, r1, #10
	add	r4, r1, #24
.L184:
	sub	r3, r2, #15808
	sub	r3, r3, #32
.L185:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L185
	add	r2, r3, #2
	cmp	r2, r4
	bne	.L184
	ldr	r5, .L280+8
	add	lr, r6, #1072
	add	r8, r6, #1552
	add	r2, r0, #36864
	strh	r5, [lr, #8]	@ movhi
	add	r4, r2, #3664
	strh	r5, [r8, #8]	@ movhi
	strh	r5, [lr, #10]	@ movhi
	add	lr, r0, #40960
	strh	r5, [r8, #10]	@ movhi
	strh	r5, [r4, #8]	@ movhi
	add	r8, r6, #1136
	strh	r5, [lr, #56]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	add	r4, r6, #1616
	strh	r5, [lr, #58]	@ movhi
	ldr	r3, .L280+12
	strh	r5, [r8, #4]	@ movhi
	add	r7, r0, #37376
	strh	r5, [r4, #4]	@ movhi
	strh	r5, [r8, #6]	@ movhi
	strh	r5, [r4, #6]	@ movhi
	add	r4, r2, #3728
	strh	r5, [r4, #4]	@ movhi
	add	r6, r6, #1056
	strh	r5, [lr, #116]	@ movhi
	add	r7, r7, #254
	strh	r5, [r4, #6]	@ movhi
	add	r4, r0, #26112
	strh	r5, [lr, #118]	@ movhi
	strh	r3, [r6, #10]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	strh	r3, [r6, #12]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	mov	r4, r7
	add	r2, r2, #3648
	strh	r3, [r2, #10]	@ movhi
	add	r6, r0, #37632
	strh	r3, [lr, #42]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r3, [lr, #44]	@ movhi
	add	r2, r6, #10
.L187:
	sub	r3, r4, #5760
.L188:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L188
	add	r4, r3, #2
	cmp	r4, r2
	bne	.L187
	ldr	r4, .L280+4
	add	r8, r6, #22
.L190:
	sub	r3, r2, #5760
.L191:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L191
	add	r2, r3, #2
	cmp	r2, r8
	bne	.L190
	add	r5, r0, #31744
	add	r9, r5, #126
	mov	r2, r9
	mov	r3, #0
	add	r4, r5, #150
.L193:
	strh	r3, [r2]	@ movhi
	add	r10, r2, #480
	add	r2, r2, #2
	cmp	r2, r4
	strh	r3, [r10]	@ movhi
	bne	.L193
	mov	r3, r7
	mov	r2, #0
.L194:
	strh	r2, [r3]	@ movhi
	add	r7, r3, #480
	add	r3, r3, #2
	cmp	r3, r8
	strh	r2, [r7]	@ movhi
	bne	.L194
	mov	r3, #0
	add	r7, r0, #38400
	add	r8, r7, #188
	add	r2, r5, #124
.L195:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r8
	bne	.L195
	add	r2, r7, #190
.L196:
	strh	r3, [r9]	@ movhi
	add	r9, r9, #480
	cmp	r2, r9
	bne	.L196
	mov	r2, #0
	mov	r3, r4
	add	r4, r7, #214
.L197:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L197
	add	r4, r7, #216
	add	r3, r5, #152
.L198:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L198
	add	r8, r6, #92
	mov	r2, r8
	mov	r7, #142
	ldr	r4, .L280+4
.L199:
	sub	r3, r2, #5760
.L200:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L200
	add	r7, r7, #1
	cmp	r7, #146
	add	r2, r2, #2
	bne	.L199
	mov	r3, #0
	add	r2, r5, #220
	add	r4, r5, #228
.L202:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r4, r2
	strh	r3, [r7]	@ movhi
	bne	.L202
	mov	r3, r8
	mov	r2, #0
	add	r6, r6, #100
.L203:
	strh	r2, [r3]	@ movhi
	add	r7, r3, #480
	add	r3, r3, #2
	cmp	r6, r3
	strh	r2, [r7]	@ movhi
	bne	.L203
	mov	r3, #0
	add	r7, r0, #38656
	add	r6, r7, #24
	add	r2, r5, #216
.L204:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L204
	add	r2, r5, #218
	add	r6, r7, #26
.L205:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L205
	mov	r6, #0
	add	r2, r5, #226
	add	r3, r7, #34
.L206:
	strh	r6, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r3, r2
	bne	.L206
	mov	r3, r4
	add	r2, r7, #36
.L207:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L207
	add	r4, r0, #43776
	add	r5, r4, #110
	mov	r2, r5
	mov	r6, #25
	mov	r7, #103
.L208:
	sub	r3, r2, #1920
.L209:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L209
	add	r7, r7, #1
	cmp	r7, #107
	add	r2, r2, #2
	bne	.L208
	mov	r6, #31
	add	r2, r4, #118
	add	r7, r4, #136
.L211:
	sub	r3, r2, #1920
.L212:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L212
	add	r2, r2, #2
	cmp	r7, r2
	bne	.L211
	mov	r2, #0
	add	r3, r1, #14
	add	r8, r1, #40
.L214:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r6]	@ movhi
	bne	.L214
	mov	r2, #0
	mov	r3, r5
.L215:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r7, r3
	strh	r2, [r6]	@ movhi
	bne	.L215
	mov	r2, #0
	add	r6, lr, #1000
	add	r3, lr, #1952
	add	r8, lr, #1472
	strh	r2, [r6, #2]	@ movhi
	strh	r2, [r8, #10]	@ movhi
	add	r6, lr, #2432
	strh	r2, [r3, #10]	@ movhi
	add	r3, r0, #41728
	strh	r2, [r6, #10]	@ movhi
	add	r3, r3, #236
	add	r6, r4, #108
.L216:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L216
	mov	r2, #0
	add	r8, r0, #41984
	add	r6, lr, #1984
	add	r3, lr, #2464
	add	r9, lr, #1504
	strh	r2, [r8, #8]	@ movhi
	strh	r2, [r9, #8]	@ movhi
	strh	r2, [r6, #8]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	r6, r4, #138
	add	r3, r8, #10
.L217:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L217
	add	r9, r4, #150
	mov	r2, r9
	mov	r6, #25
	add	r10, r4, #176
.L218:
	sub	r3, r2, #1920
.L219:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L219
	add	r2, r2, #2
	cmp	r10, r2
	bne	.L218
	mov	r6, #31
	add	r2, r4, #174
	add	r10, r4, #184
.L221:
	sub	r3, r2, #1920
.L222:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L222
	add	r2, r2, #2
	cmp	r2, r10
	bne	.L221
	mov	r3, #0
	add	r1, r1, #54
.L224:
	strh	r3, [r1]	@ movhi
	add	r2, r1, #480
	add	r1, r1, #2
	cmp	r1, ip
	strh	r3, [r2]	@ movhi
	bne	.L224
	mov	r2, #0
	mov	r3, r9
.L225:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, r10
	strh	r2, [r1]	@ movhi
	bne	.L225
	mov	r2, #0
	add	r3, lr, #1040
	strh	r2, [r3, #2]	@ movhi
	add	r1, lr, #2000
	add	r3, lr, #2480
	add	ip, lr, #1520
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r1, r4, #148
	add	r3, r8, #20
.L226:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L226
	mov	r3, #0
	add	r2, lr, #1072
	strh	r3, [r2, #8]	@ movhi
	add	r1, lr, #1552
	add	r2, lr, #2032
	add	lr, lr, #2512
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	add	r8, r8, #58
	add	r2, r4, #186
.L227:
	strh	r3, [r8]	@ movhi
	add	r8, r8, #480
	cmp	r8, r2
	bne	.L227
	ldr	r2, .L280+12
	add	r3, r4, #100
.L228:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r1]	@ movhi
	bne	.L228
	ldr	r3, .L280+12
.L229:
	strh	r3, [r7]	@ movhi
	add	r2, r7, #480
	add	r7, r7, #2
	cmp	r9, r7
	strh	r3, [r2]	@ movhi
	bne	.L229
	mov	r3, r10
	ldr	r2, .L280+12
	add	r4, r4, #194
.L230:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r4, r3
	strh	r2, [r1]	@ movhi
	bne	.L230
	add	ip, r0, #32768
	ldr	r2, .L280+12
	add	r3, ip, #106
	add	lr, ip, #114
.L231:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, lr
	strh	r2, [r1]	@ movhi
	bne	.L231
	ldr	r2, .L280+12
	add	r3, ip, #126
	add	ip, ip, #134
.L232:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L232
	mov	r2, #0
	add	ip, r0, #35584
	add	r3, ip, #180
	add	ip, ip, #190
.L233:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L233
	add	ip, r0, #34560
	ldr	r2, .L280+12
	add	r3, ip, #226
	add	ip, ip, #234
.L234:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L234
	add	r2, r0, #34816
	ldr	r1, .L280+12
	add	r3, r2, #6
	add	r2, r2, #14
.L235:
	strh	r1, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r1, [r0]	@ movhi
	bne	.L235
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L281:
	.align	2
.L280:
	.word	.LANCHOR0
	.word	21023
	.word	15646
	.word	10392
	.size	drawFrame2, .-drawFrame2
	.align	2
	.global	drawFrame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame3, %function
drawFrame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L396
	ldr	r0, [r3]
	add	r1, r0, #41472
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r4, r1, #8
	mov	r2, r4
	ldr	lr, .L396+4
	add	ip, r1, #88
.L283:
	sub	r3, r2, #16320
.L284:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L284
	add	r2, r2, #2
	cmp	r2, ip
	bne	.L283
	add	r6, r0, #24576
	add	r5, r6, #104
	mov	r2, r5
	mov	r3, #0
	add	lr, r6, #184
.L286:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r2, lr
	strh	r3, [r7]	@ movhi
	bne	.L286
	mov	r3, r4
	mov	r2, #0
.L287:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r4]	@ movhi
	bne	.L287
	mov	r3, #0
	add	r4, r0, #42240
	add	r7, r4, #198
	add	r2, r6, #102
.L288:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r7, r2
	bne	.L288
	add	r2, r4, #200
.L289:
	strh	r3, [r5]	@ movhi
	add	r5, r5, #480
	cmp	r5, r2
	bne	.L289
	mov	r2, #0
	mov	r3, lr
	add	lr, r0, #42496
	add	r4, lr, #24
.L290:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L290
	add	lr, lr, #26
	add	r3, r6, #186
.L291:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L291
	ldr	lr, .L396+8
	add	r2, r1, #10
	add	r4, r1, #24
.L292:
	sub	r3, r2, #15808
	sub	r3, r3, #32
.L293:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L293
	add	r2, r3, #2
	cmp	r2, r4
	bne	.L292
	ldr	r5, .L396+8
	add	lr, r6, #1072
	add	r7, r6, #1552
	add	r2, r0, #36864
	strh	r5, [lr, #8]	@ movhi
	add	r4, r2, #3664
	strh	r5, [r7, #8]	@ movhi
	strh	r5, [lr, #10]	@ movhi
	add	lr, r0, #40960
	strh	r5, [r7, #10]	@ movhi
	strh	r5, [r4, #8]	@ movhi
	add	r7, r6, #1136
	strh	r5, [lr, #56]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	add	r4, r6, #1616
	strh	r5, [lr, #58]	@ movhi
	ldr	r3, .L396+12
	strh	r5, [r7, #4]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	strh	r5, [r7, #6]	@ movhi
	strh	r5, [r4, #6]	@ movhi
	add	r4, r2, #3728
	strh	r5, [r4, #4]	@ movhi
	add	r6, r6, #1056
	strh	r5, [lr, #116]	@ movhi
	add	r8, r0, #38400
	strh	r5, [r4, #6]	@ movhi
	add	r4, r0, #26112
	strh	r5, [lr, #118]	@ movhi
	strh	r3, [r6, #10]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	strh	r3, [r6, #12]	@ movhi
	add	r6, r8, #190
	strh	r3, [r4, #12]	@ movhi
	mov	r4, r6
	add	r2, r2, #3648
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [lr, #42]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r3, [lr, #44]	@ movhi
	add	r2, r8, #202
.L295:
	sub	r3, r4, #5760
.L296:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L296
	add	r4, r3, #2
	cmp	r4, r2
	bne	.L295
	ldr	r4, .L396+4
	add	r8, r8, #214
.L298:
	sub	r3, r2, #5760
.L299:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L299
	add	r2, r3, #2
	cmp	r2, r8
	bne	.L298
	add	r4, r0, #32768
	add	r7, r4, #62
	mov	r2, r7
	mov	r3, #0
	add	r5, r4, #86
.L301:
	strh	r3, [r2]	@ movhi
	add	r9, r2, #480
	add	r2, r2, #2
	cmp	r2, r5
	strh	r3, [r9]	@ movhi
	bne	.L301
	mov	r3, r6
	mov	r2, #0
.L302:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r3, r8
	strh	r2, [r6]	@ movhi
	bne	.L302
	mov	r3, #0
	add	r6, r0, #39424
	add	r8, r6, #124
	add	r2, r4, #60
.L303:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r8, r2
	bne	.L303
	add	r2, r6, #126
.L304:
	strh	r3, [r7]	@ movhi
	add	r7, r7, #480
	cmp	r7, r2
	bne	.L304
	mov	r2, #0
	mov	r3, r5
	add	r5, r6, #150
.L305:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r5
	bne	.L305
	add	r3, r4, #88
	add	r5, r6, #152
.L306:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r5, r3
	bne	.L306
	add	r9, r0, #38656
	add	r8, r9, #28
	mov	r2, r8
	mov	r7, #142
	ldr	r5, .L396+4
.L307:
	sub	r3, r2, #5760
.L308:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L308
	add	r7, r7, #1
	cmp	r7, #146
	add	r2, r2, #2
	bne	.L307
	mov	r3, #0
	add	r2, r4, #156
	add	r5, r4, #164
.L310:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r5, r2
	strh	r3, [r7]	@ movhi
	bne	.L310
	mov	r3, r8
	mov	r2, #0
	add	r9, r9, #36
.L311:
	strh	r2, [r3]	@ movhi
	add	r7, r3, #480
	add	r3, r3, #2
	cmp	r9, r3
	strh	r2, [r7]	@ movhi
	bne	.L311
	mov	r3, #0
	add	r2, r4, #152
	add	r7, r6, #216
.L312:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r7, r2
	bne	.L312
	add	r2, r4, #154
	add	r7, r6, #218
.L313:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r7, r2
	bne	.L313
	mov	r7, #0
	add	r2, r4, #162
	add	r3, r6, #226
.L314:
	strh	r7, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r3, r2
	bne	.L314
	mov	r3, r5
	add	r6, r6, #228
.L315:
	strh	r7, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L315
	add	r5, r0, #43776
	add	r6, r5, #110
	mov	r2, r6
	mov	r7, #25
	mov	r8, #103
.L316:
	sub	r3, r2, #1920
.L317:
	strh	r7, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L317
	add	r8, r8, #1
	cmp	r8, #107
	add	r2, r2, #2
	bne	.L316
	mov	r8, #31
	add	r2, r5, #118
	add	r7, r5, #136
.L319:
	sub	r3, r2, #1920
.L320:
	strh	r8, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L320
	add	r2, r2, #2
	cmp	r7, r2
	bne	.L319
	mov	r2, #0
	add	r3, r1, #14
	add	r9, r1, #40
.L322:
	strh	r2, [r3]	@ movhi
	add	r8, r3, #480
	add	r3, r3, #2
	cmp	r9, r3
	strh	r2, [r8]	@ movhi
	bne	.L322
	mov	r2, #0
	mov	r3, r6
.L323:
	strh	r2, [r3]	@ movhi
	add	r8, r3, #480
	add	r3, r3, #2
	cmp	r7, r3
	strh	r2, [r8]	@ movhi
	bne	.L323
	mov	r2, #0
	add	r8, lr, #1000
	add	r3, lr, #1952
	add	r9, lr, #1472
	strh	r2, [r8, #2]	@ movhi
	strh	r2, [r9, #10]	@ movhi
	add	r8, lr, #2432
	strh	r2, [r3, #10]	@ movhi
	add	r3, r0, #41728
	strh	r2, [r8, #10]	@ movhi
	add	r3, r3, #236
	add	r8, r5, #108
.L324:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r8, r3
	bne	.L324
	mov	r2, #0
	add	r8, r0, #41984
	add	r9, lr, #1984
	add	r3, lr, #2464
	add	r10, lr, #1504
	strh	r2, [r8, #8]	@ movhi
	strh	r2, [r10, #8]	@ movhi
	strh	r2, [r9, #8]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	r9, r5, #138
	add	r3, r8, #10
.L325:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r9, r3
	bne	.L325
	add	r9, r5, #150
	mov	r2, r9
	mov	r10, #25
	add	fp, r5, #176
.L326:
	sub	r3, r2, #1920
.L327:
	strh	r10, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L327
	add	r2, r2, #2
	cmp	fp, r2
	bne	.L326
	mov	r10, #31
	add	r2, r5, #174
	add	fp, r5, #184
.L329:
	sub	r3, r2, #1920
.L330:
	strh	r10, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L330
	add	r2, r2, #2
	cmp	fp, r2
	bne	.L329
	mov	r3, #0
	add	r1, r1, #54
.L332:
	strh	r3, [r1]	@ movhi
	add	r2, r1, #480
	add	r1, r1, #2
	cmp	r1, ip
	strh	r3, [r2]	@ movhi
	bne	.L332
	mov	r2, #0
	mov	r3, r9
.L333:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, fp
	strh	r2, [r1]	@ movhi
	bne	.L333
	mov	r2, #0
	add	r3, lr, #1040
	strh	r2, [r3, #2]	@ movhi
	add	r1, lr, #2000
	add	r3, lr, #2480
	add	ip, lr, #1520
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r1, r5, #148
	add	r3, r8, #20
.L334:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L334
	mov	r3, #0
	add	r2, lr, #1072
	strh	r3, [r2, #8]	@ movhi
	add	r1, lr, #1552
	add	r2, lr, #2032
	add	lr, lr, #2512
	strh	r3, [r1, #8]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	add	r8, r8, #58
	add	r2, r5, #186
.L335:
	strh	r3, [r8]	@ movhi
	add	r8, r8, #480
	cmp	r2, r8
	bne	.L335
	ldr	r2, .L396+12
	add	r3, r5, #100
.L336:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r6, r3
	strh	r2, [r1]	@ movhi
	bne	.L336
	ldr	r3, .L396+12
.L337:
	strh	r3, [r7]	@ movhi
	add	r2, r7, #480
	add	r7, r7, #2
	cmp	r9, r7
	strh	r3, [r2]	@ movhi
	bne	.L337
	mov	r3, fp
	ldr	r2, .L396+12
	add	r5, r5, #194
.L338:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, r5
	strh	r2, [r1]	@ movhi
	bne	.L338
	add	r3, r0, #30720
	ldr	r1, .L396+12
	add	r2, r3, #234
	add	lr, r3, #242
.L339:
	strh	r1, [r2]	@ movhi
	add	ip, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r1, [ip]	@ movhi
	bne	.L339
	mov	r1, #0
	add	lr, r0, #31744
	add	r2, lr, #170
	add	r5, lr, #178
.L340:
	strh	r1, [r2]	@ movhi
	add	ip, r2, #480
	add	r2, r2, #2
	cmp	r2, r5
	strh	r1, [ip]	@ movhi
	bne	.L340
	ldr	r1, .L396+12
	add	r2, r4, #106
	add	r5, r4, #114
.L341:
	strh	r1, [r2]	@ movhi
	add	ip, r2, #480
	add	r2, r2, #2
	cmp	r2, r5
	strh	r1, [ip]	@ movhi
	bne	.L341
	add	ip, r0, #30976
	ldr	r2, .L396+12
	add	r3, r3, #254
	add	ip, ip, #6
.L342:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, ip
	strh	r2, [r1]	@ movhi
	bne	.L342
	mov	r2, #0
	add	r3, lr, #190
	add	lr, lr, #198
.L343:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r1]	@ movhi
	bne	.L343
	ldr	r2, .L396+12
	add	r3, r4, #126
	add	r4, r4, #134
.L344:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r4, r3
	strh	r2, [r1]	@ movhi
	bne	.L344
	mov	r2, #0
	add	ip, r0, #35584
	add	r3, ip, #180
	add	ip, ip, #190
.L345:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L345
	add	ip, r0, #34560
	ldr	r2, .L396+12
	add	r3, ip, #226
	add	ip, ip, #234
.L346:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r3, ip
	strh	r2, [r1]	@ movhi
	bne	.L346
	add	r2, r0, #34816
	ldr	r1, .L396+12
	add	r3, r2, #6
	add	r2, r2, #14
.L347:
	strh	r1, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r1, [r0]	@ movhi
	bne	.L347
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L397:
	.align	2
.L396:
	.word	.LANCHOR0
	.word	21023
	.word	15646
	.word	10392
	.size	drawFrame3, .-drawFrame3
	.align	2
	.global	drawFrame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame4, %function
drawFrame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L520
	ldr	r1, [r3]
	add	r0, r1, #41472
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r0, #8
	mov	r2, r4
	ldr	lr, .L520+4
	add	ip, r0, #88
.L399:
	sub	r3, r2, #16320
.L400:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L400
	add	r2, r3, #2
	cmp	r2, ip
	bne	.L399
	add	r6, r1, #24576
	add	r5, r6, #104
	mov	r2, r5
	mov	r3, #0
	add	lr, r6, #184
.L402:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r2, lr
	strh	r3, [r7]	@ movhi
	bne	.L402
	mov	r3, r4
	mov	r2, #0
.L403:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	r3, ip
	strh	r2, [r4]	@ movhi
	bne	.L403
	mov	r3, #0
	add	r4, r1, #42240
	add	r7, r4, #198
	add	r2, r6, #102
.L404:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r7
	bne	.L404
	add	r2, r4, #200
.L405:
	strh	r3, [r5]	@ movhi
	add	r5, r5, #480
	cmp	r5, r2
	bne	.L405
	mov	r2, #0
	mov	r3, lr
	add	lr, r1, #42496
	add	r4, lr, #24
.L406:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L406
	add	lr, lr, #26
	add	r3, r6, #186
.L407:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L407
	ldr	lr, .L520+8
	add	r2, r0, #10
	add	r4, r0, #24
.L408:
	sub	r3, r2, #15808
	sub	r3, r3, #32
.L409:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L409
	add	r2, r3, #2
	cmp	r2, r4
	bne	.L408
	ldr	r5, .L520+8
	add	lr, r6, #1072
	add	r7, r6, #1552
	add	r2, r1, #36864
	strh	r5, [lr, #8]	@ movhi
	add	r4, r2, #3664
	strh	r5, [r7, #8]	@ movhi
	strh	r5, [lr, #10]	@ movhi
	add	lr, r1, #40960
	strh	r5, [r7, #10]	@ movhi
	strh	r5, [r4, #8]	@ movhi
	add	r7, r6, #1136
	strh	r5, [lr, #56]	@ movhi
	strh	r5, [r4, #10]	@ movhi
	add	r4, r6, #1616
	strh	r5, [lr, #58]	@ movhi
	ldr	r3, .L520+12
	strh	r5, [r7, #4]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	strh	r5, [r7, #6]	@ movhi
	strh	r5, [r4, #6]	@ movhi
	add	r4, r2, #3728
	strh	r5, [r4, #4]	@ movhi
	add	r6, r6, #1056
	strh	r5, [lr, #116]	@ movhi
	add	r8, r1, #38400
	strh	r5, [r4, #6]	@ movhi
	add	r4, r1, #26112
	strh	r5, [lr, #118]	@ movhi
	strh	r3, [r6, #10]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	strh	r3, [r6, #12]	@ movhi
	add	r6, r8, #190
	strh	r3, [r4, #12]	@ movhi
	mov	r4, r6
	add	r2, r2, #3648
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [lr, #42]	@ movhi
	strh	r3, [r2, #12]	@ movhi
	strh	r3, [lr, #44]	@ movhi
	add	r2, r8, #202
.L411:
	sub	r3, r4, #5760
.L412:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L412
	add	r4, r4, #2
	cmp	r4, r2
	bne	.L411
	ldr	r4, .L520+4
	add	r8, r8, #214
.L414:
	sub	r3, r2, #5760
.L415:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L415
	add	r2, r2, #2
	cmp	r2, r8
	bne	.L414
	add	r5, r1, #32768
	add	r7, r5, #62
	mov	r2, r7
	mov	r3, #0
	add	r4, r5, #86
.L417:
	strh	r3, [r2]	@ movhi
	add	r9, r2, #480
	add	r2, r2, #2
	cmp	r4, r2
	strh	r3, [r9]	@ movhi
	bne	.L417
	mov	r3, r6
	mov	r2, #0
.L418:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r6]	@ movhi
	bne	.L418
	mov	r3, #0
	add	r6, r1, #39424
	add	r8, r6, #124
	add	r2, r5, #60
.L419:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r8
	bne	.L419
	add	r2, r6, #126
.L420:
	strh	r3, [r7]	@ movhi
	add	r7, r7, #480
	cmp	r2, r7
	bne	.L420
	mov	r2, #0
	mov	r3, r4
	add	r4, r6, #150
.L421:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L421
	add	r3, r5, #88
	add	r4, r6, #152
.L422:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L422
	add	r9, r1, #38656
	add	r8, r9, #28
	mov	r2, r8
	mov	r7, #142
	ldr	r4, .L520+4
.L423:
	sub	r3, r2, #5760
.L424:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L424
	add	r7, r7, #1
	cmp	r7, #146
	add	r2, r2, #2
	bne	.L423
	mov	r3, #0
	add	r2, r5, #156
	add	r4, r5, #164
.L426:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	r4, r2
	strh	r3, [r7]	@ movhi
	bne	.L426
	mov	r3, r8
	mov	r2, #0
	add	r9, r9, #36
.L427:
	strh	r2, [r3]	@ movhi
	add	r7, r3, #480
	add	r3, r3, #2
	cmp	r3, r9
	strh	r2, [r7]	@ movhi
	bne	.L427
	mov	r3, #0
	add	r2, r5, #152
	add	r7, r6, #216
.L428:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r7
	bne	.L428
	add	r2, r5, #154
	add	r7, r6, #218
.L429:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r7, r2
	bne	.L429
	mov	r7, #0
	add	r2, r5, #162
	add	r3, r6, #226
.L430:
	strh	r7, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r3
	bne	.L430
	mov	r3, r4
	add	r6, r6, #228
.L431:
	strh	r7, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L431
	add	r4, r1, #43776
	add	r5, r4, #110
	mov	r2, r5
	mov	r6, #25
	mov	r7, #103
.L432:
	sub	r3, r2, #1920
.L433:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L433
	add	r7, r7, #1
	cmp	r7, #107
	add	r2, r2, #2
	bne	.L432
	mov	r6, #31
	add	r2, r4, #118
	add	r7, r4, #136
.L435:
	sub	r3, r2, #1920
.L436:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L436
	add	r2, r2, #2
	cmp	r2, r7
	bne	.L435
	mov	r2, #0
	add	r3, r0, #14
	add	r8, r0, #40
.L438:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r6]	@ movhi
	bne	.L438
	mov	r2, #0
	mov	r3, r5
.L439:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r3, r7
	strh	r2, [r6]	@ movhi
	bne	.L439
	mov	r2, #0
	add	r6, lr, #1000
	add	r3, lr, #1952
	add	r8, lr, #1472
	strh	r2, [r6, #2]	@ movhi
	strh	r2, [r8, #10]	@ movhi
	add	r6, lr, #2432
	strh	r2, [r3, #10]	@ movhi
	add	r3, r1, #41728
	strh	r2, [r6, #10]	@ movhi
	add	r3, r3, #236
	add	r6, r4, #108
.L440:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L440
	mov	r2, #0
	add	r8, r1, #41984
	add	r6, lr, #1984
	add	r3, lr, #2464
	add	r9, lr, #1504
	strh	r2, [r8, #8]	@ movhi
	strh	r2, [r9, #8]	@ movhi
	strh	r2, [r6, #8]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	add	r6, r4, #138
	add	r3, r8, #10
.L441:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r6
	bne	.L441
	add	r9, r4, #150
	mov	r2, r9
	mov	r6, #25
	add	r10, r4, #176
.L442:
	sub	r3, r2, #1920
.L443:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L443
	add	r2, r2, #2
	cmp	r10, r2
	bne	.L442
	mov	r6, #31
	add	r2, r4, #174
	add	r10, r4, #184
.L445:
	sub	r3, r2, #1920
.L446:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L446
	add	r2, r3, #2
	cmp	r10, r2
	bne	.L445
	mov	r3, #0
	add	r0, r0, #54
.L448:
	strh	r3, [r0]	@ movhi
	add	r2, r0, #480
	add	r0, r0, #2
	cmp	r0, ip
	strh	r3, [r2]	@ movhi
	bne	.L448
	mov	r2, #0
	mov	r3, r9
.L449:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r10, r3
	strh	r2, [r0]	@ movhi
	bne	.L449
	mov	r2, #0
	add	r3, lr, #1040
	strh	r2, [r3, #2]	@ movhi
	add	r0, lr, #2000
	add	r3, lr, #2480
	add	ip, lr, #1520
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r0, r4, #148
	add	r3, r8, #20
.L450:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L450
	mov	r3, #0
	add	r2, lr, #1072
	strh	r3, [r2, #8]	@ movhi
	add	r0, lr, #1552
	add	r2, lr, #2032
	add	lr, lr, #2512
	strh	r3, [r0, #8]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	add	r8, r8, #58
	add	r2, r4, #186
.L451:
	strh	r3, [r8]	@ movhi
	add	r8, r8, #480
	cmp	r8, r2
	bne	.L451
	ldr	r2, .L520+12
	add	r3, r4, #100
.L452:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r0]	@ movhi
	bne	.L452
	ldr	r3, .L520+12
.L453:
	strh	r3, [r7]	@ movhi
	add	r2, r7, #480
	add	r7, r7, #2
	cmp	r9, r7
	strh	r3, [r2]	@ movhi
	bne	.L453
	mov	r3, r10
	ldr	r2, .L520+12
	add	r4, r4, #194
.L454:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r3, r4
	strh	r2, [r0]	@ movhi
	bne	.L454
	ldr	r3, .L520+16
	add	r7, r1, #28672
	add	r0, r7, #2272
	add	r2, r7, #2752
	add	lr, r7, #1312
	add	ip, r1, #30464
	add	r6, r1, #29952
	add	r5, r1, #31744
	strh	r3, [lr, #10]	@ movhi
	strh	r3, [ip, #10]	@ movhi
	strh	r3, [r0, #10]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	add	r0, r5, #172
	add	r2, r6, #44
.L455:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r0
	bne	.L455
	mov	r3, #0
	add	r2, r7, #1312
	strh	r3, [r2, #14]	@ movhi
	add	r0, r7, #2272
	add	r2, r7, #2752
	strh	r3, [ip, #14]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	add	r0, r5, #176
	add	r2, r6, #48
.L456:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L456
	mov	r2, #0
	add	r3, r5, #170
	add	ip, r5, #178
.L457:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r3, ip
	strh	r2, [r0]	@ movhi
	bne	.L457
	add	ip, r1, #34560
	add	lr, ip, #234
	mov	r2, lr
	mov	r4, #117
	ldr	r0, .L520+20
.L458:
	sub	r3, r2, #1920
.L459:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L459
	add	r4, r4, #1
	cmp	r4, #121
	add	r2, r3, #2
	bne	.L458
	ldr	r3, .L520+16
	add	r2, r7, #1328
	strh	r3, [r2, #14]	@ movhi
	add	r0, r7, #2288
	add	r2, r7, #2768
	add	r4, r7, #1808
	strh	r3, [r4, #14]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	add	r0, r5, #192
	add	r2, r6, #64
.L461:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r0
	bne	.L461
	mov	r2, #0
	add	r3, r7, #1344
	strh	r2, [r3, #2]	@ movhi
	add	r0, r7, #1824
	add	r3, r1, #30976
	add	r7, r7, #2784
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	add	r3, r6, #68
	add	r0, r5, #196
.L462:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r0
	bne	.L462
	mov	r0, #0
	add	r3, r5, #190
	add	r2, r5, #198
.L463:
	strh	r0, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r0, [r4]	@ movhi
	bne	.L463
	mov	r4, #127
	ldr	r0, .L520+20
	add	r2, ip, #254
.L464:
	sub	r3, r2, #1920
.L465:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L465
	add	r4, r4, #1
	cmp	r4, #131
	add	r2, r3, #2
	bne	.L464
	mov	r2, #0
	add	r4, r1, #35584
	add	r3, r4, #180
	add	r4, r4, #190
.L467:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r4, r3
	strh	r2, [r0]	@ movhi
	bne	.L467
	ldr	r2, .L520+12
	add	r3, ip, #226
.L468:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r0]	@ movhi
	bne	.L468
	add	r2, r1, #34816
	ldr	r1, .L520+12
	add	r3, r2, #6
	add	r2, r2, #14
.L469:
	strh	r1, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r1, [r0]	@ movhi
	bne	.L469
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L521:
	.align	2
.L520:
	.word	.LANCHOR0
	.word	21023
	.word	15646
	.word	10392
	.word	32767
	.word	29189
	.size	drawFrame4, .-drawFrame4
	.align	2
	.global	drawFrame5
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame5, %function
drawFrame5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L652
	ldr	r1, [r3]
	add	r0, r1, #40448
	push	{r4, r5, r6, r7, r8, r9, lr}
	add	r4, r0, #72
	mov	r2, r4
	ldr	lr, .L652+4
	add	ip, r0, #152
.L523:
	sub	r3, r2, #16320
.L524:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L524
	add	r2, r2, #2
	cmp	ip, r2
	bne	.L523
	add	r5, r1, #23552
	add	r6, r5, #168
	mov	r2, r6
	mov	r3, #0
	add	lr, r5, #248
.L526:
	strh	r3, [r2]	@ movhi
	add	r7, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r7]	@ movhi
	bne	.L526
	mov	r3, r4
	mov	r2, #0
.L527:
	strh	r2, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r4]	@ movhi
	bne	.L527
	mov	r3, #0
	add	r4, r1, #41472
	add	r7, r4, #6
	add	r2, r5, #166
.L528:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r7
	bne	.L528
	add	r2, r4, #8
.L529:
	strh	r3, [r6]	@ movhi
	add	r6, r6, #480
	cmp	r2, r6
	bne	.L529
	mov	r2, #0
	mov	r3, lr
	add	lr, r4, #88
.L530:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L530
	add	r3, r5, #250
	add	lr, r4, #90
.L531:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L531
	ldr	lr, .L652+8
	add	r2, r0, #74
	add	r4, r0, #88
.L532:
	sub	r3, r2, #15808
	sub	r3, r3, #32
.L533:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L533
	add	r2, r2, #2
	cmp	r4, r2
	bne	.L532
	ldr	r4, .L652+8
	add	r3, r1, #24576
	add	r2, r1, #36864
	add	r6, r3, #600
	strh	r4, [r3, #120]	@ movhi
	add	r5, r2, #2704
	strh	r4, [r6]	@ movhi
	strh	r4, [r3, #122]	@ movhi
	strh	r4, [r6, #2]	@ movhi
	add	r6, r2, #3184
	strh	r4, [r5, #8]	@ movhi
	strh	r4, [r6, #8]	@ movhi
	strh	r4, [r5, #10]	@ movhi
	add	r5, r3, #660
	strh	r4, [r6, #10]	@ movhi
	ldr	lr, .L652+12
	strh	r4, [r3, #180]	@ movhi
	add	r6, r2, #2768
	strh	r4, [r5]	@ movhi
	strh	r4, [r3, #182]	@ movhi
	strh	r4, [r5, #2]	@ movhi
	add	r5, r2, #3248
	strh	r4, [r6, #4]	@ movhi
	strh	r4, [r5, #4]	@ movhi
	strh	r4, [r6, #6]	@ movhi
	strh	r4, [r5, #6]	@ movhi
	add	r5, r3, #584
	strh	lr, [r3, #106]	@ movhi
	add	r7, r1, #38400
	strh	lr, [r5, #2]	@ movhi
	add	r5, r3, #588
	strh	lr, [r3, #108]	@ movhi
	strh	lr, [r5]	@ movhi
	add	r3, r2, #2688
	add	r5, r7, #190
	add	r2, r2, #3168
	strh	lr, [r3, #10]	@ movhi
	strh	lr, [r2, #10]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	mov	lr, r5
	add	r2, r7, #202
.L535:
	sub	r3, lr, #5760
.L536:
	strh	r4, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L536
	add	lr, lr, #2
	cmp	r2, lr
	bne	.L535
	ldr	lr, .L652+4
	add	r7, r7, #214
.L538:
	sub	r3, r2, #5760
.L539:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L539
	add	r2, r2, #2
	cmp	r7, r2
	bne	.L538
	add	r4, r1, #32768
	add	r6, r4, #62
	mov	r2, r6
	mov	r3, #0
	add	lr, r4, #86
.L541:
	strh	r3, [r2]	@ movhi
	add	r8, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r8]	@ movhi
	bne	.L541
	mov	r3, r5
	mov	r2, #0
.L542:
	strh	r2, [r3]	@ movhi
	add	r5, r3, #480
	add	r3, r3, #2
	cmp	r7, r3
	strh	r2, [r5]	@ movhi
	bne	.L542
	mov	r3, #0
	add	r5, r1, #39424
	add	r7, r5, #124
	add	r2, r4, #60
.L543:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r7
	bne	.L543
	add	r2, r5, #126
.L544:
	strh	r3, [r6]	@ movhi
	add	r6, r6, #480
	cmp	r6, r2
	bne	.L544
	mov	r2, #0
	mov	r3, lr
	add	lr, r5, #150
.L545:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L545
	add	r3, r4, #88
	add	lr, r5, #152
.L546:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L546
	add	r8, r1, #38656
	add	r7, r8, #28
	mov	r2, r7
	mov	r6, #142
	ldr	lr, .L652+4
.L547:
	sub	r3, r2, #5760
.L548:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L548
	add	r6, r6, #1
	cmp	r6, #146
	add	r2, r3, #2
	bne	.L547
	mov	r3, #0
	add	r2, r4, #156
	add	lr, r4, #164
.L550:
	strh	r3, [r2]	@ movhi
	add	r6, r2, #480
	add	r2, r2, #2
	cmp	lr, r2
	strh	r3, [r6]	@ movhi
	bne	.L550
	mov	r3, r7
	mov	r2, #0
	add	r8, r8, #36
.L551:
	strh	r2, [r3]	@ movhi
	add	r6, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r6]	@ movhi
	bne	.L551
	mov	r3, #0
	add	r2, r4, #152
	add	r6, r5, #216
.L552:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r6
	bne	.L552
	add	r2, r4, #154
	add	r6, r5, #218
.L553:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L553
	mov	r6, #0
	add	r2, r4, #162
	add	r3, r5, #226
.L554:
	strh	r6, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r3, r2
	bne	.L554
	mov	r3, lr
	add	r5, r5, #228
.L555:
	strh	r6, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r5, r3
	bne	.L555
	add	r4, r1, #43776
	add	r5, r4, #110
	mov	r2, r5
	mov	lr, #25
	mov	r6, #103
.L556:
	sub	r3, r2, #2880
.L557:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L557
	add	r6, r6, #1
	cmp	r6, #107
	add	r2, r2, #2
	bne	.L556
	mov	lr, #31
	add	r2, r4, #118
	add	r6, r4, #136
.L559:
	sub	r3, r2, #2880
.L560:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L560
	add	r2, r2, #2
	cmp	r6, r2
	bne	.L559
	mov	r2, #0
	add	r3, r0, #78
	add	r7, r0, #104
.L562:
	strh	r2, [r3]	@ movhi
	add	lr, r3, #480
	add	r3, r3, #2
	cmp	r7, r3
	strh	r2, [lr]	@ movhi
	bne	.L562
	mov	r2, #0
	mov	r3, r5
.L563:
	strh	r2, [r3]	@ movhi
	add	lr, r3, #480
	add	r3, r3, #2
	cmp	r6, r3
	strh	r2, [lr]	@ movhi
	bne	.L563
	mov	r2, #0
	add	r9, r1, #40960
	add	r3, r9, #42
	add	lr, r4, #106
.L564:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L564
	add	r3, r9, #44
	add	lr, r4, #108
.L565:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L565
	mov	r2, #0
	add	r3, r9, #72
.L566:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r6, r3
	bne	.L566
	add	r3, r9, #74
	add	lr, r4, #138
.L567:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L567
	add	r8, r4, #150
	mov	r2, r8
	mov	lr, #25
	add	r7, r4, #176
.L568:
	sub	r3, r2, #2880
.L569:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L569
	add	r2, r2, #2
	cmp	r7, r2
	bne	.L568
	mov	r7, #31
	add	r2, r4, #174
	add	lr, r4, #184
.L571:
	sub	r3, r2, #2880
.L572:
	strh	r7, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L572
	add	r2, r2, #2
	cmp	lr, r2
	bne	.L571
	mov	r3, #0
	add	r0, r0, #118
.L574:
	strh	r3, [r0]	@ movhi
	add	r2, r0, #480
	add	r0, r0, #2
	cmp	r0, ip
	strh	r3, [r2]	@ movhi
	bne	.L574
	mov	r2, #0
	mov	r3, r8
.L575:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r0]	@ movhi
	bne	.L575
	mov	r2, #0
	add	r3, r9, #82
	add	r0, r4, #146
.L576:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L576
	add	r3, r9, #84
	add	r0, r4, #148
.L577:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L577
	mov	r2, #0
	add	r3, r9, #120
.L578:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L578
	add	r9, r9, #122
	add	r3, r4, #186
.L579:
	strh	r2, [r9]	@ movhi
	add	r9, r9, #480
	cmp	r3, r9
	bne	.L579
	ldr	r2, .L652+12
	add	r3, r4, #100
.L580:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r5, r3
	strh	r2, [r0]	@ movhi
	bne	.L580
	mov	r3, r6
	ldr	r2, .L652+12
.L581:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r8, r3
	strh	r2, [r0]	@ movhi
	bne	.L581
	mov	r3, lr
	ldr	r2, .L652+12
	add	r4, r4, #194
.L582:
	strh	r2, [r3]	@ movhi
	add	r0, r3, #480
	add	r3, r3, #2
	cmp	r4, r3
	strh	r2, [r0]	@ movhi
	bne	.L582
	ldr	r3, .L652+16
	add	r7, r1, #28672
	add	r0, r7, #840
	add	r2, r7, #1312
	add	lr, r7, #360
	add	ip, r1, #30464
	strh	r3, [lr, #2]	@ movhi
	add	r6, r1, #28928
	strh	r3, [r0, #2]	@ movhi
	add	r5, r1, #30720
	strh	r3, [r2, #10]	@ movhi
	strh	r3, [ip, #10]	@ movhi
	add	r0, r6, #108
	add	r2, r5, #236
.L583:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L583
	mov	r3, #0
	add	r2, r7, #364
	strh	r3, [r2, #2]	@ movhi
	add	r0, r7, #844
	add	r2, r7, #1312
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	strh	r3, [ip, #14]	@ movhi
	add	r0, r6, #112
	add	r2, r5, #240
.L584:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L584
	mov	r3, #0
	add	r2, r5, #234
	add	ip, r5, #242
.L585:
	strh	r3, [r2]	@ movhi
	add	r0, r2, #480
	add	r2, r2, #2
	cmp	ip, r2
	strh	r3, [r0]	@ movhi
	bne	.L585
	add	ip, r1, #33792
	add	lr, ip, #42
	mov	r2, lr
	mov	r4, #117
	ldr	r0, .L652+20
.L586:
	sub	r3, r2, #1920
.L587:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L587
	add	r4, r4, #1
	cmp	r4, #121
	add	r2, r3, #2
	bne	.L586
	ldr	r3, .L652+16
	add	r2, r7, #380
	strh	r3, [r2, #2]	@ movhi
	add	r4, r7, #860
	add	r0, r7, #1328
	add	r2, r7, #1808
	strh	r3, [r4, #2]	@ movhi
	strh	r3, [r0, #14]	@ movhi
	strh	r3, [r2, #14]	@ movhi
	add	r0, r6, #128
	add	r4, r1, #30976
.L589:
	strh	r3, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, r4
	bne	.L589
	mov	r3, #0
	add	r2, r7, #384
	strh	r3, [r2, #2]	@ movhi
	add	r0, r7, #864
	add	r2, r7, #1344
	add	r7, r7, #1824
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	add	r2, r6, #132
	add	r0, r4, #4
.L590:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L590
	mov	r0, #0
	add	r3, r5, #254
	add	r2, r4, #6
.L591:
	strh	r0, [r3]	@ movhi
	add	r4, r3, #480
	add	r3, r3, #2
	cmp	r3, r2
	strh	r0, [r4]	@ movhi
	bne	.L591
	mov	r4, #127
	ldr	r0, .L652+20
	add	r2, ip, #62
.L592:
	sub	r3, r2, #1920
.L593:
	strh	r0, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r2, r3
	bne	.L593
	add	r4, r4, #1
	cmp	r4, #131
	add	r2, r2, #2
	bne	.L592
	mov	r0, #0
	add	r2, r1, #34560
	add	r3, r2, #244
	add	r2, r2, #254
.L595:
	strh	r0, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	r2, r3
	strh	r0, [r1]	@ movhi
	bne	.L595
	ldr	r2, .L652+12
	add	r3, ip, #34
.L596:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	lr, r3
	strh	r2, [r1]	@ movhi
	bne	.L596
	ldr	r2, .L652+12
	add	r3, ip, #70
	add	ip, ip, #78
.L597:
	strh	r2, [r3]	@ movhi
	add	r1, r3, #480
	add	r3, r3, #2
	cmp	ip, r3
	strh	r2, [r1]	@ movhi
	bne	.L597
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L653:
	.align	2
.L652:
	.word	.LANCHOR0
	.word	21023
	.word	15646
	.word	10392
	.word	32767
	.word	29189
	.size	drawFrame5, .-drawFrame5
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
