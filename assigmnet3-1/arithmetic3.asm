section .text
    global _start

_start:
    mov eax, 0
    sub eax, [var1]
    mov ebx, [var2]
    imul ebx
    add eax, [var3]
    mov [result], eax

    mov eax, 1
    int 0x80

segment .bss
    result resd 1

section .data
    var1 DD 2
    var2 DD 4
    var3 DD 6
