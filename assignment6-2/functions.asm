section .text
        global _start

is_even:
        push ebp
        mov ebp, esp

        mov eax, DWORD[ebp+8]

loop_sub:
        cmp eax, 1
        jle finish
        sub eax, 2
        jmp loop_sub

finish:
        leave
        ret

output:
        mov edx, 1
        mov ebx, 1
        mov eax, 4
        int 0x80
        ret

_start:
        mov eax, 7
        push eax
        call is_even

        cmp eax, 0
        je even

        mov eax, 79
        mov [char], eax
        mov ecx, char
        call output
        jmp done

even:
        mov eax, 69
        mov [char], eax
        mov ecx, char
        call output

done:
        mov eax, 1
        int 0x80

segment .bss
        char resd 1
