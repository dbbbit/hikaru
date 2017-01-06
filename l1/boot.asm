	mov	ax, 0x42
	jmp	$

	times 510-($-$$) db 0
	db 0x55
	db 0xaa
