---
title: Cheeky Definitions
Owner: Tim Pearson
---
### ISA
- **Instruction Set Architecture**
- the set of instructions that a processor can execute, as well as how they are encoded
- defines the interface between hardware and software
- set of instructions, addressing modes, registers, and other architectural features that a processor supports
- Examples of ISAs include x86, ARM, MIPS, and RISC-V ==(AT&T is not an example, its more about syntax)==
  
### Agnostic
- refers to a state of being neutral, indifferent, or without a specific preference or bias towards something
- random question we had :==When writing in assembly : the code is platform agnostic (Windows, Linux, macOS, OpenBSD...)==
- the answer is false xox
  
[[Types of ISA]]

### CPU (central processing unit)
- not “computer processing unit”, don’t be a [[Timvocab]]

- brain of the computer
- responsible for executing instructions and calculations
- fetches instructions from memory
- executes operations (arithmetic, logic, control tasks)
- Manages data movement between different parts of the computer
- a cpu contians the following registers:
    - ==**MDR**==, memory data register which stores the data that is to be sent to or fetched from memory, acts like a buffer, ==holds the dats that will be written to the RAM or read from the RAM.==
    - ==**MAR**==, the CPU register that either stores the memory address from which data will be fetched to the CPU registers, or the address to which data will be sent and stored via system bus, ==stores the data being transferred to and from the immediate access storage==
    - ==**PC**==, program counter, keeps track of the memory address of the next instruction to be fetched and executed
    - ==**IR**==, instruction register which stores the current instruction being executed and the actual instruction that is being decoded and executed
    - ==**ACC**==, accumulator which stores the result of calculations from the ALU
### ALU (Arithmetic Logic Unit)
- performs arithmetic and logical operations on binary data
- takes input data from registers
## ==**[[Standards]]**==
  
## Stack Frame
- region of a program's call stack that stores temporary data associated with a function call
- we use the stack frame when we are temporarily storing data from registers before using them in functions so that we can restore them before returning from the function
- …
### GP registers (General purpose registers)
- inlcudes **RAX, RBX, RCX, RDX, RSI, RDI, RBP, RSP, r8 - r15**
- ==found in x86-64-psABI-1.0.pdf manual page 61:==
    
    ![[Untitled 113.png|Untitled 113.png]]

    
## State of the preceding operation RFLAGS
- called EFLAGS in 32 archi
- search for rflags on the abi manual (page 31) to get
1. ==**Zero Flag (ZF):**== Set if the result of an operation is zero.
2. ==**Sign Flag (SF):**== Set if the result of a signed operation is negative.
3. ==**Overflow Flag (OF):**== Set if the result of a signed operation causes an overflow.
4. ==**Carry Flag (CF):**== Set if an arithmetic operation generates a carry out of the most significant bit.
5. ==**Parity Flag (PF)**==**:** Set if the number of set bits in the result is even.
6. ==**Auxiliary Carry Flag (AF)**==**:** Used for binary-coded decimal (BCD) arithmetic.
![[Untitled 1 80.png|Untitled 1 80.png]]

