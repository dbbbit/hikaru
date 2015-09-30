[bits 16]
PIC1_COMMAND equ 0x20
PIC_EOI equ 0x20
CODE_SEGMENT equ 0x07c0
VIDEO_MEMORY equ 0xB800
IVT_OFFSET equ 0x0020

init_handler:
    ; handler's offset & segment addr
    mov ax, ir0_handler
    mov [IVT_OFFSET], ax 
    mov ax, CODE_SEGMENT 
    mov [IVT_OFFSET+2], ax 

    mov ax, ir1_handler
    mov [IVT_OFFSET+4], ax 
    mov ax, CODE_SEGMENT 
    mov [IVT_OFFSET+6], ax 

    ;init vidio buffer addr
    mov ax, VIDEO_MEMORY
    mov es, ax

jmp $

ir0_handler:
    ;print 'B'
    push eax
    mov al, 'A'
    mov [es:di], al
    add di, 2
    
    ;send end signal
    mov al, PIC_EOI
    out PIC1_COMMAND, al
    pop eax
    iret


; keyboard interrupt
ir1_handler:
    push eax
    in al, 0x60,
    mov al, 'B'
    mov [es:di], al
    add di, 2
    ;send end signal
    mov al, PIC_EOI
    out PIC1_COMMAND, al
    pop eax
    iret

   
times   510-($-$$)  db  0 
dw  0xaa55
