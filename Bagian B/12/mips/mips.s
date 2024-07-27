	.file	1 "C.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.module	arch=mips32r2
	.abicalls
	.text
	.rdata
	.align	2
$LC0:
	.ascii	"%lf \000"
	.text
	.align	2
	.globl	printMatrix
	.set	nomips16
	.set	nomicromips
	.ent	printMatrix
	.type	printMatrix, @function
printMatrix:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$0,24($fp)
	b	$L2
	nop

$L5:
	sw	$0,28($fp)
	b	$L3
	nop

$L4:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,40($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,28($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lw	$2,%got($LC0)($28)
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L3:
	lw	$3,28($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L4
	nop

	li	$4,10			# 0xa
	lw	$2,%call16(putchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,putchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L5
	nop

	nop
	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	printMatrix
	.size	printMatrix, .-printMatrix
	.align	2
	.globl	gaussJordanInverse
	.set	nomips16
	.set	nomicromips
	.ent	gaussJordanInverse
	.type	gaussJordanInverse, @function
gaussJordanInverse:
	.frame	$fp,96,$31		# vars= 56, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-96
	sw	$31,92($sp)
	sw	$fp,88($sp)
	sw	$16,84($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,96($fp)
	sw	$5,100($fp)
	lw	$2,100($fp)
	sll	$2,$2,2
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,56($fp)
	sw	$0,24($fp)
	b	$L7
	nop

$L12:
	lw	$2,100($fp)
	sll	$4,$2,4
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$16,$3,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,0($16)
	sw	$0,28($fp)
	b	$L8
	nop

$L11:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,96($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,28($fp)
	sll	$2,$2,3
	addu	$3,$3,$2
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$4,56($fp)
	addu	$2,$4,$2
	lw	$4,0($2)
	lw	$2,28($fp)
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f0,0($3)
	sdc1	$f0,0($2)
	lw	$3,24($fp)
	lw	$2,28($fp)
	bne	$3,$2,$L9
	nop

	lw	$2,%got($LC1)($28)
	ldc1	$f0,%lo($LC1)($2)
	b	$L10
	nop

$L9:
	mtc1	$0,$f0
	mthc1	$0,$f0
$L10:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,28($fp)
	lw	$2,100($fp)
	addu	$2,$4,$2
	sll	$2,$2,3
	addu	$2,$3,$2
	sdc1	$f0,0($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L8:
	lw	$3,28($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L11
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L7:
	lw	$3,24($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L12
	nop

	sw	$0,32($fp)
	b	$L13
	nop

$L21:
	lw	$2,32($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	sdc1	$f0,64($fp)
	sw	$0,36($fp)
	b	$L14
	nop

$L15:
	lw	$2,32($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,36($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f2,0($2)
	lw	$2,32($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,36($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,64($fp)
	div.d	$f0,$f2,$f0
	sdc1	$f0,0($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L14:
	lw	$2,100($fp)
	sll	$2,$2,1
	lw	$3,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L15
	nop

	sw	$0,40($fp)
	b	$L16
	nop

$L20:
	lw	$3,40($fp)
	lw	$2,32($fp)
	beq	$3,$2,$L17
	nop

	lw	$2,40($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	sdc1	$f0,72($fp)
	sw	$0,44($fp)
	b	$L18
	nop

$L19:
	lw	$2,40($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,44($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f2,0($2)
	lw	$2,32($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,44($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f4,0($2)
	ldc1	$f0,72($fp)
	mul.d	$f0,$f4,$f0
	lw	$2,40($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,44($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	sub.d	$f0,$f2,$f0
	sdc1	$f0,0($2)
	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
$L18:
	lw	$2,100($fp)
	sll	$2,$2,1
	lw	$3,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L19
	nop

$L17:
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L16:
	lw	$3,40($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L20
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L13:
	lw	$3,32($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L21
	nop

	sw	$0,48($fp)
	b	$L22
	nop

$L25:
	sw	$0,52($fp)
	b	$L23
	nop

$L24:
	lw	$2,48($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$4,52($fp)
	lw	$2,100($fp)
	addu	$2,$4,$2
	sll	$2,$2,3
	addu	$3,$3,$2
	lw	$2,48($fp)
	sll	$2,$2,2
	lw	$4,96($fp)
	addu	$2,$4,$2
	lw	$4,0($2)
	lw	$2,52($fp)
	sll	$2,$2,3
	addu	$2,$4,$2
	ldc1	$f0,0($3)
	sdc1	$f0,0($2)
	lw	$2,52($fp)
	addiu	$2,$2,1
	sw	$2,52($fp)
$L23:
	lw	$3,52($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L24
	nop

	lw	$2,48($fp)
	sll	$2,$2,2
	lw	$3,56($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,48($fp)
	addiu	$2,$2,1
	sw	$2,48($fp)
$L22:
	lw	$3,48($fp)
	lw	$2,100($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L25
	nop

	lw	$4,56($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,92($sp)
	lw	$fp,88($sp)
	lw	$16,84($sp)
	addiu	$sp,$sp,96
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	gaussJordanInverse
	.size	gaussJordanInverse, .-gaussJordanInverse
	.rdata
	.align	2
$LC2:
	.ascii	"r\000"
	.align	2
$LC3:
	.ascii	"input.txt\000"
	.align	2
$LC4:
	.ascii	"Error opening file\000"
	.align	2
$LC5:
	.ascii	"%d\000"
	.align	2
$LC6:
	.ascii	"%lf\000"
	.align	2
$LC7:
	.ascii	"w\000"
	.align	2
$LC8:
	.ascii	"output.txt\000"
	.align	2
$LC9:
	.ascii	"Error opening output file\000"
	.align	2
$LC10:
	.ascii	"%e \000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 40, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	sw	$16,68($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC2)($28)
	addiu	$5,$2,%lo($LC2)
	lw	$2,%got($LC3)($28)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(fopen64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,48($fp)
	lw	$2,48($fp)
	bne	$2,$0,$L27
	nop

	lw	$2,%got($LC4)($28)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,1			# 0x1
	b	$L42
	nop

$L27:
	addiu	$2,$fp,60
	move	$6,$2
	lw	$2,%got($LC5)($28)
	addiu	$5,$2,%lo($LC5)
	lw	$4,48($fp)
	lw	$2,%call16(__isoc99_fscanf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,60($fp)
	sll	$2,$2,2
	move	$4,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,52($fp)
	sw	$0,24($fp)
	b	$L29
	nop

$L32:
	lw	$2,60($fp)
	sll	$4,$2,3
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$16,$3,$2
	lw	$2,%call16(malloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,0($16)
	sw	$0,28($fp)
	b	$L30
	nop

$L31:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,28($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	move	$6,$2
	lw	$2,%got($LC6)($28)
	addiu	$5,$2,%lo($LC6)
	lw	$4,48($fp)
	lw	$2,%call16(__isoc99_fscanf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L30:
	lw	$2,60($fp)
	lw	$3,28($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L31
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L29:
	lw	$2,60($fp)
	lw	$3,24($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L32
	nop

	lw	$4,48($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,60($fp)
	move	$5,$2
	lw	$4,52($fp)
	lw	$2,%got(gaussJordanInverse)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,gaussJordanInverse
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC7)($28)
	addiu	$5,$2,%lo($LC7)
	lw	$2,%got($LC8)($28)
	addiu	$4,$2,%lo($LC8)
	lw	$2,%call16(fopen64)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen64
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,56($fp)
	lw	$2,56($fp)
	bne	$2,$0,$L33
	nop

	lw	$2,%got($LC9)($28)
	addiu	$4,$2,%lo($LC9)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,32($fp)
	b	$L34
	nop

$L35:
	lw	$2,32($fp)
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L34:
	lw	$2,60($fp)
	lw	$3,32($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L35
	nop

	lw	$4,52($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,1			# 0x1
	b	$L42
	nop

$L33:
	sw	$0,36($fp)
	b	$L36
	nop

$L39:
	sw	$0,40($fp)
	b	$L37
	nop

$L38:
	lw	$2,36($fp)
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,40($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	ldc1	$f0,0($2)
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lw	$2,%got($LC10)($28)
	addiu	$5,$2,%lo($LC10)
	lw	$4,56($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L37:
	lw	$2,60($fp)
	lw	$3,40($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L38
	nop

	lw	$5,56($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(fputc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L36:
	lw	$2,60($fp)
	lw	$3,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L39
	nop

	sw	$0,44($fp)
	b	$L40
	nop

$L41:
	lw	$2,44($fp)
	sll	$2,$2,2
	lw	$3,52($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,44($fp)
	addiu	$2,$2,1
	sw	$2,44($fp)
$L40:
	lw	$2,60($fp)
	lw	$3,44($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L41
	nop

	lw	$4,52($fp)
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$4,56($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L42:
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	lw	$16,68($sp)
	addiu	$sp,$sp,80
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC1:
	.word	1072693248
	.word	0
	.ident	"GCC: (Debian 12.3.0-17) 12.3.0"
	.section	.note.GNU-stack,"",@progbits
