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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #0
	ldr	r3, .L4+4
	ldr	r0, .L4+8
	strh	r0, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	r2, r2, #256
	ldr	r3, .L4+12
	ldrh	r2, [r2, #48]
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	oldButtons
	.word	1027
	.word	buttons
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"button A is pressed\000"
	.align	2
.LC1:
	.ascii	"button B is pressed\000"
	.align	2
.LC2:
	.ascii	"button start is pressed\000"
	.align	2
.LC3:
	.ascii	"button select is pressed\000"
	.align	2
.LC4:
	.ascii	"button left is pressed\000"
	.align	2
.LC5:
	.ascii	"button right is pressed\000"
	.align	2
.LC6:
	.ascii	"button up is pressed\000"
	.align	2
.LC7:
	.ascii	"frame rate went to %d\000"
	.align	2
.LC8:
	.ascii	"button down is pressed\000"
	.text
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L62
	ldrh	r3, [r5]
	tst	r3, #1
	bne	.L49
	ldr	r4, .L62+4
.L7:
	tst	r3, #2
	beq	.L9
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L54
.L9:
	tst	r3, #8
	beq	.L11
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	ands	r6, r2, #8
	beq	.L55
.L11:
	tst	r3, #4
	beq	.L13
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	ands	r6, r2, #4
	beq	.L56
.L13:
	tst	r3, #32
	beq	.L16
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	ands	r6, r2, #32
	beq	.L57
.L16:
	tst	r3, #16
	beq	.L17
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L58
.L17:
	tst	r3, #64
	beq	.L18
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L59
.L18:
	tst	r3, #128
	beq	.L21
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L60
.L21:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	beq	.L61
.L6:
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	ands	r6, r2, #1
	ldr	r4, .L62+4
	bne	.L7
	ldr	r3, .L62+12
	ldr	r0, .L62+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	addle	r3, r3, #1
	strle	r3, [r4]
	strgt	r6, [r4]
	ldrh	r3, [r5]
	b	.L7
.L61:
	ldr	r2, .L62+20
	ldr	r3, [r4, #8]
	ldr	r1, [r2, #28]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r4, #8]
	blt	.L6
	mov	r1, #0
	ldr	r3, [r4]
	ldr	r2, [r2]
	add	r3, r3, r2
	cmp	r3, #4
	str	r1, [r4, #8]
	strgt	r1, [r4]
	bgt	.L6
	cmp	r3, #0
	movlt	r3, #4
	str	r3, [r4]
	b	.L6
.L54:
	ldr	r3, .L62+12
	ldr	r0, .L62+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	movle	r2, #4
	subgt	r3, r3, #1
	strgt	r3, [r4]
	ldrhle	r3, [r5]
	ldrhgt	r3, [r5]
	strle	r2, [r4]
	b	.L9
.L55:
	ldr	r3, .L62+12
	ldr	r0, .L62+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #0
	moveq	r2, #1
	ldrheq	r3, [r5]
	streq	r2, [r4, #4]
	strne	r6, [r4, #4]
	ldrhne	r3, [r5]
	b	.L11
.L56:
	ldr	r3, .L62+12
	ldr	r0, .L62+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L14
	mov	r2, #1
	ldrh	r3, [r5]
	str	r2, [r4, #4]
	b	.L13
.L57:
	ldr	r3, .L62+12
	ldr	r0, .L62+36
	mov	lr, pc
	bx	r3
	str	r6, [r4]
	ldrh	r3, [r5]
	b	.L16
.L59:
	ldr	r0, .L62+40
	ldr	r6, .L62+12
	mov	lr, pc
	bx	r6
	ldr	r2, .L62+20
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ble	.L52
	sub	r3, r3, #1
	add	r1, r2, r3, lsl #2
	ldr	r1, [r1, #8]
	ldr	r0, .L62+44
	str	r3, [r2, #4]
	str	r1, [r2, #28]
	mov	lr, pc
	bx	r6
.L52:
	ldrh	r3, [r5]
	b	.L18
.L60:
	ldr	r0, .L62+48
	ldr	r5, .L62+12
	mov	lr, pc
	bx	r5
	ldr	r2, .L62+20
	ldr	r3, [r2, #4]
	cmp	r3, #3
	bgt	.L21
	add	r1, r2, r3, lsl #2
	ldr	r0, [r1, #8]
	add	r3, r3, #1
	add	r1, r2, r3, lsl #2
	str	r0, [r2, #28]
	ldr	r1, [r1, #8]
	ldr	r0, .L62+44
	str	r3, [r2, #4]
	mov	lr, pc
	bx	r5
	b	.L21
.L58:
	ldr	r3, .L62+12
	ldr	r0, .L62+52
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldrh	r3, [r5]
	str	r2, [r4]
	b	.L17
.L14:
	ldr	r2, .L62+20
	ldr	r3, [r2]
	cmp	r3, #1
	movne	r1, #1
	streq	r6, [r2]
	ldrheq	r3, [r5]
	ldrhne	r3, [r5]
	strne	r1, [r2]
	b	.L13
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	.LANCHOR0
	.word	buttons
	.word	mgba_printf
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC5
	.size	updateGame, .-updateGame
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"frame1\000"
	.align	2
.LC10:
	.ascii	"frame2\000"
	.align	2
.LC11:
	.ascii	"frame3\000"
	.align	2
.LC12:
	.ascii	"frame4\000"
	.align	2
.LC13:
	.ascii	"frame5\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L76
	push	{r4, lr}
	ldr	r0, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
	cmp	r3, #1
	beq	.L72
	cmp	r3, #2
	beq	.L73
	cmp	r3, #3
	beq	.L74
	cmp	r3, #4
	beq	.L75
.L64:
	pop	{r4, lr}
	bx	lr
.L71:
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L76+16
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L73:
	ldr	r3, .L76+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L76+28
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L72:
	ldr	r3, .L76+32
	mov	lr, pc
	bx	r3
	ldr	r0, .L76+36
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L74:
	ldr	r3, .L76+40
	mov	lr, pc
	bx	r3
	ldr	r0, .L76+44
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	b	.L64
.L75:
	ldr	r3, .L76+48
	mov	lr, pc
	bx	r3
	ldr	r0, .L76+52
	ldr	r3, .L76+20
	mov	lr, pc
	bx	r3
	b	.L64
.L77:
	.align	2
.L76:
	.word	fillScreen
	.word	21023
	.word	.LANCHOR0
	.word	drawFrame1
	.word	.LC9
	.word	mgba_printf
	.word	drawFrame3
	.word	.LC11
	.word	drawFrame2
	.word	.LC10
	.word	drawFrame4
	.word	.LC12
	.word	drawFrame5
	.word	.LC13
	.size	drawGame, .-drawGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L81+4
	ldr	r6, .L81+8
	strh	r1, [r2]	@ movhi
	ldr	r5, .L81+12
	strh	r3, [r6]	@ movhi
	ldr	r4, .L81+16
	ldrh	r3, [r5, #48]
	ldr	r9, .L81+20
	strh	r3, [r4]	@ movhi
	ldr	r8, .L81+24
	ldr	r7, .L81+28
.L79:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	ldrh	r3, [r4]
	b	.L79
.L82:
	.align	2
.L81:
	.word	mgba_open
	.word	1027
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.size	main, .-main
	.global	frameRate
	.global	speedLevel
	.global	frameRates
	.global	imageFrame
	.global	direction
	.global	loop
	.global	frameCount
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	direction, %object
	.size	direction, 4
direction:
	.word	1
	.type	speedLevel, %object
	.size	speedLevel, 4
speedLevel:
	.word	1
	.type	frameRates, %object
	.size	frameRates, 20
frameRates:
	.word	5
	.word	10
	.word	15
	.word	20
	.word	25
	.type	frameRate, %object
	.size	frameRate, 4
frameRate:
	.word	60
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	imageFrame, %object
	.size	imageFrame, 4
imageFrame:
	.space	4
	.type	loop, %object
	.size	loop, 4
loop:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
