section .text
    global _start

_start:
    mov eax, 0

lable:
    add eax, 2
    cmp eax, 20
    jl lable

    mov eax, 1
    int 0x80