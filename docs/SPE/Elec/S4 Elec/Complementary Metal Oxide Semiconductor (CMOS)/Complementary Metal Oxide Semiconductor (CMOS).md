---
title: Complementary Metal Oxide Semiconductor (CMOS)
Owner: "Florian "
---
# Vidéo
![[kj_09_3_Worked_Examples__CMOS_Logic_Gates.mp4]]

# A useful pdf
[http://people.ee.duke.edu/~krish/teaching/Lectures/CMOScircuits_2011.pdf](http://people.ee.duke.edu/~krish/teaching/Lectures/CMOScircuits_2011.pdf)
# Notes

> [!important] Please make sure you correctly understood
> 
> [[Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)]] before reading
## Usage
A CMOS is used to create an output from a given conditional boolean formula.
## Composition
A CMOS circuit is a combinaison of a **pullup** a **pulldown** circuit on top of each other.
- The pullup circuit is responsible for linking the output (Z) to the current source if the condition is valid.
- The pulldown circuit is responsible for linking the ouptut (Z) to the ground if the condition is NOT valid.

> In any case, the output Z is connect to either the ground or the current source
The pullup circuit is made of [[Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)]][[Junction Field Effect Transistor (JFET)]]whereas the pulldown circuit is made of [[Metal Oxyde Semiconductor Field Effect Transistor (MOFSET)]].
![[Untitled 22.png|Untitled 22.png]]

![[Untitled 1 11.png|Untitled 1 11.png]]

As we can see, MOFSET can be used as switches depending on an input. We can now build the pullup and pulldown circuit given any boolean value.
  
  
# Exercices
- NOT A
    
    ![[Untitled 2 6.png|Untitled 2 6.png]]

    
- A NAND B
    
    ![[Untitled 3 6.png|Untitled 3 6.png]]

    
- A NOR B
    
    ![[Untitled 4 4.png|Untitled 4 4.png]]

    
- A AND B
    
    ![[Untitled 5 4.png|Untitled 5 4.png]]

    
- A OR B
    
    ![[Untitled 6 3.png|Untitled 6 3.png]]

    
- What function is implemented by the circuit ?
    
    = A.B+C+D
    
      
    
![[Untitled 7 3.png|Untitled 7 3.png]]

- AB + BC + CA
    
    ![[Untitled 8 2.png|Untitled 8 2.png]]

