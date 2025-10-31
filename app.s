	.file	"app.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter a number to reverse : \0"
LC1:
	.ascii "%d\0"
	.align 4
LC2:
	.ascii "Noting to reverse %d is a single digit number\12\0"
LC3:
	.ascii "Reversed number : %d\12\0"
LC4:
	.ascii "%d is a palindrome\12\0"
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	cmpl	$-9, %eax
	jl	L2
	movl	24(%esp), %eax
	cmpl	$9, %eax
	jg	L2
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L3
L2:
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	_reveseNumber
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	24(%esp), %eax
	cmpl	%eax, 28(%esp)
	jne	L3
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L3:
	movl	$0, %eax
	leave
	ret
.globl _reverseNumber
	.def	_reverseNumber;	.scl	2;	.type	32;	.endef
_reverseNumber:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L5
L6:
	movl	8(%ebp), %eax
	movl	$10, %ecx
	cltd
	idivl	%ecx
	movl	%edx, -8(%ebp)
	movl	-4(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	%eax
	addl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 8(%ebp)
L5:
	cmpl	$0, 8(%ebp)
	jne	L6
	movl	-4(%ebp), %eax
	leave
	ret
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_reveseNumber;	.scl	2;	.type	32;	.endef
