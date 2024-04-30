# Static Analysis Tool for Wasm Modules

This repository contains the static analysis tool for Wasm modules developed by the authors of the paper "Everything Old is New Again: Binary Security of WebAssembly" https://github.com/sola-st/wasm-binary-security/tree/master/tool/wasm-security-analysis and the "Wasabi" tool https://github.com/danleh/wasabi that is required by it. The codes are updated in order to analyze the Wasm instructions that were not handled.

## Compilation Instructions

1. In `/static-analysis-tool-wasm/wasm-security-analysis/Cargo.toml`, change the path on line 8 to the full path of the `/static-analysis-tool-wasm/wasabi-874fc257278842cb/7f8460f/lib/wasm` directory.
2. Navigate to `/static-analysis-tool-wasm/wasm-security-analysis` and run:
    ```
    cargo build
    ```

## Usage

1. After compilation, navigate to `/static-analysis-tool-wasm/wasm-security-analysis/target/debug`.
2. Run the following command, replacing `/path/to/module.wasm` with the path to your Wasm module:
    ```
    ./wasm-security-analysis /path/to/module.wasm
    ```
3. If the analysis throws an error (e.g., problems with `wasm::highlevel::Section`), converting to WAT and re-converting to Wasm may solve the problem:
    ```
    wasm2wat module.wasm -o module.wat
    wat2wasm module.wat -o module_converted.wasm
    ```
4. Then analyze the converted module.

## Error Handling

- If the analysis throws the error `wasm::highlevel::Instr`, it is because the tool does not recognize at least one of the instructions used in the module.
- In this case, manual editing of the file is needed. Instructions, hex opcodes (tags), and types are shown in the [official documentation](https://webassembly.github.io/spec/core/appendix/index-instructions.html).
- Start by adding the name of the instruction in the `pub enum Instr {}` in the `/static-analysis-tool-wasm/wasabi-874fc257278842cb/7f8460f/lib/wasm/src/ast/highlevel.rs`.
- Recompile the crate with:
    ```
    cargo build
    ```
- Solve all the errors raised by the compiler.
