---
Owner: "Florian "
---
# Intel vulnerabilities
Intel is really a bad microprocessor builder. One of its biggest weakness is that their architecture does **not** involve any constraint about alignment of instructions. In other words, the instructions of intel ASM can be of any size.
It is therefore strongly discouraged to use intel for sensitive data.
## Return oriented programming (ROP)
Considering this huge vulnerability and considering the fact that buffer overflows are getting pretty rare nowadays, some people thought about using the compiled code to just jump to the middle of ASM instructions (creating _new instructions then_) to execute some unintended code.
**Roper** is a tool programmed in python to find in the assembly the right jump point to setup the registers according to your will.
# Closed source vs Open source
One of the biggest misconception is that closed source is more secure. That is **FALSE**.
If you are closed source, you can do the worst code ever because **no one** is ever gonna **read** it.
Another example is someone from windows that generated an exploit generator finding out all of the buffer overflow in window’s source code.
- There is some tools to reverse engineer closed source code.
- It keeps people careful about their own code.
- Atatckers don’t need the whole source code to find vulnerabilities
# Venetian exploit technique
TODO (the leson went too fast, i promise i wasn’t playing 👀)