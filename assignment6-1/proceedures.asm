section .text
        global _start

_start:
        mov eax,65
        mov ebx, 26

letter_loop:
        mov [char], eax
        mov ecx, char

        push ebx
        call output
        pop ebx

        mov eax, 10
        mov [nl], eax
        mov ecx, nl

        push ebx
        call output
        pop ebx

        mov eax, [char]
        inc eax
        dec ebx
        jnz letter_loop

        mov eax, 1
        int 0x80

output:
    mov edx,1
    mov ebx,1
    mov eax,4
    int 0x80
    ret

segment .bss
        nl resd 1
        char resd 1