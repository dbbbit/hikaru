[bits 16]
[org 0x7c00] ;mark start memory addr

mov sp, top_of_stack
call foo

jmp $

foo:
    push ax
    mov ax, 0xabcd
    pop ax
    iret

stack: 
    resb 64
top_of_stack equ  $-1

times   510-($-$$)  db  0 

; end of boot mark
db 0x55
db 0xaa
