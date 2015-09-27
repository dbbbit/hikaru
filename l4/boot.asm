[bits 16]
CODE_SEGMENT equ 0x07c0
VIDEO_MEMORY equ 0xB800
TIMER_IVT_OFFSET equ 0x0020
GLOBAL_VAR equ 0x0

init_handler:
    ; handler's offset
    mov ax, ir0_handler
    mov [TIMER_IVT_OFFSET], ax 
    ; handler's segment addr
    mov ax, CODE_SEGMENT 
    mov [TIMER_IVT_OFFSET+2], ax 

    mov ax, 0x0000
    mov [GLOBAL_VAR], ax
    mov di, 0

jmp $

ir0_handler:
    mov ax, [GLOBAL_VAR]
    cmp ax, 0x0001
    je B
    A:  
        mov cl, 'A'
        yeild_to_b_next_time:
            mov ax, 0x0001
            mov [GLOBAL_VAR], ax
        jmp print
    B:  
        mov cl, 'B'
        yeild_to_a_next_time:
            mov ax, 0x0000
            mov [GLOBAL_VAR], ax
print:
    mov ax, VIDEO_MEMORY
    mov es, ax
    mov [es:di], cl
    add di, 2

inc_global_var:
send_end_signal:    
        mov al, 0x20
        out 0x20, al
    iret

times   510-($-$$)  db  0 
dw  0xaa55
