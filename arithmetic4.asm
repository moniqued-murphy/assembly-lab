section .text
    global _start

_start:
    mov eax, [var1]
    mov ebx, 2
    imul ebx
    mov ebx, [var2]
    sub ebx, 3
    idiv ebx
    mov [result], eax

    mov eax, 1
    int 0x80

segment .bss
    result resd 1

section .data
    var1 DD 15
    var2 DD 5
