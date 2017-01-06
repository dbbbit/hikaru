### Requirement

- [NASM](http://www.nasm.us/)
- QEMU
- GDB

```sh
    brew install nasm
    brew install qemu
```


### Usage

```sh
# run the boot.img
make run

# debug with gdb
make debug
```

When debuging, qemu would stop at 0x0000fff0 and wait for instruction.
Now attach qemu with gdb:

```sh
$ gdb
(gdb) target remote :1234
Remote debugging using :1234
0x0000fff0 in ?? ()
(gdb) set architecture i8086
(gdb) break *0x7c00
Breakpoint 1 at 0x7c00
(gdb) c
Continuing.

Breakpoint 1, 0x00007c00 in ?? ()
```
