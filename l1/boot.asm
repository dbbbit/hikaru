set_eax_0:  
    mov eax, 0x0

this_is_loop:
    add eax, 0x1
    cmp eax, 0x9
    je end
    jmp this_is_loop

end: 
    jmp end
    
times   510-($-$$)  db  0 
db 0x55
db 0xaa
