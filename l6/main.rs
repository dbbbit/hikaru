#![feature(no_std, lang_items)]
#![no_std]

#[lang="stack_exhausted"] extern fn stack_exhausted() {}
#[lang="eh_personality"] extern fn eh_personality() {}
#[lang="panic_fmt"] fn panic_fmt(_fmt: &core::fmt::Arguments, _file_line: &(&'static str, usize)) -> ! { loop {} }

#[lang="start"]
fn start(_main: *const u8, _argc: isize, _argv: *const *const u8) -> isize {
    main();
    0
}

enum Color {
    Blue       = 1,
    Green      = 2
}

fn main() {
    for i in 0..(80 * 25) {
        unsafe {
            *((0xb8000 + i * 2) as *mut u16) = (Color::Blue as u16) << 12;
        }
    }
}
