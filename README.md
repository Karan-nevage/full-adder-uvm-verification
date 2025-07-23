# Full Adder Verification using UVM ✅

This repository showcases a **Universal Verification Methodology (UVM)** testbench developed to verify a 1-bit Full Adder design in SystemVerilog. The project demonstrates key verification techniques including **random stimulus generation**, **functional coverage**, and **scoreboard-based checking**.

## 🔍 Project Overview

- **Design**: 1-bit Full Adder written in Verilog (`full_adder.v`)
- **Verification Methodology**: UVM-based testbench with modular components
- **Simulation Environment**: QuestaSim or VCS (also available on EDA Playground)

EDA Playground link: [🔗 View Simulation](https://www.edaplayground.com/x/skhu)

## 🚀 Key Features

### ✅ DUT
- Combinational **Full Adder module** (`full_adder.v`)
- Inputs: `a`, `b`, `cin`
- Outputs: `sum`, `cout`

### 🧪 UVM Testbench Components
- **Transaction (`fa_tx`)**: Encapsulates `a`, `b`, `cin` as inputs and `sum`, `cout` as outputs
- **Sequences**: `random_10_val_gen_seq` generates 10 randomized transactions for simulation
- **Core Components**:
  - Driver
  - Monitor
  - Sequencer
  - Agent
  - Environment
  - Scoreboard
  - Coverage

### 🧮 Scoreboard
- Compares DUT output with expected results
- Logs **matches and mismatches**

### 📊 Coverage
- Captures **functional coverage** for all signals:
  - Inputs: `a`, `b`, `cin`
  - Outputs: `sum`, `cout`

### 📈 Reporting
- Displays:
  - **Pass/Fail status**
  - **Coverage report** after simulation completes

## 🛠️ Running the Simulation

Before launching the simulation, make sure to pass the desired test name via the command-line processor using `+UVM_TESTNAME`.

For example, to run the `random_10_val_gen_seq` test:

```bash
+UVM_TESTNAME=random_10_val_gen
```


## 📁 File Hierarchy & Component Roles

| **File Name**         | **Description** |
|------------------------|------------------|
| `fa_common.sv`         | Shared typedefs, macros, and utility functions used across the testbench |
| `full_adder.v`         | RTL implementation of the 1-bit Full Adder module |
| `fa_assert.sv`         | Assertion checks to validate DUT outputs at runtime |
| `fa_inf.sv`            | SystemVerilog interface to connect DUT with UVM components |
| `fa_tx.sv`             | Defines transaction class encapsulating Full Adder inputs/outputs |
| `fa_seq_lib.sv`        | Sequence library generating randomized and directed test cases |
| `fa_sqr.sv`            | UVM sequencer coordinating transaction flow to the driver |
| `fa_driver.sv`         | Drives inputs to the DUT using transactions from sequencer |
| `fa_monitor.sv`        | Observes DUT outputs and converts them into transactions |
| `fa_coverage.sv`       | Collects functional coverage data for input/output combinations |
| `fa_agent.sv`          | Aggregates driver, monitor, and sequencer into a reusable UVM agent |
| `fa_scoreboard.sv`     | Compares actual DUT outputs with expected outputs |
| `fa_env.sv`            | UVM environment that integrates agent, coverage, and scoreboard |
| `fa_test_lib.sv`       | Contains test scenarios and test configuration for simulations |
| `top.sv`               | Top-level testbench module instantiating DUT and UVM environment |


## 👤 Creator Information

**Karankumar Pandharinath Nevage**  

📫 **Email**: karanpr9423@gmail.com  
🔗 **LinkedIn**: [linkedin.com/in/karankumar-nevage](https://www.linkedin.com/in/karankumar-nevage)  
💻 **GitHub**: [github.com/Karan-nevage](https://github.com/Karan-nevage)  
🌐 **Portfolio Website**: [karan-nevage.github.io](https://karan-nevage.github.io)  
📺 **YouTube Channel**: [Fluxray Electronics](https://www.youtube.com/@FluxrayElectronics)

---
