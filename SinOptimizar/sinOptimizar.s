	.file	"codOptimizar.c"
	.text
.globl foobar
	.type	foobar, @function
foobar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$32, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$256, -20(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L7:
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	.L3
.L6:
	movl	-4(%ebp), %eax
	addl	%eax, %eax
	addl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	addl	-4(%ebp), %eax
	imull	%edx, %eax
	addl	%eax, -12(%ebp)
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jle	.L4
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$3, %eax
	addl	%eax, -16(%ebp)
	jmp	.L5
.L4:
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$3, %eax
	addl	%eax, -16(%ebp)
.L5:
	addl	$1, -8(%ebp)
.L3:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jle	.L6
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jle	.L7
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
