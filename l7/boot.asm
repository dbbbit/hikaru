[bits 16]
[org 0x7c00]
cli
lgdt [gdtdesc]

; set protected mode bit of cr0
mov eax, cr0
or eax, 1
mov cr0, eax
; far jump to load CS with 32 bit segment
jmp 0x08:p_mode


[bits 32]
p_mode:
    offset equ 0x0
    mov dword [cs:offset], 0x12345678

    jmp $


gdt:
    ; null entry
    dq 0
    ; code entry
    dw 0xffff       ; limit 0:15
    dw 0x0000       ; base 0:15
    db 0x00         ; base 16:23
    db 0b10011010   ; access byte - code    P|DPL|1|1|C|R|A
    db 0b01001111   ; flags/(limit 16:19).  G|B|0|AVL|limit[16..19]
    db 0x00         ; base 24:31
    ; data entry
    ;dw 0xffff       ; limit 0:15
    ;dw 0x0000       ; base 0:15
    ;db 0x00         ; base 16:23
    ;db 0b10010100   ; access byte - data    P|DPL|1|0|E|W|A
    ;db 0b01001111   ; flags/(limit 16:19). G|D|0|AVL
    ;db 0x00         ; base 24:31

gdtdesc:
    dw gdtdesc - gdt    ;size
    dd gdt              ;offset

times   510-($-$$)  db  0 
db 0x55
db 0xaa

