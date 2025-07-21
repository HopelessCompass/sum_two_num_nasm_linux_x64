global _start

section .rodata
    a: db 2
    b: db 3
    summa: db "And the summa is... "
    summa_len: equ $ - summa
    
section .data
    result: db 0
    
section .text

    _start:
    
    mov r10b, [a]
    mov r11b, [b]
    add r10b, r11b
    
    add r10b, '0'
    mov [result], r10b
    
    mov rax, 1
    mov rdi, 1
    mov rsi, summa
    mov rdx, summa_len
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall
