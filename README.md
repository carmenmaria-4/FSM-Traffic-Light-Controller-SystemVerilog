# Traffic Light Controller on Spartan-7 FPGA

This project is a modular implementation of a traffic light controller using **SystemVerilog**, specifically designed and tested for the **Xilinx Spartan-7 (XC7S50)** FPGA. My goal was to move beyond a basic logic gate approach and build a professional-grade design using a **Finite State Machine (FSM)** architecture.

## Design Philosophy

When I started this project, I wanted to focus on two things: readability and hardware reliability. Instead of cramming everything into one file, I used a hierarchical approach. This not only makes the code cleaner but also much easier to debug when testing on the actual FPGA board.

### Core Features:
*   **Modular Architecture**: I separated the design into distinct modules (frequency scaling, counting, and FSM control). This allowed me to test each part of the logic independently.
*   **Modern SystemVerilog**: I used `always_ff` for sequential logic and `always_comb` for combinational blocks. This is a best practice that ensures the design synthesizes correctly without creating unwanted latches.
*   **Clock Management**: Since the Spartan-7 runs at **100MHz**, the transitions would be invisible to the human eye. I implemented a custom clock divider to scale that frequency down to something we can actually see on the LEDs.
*   **Reliable FSM**: The logic is driven by a Moore-type State Machine (Red -> Green -> Yellow). This structure ensures that the outputs are strictly dependent on the current state, preventing any glitches during transitions.

## Project Structure

I’ve organized the code into four main modules:

1.  **`freq.sv`**: This is the frequency divider. It takes the high-speed 100MHz clock and scales it down so the timing of the lights feels realistic.
2.  **`counter.sv`**: A 32-bit counter that tracks exactly how long each light stays on.
3.  **`traffic_light_fsm.sv`**: The "brain" of the project. This is where I defined the states and the specific conditions required to move from one color to the next.
4.  **`top.sv`**: The top-level wrapper that ties everything together and maps the internal signals to the physical pins.

## Verification & Simulation

Before deploying to the FPGA, I spent quite a bit of time in the **Vivado Simulator** using a custom **Testbench (`tb.sv`)**. I focused on validating three main things:
*   **Asynchronous Reset**: Ensuring that no matter what happens, hitting the reset button always brings the system back to a safe "Red" state.
*   **Timing Accuracy**: I monitored the internal counter to make sure the lights switch exactly when they are supposed to.
*   **Waveform Analysis**: I used the timing diagrams to visually confirm that the state transitions were smooth and followed the correct sequence.

## Hardware Specifications
*   **Target Device**: Xilinx Spartan-7 (XC7S50CSGA324-1).
*   **Toolchain**: Vivado.

## How to Run
1.  Add the `.sv` source files to a new Vivado project.
2.  Set `tb.sv` as your top-level simulation file.
3.  Run **Behavioral Simulation** to see the timing waveforms.
4.  To test on hardware, you'll need to create a `.xdc` file to map the `r` and `g` outputs to your board's LEDs and the `clk_100M` to the system oscillator.
