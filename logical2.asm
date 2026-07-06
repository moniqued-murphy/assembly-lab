section .text
    global _start

_start:
    mov eax, 8
    test eax, 1
    mov [result], eax

    mov eax, 1
    int 0x80

segment .bss
    result resd 1
