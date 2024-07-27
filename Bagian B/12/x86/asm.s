	.file	"C.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%lf "
	.text
	.globl	printMatrix
	.type	printMatrix, @function
printMatrix:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	movq	xmm0, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
.L3:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L4
	mov	edi, 10
	call	putchar@PLT
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	printMatrix, .-printMatrix
	.globl	gaussJordanInverse
	.type	gaussJordanInverse, @function
gaussJordanInverse:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	QWORD PTR -88[rbp], rdi
	mov	DWORD PTR -92[rbp], esi
	mov	eax, DWORD PTR -92[rbp]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L7
.L12:
	mov	eax, DWORD PTR -92[rbp]
	add	eax, eax
	cdqe
	sal	rax, 3
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	mov	rdx, QWORD PTR -56[rbp]
	lea	rbx, [rcx+rdx]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR [rbx], rax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L8
.L11:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -88[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -24[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rdx, rax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rcx
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -24[rbp]
	movsx	rcx, ecx
	sal	rcx, 3
	add	rax, rcx
	movsd	xmm0, QWORD PTR [rdx]
	movsd	QWORD PTR [rax], xmm0
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jne	.L9
	movsd	xmm0, QWORD PTR .LC1[rip]
	jmp	.L10
.L9:
	pxor	xmm0, xmm0
.L10:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -24[rbp]
	mov	edx, DWORD PTR -92[rbp]
	add	edx, ecx
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	QWORD PTR [rax], xmm0
	add	DWORD PTR -24[rbp], 1
.L8:
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L11
	add	DWORD PTR -20[rbp], 1
.L7:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L12
	mov	DWORD PTR -28[rbp], 0
	jmp	.L13
.L21:
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -28[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	movsd	QWORD PTR -64[rbp], xmm0
	mov	DWORD PTR -32[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -32[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -32[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	divsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR [rax], xmm0
	add	DWORD PTR -32[rbp], 1
.L14:
	mov	eax, DWORD PTR -92[rbp]
	add	eax, eax
	cmp	DWORD PTR -32[rbp], eax
	jl	.L15
	mov	DWORD PTR -36[rbp], 0
	jmp	.L16
.L20:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	je	.L17
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -28[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	movsd	QWORD PTR -72[rbp], xmm0
	mov	DWORD PTR -40[rbp], 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	movsd	xmm1, QWORD PTR [rax]
	mulsd	xmm1, QWORD PTR -72[rbp]
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -40[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	subsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	add	DWORD PTR -40[rbp], 1
.L18:
	mov	eax, DWORD PTR -92[rbp]
	add	eax, eax
	cmp	DWORD PTR -40[rbp], eax
	jl	.L19
.L17:
	add	DWORD PTR -36[rbp], 1
.L16:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L20
	add	DWORD PTR -28[rbp], 1
.L13:
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L21
	mov	DWORD PTR -44[rbp], 0
	jmp	.L22
.L25:
	mov	DWORD PTR -48[rbp], 0
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -48[rbp]
	mov	edx, DWORD PTR -92[rbp]
	add	edx, ecx
	movsx	rdx, edx
	sal	rdx, 3
	add	rdx, rax
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	mov	rax, QWORD PTR -88[rbp]
	add	rax, rcx
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -48[rbp]
	movsx	rcx, ecx
	sal	rcx, 3
	add	rax, rcx
	movsd	xmm0, QWORD PTR [rdx]
	movsd	QWORD PTR [rax], xmm0
	add	DWORD PTR -48[rbp], 1
.L23:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L24
	mov	eax, DWORD PTR -44[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -44[rbp], 1
.L22:
	mov	eax, DWORD PTR -44[rbp]
	cmp	eax, DWORD PTR -92[rbp]
	jl	.L25
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	free@PLT
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	gaussJordanInverse, .-gaussJordanInverse
	.section	.rodata
.LC3:
	.string	"r"
.LC4:
	.string	"input.txt"
.LC5:
	.string	"Error opening file"
.LC6:
	.string	"%d"
.LC7:
	.string	"%lf"
.LC8:
	.string	"w"
.LC9:
	.string	"output.txt"
.LC10:
	.string	"Error opening output file"
.LC11:
	.string	"%e "
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 72
	.cfi_offset 3, -24
	lea	rax, .LC3[rip]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0
	jne	.L27
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L42
.L27:
	lea	rdx, -68[rbp]
	mov	rax, QWORD PTR -48[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L29
.L32:
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	sal	rax, 3
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]
	mov	rdx, QWORD PTR -56[rbp]
	lea	rbx, [rcx+rdx]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR [rbx], rax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L30
.L31:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -24[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rdx, rax
	mov	rax, QWORD PTR -48[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -24[rbp], 1
.L30:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -24[rbp], eax
	jl	.L31
	add	DWORD PTR -20[rbp], 1
.L29:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L32
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	edx, DWORD PTR -68[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	gaussJordanInverse
	lea	rax, .LC8[rip]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	cmp	QWORD PTR -64[rbp], 0
	jne	.L33
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -28[rbp], 0
	jmp	.L34
.L35:
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -28[rbp], 1
.L34:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -28[rbp], eax
	jl	.L35
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 1
	jmp	.L42
.L33:
	mov	DWORD PTR -32[rbp], 0
	jmp	.L36
.L39:
	mov	DWORD PTR -36[rbp], 0
	jmp	.L37
.L38:
	mov	eax, DWORD PTR -32[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -36[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	add	DWORD PTR -36[rbp], 1
.L37:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -36[rbp], eax
	jl	.L38
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	add	DWORD PTR -32[rbp], 1
.L36:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -32[rbp], eax
	jl	.L39
	mov	DWORD PTR -40[rbp], 0
	jmp	.L40
.L41:
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -40[rbp], 1
.L40:
	mov	eax, DWORD PTR -68[rbp]
	cmp	DWORD PTR -40[rbp], eax
	jl	.L41
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
.L42:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (Debian 13.3.0-3) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
