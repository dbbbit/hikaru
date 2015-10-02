# Rust!

Use Rust to code.

## Setup

- make sure you have finish `l5`, so binutils should exist (require i386-elf-ld exactly).
- [Rust nightly](https://www.rust-lang.org/install.html)
- build `libcore` for target platform (i386 here)
    - Download Rust src code from `https://github.com/rust-lang/rust` (Download zip file should be quickly)
    - mv rust-master ./external/rust-master
    - make libcore ( about 1 min )

## Running it

```bash
make run
```

## Ref

- [Rustboot](https://github.com/tylerwbell/rustboot)
