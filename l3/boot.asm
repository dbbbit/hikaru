[bits 16]

define_the_consts:
    p_buf equ 0xb800
    msg db 'Hello, World...'
    len equ $-msg

init_target_addr:
    mov ax, p_buf
    mov es, ax
    mov di, 0x0

init_source_addr:
    mov ax, 0x07c0
    mov ds, ax
    mov si, 0

print_loop: 
    mov al, [ds:si] ;0x7c0 * 4 + 0 = 0x7c00
    mov [es:di], al
    inc si
    add di, 2
    cmp si, len
    jl print_loop

end:
    jmp end

times   510-($-$$)  db  0 
dw  0xaa55
