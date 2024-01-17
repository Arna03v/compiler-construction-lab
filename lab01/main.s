	.file	"main.c"
	.text
	.globl	globalCount
	.bss
	.align 4
	.type	globalCount, @object
	.size	globalCount, 4
globalCount:
	.zero	4
	.text
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	globalCount(%rip), %eax
	addl	$1, %eax
	movl	%eax, globalCount(%rip)
	cmpl	$0, -4(%rbp)
	jle	.L2
	cmpl	$0, -8(%rbp)
	jle	.L2
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L3
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	gcd
	jmp	.L4
.L3:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L5
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	gcd
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	jmp	.L4
.L2:
	movl	-4(%rbp), %eax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	gcd, .-gcd
	.section	.rodata
.LC0:
	.string	"gcd(a = %d, b = %d) = %d; "
.LC1:
	.string	"obtained in %d iterations.\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$10, -8(%rbp)
	movl	$15, -4(%rbp)
	cmpl	$1, -20(%rbp)
	jle	.L7
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -8(%rbp)
	cmpl	$2, -20(%rbp)
	jle	.L7
	movq	-32(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -4(%rbp)
.L7:
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	gcd
	movl	%eax, %ecx
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	globalCount(%rip), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
