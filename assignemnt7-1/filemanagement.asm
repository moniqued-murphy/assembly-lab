section .text
        global _start

_start:
        ;file open 
        mov ecx, 0711o
        mov ebx, filename
        mov eax, 8 
        int 0x80
        mov [fd_out], eax

        ;file write quote1
        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, quote1
        mov edx, len1
        int 0x80 

        ;file write quote2
        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, quote2
        mov edx, len2
        int 0x80

        ;file close
        mov eax, 6
        mov ebx, [fd_out]
        int 0x80

        ;append
        ;file open 
        mov eax, 5
        mov edx, 0777o
        mov ebx, filename
        mov ecx, 1
        int 0x80
        mov [fd_out], eax

        ;find end of file 
        mov eax, 19
        mov ebx, [fd_out]
        mov ecx, 0
        mov edx, 2
        int 0x80

        ;write quote3
        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, quote3
        mov edx, len3
        int 0x80

        ;write quote4
        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, quote4
        mov edx, len4
        int 0x80

        ;file close
        mov eax, 6
        mov ebx, [fd_out]
        int 0x80

        mov eax, 1
        int 0x80

section .bss
        fd_out resb 1

section .data 
        filename db 'quotes.txt', 0h
        quote1 db 'To be, or not to be, that is the question.', 0h
        len1 equ $ - quote1
        quote2 db 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', 0h
        len2 equ $ - quote2
        quote3 db 'Better three hours too soon than a minute too late.', 0h
        len3 equ $ - quote3
        quote4 db 'No legacy is so rich as honesty.', 0h
        len4 equ $ - quote4
