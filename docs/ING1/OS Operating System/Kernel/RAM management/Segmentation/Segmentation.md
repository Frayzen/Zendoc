---
title: Segmentation
Owner: "Florian "
---
  
In 1985, intel introduced the **Protected Mode**
The process think it starts at address 0 but the microprocessor handles the conversion of all the addresses by adding the “base” address.
The limit ensure the process is not overwriting another process’ memory space.
It allows the definition of **segments**
- Zones of contiguous memory
- Basic address translation
- Basic memory protection
- Privilege levels (_basic_)
  
![[Untitled 171.png|Untitled 171.png]]

> [!important] One of the drawback of this method is that resizing a process is not possible
  
![[Untitled 1 116.png|Untitled 1 116.png]]