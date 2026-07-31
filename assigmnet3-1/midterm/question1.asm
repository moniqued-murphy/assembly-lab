; result: (var1 +2) / (var3 - var2) = 7
; var1: 12
; var2: 15
; var3: 22

section .text
    global _start

_start:
    mov al, [var1]
    add al, 2
    mov bl, [var3]
    sub bl, [var2]
    mov ah, 0
    div bl
    add al, '0'
    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80
    
segment .bss
    result resd 1

section .data
    var1 DD 12
    var2 DD 15
    var3 DD 22