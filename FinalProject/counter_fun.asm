section .text
    global _start

count:
    push ebp ; save old base pointer
    mov ebp, esp ; set new base pointer
    mov ecx, DWORD[ebp+8] ; load argument from stack into ecx

count_loop:
    dec ecx ; decrement ecx
    jnz count_loop ; jump back if not zer

finish:
    leave ; restore stack
    ret ; return to caller

_start:
    mov eax, 7000 ; load counter value
    push eax ; push onto stack
    call count ; call the function 

done:
        mov eax, 1
        int 0x80c
