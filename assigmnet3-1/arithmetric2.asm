
section .text
    global _start

_start:
    mov eax, [var1]
    add eax, [var2]
    add eax, [var3]
    add eax, [var4]
    mov [result], eax

     mov eax, 1
    int 0x80

segment .bss
    result resd 1

section .data
    var1 DD 15
    var2 DD 20
    var3 DD 5
    var4 DD 10
