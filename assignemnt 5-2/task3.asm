section .text
        global _start

_start:
    mov eax, 2
    mov ebx, [array]
    mov ecx, array+4

    top:
        cmp ebx,[ecx]
        jg skip
        mov ebx,[ecx]
    skip:       
        add ecx, 4
        dec eax
        jnz top

        mov eax,1       
        int 0x80

section .data
        array dd 5,10,15  