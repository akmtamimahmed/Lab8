\# Physics 332: Lab 8 - Buttons \& Signal Debouncing



\## Project Overview

This repository contains the Verilog source code and hardware constraints for \*\*Lab 8: Buttons\*\*, completed as part of the Digital Logic (PHYS 332) curriculum. The project focuses on handling mechanical switch inputs on an FPGA, specifically addressing "switch bouncing" and timing issues using clock division and state machine logic.



\*\*Hardware:\*\* Nexys 4 DDR (Artix-7 FPGA)  

\*\*Software:\*\* Xilinx Vivado  

\*\*Language:\*\* Verilog HDL



\## Modules \& Problems Solved



\### 1. The Bouncy Counter (`bouncy\_counter.v`)

\* \*\*Objective:\*\* Demonstrate the effects of mechanical switch "chatter" (bouncing).

\* \*\*Mechanism:\*\* Counts button presses directly using the system's 100MHz clock.

\* \*\*Result:\*\* A single physical press registers as millions of electrical impulses, causing the LED counter to increment uncontrollably.



\### 2. The Debounced Counter (`slow\_counter.v`)

\* \*\*Objective:\*\* Implement a stable counter by filtering noise.

\* \*\*Mechanism:\*\* Uses a clock divider to create a \*\*50Hz polling signal\*\*. The system only samples the button state every 20ms.

\* \*\*Result:\*\* Captures human inputs cleanly without "bouncing," counting exactly one increment per press (or counting up steadily if held).



\## File Structure

\* `bouncy\_counter.v` - Source code for the raw, unstable counter.

\* `slow\_counter.v` - Source code for the debounced, 50Hz polling counter.

\* `Nexys4DDR\_Lab8.xdc` - Constraint file mapping the 100MHz clock, switches, and LEDs to the Nexys 4 DDR pins.



\## How to Run

1\.  Create a new RTL Project in Vivado targeting the \*\*Nexys 4 DDR\*\* board.

2\.  Import the `.v` source files and the `.xdc` constraint file.

3\.  Set either `bouncy\_counter` or `slow\_counter` as the \*\*Top Module\*\* depending on which problem you wish to test.

4\.  Generate Bitstream and program the device.

