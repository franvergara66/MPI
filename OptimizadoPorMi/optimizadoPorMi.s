	.file	"optimizadoPorMi.c"
	.text
.globl foobar
	.type	foobar, @function
foobar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	$0, -4(%ebp)
	movl	$1, -8(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L2
.L5:
	movl	-4(%ebp), %eax
	addl	$512, %eax
	movl	%eax, -16(%ebp)
	movl	-4(%ebp), %eax
	sall	$3, %eax
	imull	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	.L3
.L4:
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	sall	$2, %eax
	imull	-16(%ebp), %eax
	leal	(%edx,%eax), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -8(%ebp)
.L3:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jle	.L4
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jle	.L5
	movl	-12(%ebp), %eax
	leave
	ret
	.size	foobar, .-foobar
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	$100000, 8(%esp)
	movl	$90, 4(%esp)
	movl	$10, (%esp)
	call	foobar
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
