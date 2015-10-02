# Bare Bones

为后续的接入高级语言开发环境 (C/Rust) 打下基础。  
此刻, Nasm 依然是唯一的编译器伙伴。

## Setup

Install binutils from source.

```bash
$ wget http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
$ tar xf binutils-2.24.tar.gz
$ cd binutils-2.24
$ ./configure --target=i386-elf --disable-werror
$ make && make install
```

## Running it

```bash
$ make
$ make debug
```

### Some tips

- `$@` in Makefile means current target name, `$<` means the dependency name
- use gdb to observe the layout of memory, `x/10x 0x100000` will helps.

## Ref

- [Bare Bones](http://wiki.osdev.org/Bare_Bones)
