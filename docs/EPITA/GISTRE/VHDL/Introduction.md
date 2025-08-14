---
title: Introduction
Owner: "Florian "
---
# FPGA
An **FPGA card** is essentially composed of two main layers stacked on top of each other:
- The **configuration layer**, which consists of **SRAM cells** that store the bitstream used to configure the FPGA’s internal logic. This layer is volatile, meaning that the FPGA must be reprogrammed on each power cycle unless an external memory stores the configuration.
- The **logic layer**, which contains **programmable logic elements** such as Look-Up Tables (LUTs), flip-flops, multiplexers, and routing interconnects. This layer is dynamically configured by the SRAM layer to implement specific digital circuits.
The FPGA is organized into **functional blocks** that provide specialized capabilities:
- **Logic Blocks (CLBs/ALMs)**: These are the core units that implement combinational and sequential logic, using LUTs and flip-flops.
- **Memory Blocks (RAM/ROM)**: These blocks support the creation of data storage structures such as **FIFO queues, caches, and shift registers**, providing fast local memory for data processing.
- **DSP Blocks (Digital Signal Processing)**: These specialized units include **multipliers, accumulators, and arithmetic logic**, enabling high-speed computations for signal processing, image processing, and machine learning applications.
- **I/O Blocks**: These handle communication between the FPGA and external devices, supporting various protocols like **PCIe, Ethernet, and DDR memory interfaces**.
- **Clock Management Blocks (DCM/PLL)**: **Digital Clock Managers (DCM)** and **Phase-Locked Loops (PLL)** are used for **clock signal conditioning, frequency synthesis, jitter reduction, and phase shifting**. These blocks allow precise control of timing and synchronization, which is critical for high-performance designs.
    
    > [!important] These components are used to rephase the main clock because of the Scew<br>Another usage of PLL in STM32 is after the 16 Mhz quartz clock to increase the frequency. It is configurable to allow the user to change the card clock speed.
    
By interconnecting and configuring these blocks, an FPGA can implement highly parallel and efficient hardware designs tailored to specific applications.

> [!important] FPGA are widely used in space, aircraft and defense as well as telecommunication industry
# ASIC
An **ASIC (Application-Specific Integrated Circuit)** is a custom-designed chip optimized for a specific task or application, such as graphics processing, networking, or machine learning. Unlike an **FPGA (Field-Programmable Gate Array)**, which is **reconfigurable** and can be programmed multiple times, an ASIC is **hardwired** during manufacturing and cannot be altered after fabrication. This makes ASICs **faster, more power-efficient, and smaller** than FPGAs for a given task but also **much more expensive and time-consuming** to develop. FPGAs are ideal for prototyping and applications requiring flexibility, while ASICs are preferred for mass production where performance and efficiency outweigh the high initial development cost.
# Keywords
- **HDL:** Hardware Description Language
- **IP:** is an **intellectual property**, it is a component library.
- **EDA:** Electronic Design Automation
- **ASIC**: Application Specific Integrated Circuit. It is described in HDL language. ARM is the biggest seller of IP.
    
    > [!info] Design And Reuse, The System-On-Chip Design Resource - IP, Core, SoC  
    > Design And Reuse, The Web's System On Chip Design Resource : catalogs of IPs, Virtual Components, Cores for designing System-on-Chip (SOC)  
    > [https://www.design-reuse.com/](https://www.design-reuse.com/)  
    
- **ISA**: Instruction Set Architecture, all the assembler instructions of an architecture
- **LUTs**: Look Up Table
- **Scew:** change of phase in a clock pulse due to the length of the circuit
- **DSP**: Digital Signal Processing
# Logic Design
`VHDL` is a description of hardware. We call it “Hardware Description Language”. The V stand for `VHSIC` (_Very High Speed Integrated Circuit._ It describes structure and behavior of an electrical circuit. It used to be created only for simulation and rendering.
The “compilation” process is called **synthesis**.
There will be test for every single part of the described circuit. The testsuite allows the “checks” as there is no such things as debuggers. It allows describing hierarchical components: we can create small components and reuse them in a larger components.
The first language has been created by several big companies initially and all of the rights has been transferred to I3E, a company that creates and operates tech standards (wifi, bluetooth…). The last VHDL standards was published in 1994.

> [!info] Synthèse VHDL et Systèmes sur puce (SOC)  
> Comme il a été expliqué dans l’article précédent, la fonction VHDL « MOD » correspondant au calcul du modulo n’est pas reconnue comme synthètisable dans les outils courants comme ISE.  
> [http://vhdl33.free.fr/](http://vhdl33.free.fr/)  

> [!info] VHDL for Designers  
> How much VHDL training do you need?  
> [https://www.doulos.com/training/fpga-and-hardware-design/vhdl/vhdl-for-designers/](https://www.doulos.com/training/fpga-and-hardware-design/vhdl/vhdl-for-designers/)  

> [!info] Free Model Foundry  
> This is the premier site for VHDL and Verilog component simulation models.  
> [https://freemodelfoundry.com/](https://freemodelfoundry.com/)  
## Modeling vs Synthesis
In **VHDL**, **modeling** refers to the process of describing a digital system's behavior, structure, or data flow using VHDL constructs.
- All the language (logical + temporal)
- A model can be structural (create of components and reuse them in others) or dataflow (creation of a component from the equations describing its behavior)
**Synthesis**, on the other hand, is the process of transforming a synthesizable VHDL model into a hardware representation, such as a gate-level netlist, which can be implemented on an FPGA or ASIC.
- A subset of general VHDL
- Requires a good knowledge of the circuit and the technology

> [!important] We say VHDL RTL (Register Transfer Level) for VHDL that allows synthesis.
---
While modeling focuses on describing and simulating the intended behavior of a circuit, synthesis enforces hardware constraints and converts the code into actual logic gates and connections
## Other languages:
- `Verilog`: older thatn VHDL, syntax is C-like. Mostly used in USA and Asia
- `VHDL-AMS`: mix of analog and numerical language, entirely compatible with VHDL. Only used for modeling.
- `SystemC`: Based on **C++**, used for system **conception** and **behavioral modeling**.
- `SytemVerilog`: **extension** of Verilog, integrating advanced functionalities sucha as **conception** and **verification**
- `ModelSim`: leader for simulation

> [!important] All of them are called EDA (Electronic Design Automation)