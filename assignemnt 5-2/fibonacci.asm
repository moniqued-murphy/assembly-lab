section .text
        global _start

_start:
        mov eax, 0 
        mov ebx, 1
        mov ecx, 10

        label:
        mov edx, ebx
        add ebx, eax
        mov eax, edx
        loop label

        mov eax,1
        int 0x80