# Bare Bones

为后续的接入高级语言开发环境(C/Rust)打下基础。
此刻, Nasm 依然是唯一的编译器伙伴。

## Setup

Install binutils from source. ( Linker 出场)

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
### Some explain

- `$@` in Makefile means current target name, `$<` means the dependency name

## Ref

- [Bare Bones](http://wiki.osdev.org/Bare_Bones)
