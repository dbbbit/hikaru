        mov ax, 0x1     ;decimal
        mov cx, 0x2     ;decimal
hang: 
        jmp hang           

times   510-($-$$)  db  0 
dw  0xaa55
