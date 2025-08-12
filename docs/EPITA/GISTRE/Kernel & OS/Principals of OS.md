---
title: "Principals of OS"
---
Last edited time: February 27, 2025 5:05 PM

[ivan_boule_epita_gistre_cours_os_2_principles.pdf](Principals%20of%20OS/ivan_boule_epita_gistre_cours_os_2_principles.pdf)

![image.png](Principals%20of%20OS/image.png)

# ISA & ABI

- **ISA (Instruction Set Architecture):** The software support of all the architecture specific functions (in the `arch` folder of the kernel)
    - All CPU instructions
    - Memory architecture
    - Interruption mechanisms
    - Input/Output devices
    - Independent from the OS
- **ABI (Application Binary Interface)**: An interface specific to a kernel version.
    - Instruction CPU-independent
    - The set of all kernel syscalls

<aside>
💡

In order to debug (de)allocation of objects, one should use a macro MY_OBJ_(DE)ALLOC(…) so that changing the behavior of the macro is easy. 

</aside>

# Microcode

When a processor is too complex (too much instructions, pagination, cache…). Code instructions in hardware is not possible. Therefore, a sub processor interprets micro-instruction and translate them to the processor.

This set of micro instructions is in essence a **translator** that achieves all necessary operations on the processor side to .

<aside>
💡

Book: Cholsey kidder

</aside>

# Compilation

![image.png](Principals%20of%20OS/image%201.png)

## Static linking

Static links are all part of code that are integrated into the final executable. The final binary is self-contained and does not depend on any external part of code.

## Dynamic linking

In a program, external functions are often located in shared libraries, which are separate binary files. These functions are compiled with the **PIC** (Position Independent Code) flag, meaning they can be loaded at any address in memory.

When the program calls an external function, the actual address of the function isn't known until runtime. To manage this, the **GOT** (Global Offset Table) stores the addresses of these external functions.

The **PLT** (Procedure Linkage Table) is responsible for resolving and calling these external functions. Initially, it redirects function calls to the GOT, which eventually loads the correct address of the function from the shared library when it's first accessed.

<aside>
💡

This is managed by the [**ld.so](http://ld.so)** library. (*man (8) ld.so*). The name of dynamic links is stored in the `.interp` section of the binaries → `readelf -p .interp my_program`. This library is launched by the kernel at program launch.   

</aside>

# Process

The notion of a process is intimately related to parallelism. Indeed, we want to give the processor as much work as we can. Therefore, if a program is waiting for a file to be loaded, we want the processor to handle other operations from another program (another process).

A process modifies the registers, the RAM (…) at runtime. During the program swap, we don’t want to leave this memory to the new process (for security issue first).

Also, in order to allow programs to be executed in parallel, we cannot stick to physical memory address : we need **virtual addressing**. This is included in the CPU and a privileged instruction allows swapping from virtual addressing to physical addressing.

<aside>
💡

The kernel is responsible for building the **translation table** from virtual to physic.

</aside>

For example, a `malloc` is allocating a virtual region to the kernel that itself allocates (if needed, [see pagination](../../ING1/%5BOS%5D%20Operating%20System/Kernel/RAM%20management/Paging.md)) a physical region of code (a page).  

![image.png](Principals%20of%20OS/image%202.png)

The kernel should have stored for each awaiting process:

- Its RAM address space
- Its virtual translation table
- Its CPU registers
- Its execution state (stopped, ready, etc…)
