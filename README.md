# VLSI-Based Digital Clock with Alarm Functionality

## Project Overview

This project implements a complete digital clock system using Verilog HDL. The design maintains real-time HH:MM:SS time, supports alarm functionality, 12/24-hour display modes, snooze capability, and FPGA-oriented display interfacing. The project is verified through simulation and waveform analysis using Icarus Verilog and GTKWave.

The implementation follows industry-standard RTL design and verification practices commonly used in FPGA and VLSI development.

---

## Features

* 24-hour clock format
* Optional 12-hour display mode with AM/PM indication
* HH:MM:SS time keeping
* Alarm enable/disable functionality
* Alarm trigger generation
* Snooze support (+5 minutes)
* Clock-enable timing generation
* Input synchronization
* Push-button debouncing
* Seven-segment display support
* Modular RTL architecture
* Self-checking testbench
* Simulation waveform generation
* FPGA-ready design structure

---

## Design Architecture

```text
System Clock
     │
     ▼
Clock Enable Generator
     │
     ▼
Time Keeper
(Hours / Minutes / Seconds)
     │
     ├─────────────► Display Logic
     │                    │
     │                    ▼
     │            Seven Segment Output
     │
     ▼
Alarm Controller
     │
     ▼
Alarm Output / Buzzer / LED
```

---

## RTL Modules

| Module              | Description                |
| ------------------- | -------------------------- |
| sync_ff.v           | Input synchronizer         |
| debounce.v          | Button debouncer           |
| clock_enable_gen.v  | Generates timing ticks     |
| time_keeper.v       | Maintains HH:MM:SS time    |
| mode_12_24.v        | 12-hour/24-hour conversion |
| alarm_controller.v  | Alarm comparison logic     |
| snooze_controller.v | Snooze time generation     |
| seven_seg_decoder.v | Seven-segment decoder      |
| display_mux.v       | Display digit generation   |
| digital_clock_top.v | Top-level integration      |

---

## Verification

The design is verified using:

* Icarus Verilog
* GTKWave
* Self-checking SystemVerilog testbench

Verification scenarios include:

* Reset functionality
* Seconds increment
* Minute rollover
* Hour rollover
* 24-hour wraparound
* Alarm activation
* Alarm enable/disable
* AM/PM conversion

---

## Simulation Flow

### Compile

```powershell
iverilog -g2012 -o digital_clock rtl/*.v tb/tb_digital_clock.sv
```

### Run Simulation

```powershell
vvp digital_clock
```

### Open Waveform

```powershell
gtkwave waveforms/digital_clock.vcd
```

---

## Sample Waveform Signals

Monitor the following signals:

* hour
* minute
* second
* alarm_out
* pm

Expected behavior:

* Seconds increment from 0 to 59
* Minutes increment after second rollover
* Hours increment after minute rollover
* Alarm activates when alarm time matches current time

---

## Project Structure

```text
VLSI-Digital-Clock-with-Alarm-Functionality/
│
├── rtl/
├── tb/
├── scripts/
├── constraints/
├── reports/
├── waveforms/
├── images/
├── README.md
└── .gitignore
```

---


## Applications

* Digital clocks
* Alarm clocks
* Real-time embedded systems
* FPGA-based controllers
* Consumer electronics
* Industrial timing systems
* Educational FPGA laboratories

---

## Tools Used

* Verilog HDL
* SystemVerilog
* Icarus Verilog
* GTKWave
* Visual Studio Code

---

## Learning Outcomes

This project demonstrates:

* RTL Design
* Sequential Logic Design
* Counter Design
* Clock Management
* Verification Methodology
* Waveform Analysis
* FPGA-Oriented Development
* Digital System Integration

---

## Author

Developed as a VLSI/FPGA course project for learning digital design, verification, and hardware description language development.
