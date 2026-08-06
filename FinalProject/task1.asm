section .text
    global _start

_start:
    ;read message
    mov eax, 3 ; sys_read
    mov ebx, 0 ; stdin
    mov ecx, message ; buffer
    mov edx, 10 ; length
    int 0x80

    ; read key 
    mov eax, 3
    mov ebx, 0
    mov ecx, key
    mov edx, 10
    int 0x80

    ; file open 
    mov ecx, 0711o ; file permissions
    mov ebx, filename ; file to create 
    mov eax, 8 ; sys_creat
    int 0x80 
    mov [fd_out], eax

    ; write Plain text:
    mov eax, 4 ; sys_write
    mov ebx, [fd_out] 
    mov ecx, label1 ; buffer
    mov edx, len_label1 ; length
    int 0x80 

    ; write message
    mov eax, 4 
    mov ebx, [fd_out]
    mov ecx, message
    mov edx, 10
    int 0x80

    ; write Key:
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, label2
    mov edx, len_label2
    int 0x80

    ; write key
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, key
    mov edx, 10
    int 0x80

    ; Encryption loop 
    mov eax, 10
    mov ecx, message
    mov edx, key
    mov esi, encrypted

    encryption_loop:    
        mov bl, [ecx] ; load message byte
        xor bl, [edx] ; XOR with key byte
        inc ecx ; message pointer
        inc edx ; key pointer
        mov [esi], bl ; store encrypted byte
        inc esi ; encrypted pointer
        dec eax ; decrement counter
        jnz encryption_loop ; repeat until counter reaches zero 

    ; Decryption loop
    mov eax, 10
    mov ecx, encrypted
    mov edx, key
    mov esi, decrypted

    decryption_loop:
        mov bl, [ecx]
        xor bl, [edx]
        inc ecx
        inc edx
        mov [esi], bl
        inc esi
        dec eax
        jnz decryption_loop

    ; write Encrypted Text:
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, label3
    mov edx, len_label3
    int 0x80

    ; write encrypted
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, encrypted
    mov edx, 10
    int 0x80

    ; write newline
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; write Decrypted text:
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, label4
    mov edx, len_label4
    int 0x80


    ; write decrypted
    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, decrypted
    mov edx, 10
    int 0x80

    ; file close
    mov eax, 6
    mov ebx, [fd_out]
    int 0x80

    mov eax, 1
    int 0x80

section .bss
    fd_out resd 1
    message resb 10
    key resb 10
    encrypted resb 10
    decrypted resb 10

section .data
    filename db 'output.txt', 0h
    label1 db 'Plain text: ', 0h
    len_label1 equ $ - label1 - 1
    label2 db 'Key: ', 0h
    len_label2 equ $ - label2 - 1
    label3 db 'Encrypted text: ', 0h
    len_label3 equ $ - label3 - 1
    label4 db 'Decrypted text: ', 0h
    len_label4 equ $ - label4 - 1
    newline db 10
