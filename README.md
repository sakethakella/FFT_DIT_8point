# 8-Point Radix-2 DIT FFT Engine (Verilog)

## Overview

This repository contains a synthesizable, pipelined 8-point Radix-2 Decimation-In-Time (DIT) Fast Fourier Transform (FFT) engine implemented in Verilog HDL. The design leverages a three-stage pipeline architecture and Q1.15 fixed-point complex arithmetic, making it suitable for both FPGA prototyping and simulation with Icarus Verilog (iverilog).

## Features

- **Pipelined 3-stage architecture** for high throughput and efficient resource utilization
- **Q1.15 fixed-point** complex arithmetic for hardware-friendly implementation
- **Dedicated twiddle factor ROM** for fast and accurate FFT computation
- **Synthesizable complex multiplier module**
- **Modular and extensible design** for easy integration and customization

## File Structure

- `FFT.v` — Main Verilog source file containing:
  - `fft_8point`: Top-level FFT engine
  - `twiddle_rom`: Twiddle factor ROM
  - `complex_mult`: Complex multiplier module

## Module Descriptions

### fft_8point

Implements the pipelined 8-point FFT computation.

- **Inputs:**
  - `clk`, `rst`: Clock and synchronous reset
  - `x_real_0` ... `x_real_7`, `x_imag_0` ... `x_imag_7`: 8 complex input samples (Q1.15 format)
- **Outputs:**
  - `X_real_0` ... `X_real_7`, `X_imag_0` ... `X_imag_7`: 8 complex FFT outputs (Q1.15 format)
- **Pipeline Stages:**
  1. **Stage 1:** Butterfly computation (no twiddle factors)
  2. **Stage 2:** Butterfly computation with twiddle factor multiplication
  3. **Stage 3:** Final butterfly computation

### twiddle_rom

- Provides the four unique twiddle factors required for an 8-point FFT in Q1.15 format.
- Twiddle values are initialized in an `initial` block for simulation and synthesis compatibility.

### complex_mult

- Synthesizable module for Q1.15 complex multiplication.
- Accepts two complex numbers as input and outputs their product.

## Getting Started

### Prerequisites

- [Icarus Verilog (iverilog)](http://iverilog.icarus.com/) for simulation
- [GTKWave](http://gtkwave.sourceforge.net/) for waveform viewing (optional)

### Simulation Instructions

1. **Write a testbench** that instantiates `fft_8point` and applies test vectors.
2. **Compile and run:**
   ```sh
   iverilog -o fft_test FFT.v testbench.v
   vvp fft_test
   ```
3. **View waveforms** (optional):
   - Add `$dumpfile` and `$dumpvars` in your testbench.
   - Open the generated `.vcd` file in GTKWave.

## Notes

- The provided FFT pipeline is a template and may require further completion for full production use. Complete the butterfly and twiddle logic as needed for your application.
- All module ports use scalar signals for maximum compatibility with Verilog-2001 and common simulation tools.
- The design is intended for educational, research, and prototyping purposes.

## License

This project is released under the MIT License.

## Author

Self Project — December 2024 to January 2025
