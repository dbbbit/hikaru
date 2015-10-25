LD=i386-elf-ld
RUSTC=rustc

run: kernel
	qemu-system-i386 -kernel $<

debug:	kernel
	qemu-system-i386 -kernel $< -s -S

kernel:	boot.o	main.o
	$(LD) -T linker.ld boot.o main.o -o $@

boot.o:	boot.asm
	nasm -felf32 boot.asm -l boot.lst -o $@

main.o:	main.rs
	$(RUSTC) -C opt-level=2 -Z no-landing-pads --target i686-unknown-linux-gnu -C relocation-model=static -g --emit obj -L build/libcore -o main.o main.rs

main.s:	main.rs
	$(RUSTC) -C opt-level=2 -Z no-landing-pads --target i686-unknown-linux-gnu -C relocation-model=static -g --emit asm -L build/libcore main.rs

libcore:
	mkdir -p build/libcore
	$(RUSTC) -C opt-level=2 -Z no-landing-pads --target i686-unknown-linux-gnu -g external/rust-master/src/libcore/lib.rs --out-dir build/libcore

clean:
	rm -rf *.o *.lst *.bin kernel build main.s
