section .text
        global _start

_start:

    mov eax, [var1]
    add eax, [var2]
    mov [result], eax

    mov eax,1      ; set eax register to 1 
        int 0x80       ; interrupt 0x80 

segment .bss
        result resd 1

segment .data
    var1 DD 10 
    var2 DD 15