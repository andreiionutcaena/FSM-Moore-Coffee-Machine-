# Coffee Machine FSM - SystemVerilog

This project simulates a **Finite State Machine (FSM)** for a coffee vending machine implemented in **SystemVerilog** and tested using a behavioral testbench.

## 📝 Description

The coffee machine accepts 50 and 100 monetary units as input. Once the total amount reaches or exceeds 200 units, it dispenses a coffee. The FSM transitions through different states based on inserted coin values.

FSM outputs:
- `cafea`: High when coffee is dispensed.

## 🧪 Testbench

The testbench simulates multiple input scenarios and compares the FSM's output (`cafea`) against a golden model (`cafea_golden_model`). A signal `ok` is used to validate the correctness of the output.

## 📁 File Structure

```
FSM-Moore-Coffee-Machine-/
├── FSM.sv         # FSM design in SystemVerilog
├── testbench.sv   # Testbench for the FSM
├── .gitignore     # gitignore document for the project
└── README.md      # Project documentation
```

## 💻 Requirements

- Vivado or any SystemVerilog-compatible simulator (e.g., ModelSim, VCS)
- Git (for version control)

## 🚀 Simulation Instructions

In Vivado or another tool:

1. Add `FSM.sv` and `testbench.sv` to your simulation sources.
2. Run the behavioral simulation.
3. Observe the signal `ok` to ensure the FSM matches the golden model.

## 🧠 FSM State Diagram

States:
- `BANI_0` to `BANI_300` — transitions based on 50 or 100 coin inputs
- `cafea` is asserted in states `BANI_200`, `BANI_250`, and `BANI_300`

## 📌 License

This project is open-source under the MIT License.

