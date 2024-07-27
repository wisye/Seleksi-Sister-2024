	.arch armv5te
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"C.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%lf \000"
	.text
	.align	2
	.global	printMatrix
	.syntax unified
	.arm
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, .L6
.LPIC0:
	add	r1, pc, r1
	mov	r0, r1
	bl	printf(PLT)
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L4
	mov	r0, #10
	bl	putchar(PLT)
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L5
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0-(.LPIC0+8)
	.size	printMatrix, .-printMatrix
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.global	__aeabi_dsub
	.align	2
	.global	gaussJordanInverse
	.syntax unified
	.arm
	.type	gaussJordanInverse, %function
gaussJordanInverse:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #68
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L9
.L14:
	ldr	r3, [fp, #-84]
	lsl	r1, r3, #4
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r4, r2, r3
	mov	r0, r1
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [r4]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L10
.L13:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-56]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-28]
	lsl	r2, r2, #3
	add	r1, r1, r2
	ldrd	r2, [r3]
	strd	r2, [r1]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L11
	mov	r2, #0
	ldr	r3, .L28
	b	.L12
.L11:
	mov	r2, #0
	mov	r3, #0
.L12:
	ldr	r1, [fp, #-24]
	lsl	r1, r1, #2
	ldr	r0, [fp, #-56]
	add	r1, r0, r1
	ldr	r0, [r1]
	ldr	ip, [fp, #-28]
	ldr	r1, [fp, #-84]
	add	r1, ip, r1
	lsl	r1, r1, #3
	add	r1, r0, r1
	strd	r2, [r1]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L10:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L13
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L9:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L14
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L15
.L23:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L16
.L17:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r4, r2, r3
	ldrd	r2, [fp, #-68]
	bl	__aeabi_ddiv(PLT)
	mov	r2, r0
	mov	r3, r1
	strd	r2, [r4]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L16:
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L17
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L18
.L22:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L19
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L20
.L21:
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r4, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [r3]
	ldrd	r2, [fp, #-76]
	bl	__aeabi_dmul(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #3
	add	r6, r2, r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub(PLT)
	mov	r2, r0
	mov	r3, r1
	strd	r2, [r6]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L20:
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-44]
	cmp	r2, r3
	blt	.L21
.L19:
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L18:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L22
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L15:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L23
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L24
.L27:
	mov	r3, #0
	str	r3, [fp, #-52]
	b	.L25
.L26:
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-84]
	add	r3, r1, r3
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-48]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-80]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-52]
	lsl	r2, r2, #3
	add	r1, r1, r2
	ldrd	r2, [r3]
	strd	r2, [r1]
	ldr	r3, [fp, #-52]
	add	r3, r3, #1
	str	r3, [fp, #-52]
.L25:
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L26
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	free(PLT)
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L24:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	blt	.L27
	ldr	r0, [fp, #-56]
	bl	free(PLT)
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, pc}
.L29:
	.align	2
.L28:
	.word	1072693248
	.size	gaussJordanInverse, .-gaussJordanInverse
	.section	.rodata
	.align	2
.LC1:
	.ascii	"r\000"
	.align	2
.LC2:
	.ascii	"input.txt\000"
	.align	2
.LC3:
	.ascii	"Error opening file\000"
	.align	2
.LC4:
	.ascii	"%d\000"
	.align	2
.LC5:
	.ascii	"%lf\000"
	.align	2
.LC6:
	.ascii	"w\000"
	.align	2
.LC7:
	.ascii	"output.txt\000"
	.align	2
.LC8:
	.ascii	"Error opening output file\000"
	.align	2
.LC9:
	.ascii	"%e \000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	ldr	r3, .L47
.LPIC1:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L47+4
.LPIC2:
	add	r3, pc, r3
	mov	r0, r3
	bl	fopen(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L31
	ldr	r3, .L47+8
.LPIC3:
	add	r3, pc, r3
	mov	r0, r3
	bl	puts(PLT)
	mov	r3, #1
	b	.L46
.L31:
	sub	r3, fp, #52
	mov	r2, r3
	ldr	r3, .L47+12
.LPIC4:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	__isoc99_fscanf(PLT)
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L33
.L36:
	ldr	r3, [fp, #-52]
	lsl	r1, r3, #3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r4, r2, r3
	mov	r0, r1
	bl	malloc(PLT)
	mov	r3, r0
	str	r3, [r4]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L34
.L35:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, .L47+16
.LPIC5:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	__isoc99_fscanf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L34:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L35
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L33:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L36
	ldr	r0, [fp, #-40]
	bl	fclose(PLT)
	ldr	r3, [fp, #-52]
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	gaussJordanInverse(PLT)
	ldr	r3, .L47+20
.LPIC6:
	add	r3, pc, r3
	mov	r1, r3
	ldr	r3, .L47+24
.LPIC7:
	add	r3, pc, r3
	mov	r0, r3
	bl	fopen(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L37
	ldr	r3, .L47+28
.LPIC8:
	add	r3, pc, r3
	mov	r0, r3
	bl	puts(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L38
.L39:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	free(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L38:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	blt	.L39
	ldr	r0, [fp, #-44]
	bl	free(PLT)
	mov	r3, #1
	b	.L46
.L37:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L40
.L43:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L41
.L42:
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, .L47+32
.LPIC9:
	add	r1, pc, r1
	ldr	r0, [fp, #-48]
	bl	fprintf(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L41:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	blt	.L42
	ldr	r1, [fp, #-48]
	mov	r0, #10
	bl	fputc(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L40:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	blt	.L43
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L44
.L45:
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	free(PLT)
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L44:
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L45
	ldr	r0, [fp, #-44]
	bl	free(PLT)
	ldr	r0, [fp, #-48]
	bl	fclose(PLT)
	mov	r3, #0
.L46:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L48:
	.align	2
.L47:
	.word	.LC1-(.LPIC1+8)
	.word	.LC2-(.LPIC2+8)
	.word	.LC3-(.LPIC3+8)
	.word	.LC4-(.LPIC4+8)
	.word	.LC5-(.LPIC5+8)
	.word	.LC6-(.LPIC6+8)
	.word	.LC7-(.LPIC7+8)
	.word	.LC8-(.LPIC8+8)
	.word	.LC9-(.LPIC9+8)
	.size	main, .-main
	.ident	"GCC: (Debian 13.2.0-13) 13.2.0"
	.section	.note.GNU-stack,"",%progbits
