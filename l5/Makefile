LD=i386-elf-ld

all:	boot.bin
	qemu-system-i386 -kernel $<

boot.o:	boot.asm
	nasm -felf32 $< -l boot.lst -o $@

boot.bin:	boot.o
	$(LD) -T linker.ld $< -o $@

clean:
	rm -rf *.o *.lst *.bin

debug:	boot.bin
	qemu-system-i386 -kernel $< -s -S
