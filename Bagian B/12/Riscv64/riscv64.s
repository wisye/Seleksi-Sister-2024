	.file	"C.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lf "
	.text
	.align	1
	.globl	printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB6:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L2
.L5:
	sw	zero,-24(s0)
	j	.L3
.L4:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-40(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmv.x.d	a1,fa5
	lla	a0,.LC0
	call	printf@plt
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L4
	li	a0,10
	call	putchar@plt
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L5
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	printMatrix, .-printMatrix
	.align	1
	.globl	gaussJordanInverse
	.type	gaussJordanInverse, @function
gaussJordanInverse:
.LFB7:
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,104(sp)
	sd	s0,96(sp)
	sd	s1,88(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	sd	a0,-104(s0)
	mv	a5,a1
	sw	a5,-108(s0)
	lw	a5,-108(s0)
	slli	a5,a5,3
	mv	a0,a5
	call	malloc@plt
	mv	a5,a0
	sd	a5,-72(s0)
	sw	zero,-36(s0)
	j	.L7
.L12:
	lw	a5,-108(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	slli	a3,a5,3
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	s1,a4,a5
	mv	a0,a3
	call	malloc@plt
	mv	a5,a0
	sd	a5,0(s1)
	sw	zero,-40(s0)
	j	.L8
.L11:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-104(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-40(s0)
	slli	a5,a5,3
	add	a4,a4,a5
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a3,-72(s0)
	add	a5,a3,a5
	ld	a3,0(a5)
	lw	a5,-40(s0)
	slli	a5,a5,3
	add	a5,a3,a5
	fld	fa5,0(a4)
	fsd	fa5,0(a5)
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bne	a4,a5,.L9
	lla	a5,.LC1
	fld	fa5,0(a5)
	j	.L10
.L9:
	fmv.d.x	fa5,zero
.L10:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-40(s0)
	mv	a3,a5
	lw	a5,-108(s0)
	addw	a5,a3,a5
	sext.w	a5,a5
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L8:
	lw	a5,-40(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L11
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L7:
	lw	a5,-36(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L12
	sw	zero,-44(s0)
	j	.L13
.L21:
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-44(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-80(s0)
	sw	zero,-48(s0)
	j	.L14
.L15:
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-48(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-48(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,-80(s0)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,0(a5)
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
.L14:
	lw	a5,-108(s0)
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-48(s0)
	sext.w	a5,a5
	blt	a5,a4,.L15
	sw	zero,-52(s0)
	j	.L16
.L20:
	lw	a5,-52(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	beq	a4,a5,.L17
	lw	a5,-52(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-44(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsd	fa5,-88(s0)
	sw	zero,-56(s0)
	j	.L18
.L19:
	lw	a5,-52(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-56(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-56(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	fld	fa5,-88(s0)
	fmul.d	fa5,fa3,fa5
	lw	a5,-52(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-56(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsub.d	fa5,fa4,fa5
	fsd	fa5,0(a5)
	lw	a5,-56(s0)
	addiw	a5,a5,1
	sw	a5,-56(s0)
.L18:
	lw	a5,-108(s0)
	slliw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-56(s0)
	sext.w	a5,a5
	blt	a5,a4,.L19
.L17:
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sw	a5,-52(s0)
.L16:
	lw	a5,-52(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L20
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L13:
	lw	a5,-44(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L21
	sw	zero,-60(s0)
	j	.L22
.L25:
	sw	zero,-64(s0)
	j	.L23
.L24:
	lw	a5,-60(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-64(s0)
	mv	a3,a5
	lw	a5,-108(s0)
	addw	a5,a3,a5
	sext.w	a5,a5
	slli	a5,a5,3
	add	a4,a4,a5
	lw	a5,-60(s0)
	slli	a5,a5,3
	ld	a3,-104(s0)
	add	a5,a3,a5
	ld	a3,0(a5)
	lw	a5,-64(s0)
	slli	a5,a5,3
	add	a5,a3,a5
	fld	fa5,0(a4)
	fsd	fa5,0(a5)
	lw	a5,-64(s0)
	addiw	a5,a5,1
	sw	a5,-64(s0)
.L23:
	lw	a5,-64(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L24
	lw	a5,-60(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a0,a5
	call	free@plt
	lw	a5,-60(s0)
	addiw	a5,a5,1
	sw	a5,-60(s0)
.L22:
	lw	a5,-60(s0)
	mv	a4,a5
	lw	a5,-108(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L25
	ld	a0,-72(s0)
	call	free@plt
	nop
	ld	ra,104(sp)
	.cfi_restore 1
	ld	s0,96(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	ld	s1,88(sp)
	.cfi_restore 9
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	gaussJordanInverse, .-gaussJordanInverse
	.section	.rodata
	.align	3
.LC2:
	.string	"r"
	.align	3
.LC3:
	.string	"input.txt"
	.align	3
.LC4:
	.string	"Error opening file"
	.align	3
.LC5:
	.string	"%d"
	.align	3
.LC6:
	.string	"%lf"
	.align	3
.LC7:
	.string	"w"
	.align	3
.LC8:
	.string	"output.txt"
	.align	3
.LC9:
	.string	"Error opening output file"
	.align	3
.LC10:
	.string	"%e "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	lla	a1,.LC2
	lla	a0,.LC3
	call	fopen@plt
	mv	a5,a0
	sd	a5,-64(s0)
	ld	a5,-64(s0)
	bne	a5,zero,.L27
	lla	a0,.LC4
	call	puts@plt
	li	a5,1
	j	.L42
.L27:
	addi	a5,s0,-84
	mv	a2,a5
	lla	a1,.LC5
	ld	a0,-64(s0)
	call	__isoc99_fscanf@plt
	lw	a5,-84(s0)
	slli	a5,a5,3
	mv	a0,a5
	call	malloc@plt
	mv	a5,a0
	sd	a5,-72(s0)
	sw	zero,-36(s0)
	j	.L29
.L32:
	lw	a5,-84(s0)
	slli	a3,a5,3
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	s1,a4,a5
	mv	a0,a3
	call	malloc@plt
	mv	a5,a0
	sd	a5,0(s1)
	sw	zero,-40(s0)
	j	.L30
.L31:
	lw	a5,-36(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-40(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	mv	a2,a5
	lla	a1,.LC6
	ld	a0,-64(s0)
	call	__isoc99_fscanf@plt
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L30:
	lw	a4,-84(s0)
	lw	a5,-40(s0)
	sext.w	a5,a5
	blt	a5,a4,.L31
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L29:
	lw	a4,-84(s0)
	lw	a5,-36(s0)
	sext.w	a5,a5
	blt	a5,a4,.L32
	ld	a0,-64(s0)
	call	fclose@plt
	lw	a5,-84(s0)
	mv	a1,a5
	ld	a0,-72(s0)
	call	gaussJordanInverse
	lla	a1,.LC7
	lla	a0,.LC8
	call	fopen@plt
	mv	a5,a0
	sd	a5,-80(s0)
	ld	a5,-80(s0)
	bne	a5,zero,.L33
	lla	a0,.LC9
	call	puts@plt
	sw	zero,-44(s0)
	j	.L34
.L35:
	lw	a5,-44(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a0,a5
	call	free@plt
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L34:
	lw	a4,-84(s0)
	lw	a5,-44(s0)
	sext.w	a5,a5
	blt	a5,a4,.L35
	ld	a0,-72(s0)
	call	free@plt
	li	a5,1
	j	.L42
.L33:
	sw	zero,-48(s0)
	j	.L36
.L39:
	sw	zero,-52(s0)
	j	.L37
.L38:
	lw	a5,-48(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a4,0(a5)
	lw	a5,-52(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmv.x.d	a2,fa5
	lla	a1,.LC10
	ld	a0,-80(s0)
	call	fprintf@plt
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sw	a5,-52(s0)
.L37:
	lw	a4,-84(s0)
	lw	a5,-52(s0)
	sext.w	a5,a5
	blt	a5,a4,.L38
	ld	a1,-80(s0)
	li	a0,10
	call	fputc@plt
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
.L36:
	lw	a4,-84(s0)
	lw	a5,-48(s0)
	sext.w	a5,a5
	blt	a5,a4,.L39
	sw	zero,-56(s0)
	j	.L40
.L41:
	lw	a5,-56(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a0,a5
	call	free@plt
	lw	a5,-56(s0)
	addiw	a5,a5,1
	sw	a5,-56(s0)
.L40:
	lw	a4,-84(s0)
	lw	a5,-56(s0)
	sext.w	a5,a5
	blt	a5,a4,.L41
	ld	a0,-72(s0)
	call	free@plt
	ld	a0,-80(s0)
	call	fclose@plt
	li	a5,0
.L42:
	mv	a0,a5
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	ld	s1,72(sp)
	.cfi_restore 9
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC1:
	.word	0
	.word	1072693248
	.ident	"GCC: (Debian 13.2.0-12) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
