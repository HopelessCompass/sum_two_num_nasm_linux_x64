global _start

section .rodata
    a: db 2
    b: db 3
    summa: db "And the summa is... "
    summa_len: equ $ - summa
    
section .data
    result: db 0
    
section .text

set_syswrite_registers:
    mov rax, 1
    mov rdi, 1
    ret

_start:

    mov r10b, [a]
    add r10b, [b]
    
    add r10b, '0'
    mov [result], r10b

    call set_syswrite_registers
    mov rsi, summa
    mov rdx, summa_len
    syscall

    call set_syswrite_registers
    mov rsi, result
    mov rdx, 1
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall
