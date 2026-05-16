# Computer Architecture Lab

Computer Architecture Lab is a Verilog implementation of a simplified MIPS-style CPU. The repository follows the lab work step by step, starting from small hardware blocks such as a program counter, multiplexer, instruction memory, cache, register file, and ALU, then combining those parts into a pipelined `MyMips` processor.

The final design lives in `Project/` and connects the classic fetch, decode, execute, memory, and write-back stages with pipeline registers between them.

## Features

- MIPS-style CPU design in Verilog
- Step-by-step homework folders from `Hw1` to `Hw6`
- Final integrated processor in `Project/`
- Instruction fetch with program counter, branch mux, instruction memory, and cache
- Decode stage with register file and sign extension
- Control unit for R-type, load/store, immediate, branch, and comparison instructions
- Execute stage with ALU, ALU control, immediate mux, branch target calculation, and destination register selection
- Data memory stage for `lw` and `sw` behavior
- Write-back stage for selecting memory data or ALU results
- Pipeline registers for IF/ID, ID/EX, EX/MEM, and MEM/WB boundaries
- Verilog test benches for most individual lab modules
- VCD waveform outputs for GTKWave inspection
- Lab PDFs included for assignment references

## Repository Structure

```text
.
+-- README.md
+-- PDF's/                    # Lab assignment PDFs
+-- Hw1/                      # Early PC, mux, and instruction memory modules
+-- Hw2/                      # Fetch path, cache, PC, and instruction memory tests
+-- Hw3/                      # Register file, sign extension, and decode stage
+-- Hw4/                      # Control unit, IF/ID register, and early MyMips integration
+-- Hw5/                      # ALU, ALU control, execute stage, and ID/EX register
+-- Hw6/                      # Data memory, EX/MEM, MEM/WB, and write-back modules
+-- Project/                  # Final integrated CPU implementation
+-- Tests_vscode_by_gtkwave/  # Saved VCD waveform files
```

## Final Project Modules

| File | Purpose |
| --- | --- |
| `Project/MyMips.v` | Top-level CPU module that wires all stages together. |
| `Project/Fetch.v` | Fetch stage with PC, branch selection, instruction memory, and cache. |
| `Project/PcRegister.v` | Program counter module, named `PC`, that advances when cache hit is active. |
| `Project/InstructionMemory.v` | Byte-addressed instruction memory that returns 128-bit instruction lines. |
| `Project/Cache.v` | Small direct-mapped instruction cache with valid bit, tag, and 128-bit data line. |
| `Project/IFID.v` | Pipeline register between fetch and decode. |
| `Project/Decode.v` | Splits instruction fields, reads registers, and sign-extends immediates. |
| `Project/RegisterFile.v` | 32-register file with asynchronous reads and protected zero register. |
| `Project/SignExtended.v` | Sign extension for 16-bit immediates. |
| `Project/ControlUnit.v` | Generates datapath control signals from the instruction opcode. |
| `Project/IDEXRegister.v` | Pipeline register between decode and execute. |
| `Project/Execute.v` | Execute stage with ALU input mux and ALU control integration. |
| `Project/ALU.v` | Arithmetic and logic operations including add, subtract, not, shifts, and/or, and set-less-than. |
| `Project/Mux2To1.v` | 32-bit two-input mux used in the execute stage. |
| `Project/mux.v` | PC-source mux used by the fetch stage. |
| `Project/ExMemoryRegister.v` | Pipeline register between execute and memory. |
| `Project/DataMemory.v` | 1024-word data memory with read and write control signals. |
| `Project/MemoryWriteBackRegister.v` | Pipeline register between memory and write-back. |
| `Project/WriteBack.v` | Selects the value written back into the register file. |

## Pipeline Overview

The final `MyMips` module is organized around the usual five-stage CPU flow:

```text
Fetch -> IF/ID -> Decode -> ID/EX -> Execute -> EX/MEM -> Memory -> MEM/WB -> Write Back
```

At a high level:

1. `Fetch` chooses the next PC from either `PC + 4` or a branch target.
2. `InstructionMemory` loads a 128-bit block of instruction bytes.
3. `Cache` returns the selected 32-bit instruction when the tag and valid bit match.
4. `IFID` stores the fetched instruction and next PC.
5. `Decode` reads source registers, extracts fields, and sign-extends the immediate.
6. `ControlUnit` converts opcodes into datapath control signals.
7. `IDEXRegister` carries data and control signals into execute.
8. `Execute` selects the second ALU input, computes the ALU result, and exposes the zero flag.
9. `EXMemoryRegister` carries branch, memory, and write-back signals forward.
10. `DataMemory` performs reads and writes for memory instructions.
11. `MemoryWriteBackRegister` stores memory/ALU outputs.
12. `WriteBack` selects the final value that is written into the register file.

