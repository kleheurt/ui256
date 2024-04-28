	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"uint256.cpp"
	.def	"?from_2pow@@YAXQEAE_KAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?from_2pow@@YAXQEAE_KAEAY03_K@Z" # -- Begin function ?from_2pow@@YAXQEAE_KAEAY03_K@Z
	.p2align	4, 0x90
"?from_2pow@@YAXQEAE_KAEAY03_K@Z":      # @"?from_2pow@@YAXQEAE_KAEAY03_K@Z"
.seh_proc "?from_2pow@@YAXQEAE_KAEAY03_K@Z"
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%r8, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	$0, 40(%rsp)
	movb	$0, 38(%rsp)
	movq	64(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movl	$0, 32(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movslq	32(%rsp), %rax
	cmpq	56(%rsp), %rax
	jae	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	48(%rsp), %rax
	movslq	32(%rsp), %rcx
	movb	(%rax,%rcx), %al
	movb	%al, 38(%rsp)
	movzbl	38(%rsp), %eax
                                        # kill: def $rax killed $eax
	shrq	$6, %rax
                                        # kill: def $al killed $al killed $rax
	movb	%al, 39(%rsp)
	movzbl	38(%rsp), %eax
	movl	%eax, %ecx
	andq	$63, %rcx
	movl	$1, %eax
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rax
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rdx
	movq	64(%rsp), %rax
	movzbl	39(%rsp), %ecx
                                        # kill: def $rcx killed $ecx
	orq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	32(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	jmp	.LBB0_1
.LBB0_4:
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?zero_out@@YAXAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?zero_out@@YAXAEAY03_K@Z"
	.globl	"?zero_out@@YAXAEAY03_K@Z"      # -- Begin function ?zero_out@@YAXAEAY03_K@Z
	.p2align	4, 0x90
"?zero_out@@YAXAEAY03_K@Z":             # @"?zero_out@@YAXAEAY03_K@Z"
.seh_proc "?zero_out@@YAXAEAY03_K@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	movq	UINT256_ZERO(%rip), %rcx
	movq	%rcx, (%rax)
	movq	UINT256_ZERO+8(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	UINT256_ZERO+16(%rip), %rcx
	movq	%rcx, 16(%rax)
	movq	UINT256_ZERO+24(%rip), %rcx
	movq	%rcx, 24(%rax)
	popq	%rax
	retq
	.seh_endproc
                                        # -- End function
	.def	"?eq@@YA_NQEA_K0@Z";
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	"?eq@@YA_NQEA_K0@Z"             # -- Begin function ?eq@@YA_NQEA_K0@Z
	.p2align	4, 0x90
"?eq@@YA_NQEA_K0@Z":                    # @"?eq@@YA_NQEA_K0@Z"
.seh_proc "?eq@@YA_NQEA_K0@Z"
# %bb.0:
	subq	$48, %rsp
	.seh_stackalloc 48
	.seh_endprologue
	movq	%rdx, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movq	$0, 8(%rsp)
	movl	$0, 4(%rsp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB2_6
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	24(%rsp), %rax
	movslq	4(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	32(%rsp), %rcx
	movslq	4(%rsp), %rdx
	cmpq	(%rcx,%rdx,8), %rax
	je	.LBB2_4
# %bb.3:
	movb	$0, 47(%rsp)
	jmp	.LBB2_7
.LBB2_4:                                #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_1 Depth=1
	movl	4(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB2_1
.LBB2_6:
	movb	$1, 47(%rsp)
.LBB2_7:
	movb	47(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$48, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?compare@@YAHQEA_K0@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?compare@@YAHQEA_K0@Z"         # -- Begin function ?compare@@YAHQEA_K0@Z
	.p2align	4, 0x90
"?compare@@YAHQEA_K0@Z":                # @"?compare@@YAHQEA_K0@Z"
.seh_proc "?compare@@YAHQEA_K0@Z"
# %bb.0:
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rdx, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movl	$3, 4(%rsp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, 4(%rsp)
	jl	.LBB3_9
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	16(%rsp), %rcx
	movslq	4(%rsp), %rdx
	cmpq	(%rcx,%rdx,8), %rax
	jne	.LBB3_4
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_8
.LBB3_4:
	movq	8(%rsp), %rax
	movslq	4(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	16(%rsp), %rcx
	movslq	4(%rsp), %rdx
	cmpq	(%rcx,%rdx,8), %rax
	jbe	.LBB3_6
# %bb.5:
	movl	$1, 28(%rsp)
	jmp	.LBB3_10
.LBB3_6:
	jmp	.LBB3_7
.LBB3_7:
	movl	$-1, 28(%rsp)
	jmp	.LBB3_10
.LBB3_8:                                #   in Loop: Header=BB3_1 Depth=1
	movl	4(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 4(%rsp)
	jmp	.LBB3_1
.LBB3_9:
	movl	$0, 28(%rsp)
.LBB3_10:
	movl	28(%rsp), %eax
	addq	$32, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z" # -- Begin function ?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z
	.p2align	4, 0x90
"?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z": # @"?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z"
.seh_proc "?add_deprecated_do_not_use@@YAXQEA_K0AEAY03_K@Z"
# %bb.0:
	subq	$120, %rsp
	.seh_stackalloc 120
	.seh_endprologue
	movq	%r8, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movq	%rcx, 96(%rsp)
	movq	112(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movb	$0, 95(%rsp)
	movl	$0, 88(%rsp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movslq	88(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB4_6
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movq	96(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movabsq	$-4611686018427387904, %rax     # imm = 0xC000000000000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$2, %rax
	movq	%rax, 80(%rsp)
	movq	104(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movabsq	$-4611686018427387904, %rax     # imm = 0xC000000000000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$2, %rax
	movq	%rax, 72(%rsp)
	movq	96(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movabsq	$288230376151711743, %rax       # imm = 0x3FFFFFFFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	movq	%rax, 64(%rsp)
	movq	104(%rsp), %rcx
	movslq	88(%rsp), %rdx
	movabsq	$288230376151711743, %rax       # imm = 0x3FFFFFFFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	movq	%rax, 56(%rsp)
	movq	64(%rsp), %rax
	addq	56(%rsp), %rax
	movzbl	95(%rsp), %ecx
                                        # kill: def $rcx killed $ecx
	addq	%rcx, %rax
	movq	%rax, 48(%rsp)
	movq	80(%rsp), %rax
	addq	72(%rsp), %rax
	movq	%rax, 40(%rsp)
	movabsq	$-4611686018427387904, %rax     # imm = 0xC000000000000000
	andq	48(%rsp), %rax
	cmpq	$0, %rax
	je	.LBB4_4
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movq	40(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 40(%rsp)
.LBB4_4:                                #   in Loop: Header=BB4_1 Depth=1
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rax
	shlq	$2, %rax
	orq	%rax, %rdx
	movq	112(%rsp), %rax
	movslq	88(%rsp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movq	40(%rsp), %rax
	shrq	$62, %rax
                                        # kill: def $al killed $al killed $rax
	movb	%al, 95(%rsp)
# %bb.5:                                #   in Loop: Header=BB4_1 Depth=1
	movl	88(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 88(%rsp)
	jmp	.LBB4_1
.LBB4_6:
	cmpb	$0, 95(%rsp)
	je	.LBB4_8
# %bb.7:
	movq	112(%rsp), %rcx
	callq	"?max_out@@YAXAEAY03_K@Z"
.LBB4_8:
	nop
	addq	$120, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?max_out@@YAXAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"?max_out@@YAXAEAY03_K@Z"
	.globl	"?max_out@@YAXAEAY03_K@Z"       # -- Begin function ?max_out@@YAXAEAY03_K@Z
	.p2align	4, 0x90
"?max_out@@YAXAEAY03_K@Z":              # @"?max_out@@YAXAEAY03_K@Z"
.seh_proc "?max_out@@YAXAEAY03_K@Z"
# %bb.0:
	pushq	%rax
	.seh_stackalloc 8
	.seh_endprologue
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	movq	UINT256_MAX(%rip), %rcx
	movq	%rcx, (%rax)
	movq	UINT256_MAX+8(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	UINT256_MAX+16(%rip), %rcx
	movq	%rcx, 16(%rax)
	movq	UINT256_MAX+24(%rip), %rcx
	movq	%rcx, 24(%rax)
	popq	%rax
	retq
	.seh_endproc
                                        # -- End function
	.def	"?add@@YAXQEA_K0AEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	"?add@@YAXQEA_K0AEAY03_K@Z"     # -- Begin function ?add@@YAXQEA_K0AEAY03_K@Z
	.p2align	4, 0x90
"?add@@YAXQEA_K0AEAY03_K@Z":            # @"?add@@YAXQEA_K0AEAY03_K@Z"
.seh_proc "?add@@YAXQEA_K0AEAY03_K@Z"
# %bb.0:
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%r8, 96(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	96(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, 44(%rsp)
.LBB6_1:                                # =>This Inner Loop Header: Depth=1
	movslq	44(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB6_4
# %bb.2:                                #   in Loop: Header=BB6_1 Depth=1
	movq	80(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	movq	%rax, 72(%rsp)
	movq	88(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	addq	56(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	addq	64(%rsp), %rax
	movq	%rax, 56(%rsp)
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	56(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	80(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$32, %rax
	movq	%rax, 72(%rsp)
	movq	88(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$32, %rax
	movq	%rax, 64(%rsp)
	movq	56(%rsp), %rax
	shrq	$32, %rax
	addq	64(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	addq	64(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	48(%rsp), %rdx
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	56(%rsp), %rax
	shlq	$32, %rax
	orq	%rax, %rdx
	movq	96(%rsp), %rax
	movslq	44(%rsp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movq	56(%rsp), %rax
	shrq	$32, %rax
	movq	%rax, 56(%rsp)
# %bb.3:                                #   in Loop: Header=BB6_1 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB6_1
.LBB6_4:
	cmpq	$0, 56(%rsp)
	je	.LBB6_6
# %bb.5:
	movq	96(%rsp), %rcx
	callq	"?max_out@@YAXAEAY03_K@Z"
.LBB6_6:
	nop
	addq	$104, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?sub@@YAXQEA_K0AEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?sub@@YAXQEA_K0AEAY03_K@Z"     # -- Begin function ?sub@@YAXQEA_K0AEAY03_K@Z
	.p2align	4, 0x90
"?sub@@YAXQEA_K0AEAY03_K@Z":            # @"?sub@@YAXQEA_K0AEAY03_K@Z"
.seh_proc "?sub@@YAXQEA_K0AEAY03_K@Z"
# %bb.0:
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%r8, 96(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	96(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, 44(%rsp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	movslq	44(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB7_4
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movq	80(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	movq	%rax, 72(%rsp)
	movq	88(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$4294967295, %rax               # imm = 0xFFFFFFFF
	andq	(%rcx,%rdx,8), %rax
	addq	56(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	cmpq	64(%rsp), %rax
	setl	%al
	andb	$1, %al
	movzbl	%al, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 56(%rsp)
	movq	56(%rsp), %rax
	shlq	$32, %rax
	orq	72(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	72(%rsp), %rax
	subq	64(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	80(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$32, %rax
	movq	%rax, 72(%rsp)
	movq	88(%rsp), %rcx
	movslq	44(%rsp), %rdx
	movabsq	$-4294967296, %rax              # imm = 0xFFFFFFFF00000000
	andq	(%rcx,%rdx,8), %rax
	shrq	$32, %rax
	addq	56(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	72(%rsp), %rax
	cmpq	64(%rsp), %rax
	setl	%al
	andb	$1, %al
	movzbl	%al, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 56(%rsp)
	movq	56(%rsp), %rax
	shlq	$32, %rax
	orq	72(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	72(%rsp), %rax
	subq	64(%rsp), %rax
	shlq	$32, %rax
	orq	48(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rdx
	movq	72(%rsp), %rax
	subq	64(%rsp), %rax
	shlq	$32, %rax
	orq	%rax, %rdx
	movq	96(%rsp), %rax
	movslq	44(%rsp), %rcx
	movq	%rdx, (%rax,%rcx,8)
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB7_1
.LBB7_4:
	cmpq	$0, 56(%rsp)
	je	.LBB7_6
# %bb.5:
	movq	96(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
.LBB7_6:
	nop
	addq	$104, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?shl_deprecated@@YAXQEA_KHAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?shl_deprecated@@YAXQEA_KHAEAY03_K@Z" # -- Begin function ?shl_deprecated@@YAXQEA_KHAEAY03_K@Z
	.p2align	4, 0x90
"?shl_deprecated@@YAXQEA_KHAEAY03_K@Z": # @"?shl_deprecated@@YAXQEA_KHAEAY03_K@Z"
.seh_proc "?shl_deprecated@@YAXQEA_KHAEAY03_K@Z"
# %bb.0:
	subq	$120, %rsp
	.seh_stackalloc 120
	.seh_endprologue
	movq	%r8, 112(%rsp)
	movl	%edx, 108(%rsp)
	movq	%rcx, 96(%rsp)
	movq	112(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movslq	108(%rsp), %rax
	andq	$63, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 92(%rsp)
	movslq	92(%rsp), %rcx
	movl	$64, %eax
	subq	%rcx, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 88(%rsp)
	movslq	88(%rsp), %rax
	andq	$63, %rax
	cmpq	$0, %rax
	jne	.LBB8_2
# %bb.1:
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	jmp	.LBB8_3
.LBB8_2:
	movl	88(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
.LBB8_3:
	movq	40(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 80(%rsp)
	movl	92(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rax
	movq	%rax, 72(%rsp)
	movl	$0, 68(%rsp)
.LBB8_4:                                # =>This Inner Loop Header: Depth=1
	movslq	68(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB8_11
# %bb.5:                                #   in Loop: Header=BB8_4 Depth=1
	movslq	68(%rsp), %rax
	shlq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 64(%rsp)
	movl	64(%rsp), %eax
	addl	108(%rsp), %eax
	movl	%eax, 60(%rsp)
	movslq	60(%rsp), %rax
	addq	$64, %rax
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 56(%rsp)
	movl	64(%rsp), %eax
	addl	108(%rsp), %eax
	cltq
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 52(%rsp)
	movslq	56(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB8_7
# %bb.6:                                #   in Loop: Header=BB8_4 Depth=1
	movq	96(%rsp), %rax
	movslq	68(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdx
	andq	80(%rsp), %rdx
	movl	92(%rsp), %eax
	movl	%eax, %ecx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	movq	112(%rsp), %rax
	movslq	56(%rsp), %rcx
	orq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
.LBB8_7:                                #   in Loop: Header=BB8_4 Depth=1
	movslq	52(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB8_9
# %bb.8:                                #   in Loop: Header=BB8_4 Depth=1
	movq	96(%rsp), %rax
	movslq	68(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdx
	andq	72(%rsp), %rdx
	movl	92(%rsp), %eax
	movl	%eax, %ecx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rdx
	movq	112(%rsp), %rax
	movslq	52(%rsp), %rcx
	orq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
.LBB8_9:                                #   in Loop: Header=BB8_4 Depth=1
	jmp	.LBB8_10
.LBB8_10:                               #   in Loop: Header=BB8_4 Depth=1
	movl	68(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 68(%rsp)
	jmp	.LBB8_4
.LBB8_11:
	addq	$120, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?shl@@YAXQEA_KHAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?shl@@YAXQEA_KHAEAY03_K@Z"     # -- Begin function ?shl@@YAXQEA_KHAEAY03_K@Z
	.p2align	4, 0x90
"?shl@@YAXQEA_KHAEAY03_K@Z":            # @"?shl@@YAXQEA_KHAEAY03_K@Z"
.seh_proc "?shl@@YAXQEA_KHAEAY03_K@Z"
# %bb.0:
	subq	$120, %rsp
	.seh_stackalloc 120
	.seh_endprologue
	movq	%r8, 112(%rsp)
	movl	%edx, 108(%rsp)
	movq	%rcx, 96(%rsp)
	movq	112(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movq	$0, 80(%rsp)
	movslq	108(%rsp), %rax
	andq	$63, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 76(%rsp)
	movslq	76(%rsp), %rcx
	movl	$64, %eax
	subq	%rcx, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 72(%rsp)
	movslq	76(%rsp), %rax
	andq	$63, %rax
	cmpq	$0, %rax
	jne	.LBB9_2
# %bb.1:
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	jmp	.LBB9_3
.LBB9_2:
	movl	76(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
.LBB9_3:
	movq	32(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 64(%rsp)
	movl	72(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rax
	movq	%rax, 56(%rsp)
	movslq	108(%rsp), %rcx
	movl	$192, %eax
	subq	%rcx, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 52(%rsp)
	movslq	52(%rsp), %rax
	addq	$64, %rax
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 48(%rsp)
	movslq	52(%rsp), %rax
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 44(%rsp)
	movl	$3, 40(%rsp)
.LBB9_4:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, 40(%rsp)
	jl	.LBB9_6
# %bb.5:                                #   in Loop: Header=BB9_4 Depth=1
	movq	96(%rsp), %rax
	movslq	48(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	andq	64(%rsp), %rax
	movq	%rax, 88(%rsp)
	movq	96(%rsp), %rax
	movslq	44(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	andq	56(%rsp), %rax
	movq	%rax, 80(%rsp)
	movl	76(%rsp), %ecx
	movq	88(%rsp), %rax
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rax
	movq	%rax, 88(%rsp)
	movl	72(%rsp), %ecx
	movq	80(%rsp), %rax
	movl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rax
	movq	%rax, 80(%rsp)
	movq	88(%rsp), %rdx
	orq	80(%rsp), %rdx
	movq	112(%rsp), %rax
	movslq	40(%rsp), %rcx
	movq	%rdx, (%rax,%rcx,8)
	movl	48(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 48(%rsp)
	movl	44(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 44(%rsp)
	movl	40(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB9_4
.LBB9_6:
	addq	$120, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?shr@@YAXQEA_KHAEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?shr@@YAXQEA_KHAEAY03_K@Z"     # -- Begin function ?shr@@YAXQEA_KHAEAY03_K@Z
	.p2align	4, 0x90
"?shr@@YAXQEA_KHAEAY03_K@Z":            # @"?shr@@YAXQEA_KHAEAY03_K@Z"
.seh_proc "?shr@@YAXQEA_KHAEAY03_K@Z"
# %bb.0:
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%r8, 96(%rsp)
	movl	%edx, 92(%rsp)
	movq	%rcx, 80(%rsp)
	movq	96(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	movslq	92(%rsp), %rax
	andq	$63, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 76(%rsp)
	movslq	76(%rsp), %rcx
	movl	$64, %eax
	subq	%rcx, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 72(%rsp)
	movl	72(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shlq	%cl, %rax
	movq	%rax, 64(%rsp)
	cmpl	$0, 76(%rsp)
	jne	.LBB10_2
# %bb.1:
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	jmp	.LBB10_3
.LBB10_2:
	movl	76(%rsp), %eax
	movl	%eax, %ecx
	movq	$-1, %rax
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
.LBB10_3:
	movq	32(%rsp), %rax                  # 8-byte Reload
	movq	%rax, 56(%rsp)
	movl	$3, 52(%rsp)
.LBB10_4:                               # =>This Inner Loop Header: Depth=1
	cmpl	$0, 52(%rsp)
	jl	.LBB10_11
# %bb.5:                                #   in Loop: Header=BB10_4 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	cltq
	shlq	$6, %rax
	movslq	92(%rsp), %rcx
	subq	%rcx, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 48(%rsp)
	movslq	48(%rsp), %rax
	subq	$64, %rax
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 44(%rsp)
	movslq	48(%rsp), %rax
	shrq	$6, %rax
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, 40(%rsp)
	cmpl	$0, 44(%rsp)
	jl	.LBB10_7
# %bb.6:                                #   in Loop: Header=BB10_4 Depth=1
	movq	80(%rsp), %rax
	movslq	52(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdx
	andq	64(%rsp), %rdx
	movl	76(%rsp), %eax
	movl	%eax, %ecx
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rdx
	movq	96(%rsp), %rax
	movslq	44(%rsp), %rcx
	orq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
.LBB10_7:                               #   in Loop: Header=BB10_4 Depth=1
	cmpl	$0, 40(%rsp)
	jl	.LBB10_9
# %bb.8:                                #   in Loop: Header=BB10_4 Depth=1
	movq	80(%rsp), %rax
	movslq	52(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdx
	andq	56(%rsp), %rdx
	movl	76(%rsp), %eax
	movl	%eax, %ecx
                                        # kill: def $cl killed $rcx
	shrq	%cl, %rdx
	movq	96(%rsp), %rax
	movslq	40(%rsp), %rcx
	orq	(%rax,%rcx,8), %rdx
	movq	%rdx, (%rax,%rcx,8)
.LBB10_9:                               #   in Loop: Header=BB10_4 Depth=1
	jmp	.LBB10_10
.LBB10_10:                              #   in Loop: Header=BB10_4 Depth=1
	movl	52(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB10_4
.LBB10_11:
	addq	$104, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?mul@@YAXQEA_K0AEAY03_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?mul@@YAXQEA_K0AEAY03_K@Z"     # -- Begin function ?mul@@YAXQEA_K0AEAY03_K@Z
	.p2align	4, 0x90
"?mul@@YAXQEA_K0AEAY03_K@Z":            # @"?mul@@YAXQEA_K0AEAY03_K@Z"
.seh_proc "?mul@@YAXQEA_K0AEAY03_K@Z"
# %bb.0:
	subq	$184, %rsp
	.seh_stackalloc 184
	.seh_endprologue
	movq	%r8, 176(%rsp)
	movq	%rdx, 168(%rsp)
	movq	%rcx, 160(%rsp)
	movq	176(%rsp), %rcx
	callq	"?zero_out@@YAXAEAY03_K@Z"
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	movl	$32, %r8d
	callq	memset
	movl	$0, 60(%rsp)
.LBB11_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_3 Depth 2
	movslq	60(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB11_10
# %bb.2:                                #   in Loop: Header=BB11_1 Depth=1
	movq	168(%rsp), %rax
	movslq	60(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, 48(%rsp)
	movq	$1, 40(%rsp)
	movl	$0, 36(%rsp)
.LBB11_3:                               #   Parent Loop BB11_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	36(%rsp), %rax
	cmpq	$64, %rax
	jae	.LBB11_8
# %bb.4:                                #   in Loop: Header=BB11_3 Depth=2
	movq	48(%rsp), %rax
	andq	40(%rsp), %rax
	cmpq	$0, %rax
	je	.LBB11_6
# %bb.5:                                #   in Loop: Header=BB11_3 Depth=2
	movslq	36(%rsp), %rax
	movslq	60(%rsp), %rcx
	shlq	$6, %rcx
	addq	%rcx, %rax
	movl	%eax, %edx
	movq	160(%rsp), %rcx
	leaq	128(%rsp), %r8
	callq	"?shl@@YAXQEA_KHAEAY03_K@Z"
	leaq	128(%rsp), %rdx
	leaq	64(%rsp), %rcx
	leaq	96(%rsp), %r8
	callq	"?add@@YAXQEA_K0AEAY03_K@Z"
	movq	96(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	104(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	112(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 88(%rsp)
.LBB11_6:                               #   in Loop: Header=BB11_3 Depth=2
	movq	40(%rsp), %rax
	shlq	%rax
	movq	%rax, 40(%rsp)
# %bb.7:                                #   in Loop: Header=BB11_3 Depth=2
	movl	36(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB11_3
.LBB11_8:                               #   in Loop: Header=BB11_1 Depth=1
	jmp	.LBB11_9
.LBB11_9:                               #   in Loop: Header=BB11_1 Depth=1
	movl	60(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB11_1
.LBB11_10:
	movq	176(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 24(%rax)
	addq	$184, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?div@@YAXQEA_K0AEAY03_K1@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?div@@YAXQEA_K0AEAY03_K1@Z"    # -- Begin function ?div@@YAXQEA_K0AEAY03_K1@Z
	.p2align	4, 0x90
"?div@@YAXQEA_K0AEAY03_K1@Z":           # @"?div@@YAXQEA_K0AEAY03_K1@Z"
.seh_proc "?div@@YAXQEA_K0AEAY03_K1@Z"
# %bb.0:
	subq	$232, %rsp
	.seh_stackalloc 232
	.seh_endprologue
	movq	%r9, 224(%rsp)
	movq	%r8, 216(%rsp)
	movq	%rdx, 208(%rsp)
	movq	%rcx, 200(%rsp)
	movq	208(%rsp), %rcx
	leaq	UINT256_ZERO(%rip), %rdx
	callq	"?eq@@YA_NQEA_K0@Z"
	testb	$1, %al
	jne	.LBB12_1
	jmp	.LBB12_2
.LBB12_1:
	movq	216(%rsp), %rax
	movq	UINT256_MAX(%rip), %rcx
	movq	%rcx, (%rax)
	movq	UINT256_MAX+8(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	UINT256_MAX+16(%rip), %rcx
	movq	%rcx, 16(%rax)
	movq	UINT256_MAX+24(%rip), %rcx
	movq	%rcx, 24(%rax)
	movq	224(%rsp), %rax
	movq	UINT256_ZERO(%rip), %rcx
	movq	%rcx, (%rax)
	movq	UINT256_ZERO+8(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	UINT256_ZERO+16(%rip), %rcx
	movq	%rcx, 16(%rax)
	movq	UINT256_ZERO+24(%rip), %rcx
	movq	%rcx, 24(%rax)
	jmp	.LBB12_16
.LBB12_2:
	leaq	160(%rsp), %rcx
	xorl	%edx, %edx
	movl	$32, %r8d
	callq	memset
	leaq	64(%rsp), %rcx
	xorl	%edx, %edx
	movl	$32, %r8d
	callq	memset
	movl	$3, 60(%rsp)
.LBB12_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_5 Depth 2
	cmpl	$0, 60(%rsp)
	jl	.LBB12_15
# %bb.4:                                #   in Loop: Header=BB12_3 Depth=1
	movq	208(%rsp), %rax
	movslq	60(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, 48(%rsp)
	movabsq	$-9223372036854775808, %rax     # imm = 0x8000000000000000
	movq	%rax, 40(%rsp)
	movl	$63, 36(%rsp)
.LBB12_5:                               #   Parent Loop BB12_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$0, 36(%rsp)
	jl	.LBB12_13
# %bb.6:                                #   in Loop: Header=BB12_5 Depth=2
	movq	48(%rsp), %rax
	andq	40(%rsp), %rax
	cmpq	$0, %rax
	je	.LBB12_11
# %bb.7:                                #   in Loop: Header=BB12_5 Depth=2
	leaq	64(%rsp), %rcx
	movl	$1, %edx
	leaq	128(%rsp), %r8
	callq	"?shl@@YAXQEA_KHAEAY03_K@Z"
	movq	200(%rsp), %rax
	movslq	60(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	andq	40(%rsp), %rax
	orq	128(%rsp), %rax
	movq	%rax, 128(%rsp)
	movq	208(%rsp), %rdx
	leaq	128(%rsp), %rcx
	callq	"?compare@@YAHQEA_K0@Z"
	cmpl	$0, %eax
	jl	.LBB12_9
# %bb.8:                                #   in Loop: Header=BB12_5 Depth=2
	movq	208(%rsp), %rdx
	leaq	128(%rsp), %rcx
	leaq	64(%rsp), %r8
	callq	"?sub@@YAXQEA_K0AEAY03_K@Z"
	movq	40(%rsp), %rcx
	movslq	60(%rsp), %rax
	orq	160(%rsp,%rax,8), %rcx
	movq	%rcx, 160(%rsp,%rax,8)
	jmp	.LBB12_10
.LBB12_9:                               #   in Loop: Header=BB12_5 Depth=2
	movq	128(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	136(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	144(%rsp), %rax
	movq	%rax, 80(%rsp)
	movq	152(%rsp), %rax
	movq	%rax, 88(%rsp)
.LBB12_10:                              #   in Loop: Header=BB12_5 Depth=2
	jmp	.LBB12_11
.LBB12_11:                              #   in Loop: Header=BB12_5 Depth=2
	movq	40(%rsp), %rax
	shrq	%rax
	movq	%rax, 40(%rsp)
# %bb.12:                               #   in Loop: Header=BB12_5 Depth=2
	movl	36(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB12_5
.LBB12_13:                              #   in Loop: Header=BB12_3 Depth=1
	jmp	.LBB12_14
.LBB12_14:                              #   in Loop: Header=BB12_3 Depth=1
	movl	60(%rsp), %eax
	addl	$-1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB12_3
.LBB12_15:
	movq	216(%rsp), %rax
	movq	160(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	168(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	176(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	184(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	224(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 24(%rax)
.LBB12_16:
	addq	$232, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"?popcount256d@@YAHQEA_K@Z";
	.scl	2;
	.type	32;
	.endef
	.globl	"?popcount256d@@YAHQEA_K@Z"     # -- Begin function ?popcount256d@@YAHQEA_K@Z
	.p2align	4, 0x90
"?popcount256d@@YAHQEA_K@Z":            # @"?popcount256d@@YAHQEA_K@Z"
.seh_proc "?popcount256d@@YAHQEA_K@Z"
# %bb.0:
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	movq	%rcx, 24(%rsp)
	movl	$0, 20(%rsp)
	movl	$0, 16(%rsp)
.LBB13_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_3 Depth 2
	movslq	16(%rsp), %rax
	cmpq	$4, %rax
	jae	.LBB13_8
# %bb.2:                                #   in Loop: Header=BB13_1 Depth=1
	movl	$0, 12(%rsp)
	movq	24(%rsp), %rax
	movslq	16(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, (%rsp)
	movl	$0, 12(%rsp)
.LBB13_3:                               #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$0, (%rsp)
	je	.LBB13_6
# %bb.4:                                #   in Loop: Header=BB13_3 Depth=2
	movq	(%rsp), %rax
	subq	$1, %rax
	andq	(%rsp), %rax
	movq	%rax, (%rsp)
# %bb.5:                                #   in Loop: Header=BB13_3 Depth=2
	movl	12(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 12(%rsp)
	jmp	.LBB13_3
.LBB13_6:                               #   in Loop: Header=BB13_1 Depth=1
	movl	12(%rsp), %eax
	addl	20(%rsp), %eax
	movl	%eax, 20(%rsp)
# %bb.7:                                #   in Loop: Header=BB13_1 Depth=1
	movl	16(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 16(%rsp)
	jmp	.LBB13_1
.LBB13_8:
	movl	20(%rsp), %eax
	addq	$32, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.globl	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ" # -- Begin function ??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ
	.p2align	4, 0x90
"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ": # @"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
.seh_proc "??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	leaq	"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"(%rip), %rcx
	xorl	%eax, %eax
	movl	%eax, %edx
	callq	"??0id@locale@std@@QEAA@_K@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"??0id@locale@std@@QEAA@_K@Z";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??0id@locale@std@@QEAA@_K@Z"
	.globl	"??0id@locale@std@@QEAA@_K@Z"   # -- Begin function ??0id@locale@std@@QEAA@_K@Z
	.p2align	4, 0x90
"??0id@locale@std@@QEAA@_K@Z":          # @"??0id@locale@std@@QEAA@_K@Z"
.seh_proc "??0id@locale@std@@QEAA@_K@Z"
# %bb.0:
	subq	$16, %rsp
	.seh_stackalloc 16
	.seh_endprologue
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rcx, (%rax)
	addq	$16, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ";
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.globl	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ" # -- Begin function ??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ
	.p2align	4, 0x90
"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ": # @"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
.seh_proc "??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	leaq	"?id@?$numpunct@D@std@@2V0locale@2@A"(%rip), %rcx
	xorl	%eax, %eax
	movl	%eax, %edx
	callq	"??0id@locale@std@@QEAA@_K@Z"
	nop
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.lcomm	UINT256_ZERO,32,16              # @UINT256_ZERO
	.data
	.p2align	4, 0x0                          # @UINT256_MAX
UINT256_MAX:
	.zero	32,255

	.section	.bss,"bw",discard,"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.globl	"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A" # @"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.p2align	3, 0x0
"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A":
	.zero	8

	.section	.bss,"bw",discard,"?id@?$numpunct@D@std@@2V0locale@2@A"
	.globl	"?id@?$numpunct@D@std@@2V0locale@2@A" # @"?id@?$numpunct@D@std@@2V0locale@2@A"
	.p2align	3, 0x0
"?id@?$numpunct@D@std@@2V0locale@2@A":
	.zero	8

	.section	.CRT$XCU,"dr",associative,"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.p2align	3, 0x0
	.quad	"??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.section	.CRT$XCU,"dr",associative,"?id@?$numpunct@D@std@@2V0locale@2@A"
	.p2align	3, 0x0
	.quad	"??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.section	.drectve,"yni"
	.ascii	" /FAILIFMISMATCH:\"_MSC_VER=1900\""
	.ascii	" /FAILIFMISMATCH:\"_ITERATOR_DEBUG_LEVEL=0\""
	.ascii	" /FAILIFMISMATCH:\"RuntimeLibrary=MT_StaticRelease\""
	.ascii	" /DEFAULTLIB:libcpmt.lib"
	.ascii	" /FAILIFMISMATCH:\"_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\""
	.ascii	" /FAILIFMISMATCH:\"annotate_string=0\""
	.ascii	" /FAILIFMISMATCH:\"annotate_vector=0\""
	.ascii	" /INCLUDE:\"?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A\""
	.ascii	" /INCLUDE:\"?id@?$numpunct@D@std@@2V0locale@2@A\""
	.addrsig
	.addrsig_sym "?zero_out@@YAXAEAY03_K@Z"
	.addrsig_sym "?eq@@YA_NQEA_K0@Z"
	.addrsig_sym "?compare@@YAHQEA_K0@Z"
	.addrsig_sym "?max_out@@YAXAEAY03_K@Z"
	.addrsig_sym "?add@@YAXQEA_K0AEAY03_K@Z"
	.addrsig_sym "?sub@@YAXQEA_K0AEAY03_K@Z"
	.addrsig_sym "?shl@@YAXQEA_KHAEAY03_K@Z"
	.addrsig_sym "??__E?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A@@YAXXZ"
	.addrsig_sym "??__E?id@?$numpunct@D@std@@2V0locale@2@A@@YAXXZ"
	.addrsig_sym UINT256_ZERO
	.addrsig_sym UINT256_MAX
	.addrsig_sym "?id@?$num_put@DV?$ostreambuf_iterator@DU?$char_traits@D@std@@@std@@@std@@2V0locale@2@A"
	.addrsig_sym "?id@?$numpunct@D@std@@2V0locale@2@A"
