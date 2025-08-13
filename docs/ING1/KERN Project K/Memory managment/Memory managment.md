---
Owner: "Florian "
---
# Logical And linear addresses
At the system-architecture level in protected mode, the processor uses two stages of address translation to arrive at a physical address.

> [!important] To protect critical part of assembly from being interrupted, we can use
> 
> **cli** to disable interrupts and **sti** to enable it back.
## Descriptors Tables
### Global Descriptor Table (GDT)
The GDT is a data structure used by Intel x86 processors to define the characteristics of the various memory segments used in a system. These segments can include code segments, data segments, and system segments like Task State Segments (TSS). The GDT is global in scope, meaning it is shared by all processes running on the system.
### Local Descriptor Table (LDT)
The LDT is similar to the GDT but is used for defining memory segments specific to an individual process or a group of processes.
- Each process can have its own LDT
![[Untitled 67.png|Untitled 67.png]]
## Logical address translation
  
A logical address consists of a 16-bit segment selector and a 32-bit offset.
The segment selector identifies the segment the byte is located in and the offset specifies the location of the byte in the segment relative to the base address of the segment.
## Linear address space paging
The processor translates every logical address into a linear address. A linear address is a 32-bit address in the processor’s linear address space. Like the physical address space, the linear address space is a flat (unsegmented), 232 -byte address space.
The linear address space contains all the segments and system tables defined for a system.
![[Untitled 1 43.png|Untitled 1 43.png]]
# Segment register
A list of segment register is not enough: we need segment registers to know which segment is the current active.
- ss: stack segment
- cs: code segment
- ds: data segment
  
A long jump is a jump to another segment
  
![[Untitled 2 30.png|Untitled 2 30.png]]
### Segment selector
A segment selector is a 16-bit identifier for a segment.
It does not point directly to the segment,  
but instead points to the segment descriptor that defines the segment.
![[Untitled 3 22.png|Untitled 3 22.png]]
- Index: selects one of 8192 descriptors in the GDT or LDT. The processor multiplies the index value by 8 and adds the result to the base address of the GDT or LDT. (from the GDTR or LDTR)
- Table Indicator flag: Specifies the descriptor table to use:
    - clearing this flag selects the GDT;
    - setting this flag selects the current LDR
- Request privilege level: select the ring level
### Translate from logical to linear
1. Uses the offset in the segment selector to locate the segment descriptor for the segment in the GDT or LDT and reads it into the processor. (This step is needed only when a new segment selector is loaded into a segment register.)
2. Examines the segment descriptor to check the access rights and range of the segment to insure that the segment is accessible and that the offset is within the limits of the segment.
3. Adds the base address of the segment from the segment descriptor to the offset to form a linear address.