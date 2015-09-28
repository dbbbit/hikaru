[org 0x7c00] ;mark start memory addr

msg db 'hi'
mov eax, [msg]

end: 
    jmp end
    
times   510-($-$$)  db  0 

; end of boot mark
db 0x55
db 0xaa
