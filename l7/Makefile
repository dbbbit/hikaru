run:	floppy.img
	qemu-system-i386 -fda floppy.img

debug:	floppy.img
	qemu-system-i386 -fda floppy.img -s -S

floppy.img:	boot.bin
	qemu-img create floppy.img 1.44k
	dd if=boot.bin of=./floppy.img bs=512 count=1

boot.bin:	boot.asm
	nasm boot.asm -f bin -l boot.lst -o boot.bin 

clean:
	rm -rf floppy.img boot.bin
