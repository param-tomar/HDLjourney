# HDLjourney
This contains all the practice codes to build my hardware design language profile
# Binary Finite State Machine (FSM) Design

A robust Verilog implementation of a synchronous Binary Finite State Machine designed and verified using standard hardware description workflows.

---

## 🛠️ Design Architecture & RTL View

This module implements a sequential state machine tracking state transitions based on control inputs. 

### RTL Schematic
The structural design was synthesized to verify correct gate-level translation and routing logic:

<img width="1366" height="768" alt="BinaryFSM RTL view" src="https://github.com/user-attachments/assets/ac5b6f84-5f2f-4533-988f-466fea4545d3" />


---

## 🔬 Simulation & Verification

Verification was performed using a custom testbench to exercise state boundaries, reset conditions, and edge cases.

### Waveform Analysis
The timing diagram below demonstrates valid state transitions, cycle-accurate output generation, and flag behavior:

<img width="1366" height="768" alt="BinaryFSM" src="https://github.com/user-attachments/assets/508528b2-65e5-4a20-8286-2f2d0c060f93" />


### Testbench Console Output
```text
[INSERT A COPY-PASTE OF YOUR SIMULATION "PASS" LOGS HERE]

