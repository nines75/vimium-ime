fn main() {
    println!("cargo:rerun-if-changed=src/turn-off-ime.cpp");

    cc::Build::new()
        .cpp(true)
        .file("src/turn-off-ime.cpp")
        .compile("turn-off-ime");

    println!("cargo:rustc-link-lib=imm32");
}
