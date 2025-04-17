; a x86_64 assembly function
; Linux/WSL, linked with gcc
; conforming to sysV ABI
; replaces the '.'s in a string with "[.]"

format ELF64

public convert
extrn calloc
extrn free

NULL equ 0x0

section ".text" executable

; see src/convert.h for the function prototype
; char* convert(const char* string, uint64_t string_len);
convert:
    ; function prologue as per https://wiki.osdev.org/Calling_Conventions
    ; save registers rbx, rsp, rbp, r12, r13, r14, r15
    sub rsp, 64 ; 6 * 8-byte regiters and a bonus 16 bytes as a treat (alignemnt)
    mov [rsp + 0], rbx
    mov [rsp + 8], rbp
    mov [rsp + 16], r12
    mov [rsp + 24], r13
    mov [rsp + 32], r14
    mov [rsp + 40], r15
    
    mov rbp, [rsp]  

    ; stow our inputs
    mov [string], rdi
    mov [length_out], rsi
    mov [length_in], rsi

    ; calculate length_out of new string to make. 
    ; 3x the length_out is the max size the string can increase, here we round up to 4x because I'm lazy. 
    ; This also accounts for enough room for null-terinator
    sal qword [length_out], 2  ; multiply length_out by 4
    
    ; allocate a zero'd buffer
    ; rax = calloc(1, *length_out);
    mov rdi, [length_out]
    mov rsi, 1
    call calloc

    ; save the result returned by calloc
    mov qword [string_out], rax

    ; exit early with NULL if there was an allocation error
    cmp rax, NULL
    jne @F
        ; function epilogue
        mov r15, [rsp + 40]
        mov r14, [rsp + 32]
        mov r13, [rsp + 24]
        mov r12, [rsp + 16]
        mov rbp, [rsp + 8]
        mov rbx, [rsp]
        
        add rsp, 64
        
        ; return 0
        mov rax, NULL
        ret
    @@:

    ; loop over each character in the input buffer and output buffer left to right
    input_offset equ rdi
    output_offset equ rsi

    mov input_offset, 0  
    mov output_offset, 0
    @@: 
        ; check if input offset is >= the input length
        mov rax, [length_in]
        cmp input_offset, rax
        jge @F  ; break from loop

        ; check if the output offset is >= (output length -1). The extra room is for a null-terminator
        mov rax, [length_out]
        dec rax
        cmp output_offset, rax
        jge @F  ; break from loop

        ; read character from the input buffer
        mov rax, [string]
        add rax, input_offset
        mov al, [rax] ; al = character from string

        ; if the character is a '.' output "[.]" instead
        cmp al, '.'
        jne convert._not_dot
            ; is a dot
            ; write "[.]" to output buffer
            mov rbx, [string_out]
            add rbx, output_offset
            mov byte [rbx], '['
            inc rbx
            mov byte [rbx], '.'
            inc rbx
            mov byte [rbx], ']'
            add output_offset, 3

            jmp convert._dot_end
        convert._not_dot:
            ; is not a dot
            ; copy the character to the output buffer
            mov rbx, [string_out]
            add rbx, output_offset
            mov byte [rbx], al
            
            inc output_offset
        convert._dot_end:

        inc input_offset

        jmp @B ; continue loop
    @@:
    
    ; function epilogue
    mov r15, [rsp + 40]
    mov r14, [rsp + 32]
    mov r13, [rsp + 24]
    mov r12, [rsp + 16]
    mov rbp, [rsp + 8]
    mov rbx, [rsp]
    
    add rsp, 64

    ; return the new string
    mov rax, [string_out]

    ret

section ".data"

section ".bss" writeable
    ; meow: db 1
    length_out: dq 0
    length_in:  dq 0
    string:     dq 0x0000000000000000
    string_out: dq 0x0000000000000000


