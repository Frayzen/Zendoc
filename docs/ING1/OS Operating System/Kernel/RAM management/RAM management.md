---
Owner: "Florian "
---
# Storage
- Reminder about primary storage
    
    ![[Untitled 143.png|Untitled 143.png]]
    
    - **primary**  
        (can be used directly by CPU)
    - **secondary**  
        (is permanent – has to be kept synchronous)
    - **tertiary**  
        (only for backups)

> [!important] **Primary storage:**
> 
> The **only** storage the CPU can address directly
# Stating the problem
**Problem**: While some address values in program data are set during compilation, the specific location of a process in RAM is uncertain. This presents challenges:
- **Multitasking**: In multitasking systems, multiple processes share the same RAM simultaneously, which can lead to conflicts.
- **Hardcoded Addresses**: Programs with hardcoded addresses can't adapt to changing RAM locations.
- **Fragmentation**: To avoid wasted space, we need to manage RAM efficiently and minimize fragmentation.
- **Protection and Isolation**: Each process must run as if it's the only one in RAM, ensuring protection and isolation from other processes.
# Solutions
[[Segmentation]]
[[Paging]]

> [!important] Segmentation is
> 
> **old** and **paging** is way more used nowadays