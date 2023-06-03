.section .data
cpuStr: .asciz "CPUID = %x\n"
funcStr: .asciz "Max function number = %i\n"
vendorStr: .asciz "Vendor ID = %s\n"

.section .text
.globl main

main:
    pushq   %r12
    movl    $1, %eax
    subq    $16, %rsp
    cpuid
    leaq    cpuStr(%rip), %rdi
    movl    %eax, %esi
    call    printf
    movl    $0, %eax
    cpuid
    leaq    funcStr(%rip), %rdi
    movl    %eax, %esi
    movl    %edx, %r12d
    movl    %ecx, %ebp
    call    printf
    movl    %ebx, 3(%rsp)
    leaq    3(%rsp), %rsi
    leaq    vendorStr(%rip), %rdi
    movl    %r12d, 7(%rsp)
    movl    %ebp, 11(%rsp)
    call    printf
    addq    $16, %rsp
    popq    %r12

    movl    $60, %eax
    xorl    %edi, %edi
    syscall

.section .note.GNU-stack,"",@progbits
