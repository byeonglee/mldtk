#define STACK_OFFSET_XMM7               (- 8)
#define STACK_OFFSET_XMM6               (STACK_OFFSET_XMM7 - 8)
#define STACK_OFFSET_XMM5               (STACK_OFFSET_XMM6 - 8)
#define STACK_OFFSET_XMM4               (STACK_OFFSET_XMM5 - 8)
#define STACK_OFFSET_XMM3               (STACK_OFFSET_XMM4 - 8)
#define STACK_OFFSET_XMM2               (STACK_OFFSET_XMM3 - 8)
#define STACK_OFFSET_XMM1               (STACK_OFFSET_XMM2 - 8)
#define STACK_OFFSET_XMM0               (STACK_OFFSET_XMM1 - 8)
#define STACK_OFFSET_R9                 (STACK_OFFSET_XMM0 - 8)
#define STACK_OFFSET_R8                 (STACK_OFFSET_R9 - 8)
#define STACK_OFFSET_RCX                (STACK_OFFSET_R8 - 8)
#define STACK_OFFSET_RDX                (STACK_OFFSET_RCX - 8)
#define STACK_OFFSET_RSI                (STACK_OFFSET_RDX - 8)
#define STACK_OFFSET_RDI                (STACK_OFFSET_RSI - 8)
#define STACK_OFFSET_NMDESC             (STACK_OFFSET_RDI - 8)
#define STACK_OFFSET_ORIG_TARGET        (STACK_OFFSET_NMDESC - 8)
#define STACK_OFFSET_NM_STK_ARG_COUNT   (STACK_OFFSET_ORIG_TARGET - 8)
#define STACK_OFFSET_NM_STK_ARG_BYTES   (STACK_OFFSET_NM_STK_ARG_COUNT - 8)
#define STACK_OFFSET_RESULT             (STACK_OFFSET_NM_STK_ARG_BYTES - 8)
#define STACK_OFFSET_SAVED_RET_ADDR     (STACK_OFFSET_RESULT - 8)
#define STACK_OFFSET_SAVED_OLD_FP       (STACK_OFFSET_SAVED_RET_ADDR - 8)
#define STACK_OFFSET_BDA_STATE          (STACK_OFFSET_SAVED_OLD_FP - 8)
#define _STACK_STORAGE_SIZE             (-STACK_OFFSET_BDA_STATE)

#if _STACK_STORAGE_SIZE % 16 == 0
#define STACK_STORAGE_SIZE              _STACK_STORAGE_SIZE
#else
#define STACK_STORAGE_SIZE              ((_STACK_STORAGE_SIZE + 15) & ~15)
#endif

#define DWARF_REG_RBP                 6
#define DWARF_REG_RSP                 7

        .global bda_j2c_proxy
        .type bda_j2c_proxy, @function
        .text
bda_j2c_proxy:
        .cfi_startproc
        endbr64
        push %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset DWARF_REG_RBP, -16
        movq %rsp, %rbp
        .cfi_def_cfa_register DWARF_REG_RBP
        subq $STACK_STORAGE_SIZE, %rsp

        movq %rax, STACK_OFFSET_NMDESC(%rbp)
        /* store volatile parameter registers */
        movq %rdi, STACK_OFFSET_RDI(%rbp)
        movq %rsi, STACK_OFFSET_RSI(%rbp)
        movq %rdx, STACK_OFFSET_RDX(%rbp)
        movq %rcx, STACK_OFFSET_RCX(%rbp)
        movq %r8, STACK_OFFSET_R8(%rbp)
        movq %r9, STACK_OFFSET_R9(%rbp)

        movq STACK_OFFSET_NMDESC(%rbp), %rdi
        call nmdesc_get_orig_target
        movq %rax, STACK_OFFSET_ORIG_TARGET(%rbp)
        movq STACK_OFFSET_RDI(%rbp), %rdi /*JNIEnv pointer*/
        call bda_get_state_info
        movq %rax, STACK_OFFSET_BDA_STATE(%rbp)

        testq %rax,%rax
        je 1f
        /* stitch stack frames */
        movq 0(%rbp), %rax
        movq %rax, STACK_OFFSET_SAVED_OLD_FP(%rbp)
        movq 8(%rbp), %rax
        movq %rax, STACK_OFFSET_SAVED_RET_ADDR(%rbp)
        movq STACK_OFFSET_BDA_STATE(%rbp), %rdi
        call bda_state_c2j_old_fp
        movq %rax, 0(%rbp)
        movq STACK_OFFSET_BDA_STATE(%rbp), %rdi
        call bda_state_c2j_ret_addr
        movq %rax, 8(%rbp)

        /* call prof_j2c_call */
        movq STACK_OFFSET_BDA_STATE(%rbp), %rdi
        movq STACK_OFFSET_NMDESC(%rbp), %rsi
        leaq STACK_OFFSET_RDI(%rbp), %rdx
        leaq STACK_OFFSET_XMM0(%rbp), %rcx
        leaq 16(%rbp), %r8
        call prof_j2c_call
1:

        /* place some arguments on the stack */
        movq STACK_OFFSET_NMDESC(%rbp), %rdi
        call nmdesc_get_stack_arg_count
        movq %rax, STACK_OFFSET_NM_STK_ARG_COUNT(%rbp)
        movq %rax, STACK_OFFSET_NM_STK_ARG_BYTES(%rbp)
        shlq $3, STACK_OFFSET_NM_STK_ARG_BYTES(%rbp)
        testq $1,%rax
        je 1f
        push $0 /* pad bytes to satisfy the 16 bytes alignment */
        addq $8, STACK_OFFSET_NM_STK_ARG_BYTES(%rbp)
1:
.Lentry:
        testq %rax, %rax
        je .Lexit
        push 8(%rbp,  %rax, 8)
        dec %rax
        jmp .Lentry
.Lexit:

        /* restore parameter registers */
        movq STACK_OFFSET_RDI(%rbp), %rdi
        movq STACK_OFFSET_RSI(%rbp), %rsi
        movq STACK_OFFSET_RDX(%rbp), %rdx
        movq STACK_OFFSET_RCX(%rbp), %rcX
        movq STACK_OFFSET_R9(%rbp), %r9
        movq STACK_OFFSET_R8(%rbp), %r8

        /* call the original target */
        movq STACK_OFFSET_ORIG_TARGET(%rbp), %rax
        call *%rax
        movq %rax, STACK_OFFSET_RESULT(%rbp)
        addq STACK_OFFSET_NM_STK_ARG_BYTES(%rbp), %rsp

        movq STACK_OFFSET_BDA_STATE(%rbp), %rax
        testq %rax,%rax
        je 1f
        /* unstitch stack frames */
        movq STACK_OFFSET_SAVED_OLD_FP(%rbp), %rax
        movq %rax, 0(%rbp)
        movq STACK_OFFSET_SAVED_RET_ADDR(%rbp), %rax
        movq %rax, 8(%rbp)
        /* call prof_j2c_return */
        movq STACK_OFFSET_BDA_STATE(%rbp), %rdi
        movq STACK_OFFSET_NMDESC(%rbp), %rsi
        movq STACK_OFFSET_RDI(%rbp), %rdx
        movq STACK_OFFSET_RESULT(%rbp), %rcx
        call prof_j2c_return
1:

        movq STACK_OFFSET_RESULT(%rbp), %rax
        addq $STACK_STORAGE_SIZE, %rsp
        pop %rbp
        ret
        .cfi_endproc
