# HDLjourney
This contains all the practice codes to build my hardware design language profile
# Binary Finite State Machine (FSM) Design

A robust Verilog implementation of a synchronous Binary Finite State Machine designed and verified using standard hardware description workflows.

---

## 🛠️ Design Architecture & RTL View

This module implements a sequential state machine tracking state transitions based on control inputs. 

### RTL Schematic
The structural design was synthesized to verify correct gate-level translation and routing logic:

![RTL Schematic](./images/rtl_view.png)

---

## 🔬 Simulation & Verification

Verification was performed using a custom testbench to exercise state boundaries, reset conditions, and edge cases.

### Waveform Analysis
The timing diagram below demonstrates valid state transitions, cycle-accurate output generation, and flag behavior:

![Simulation Waveform](./images/simulation_waveform.png)

### Testbench Console Output
```text
[INSERT A COPY-PASTE OF YOUR SIMULATION "PASS" LOGS HERE]

