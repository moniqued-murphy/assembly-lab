section .text
    global _start

_start:
    mov eax, [var1]
    mov eax, 0
    sub eax, [var1]
    mov ebx, 10
    imul ebx
    mov [result], eax

    mov eax, 1
    int 0x80

segment .bss
    result resd 1

section .data
    var1 DD 12
