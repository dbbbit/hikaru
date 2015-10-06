run: floppy.img
	qemu-system-i386 -fda $<

debug: floppy.img
	qemu-system-i386 -fda $< -s -S

floppy.img:	boot.bin
	qemu-img create $@ 1.44k
	dd if=$< of=$@ bs=512 count=1

boot.bin:	boot.asm	
	nasm $< -f bin -l boot.lst -o $@

clean:
	rm -rf *.img *.bin *.lst
