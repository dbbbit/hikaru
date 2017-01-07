all: boot.img

run: boot.img
	qemu-system-i386 -fda $<

debug: boot.img
	qemu-system-i386 -fda $< -s -S

attach:
	gdb -x gdb_setup

boot.img: boot.bin
	qemu-img create $@ 1.44k
	dd if=$< of=$@ bs=512 count=2

boot.bin: boot.asm
	nasm $< -f bin -l boot.lst -o $@

clean:
	rm -rf *.img *.bin *.lst
