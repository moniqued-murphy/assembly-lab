section .text
    global _start

count:
    push ebp ; save old base pointer
    mov ebp, esp ; set new base pointer
    mov ecx, DWORD[ebp+8] ; load argument from stack into ecx

count_loop:
    dec ecx
    jnz count_loop

finish:
    leave
    ret

_start:
    mov eax, 7000
    push eax
    call count

done:
        mov eax, 1
        int 0x80
