[bits 16]
[org 0x7c00]

mov ax, ir0_handler
mov [0x0020], ax
mov ax, 0x0000
mov [0x0022], ax

jmp $

ir0_handler:
    call beat
    mov al, 0x20
    out 0x20, al
    iret

beat:
    mov ax, 0xB800
    mov es, ax
    mov di, 0
    mov ch, 0x07
    inc cl
    mov [es:di], cx
    ret

times   510-($-$$)  db  0 
dw  0xaa55
