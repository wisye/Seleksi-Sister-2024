	.file	"C.c"
	.machine ppc
	.section	".text"
	.section	.rodata
	.align 2
.LC0:
	.string	"%lf "
	.section	".got2","aw"
	.align 2
.LCTOC1 = .+32768
.LC1:
	.long .LC0
	.section	".text"
	.align 2
	.globl printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB6:
	.cfi_startproc
	stwu 1,-48(1)
	.cfi_def_cfa_offset 48
	mflr 0
	stw 0,52(1)
	stw 30,40(1)
	stw 31,44(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L6
.L6:
	mflr 30
	addis 30,30,.LCTOC1-.L6@ha
	addi 30,30,.LCTOC1-.L6@l
	stw 3,24(31)
	stw 4,28(31)
	li 9,0
	stw 9,8(31)
	b .L2
.L5:
	li 9,0
	stw 9,12(31)
	b .L3
.L4:
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,24(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,12(31)
	slwi 9,9,3
	add 9,10,9
	lfd 0,0(9)
	fmr 1,0
	lwz 3,.LC1-.LCTOC1(30)
	creqv 6,6,6
	bl printf+32768@plt
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L3:
	lwz 10,12(31)
	lwz 9,28(31)
	cmpw 0,10,9
	blt 0,.L4
	li 3,10
	bl putchar+32768@plt
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L2:
	lwz 10,8(31)
	lwz 9,28(31)
	cmpw 0,10,9
	blt 0,.L5
	nop
	nop
	addi 11,31,48
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE6:
	.size	printMatrix,.-printMatrix
	.section	".got2","aw"
.LC3:
	.long .LC2
.LC5:
	.long .LC4
	.section	".text"
	.align 2
	.globl gaussJordanInverse
	.type	gaussJordanInverse, @function
gaussJordanInverse:
.LFB7:
	.cfi_startproc
	stwu 1,-96(1)
	.cfi_def_cfa_offset 96
	mflr 0
	stw 0,100(1)
	stw 29,84(1)
	stw 30,88(1)
	stw 31,92(1)
	.cfi_offset 65, 4
	.cfi_offset 29, -12
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L27
.L27:
	mflr 30
	addis 30,30,.LCTOC1-.L27@ha
	addi 30,30,.LCTOC1-.L27@l
	stw 3,72(31)
	stw 4,76(31)
	lwz 9,76(31)
	slwi 9,9,2
	mr 3,9
	bl malloc+32768@plt
	mr 9,3
	stw 9,40(31)
	li 9,0
	stw 9,8(31)
	b .L8
.L13:
	lwz 9,76(31)
	slwi 8,9,4
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 29,10,9
	mr 3,8
	bl malloc+32768@plt
	mr 9,3
	stw 9,0(29)
	li 9,0
	stw 9,12(31)
	b .L9
.L12:
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,72(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,12(31)
	slwi 9,9,3
	add 10,10,9
	lwz 9,8(31)
	slwi 9,9,2
	lwz 8,40(31)
	add 9,8,9
	lwz 8,0(9)
	lwz 9,12(31)
	slwi 9,9,3
	add 9,8,9
	lfd 0,0(10)
	stfd 0,0(9)
	lwz 10,8(31)
	lwz 9,12(31)
	cmpw 0,10,9
	bne 0,.L10
	lwz 9,.LC3-.LCTOC1(30)
	lfd 0,0(9)
	b .L11
.L10:
	lwz 9,.LC5-.LCTOC1(30)
	lfd 0,0(9)
.L11:
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 8,12(31)
	lwz 9,76(31)
	add 9,8,9
	slwi 9,9,3
	add 9,10,9
	stfd 0,0(9)
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L9:
	lwz 10,12(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L12
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L8:
	lwz 10,8(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L13
	li 9,0
	stw 9,16(31)
	b .L14
.L22:
	lwz 9,16(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,16(31)
	slwi 9,9,3
	add 9,10,9
	lfd 0,0(9)
	stfd 0,48(31)
	li 9,0
	stw 9,20(31)
	b .L15
.L16:
	lwz 9,16(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,20(31)
	slwi 9,9,3
	add 9,10,9
	lfd 12,0(9)
	lwz 9,16(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,20(31)
	slwi 9,9,3
	add 9,10,9
	lfd 0,48(31)
	fdiv 0,12,0
	stfd 0,0(9)
	lwz 9,20(31)
	addi 9,9,1
	stw 9,20(31)
.L15:
	lwz 9,76(31)
	slwi 9,9,1
	lwz 10,20(31)
	cmpw 0,10,9
	blt 0,.L16
	li 9,0
	stw 9,24(31)
	b .L17
.L21:
	lwz 10,24(31)
	lwz 9,16(31)
	cmpw 0,10,9
	beq 0,.L18
	lwz 9,24(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,16(31)
	slwi 9,9,3
	add 9,10,9
	lfd 0,0(9)
	stfd 0,56(31)
	li 9,0
	stw 9,28(31)
	b .L19
.L20:
	lwz 9,24(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,28(31)
	slwi 9,9,3
	add 9,10,9
	lfd 12,0(9)
	lwz 9,16(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,28(31)
	slwi 9,9,3
	add 9,10,9
	lfd 11,0(9)
	lfd 0,56(31)
	fmul 0,11,0
	lwz 9,24(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,28(31)
	slwi 9,9,3
	add 9,10,9
	fsub 0,12,0
	stfd 0,0(9)
	lwz 9,28(31)
	addi 9,9,1
	stw 9,28(31)
.L19:
	lwz 9,76(31)
	slwi 9,9,1
	lwz 10,28(31)
	cmpw 0,10,9
	blt 0,.L20
.L18:
	lwz 9,24(31)
	addi 9,9,1
	stw 9,24(31)
.L17:
	lwz 10,24(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L21
	lwz 9,16(31)
	addi 9,9,1
	stw 9,16(31)
.L14:
	lwz 10,16(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L22
	li 9,0
	stw 9,32(31)
	b .L23
.L26:
	li 9,0
	stw 9,36(31)
	b .L24
.L25:
	lwz 9,32(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 8,36(31)
	lwz 9,76(31)
	add 9,8,9
	slwi 9,9,3
	add 10,10,9
	lwz 9,32(31)
	slwi 9,9,2
	lwz 8,72(31)
	add 9,8,9
	lwz 8,0(9)
	lwz 9,36(31)
	slwi 9,9,3
	add 9,8,9
	lfd 0,0(10)
	stfd 0,0(9)
	lwz 9,36(31)
	addi 9,9,1
	stw 9,36(31)
.L24:
	lwz 10,36(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L25
	lwz 9,32(31)
	slwi 9,9,2
	lwz 10,40(31)
	add 9,10,9
	lwz 9,0(9)
	mr 3,9
	bl free+32768@plt
	lwz 9,32(31)
	addi 9,9,1
	stw 9,32(31)
.L23:
	lwz 10,32(31)
	lwz 9,76(31)
	cmpw 0,10,9
	blt 0,.L26
	lwz 3,40(31)
	bl free+32768@plt
	nop
	addi 11,31,96
	lwz 0,4(11)
	mtlr 0
	lwz 29,-12(11)
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE7:
	.size	gaussJordanInverse,.-gaussJordanInverse
	.section	.rodata
	.align 2
.LC6:
	.string	"r"
	.align 2
.LC7:
	.string	"input.txt"
	.align 2
.LC10:
	.string	"Error opening file"
	.align 2
.LC12:
	.string	"%d"
	.align 2
.LC14:
	.string	"%lf"
	.align 2
.LC16:
	.string	"w"
	.align 2
.LC17:
	.string	"output.txt"
	.align 2
.LC20:
	.string	"Error opening output file"
	.align 2
.LC22:
	.string	"%e "
	.section	".got2","aw"
.LC8:
	.long .LC6
.LC9:
	.long .LC7
.LC11:
	.long .LC10
.LC13:
	.long .LC12
.LC15:
	.long .LC14
.LC18:
	.long .LC16
.LC19:
	.long .LC17
.LC21:
	.long .LC20
.LC23:
	.long .LC22
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	stwu 1,-80(1)
	.cfi_def_cfa_offset 80
	mflr 0
	stw 0,84(1)
	stw 29,68(1)
	stw 30,72(1)
	stw 31,76(1)
	.cfi_offset 65, 4
	.cfi_offset 29, -12
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	bcl 20,31,.L45
.L45:
	mflr 30
	addis 30,30,.LCTOC1-.L45@ha
	addi 30,30,.LCTOC1-.L45@l
	lwz 4,.LC8-.LCTOC1(30)
	lwz 3,.LC9-.LCTOC1(30)
	bl fopen+32768@plt
	mr 9,3
	stw 9,32(31)
	lwz 9,32(31)
	cmpwi 0,9,0
	bne 0,.L29
	lwz 3,.LC11-.LCTOC1(30)
	bl puts+32768@plt
	li 9,1
	b .L44
.L29:
	addi 9,31,44
	mr 5,9
	lwz 4,.LC13-.LCTOC1(30)
	lwz 3,32(31)
	crxor 6,6,6
	bl __isoc99_fscanf+32768@plt
	lwz 9,44(31)
	slwi 9,9,2
	mr 3,9
	bl malloc+32768@plt
	mr 9,3
	stw 9,36(31)
	li 9,0
	stw 9,8(31)
	b .L31
.L34:
	lwz 9,44(31)
	slwi 8,9,3
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,36(31)
	add 29,10,9
	mr 3,8
	bl malloc+32768@plt
	mr 9,3
	stw 9,0(29)
	li 9,0
	stw 9,12(31)
	b .L32
.L33:
	lwz 9,8(31)
	slwi 9,9,2
	lwz 10,36(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,12(31)
	slwi 9,9,3
	add 9,10,9
	mr 5,9
	lwz 4,.LC15-.LCTOC1(30)
	lwz 3,32(31)
	crxor 6,6,6
	bl __isoc99_fscanf+32768@plt
	lwz 9,12(31)
	addi 9,9,1
	stw 9,12(31)
.L32:
	lwz 9,44(31)
	lwz 10,12(31)
	cmpw 0,10,9
	blt 0,.L33
	lwz 9,8(31)
	addi 9,9,1
	stw 9,8(31)
.L31:
	lwz 9,44(31)
	lwz 10,8(31)
	cmpw 0,10,9
	blt 0,.L34
	lwz 3,32(31)
	bl fclose+32768@plt
	lwz 9,44(31)
	mr 4,9
	lwz 3,36(31)
	bl gaussJordanInverse@local
	lwz 4,.LC18-.LCTOC1(30)
	lwz 3,.LC19-.LCTOC1(30)
	bl fopen+32768@plt
	mr 9,3
	stw 9,40(31)
	lwz 9,40(31)
	cmpwi 0,9,0
	bne 0,.L35
	lwz 3,.LC21-.LCTOC1(30)
	bl puts+32768@plt
	li 9,0
	stw 9,16(31)
	b .L36
.L37:
	lwz 9,16(31)
	slwi 9,9,2
	lwz 10,36(31)
	add 9,10,9
	lwz 9,0(9)
	mr 3,9
	bl free+32768@plt
	lwz 9,16(31)
	addi 9,9,1
	stw 9,16(31)
.L36:
	lwz 9,44(31)
	lwz 10,16(31)
	cmpw 0,10,9
	blt 0,.L37
	lwz 3,36(31)
	bl free+32768@plt
	li 9,1
	b .L44
.L35:
	li 9,0
	stw 9,20(31)
	b .L38
.L41:
	li 9,0
	stw 9,24(31)
	b .L39
.L40:
	lwz 9,20(31)
	slwi 9,9,2
	lwz 10,36(31)
	add 9,10,9
	lwz 10,0(9)
	lwz 9,24(31)
	slwi 9,9,3
	add 9,10,9
	lfd 0,0(9)
	fmr 1,0
	lwz 4,.LC23-.LCTOC1(30)
	lwz 3,40(31)
	creqv 6,6,6
	bl fprintf+32768@plt
	lwz 9,24(31)
	addi 9,9,1
	stw 9,24(31)
.L39:
	lwz 9,44(31)
	lwz 10,24(31)
	cmpw 0,10,9
	blt 0,.L40
	lwz 4,40(31)
	li 3,10
	bl fputc+32768@plt
	lwz 9,20(31)
	addi 9,9,1
	stw 9,20(31)
.L38:
	lwz 9,44(31)
	lwz 10,20(31)
	cmpw 0,10,9
	blt 0,.L41
	li 9,0
	stw 9,28(31)
	b .L42
.L43:
	lwz 9,28(31)
	slwi 9,9,2
	lwz 10,36(31)
	add 9,10,9
	lwz 9,0(9)
	mr 3,9
	bl free+32768@plt
	lwz 9,28(31)
	addi 9,9,1
	stw 9,28(31)
.L42:
	lwz 9,44(31)
	lwz 10,28(31)
	cmpw 0,10,9
	blt 0,.L43
	lwz 3,36(31)
	bl free+32768@plt
	lwz 3,40(31)
	bl fclose+32768@plt
	li 9,0
.L44:
	mr 3,9
	addi 11,31,80
	lwz 0,4(11)
	mtlr 0
	lwz 29,-12(11)
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE8:
	.size	main,.-main
	.section	.rodata
	.align 3
.LC2:
	.long	1072693248
	.long	0
	.align 3
.LC4:
	.long	0
	.long	0
	.ident	"GCC: (Debian 13.2.0-13) 13.2.0"
	.gnu_attribute 4, 1
	.section	.note.GNU-stack,"",@progbits