## Supported Operations

The datapath and control logic cover a small custom MIPS-like instruction subset.

### R-Type ALU Functions

The ALU control unit maps R-type function codes to:

| Operation | ALU behavior |
| --- | --- |
| `add` | `inputOne + inputTwo` |
| `sub` | `inputOne - inputTwo` |
| `and` | `inputOne & inputTwo` |
| `or` | `inputOne | inputTwo` |
| `slt` | set result to `1` when `inputOne < inputTwo` |
| `lsl` | left shift |
| `lsr` | right shift |
| `not` | bitwise not of the first input |

### I-Type and Branch Operations

The control unit includes opcode handling for:

| Instruction type | Behavior |
| --- | --- |
| `lw` | ALU address calculation, memory read, register write-back |
| `sw` | ALU address calculation, memory write |
| `addi` | Immediate add with register write-back |
| `beq` | Subtract/zero check for branch decision |
| `slti` | Immediate set-less-than |

## Homework Progression

The homework folders show how the final CPU was built incrementally:

| Folder | Main focus |
| --- | --- |
| `Hw1` | Basic modules such as mux, PC register, and instruction memory. |
| `Hw2` | Fetch path, cache module, and related tests. |
| `Hw3` | Register file, sign extension, and decode stage. |
| `Hw4` | Control unit, IF/ID pipeline register, and partial CPU integration. |
| `Hw5` | ALU, ALU control, execute stage, and ID/EX register. |
| `Hw6` | Data memory, EX/MEM register, MEM/WB register, and write-back stage. |
| `Project` | Final integrated MIPS-style processor. |

## Running Simulations

This project does not use a build system. You can compile individual Verilog test benches or the final CPU with a simulator such as Icarus Verilog.

Compile the final project:

```bash
iverilog -o /tmp/mymips.out Project/*.v Hw5/ALUControlUnit.v
```

`Project/Execute.v` instantiates `ALUControlUnit`, and that module is stored in `Hw5/ALUControlUnit.v`, so it should be included when compiling the final project.

Compile and run an individual test bench:

```bash
iverilog -o /tmp/alu_test.out Hw5/ALU.v Hw5/ALUControlUnit.v Hw5/Mux2To1.v Hw5/Execute.v Hw5/ExecuteTest.v
vvp /tmp/alu_test.out
```

Open a saved waveform in GTKWave:

```bash
gtkwave Tests_vscode_by_gtkwave/MyMips_all.vcd
```

## Included Waveforms

The `Tests_vscode_by_gtkwave/` folder contains saved `.vcd` outputs, including:

- `MyMips_all.vcd`
- `MyMips_test1.vcd`
- `MyMips_test2.vcd`
- `MyMips_test3.vcd`
- `MyMips_test4.vcd`
- `MyMips_test5.vcd`
- `MyMips_test6.vcd`
- `MyMips_test7.vcd`
- `MyMips_test8.vcd`
- `MyMips_test9.vcd`
- `MyMips_test10.vcd`
- `MyMips_test11.vcd`
- `MyMips_test12.vcd`
- `MyMips_test13.vcd`

These files are useful for checking signal behavior across the pipeline in GTKWave.

## Requirements

- Verilog simulator, such as Icarus Verilog
- GTKWave, optional, for waveform inspection
- Basic understanding of MIPS datapaths and pipelined CPU stages

## Notes

- The design is a lab/learning project, not a production-grade processor core.
- The instruction memory contains hard-coded test instructions inside `initial` blocks.
- The register file initializes registers with their index values, while register zero is forced to zero.
- The fetch path advances the PC only when cache `hit` is asserted.
- The final project compiles with Icarus Verilog when `Hw5/ALUControlUnit.v` is included.
- Some Verilog style choices, such as procedural `assign` usage inside `always` blocks, are accepted by the tested simulator but may need cleanup for stricter synthesis-oriented tools.

## Possible Improvements

- Move `ALUControlUnit.v` into `Project/` so the final design is self-contained
- Add a top-level project test bench for `Project/MyMips.v`
- Replace hard-coded instruction memory values with `$readmemh`
- Add hazard detection and forwarding logic
- Add reset signals to pipeline registers and memories
- Document the custom instruction encoding in a separate table
- Add automated simulation scripts for all homework test benches
- Separate simulation-only code from synthesizable modules
