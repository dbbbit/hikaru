[bits 16]
; Register  Contents
; 0x00      Seconds
; 0x02      Minutes
; 0x04      Hours
; 0x06      Weekday
; 0x07      Day of Month
; 0x08      Month
; 0x09      Year
; 0x32      Century (maybe)
; 0x0A      Status Register A
; 0x0B      Status Register B

mov ecx, 0x0 ;memory address for store

mov al, 0x00
call get_data_byte

mov al, 0x02
call get_data_byte

mov al, 0x04
call get_data_byte

mov al, 0x06
call get_data_byte

mov al, 0x07
call get_data_byte

mov al, 0x08
call get_data_byte

mov al, 0x09
call get_data_byte

jmp $

get_data_byte:
    out 0x70, al
    in al, 0x71
    mov byte [ecx], al
    add ecx, 1
    ret

times   510-($-$$)  db  0 
dw  0xaa55
