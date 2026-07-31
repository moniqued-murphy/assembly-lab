section .text
        global _start

_addsum:
    push ebp
    mov ebp, esp
    sub esp, 16

    mov eax, [ebp+8]
    add eax, [ebp+12]
    add eax, [ebp+16]
    mov [ebp-4], eax

    leave
    ret

_start:
    push 5
    push 10
    push 15
    call _addsum
    mov [result], eax

    mov eax, 1
    int 0x80

segment .bss
    result resd 1
