---
title: Interrupts
Owner: "Florian "
---
[https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-vol-3a-part-1-manual.pdf](https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-vol-3a-part-1-manual.pdf)
![[Untitled 66.png|Untitled 66.png]]
  
![[Untitled 1 42.png|Untitled 1 42.png]]
# INTERRUPT AND EXCEPTION HANDLING
When the processor performs a call to the exception- or interrupt-handler procedure:
- If the handler procedure is going to be executed at a numerically lower privilege level, a stack switch occurs. When the stack switch occurs:
    1. The segment selector and stack pointer for the stack to be used by the handler are obtained from the TSS for the currently executing task. On this new stack, the processor pushes the stack segment selector and stack pointer of the interrupted procedure.
    2. The processor then saves the current state of the EFLAGS, CS, and EIP registers on the new stack.
    3. If an exception causes an error code to be saved, it is pushed on the new stack after the EIP value.
![[Untitled 2 29.png|Untitled 2 29.png]]
  
- If the handler procedure is going to be executed at the same privilege level as the interrupted procedure:
    1. The processor saves the current state of the EFLAGS, CS, and EIP registers on the current stack (see  
        Figures 6-4).
    2. If an exception causes an error code to be saved, it is pushed on the current stack after the EIP value.