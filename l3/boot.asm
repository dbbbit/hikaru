[bits 16]
mov ax, 0xB800
mov es, ax
mov di, 0
mov al, '$'
mov [es:di], al

mov al, 0x70
mov [es:di+1], al

jmp $
times   510-($-$$)  db  0 
dw  0xaa55
