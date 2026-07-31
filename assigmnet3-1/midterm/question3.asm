section .text
    global _start

_start:
    mov eax,[num]
    test eax,1
    jz even_label

    mov eax,4
    mov ebx,1
    mov ecx,oddmsg
    mov edx,oddlen
    int 0x80
    jmp done

even_label:
    mov eax,4
    mov ebx,1
    mov ecx,evenmsg
    mov edx,evenlen
    int 0x80

done:
    mov eax,1
    int 0x80

section .data
num     DD 7
oddmsg  db 'odd number', 0xa
oddlen  equ $ - oddmsg
evenmsg db 'even number', 0xa
evenlen equ $ - evenmsg