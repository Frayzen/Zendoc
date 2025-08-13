---
title: My own OS
Owner: "Florian "
---
  
![[1000003303.jpg]]

# Flat memory model
In the FMM we treat RAM as a single contiguous model. The GDT **must** contain at least a code and data segment.
[https://youtu.be/Wh5nPn2U_1w?si=T47r-bamDpomiXBs&t=250](https://youtu.be/Wh5nPn2U_1w?si=T47r-bamDpomiXBs&t=250)
## Global Descriptor Table (GDT)
**The following graph is read from right to left and bottom up.**
![[Untitled 111.png|Untitled 111.png]]

Base is the address of the beginning of the section
![[Untitled 1 78.png|Untitled 1 78.png]]

- Present = 1 for used segments
- Privilege is on 2 bits with 00 being the most privilege and 11 the least
- Type = 1 if code OR data segment
- Flags are single bits representing boolean property:
    - Type flags:
        - Is this segment containing code ?
        - Depending on the type, this flag can be either:  
            (**For code segments**) Conforming: can this code be executed by lowest privileged segments ?  
            (**For data segments**) Direction: should the data grow downward ?
        - Depending on the type, this flag can be either:  
            (**For code segments**) Readable : can we read constants from here ?  
            (**For data segments**) Writable: can we write on the segment ?
        - Accessed : used by the CPU to know when the sector is used ( should be set to 0 initially)
    - Other flags:
        - Granularity: when this bit is set to 1, the limit is timed bu 0x1000 (to span throughout the whole 4GB of memory)
        - Is the segment gonna use 32 bits memory ?
        - Is the segment gonna use 64 bits memory ?
        - Available: It's a spare bit that can be utilized by the system software or operating system for its own requirements.
```Assembly
GDT_Start:
    null_descriptor:
        dd 0        ; 4 zeros
        dd 0        ; again
    code_descriptor:
        dw 0xffff   ; First 16 bits of the limit
        dw 0        ; First 24 bits of the base
        db 0        ; -
        db 10011010 ; pres, priv, type and type flag
        ;  p,p,t,type
        db 11001111
        ; Other + limit (last 4 bits)
        db 0        ; Last 8 bits of the base
    data_descriptor:
        dw 0xffff   ; First 16 bits of the limit
        dw 0        ; First 24 bits of the base
        db 0        ; -
        db 10010010 ; pres, priv, type and type flag
        ;  p,p,t,type
        db 11001111
        ; Other + limit (last 4 bits)
        db 0        ; Last 8 bits of the base
GDT_End:
GDT_Descriptor:
    dw GDT_End - GDT_Start - 1 ;size
    dd GDT_Start               ;start
;can be applied using
lgdt [GDT_Descriptor]
```