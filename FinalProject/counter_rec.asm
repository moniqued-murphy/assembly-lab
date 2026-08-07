section .text
    global _start

count:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    cmp ecx, 0
    je done
    dec ecx
    push ecx
    call count

done:
    leave
    ret

_start:
    mov eax, 7000
    push eax
    call count 

    mov eax, 1
    int 0x80
