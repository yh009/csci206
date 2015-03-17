	.file	"sumsquares.c"
	.comm	squares,400,32
	.comm	sum,4,4
	.comm	i,4,4
	.section	.rodata
.LC0:
	.string	"squares[%d]= %d\n"
	.align 8
.LC1:
	.string	"sum of squares from 0 to 99 = %d\n"
	.text
.globl main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, sum(%rip)
	movl	$0, i(%rip)
	jmp	.L2
.L3:
	movl	i(%rip), %eax
	movl	i(%rip), %ecx
	movl	i(%rip), %edx
	imull	%ecx, %edx
	cltq
	movl	%edx, squares(,%rax,4)
	movl	i(%rip), %eax
	cltq
	movl	squares(,%rax,4), %edx
	movl	sum(%rip), %eax
	leal	(%rdx,%rax), %eax
	movl	%eax, sum(%rip)
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L2:
	movl	i(%rip), %eax
	cmpl	$99, %eax
	jle	.L3
	movl	$0, i(%rip)
	jmp	.L4
.L5:
	movl	i(%rip), %eax
	cltq
	movl	squares(,%rax,4), %edx
	movl	i(%rip), %ecx
	movl	$.LC0, %eax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L4:
	movl	i(%rip), %eax
	cmpl	$99, %eax
	jle	.L5
	movl	sum(%rip), %edx
	movl	$.LC1, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
