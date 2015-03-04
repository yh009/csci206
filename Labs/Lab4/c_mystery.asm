	.file	"c_mystery.c"
.globl unused
	.data
	.align 4
	.type	unused, @object
	.size	unused, 4
unused:
	.long	-559038737
.globl x
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	89
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
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L3:
	movl	-16(%rbp), %eax
	addl	%eax, -12(%rbp)
	addl	$1, -16(%rbp)
.L2:
	cmpl	$10, -16(%rbp)
	jle	.L3
	movq	$x, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
