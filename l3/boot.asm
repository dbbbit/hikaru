[bits 16]
[org 0x7c00]
		mov	ax, cs
		mov	ds, ax

		;read sector to es:bx
		mov	ax, 0x60
		mov	es, ax
		mov	bx, 0
		mov	ax, 0x0201 ;read 1 sector
		mov	cx, 0x2 ;track 0, sector 2
		mov 	dx, 0x0 ;driver 0
		int	0x13

		;print msg read from disk
		mov 	ax, 0xb800
		mov 	ds, ax ;ds:di => screen buffer
		mov 	di, 0x0
		mov 	si, 0
print		mov 	al, [es:si]
		or  	al, al
		jz 	print_done
		mov 	[ds:di], al
		add	di, 2
		inc 	si
		jmp	print

print_done	jmp $

		;end mark
		times	510-($-$$)  db  0 
		dw	0xaa55

msg		db	"{42}", 0x0
