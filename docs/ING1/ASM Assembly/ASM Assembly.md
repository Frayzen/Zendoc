---
Owner: Matcha
---
[[Compilation Process]]
[[Cheeky Definitions]]
[[Cat imp]]
## Intel Manual
Volumes
Intel 64 Architecture Software Developer’s Manual Vol.1 (Basic architecture)
Intel 64 Architecture Software Developer’s Manual Vol.2 (Instructions manual)
  
# Instructions
prefix **MNEMONIC SRC, DST**
- Mnemonic is the human readable representation of an **OPCODE**
- Operands (src and dst) are the parameters of the instruction (like 2 and 3 in the addition 2 + 3)
  
Operations are made by the **ALU** (arithmetic and logical unit) such as AND, OR, XOR, NOT and ADD, SUB, MUL, DIV…
  
# Registers
Small internal storage space
**Pro:** really fast
**Cons:** not very large amount of data
They are used as source and destination for most of our operands

> [!important] All CPUs have registers but names can differ
![[Untitled 18.png|Untitled 18.png]]
![[Untitled 1 8.png|Untitled 1 8.png]]
![[Untitled 2 4.png|Untitled 2 4.png]]
- The current instruction (a pointer to the instruction stored in the RAM) is stored in the program counter register or **RIP**.
- The stack pointer **SP** represent the top of the stack. It increments as it grows and decrements as it diminishes.
  
There exists other registers such as **control register**.
![[Untitled 3 4.png|Untitled 3 4.png]]
- rax → Accumator (but also normally has the return of a function)
- rbx →callee saved, frame pointer or base pointer for memory access
- rcx → counter
  
## Data types
### Memory
- using [ ] with a register in between is dereferencing it
- mov eax edx — same as in c — eax = edx
- mov eax [edx] — same as in c — eax = *edx
  
### Arrays
- to define an array we need to give it a name, size of elements and the elements themselves.
- also we need to define whether its in the .data or .rodata section
    
    - .data = initilized data, can change at runtime
    - .rodta = (read only), constant
    
    ```Assembly
    section .rdata
    my_string db 'Hello', 0  ; Constant string in the .rdata section
    ```
    
    ```Assembly
    section .data
    my_array dq 1, 2, 3, 4, 5  ; An array of 64-bit integers
    ```
    
    - above we use dq to define the size of elements.
        - q = 64 bits (quintessential → means everything)
        - d = 32 bits (double)
        - w = 16 bits (word)
        - b = 8 bits (byte)