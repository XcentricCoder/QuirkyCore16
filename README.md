# QuirkyCore16 -Custom 16-bit CPU in Verilog

This project implements a custom 16-bit RISC-style CPU using Verilog HDL. The CPU executes a wide set of operations including arithmetic, logic, conditional jumps, memory access, and I/O communication. Designed with a structured FSM, this processor supports immediate and register addressing modes, condition flags, and external data interfacing.

## 🚀 Features

* 16-bit General Purpose Registers (`GPR[31:0]`)
* Special General Purpose Register (`SGPR`) for high word of multiplication
* 32-bit instruction format
* Immediate mode and register mode execution
* ALU status flags: Carry, Zero, Sign, Overflow
* Instruction and Data Memory
* FSM-based instruction processing
* External data bus interface (`din`, `dout`)

## 📦 Supported Instructions

### Arithmetic

| Opcode    | Description                |
| --------- | -------------------------- |
| `movsgpr` | Move from SGPR to GPR      |
| `mov`     | Register or immediate move |
| `add`     | Add                        |
| `sub`     | Subtract                   |
| `mul`     | Multiply (16x16 = 32-bit)  |

### Logical / Bitwise

| Opcode  | Description  |
| ------- | ------------ |
| `ror`   | Bitwise OR   |
| `rand`  | Bitwise AND  |
| `rxor`  | Bitwise XOR  |
| `rxnor` | Bitwise XNOR |
| `rnand` | Bitwise NAND |
| `rnor`  | Bitwise NOR  |
| `rnot`  | Bitwise NOT  |

### Memory / I/O

| Opcode     | Description                         |
| ---------- | ----------------------------------- |
| `storereg` | Store register to memory            |
| `storedin` | Store external input to memory      |
| `senddout` | Send memory data to external output |
| `sendreg`  | Load memory data into a register    |

### Control Flow

| Opcode        | Description            |
| ------------- | ---------------------- |
| `jump`        | Unconditional jump     |
| `jcarry`      | Jump if carry flag     |
| `jnocarry`    | Jump if not carry      |
| `jzero`       | Jump if zero           |
| `jnozero`     | Jump if not zero       |
| `jsign`       | Jump if sign           |
| `jnosign`     | Jump if not sign       |
| `joverflow`   | Jump if overflow       |
| `jnooverflow` | Jump if not overflow   |
| `halt`        | Stop program execution |

## 📁 File Structure

```
custom-verilog-cpu/
├── src/
│   └── top.v               # Main CPU Verilog source
├── mem/
│   ├── instr.mem           # Instruction memory file
│   └── data.mem            # Data memory (optional)
├── sim/
│   └── top_tb.v            # (Optional) Testbench file
├── docs/
│   └── architecture.md     # Detailed documentation
├── README.md               # Project overview
├── LICENSE                 # License information
└── .gitignore              # Git ignore list
```

## ▶️ Simulation Guide

Use tools like **Icarus Verilog**, **ModelSim**, or **Vivado** for simulation.

```bash
# Using Icarus Verilog
iverilog -o cpu.out src/top.v sim/top_tb.v
vvp cpu.out
```

Ensure your `top.v` properly points to the `instr.mem` file using `$readmemb`.

## 📖 Documentation

See [`docs/architecture.md`](docs/architecture.md) for:

* Instruction formats
* FSM state transitions
* Flag logic
* Internal data paths

## 📜 License

This project is licensed under the [MIT License](LICENSE).

## 🙌 Contributions

Feel free to fork, open issues, or submit pull requests to improve or extend the CPU!

---

Built with ❤️ using Verilog HDL.
