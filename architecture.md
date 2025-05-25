# Custom 16-bit CPU Architecture

## Overview

This document explains the architecture of the custom 16-bit CPU implemented in Verilog. The CPU supports a rich instruction set including arithmetic, logical, memory, and control flow operations with immediate and register addressing modes. It features an FSM-based control unit, condition flags, and external I/O interfacing.

---

## 1. CPU Components

### 1.1 Registers

- **General Purpose Registers (GPR):**  
  32 registers, each 16 bits wide (`GPR[31:0]`), used for general computation and data storage.

- **Special General Purpose Register (SGPR):**  
  A 16-bit register that holds the high 16 bits of a 32-bit multiplication result.

### 1.2 Instruction Memory (`inst_mem`)

- Holds 16 instructions of 32 bits each.
- Instructions are read sequentially by the Program Counter (PC).
- Loaded initially from an external `.mem` file.

### 1.3 Data Memory (`data_mem`)

- Holds 16 words of 32 bits each (used for data storage and I/O).
- Supports store/load instructions.

### 1.4 Instruction Register (IR)

- Holds the current instruction being decoded and executed.

---

## 2. Instruction Format (32-bit)
| 31:27  | 26:22 | 21:17 | 16  | 15:11 | 15:0 (imm) |
| ------ | ----- | ----- | --- | ----- | ---------- |
| opcode | rdst  | rsrc1 | imm | rsrc2 | immediate  |


- **opcode (5 bits):** Operation code (e.g. add, sub, mul, jumps)
- **rdst (5 bits):** Destination register
- **rsrc1 (5 bits):** Source register 1
- **imm_mode (1 bit):** Indicates immediate mode if set
- **rsrc2 (5 bits):** Source register 2 (used if not immediate mode)
- **imsrc (16 bits):** Immediate source value

---

## 3. Instruction Set

### 3.1 Arithmetic Instructions

- `movsgpr`: Move SGPR to GPR
- `mov`: Move immediate or register value
- `add`, `sub`, `mul`: Basic arithmetic operations

### 3.2 Logical Instructions

- Bitwise OR (`ror`), AND (`rand`), XOR (`rxor`), XNOR (`rxnor`)
- NAND (`rnand`), NOR (`rnor`), NOT (`rnot`)

### 3.3 Memory & I/O Instructions

- `storereg`: Store GPR to data memory
- `storedin`: Store external input (`din`) to data memory
- `senddout`: Send data memory to external output (`dout`)
- `sendreg`: Load data memory into GPR

### 3.4 Control Flow Instructions

- Unconditional jump: `jump`
- Conditional jumps based on flags: `jcarry`, `jnocarry`, `jzero`, `jnozero`, `jsign`, `jnosign`, `joverflow`, `jnooverflow`
- Halt: `halt`

---

## 4. Flags and Status Registers

- **Carry:** Set if arithmetic addition produces a carry out.
- **Zero:** Set if the result of an operation is zero.
- **Sign:** Set if the most significant bit of the result is 1 (negative).
- **Overflow:** Set if signed overflow occurs during addition or subtraction.

Flags are updated after arithmetic and logical instructions by the `condn_flag` task.

---

## 5. Control Unit - FSM

The CPU uses a finite state machine (FSM) with the following states:

| State           | Description                           |
|-----------------|-----------------------------------|
| `idle`          | Wait for reset; initialize PC and IR |
| `fetch_inst`    | Fetch instruction from `inst_mem`  |
| `dec_exec_inst` | Decode and execute the instruction   |
| `delay_next_inst` | Wait cycles for instruction delay  |
| `next_inst`     | Update PC for next instruction or jump |
| `sense_halt`    | Check if `halt` was executed         |

### State Transitions

- On reset, CPU moves from `idle` to `fetch_inst`.
- After fetching, decodes and executes instruction.
- Delays for timing synchronization.
- Advances to next instruction or jumps based on flags.
- Halts if `halt` instruction executed until reset.

---

## 6. Data Path

- Instructions fetched into `IR`.
- Decoded to extract opcode and register/immediate fields.
- Arithmetic and logical operations performed on registers or immediate values.
- Results stored back into destination registers.
- Flags updated accordingly.
- Memory accesses occur through `data_mem` for load/store.
- External I/O interfaced via `din` (input) and `dout` (output).

---

## 7. Multiplication Handling

- Multiplication results in a 32-bit value stored as:
  - Lower 16 bits: destination GPR
  - Upper 16 bits: `SGPR` register
- Flags updated based on the full result.

---

## 8. External Interfaces

- `din` (16-bit input): Used for storing external input into memory.
- `dout` (16-bit output): Used for sending memory content externally.

---

## 9. Programming Model

- Instructions are sequentially loaded from the `instr.mem` file.
- Program counter increments unless a jump or halt occurs.
- Jump instructions set PC to immediate address.
- Halt stops execution until reset.

---

## 10. Summary Diagram

+------------------+
| Instruction Mem |<-------------------------+
+------------------+ |
| |
v |
+------------------+ +------------------+ |
| Instruction Reg | --> | Decoder & ALU | |
+------------------+ +------------------+ |
| | |
| v |
| +------------+ |
| | Registers | |
| +------------+ |
| | |
+-----------------------+------------+
|
+-------------+
| Data Memory |
+-------------+
|
+-------------------+
| External I/O |
| (din / dout) |
+-------------------+


---

## 11. Future Work

- Expand instruction memory size
- Add pipelining support
- Improve flag handling and exception interrupts
- Add debugging features

---

This document provides a thorough technical overview for anyone wanting to understand, simulate, or extend the CPU design.

---

*Created by Sonan on 2025-05-25*  

