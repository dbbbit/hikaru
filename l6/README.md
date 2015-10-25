# Rust!

Use Rust to code.

## Setup

- [Rust nightly](https://www.rust-lang.org/install.html)
- make sure you have finish `l5`, so binutils for target platform should exist (require i386-elf-ld exactly).
- build `libcore` for target platform (i386 here)
    - Download Rust src code from `https://github.com/rust-lang/rust` (Download zip file should be quickly)
    - mv rust-master ./external/rust-master
    - make libcore ( about 1 min )

## Running it

```bash
make run
```

## Debug
    
```bash
stop at beginning of code:   
(gdb) br *0x100010 

```

## Ref

- [Rustboot](https://github.com/tylerwbell/rustboot)
