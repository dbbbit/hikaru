build:	
	nasm boot.asm -f bin -o boot.bin
	qemu-img create floppy.img 1.44k
	dd if=boot.bin of=./floppy.img bs=512 count=1

boot:
	qemu-system-i386 -fda floppy.img

debug: build
	qemu-system-i386 -fda floppy.img -s -S

clean:
	rm -rf floppy.img boot.bin
