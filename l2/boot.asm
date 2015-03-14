[bits 16]
memory_idx dw 0

mov al, 7
out 0x70, al
in al, 0x71
mov byte [memory_idx], al

mov al, 8
out 0x70, al
in al, 0x71
mov byte [memory_idx+1], al

jmp $
times   510-($-$$)  db  0 
dw  0xaa55
