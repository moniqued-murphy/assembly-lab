section .text
        global _start

_start:
        mov ecx,15  
        mov ebx, 0

        label:
        inc ebx
        loop label

        mov eax,1
        int 0x80