[bits 16]
[org 0x7c00]
cli
lgdt [gdtdesc]
lidt [idtdesc]

; set protected mode bit of cr0
mov eax, cr0
or eax, 1
mov cr0, eax
; far jump to load CS with 32 bit segment
jmp 0x08:p_mode


[bits 32]
p_mode:
    ;init_idt
    mov eax, 0x10
    mov ds, eax
    mov ecx, 0x0
    init_idt_item:
        mov eax, 0x00080000 + handlers    ;selector, offset
        add eax, ecx
        mov dword [ds:idt + ecx*8], eax
        mov eax, 0b1000111000000000 
        mov dword [ds:idt + ecx*8 + 4], eax
        add ecx, 1 
        cmp ecx, 2
        jl init_idt_item

        ; div error raise -> handler0
        mov eax, 0
        mov ebx, 0
        div ebx
        ;int1 -> handler1
        int 1

dead:
    jmp dead

handlers:
handler0:
    mov eax, 0x2
    mov ebx, 0x4
    iret
handler1:
    mov eax, 0x1
    jmp handler1

gdt:
    ; null entry
    dq 0
    ; code entry
    dw 0xffff       ; limit 0:15
    dw 0x0000       ; base 0:15
    db 0x00         ; base 16:23
    db 0b10011010   ; access byte - P|DPL|1|1|C|R|A
    db 0b01001111   ; G|B|0|AVL/(limit 16:19).  
    db 0x00         ; base 24:31
    ; data entry
    dw 0xffff       ; limit 0:15
    dw 0x0000       ; base 0:15
    db 0x00         ; base 16:23
    db 0b10010110   ; access byte - P|DPL|1|0|E|W|A
    db 0b01001111   ; G|D|0|AVL/(limit 16:19). 
    db 0x00         ; base 24:31

gdtdesc:
    dw gdtdesc - gdt    ;size
    dd gdt              ;offset

idt:
idtdesc:
    dw 256 * 8          ;size
    dd idt              ;offset

times   510-($-$$)  db  0 
db 0x55
db 0xaa
