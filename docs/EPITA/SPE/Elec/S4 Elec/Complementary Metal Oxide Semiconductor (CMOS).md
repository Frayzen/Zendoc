---
title: "Complementary Metal Oxide Semiconductor (CMOS)"
---
Last edited time: June 11, 2023 3:09 PM

# Vidéo

[kj_09_3_Worked Examples_ CMOS Logic Gates.mp4](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/kj_09_3_Worked_Examples__CMOS_Logic_Gates.mp4)

# A useful pdf

[http://people.ee.duke.edu/~krish/teaching/Lectures/CMOScircuits_2011.pdf](http://people.ee.duke.edu/~krish/teaching/Lectures/CMOScircuits_2011.pdf)

# Notes

<aside>
⚠️ Please make sure you correctly understood [MOFSET](Metal%20Oxyde%20Semiconductor%20Field%20Effect%20Transistor%20.md) before reading

</aside>

## Usage

A CMOS is used to create an output from a given conditional boolean formula.

 

## Composition

A CMOS circuit is a combinaison of a **pullup** a **pulldown** circuit on top of each other.

- The pullup circuit is responsible for linking the output (Z) to the current source if the condition is valid.
- The pulldown  circuit is responsible for linking the ouptut (Z) to the ground if the condition is NOT valid.

> In any case, the output Z is connect to either the ground or the current source
> 

The pullup circuit is made of [PFETs](Metal%20Oxyde%20Semiconductor%20Field%20Effect%20Transistor%20.md) [](Junction%20Field%20Effect%20Transistor%20(JFET).md)whereas the pulldown circuit is made of [NFETs](Metal%20Oxyde%20Semiconductor%20Field%20Effect%20Transistor%20.md).

![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled.png)

![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%201.png)

As we can see, MOFSET can be used as switches depending on an input. We can now build the pullup and pulldown circuit given any boolean value.

# Exercices

- NOT A
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%202.png)
    
- A NAND B
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%203.png)
    
- A NOR B
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%204.png)
    
- A AND B
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%205.png)
    
- A OR B
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%206.png)
    

- What function is implemented by the circuit ?
    
    = A.B+C+D
    

![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%207.png)

- AB + BC + CA
    
    ![Untitled](Complementary%20Metal%20Oxide%20Semiconductor%20(CMOS)/Untitled%208.png)
