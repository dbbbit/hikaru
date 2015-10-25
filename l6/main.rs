#![feature(no_std, lang_items, asm)]
#![no_std]

#[lang="stack_exhausted"] extern fn stack_exhausted() {}
#[lang="eh_personality"] extern fn eh_personality() {}
#[lang="panic_fmt"] fn panic_fmt(_fmt: &core::fmt::Arguments, _file_line: &(&'static str, usize)) -> ! { loop {} }

#[lang="start"]
fn start(_main: *const u8, _argc: isize, _argv: *const *const u8) -> isize {
    main();
    0
}

fn main() {
    let greeting = b"> HIKARU RUNNING...";
    let color_code: u16 = 0x0400;
    for i in 0..(80 * 25) {
        unsafe {
            *((0xb8000 + i * 2) as *mut u16) = color_code;
        }
    }

    for idx in 0..19 {
        unsafe {
            *((0xb8000 + idx * 2) as *mut u16) = greeting[idx] as u16 + color_code;
        }
    }

    unsafe {
        asm!("cli;
              dead:\n
                hlt;
                jmp dead;"
        )
    }
}
