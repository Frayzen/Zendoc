---
Owner: "Florian "
---
# Objectives
- Configure our CPU
- x86_64 required
    
    > [!important] AMD is the constructor that created x86_64.1
    
- The main objective is to be able to create little ROMs that can be executed.
- Kernel is a program launched by boot-loader that prepares the machine (CPU, ram…) and make the machine usable by other software.
- Implement some driver for hardware
    - Initially: serial driver
    - Memory segmentation
    - Event system: when hitting a key, store the information
    - Timer: to ma
    - ATAPI: Be able to communicate with some ATA peripherics. It is a protocol parallel to SCOSI (protocol that make one able to manage disks, storage peripherics).
    - Read ISO file
    - Be able to read an elf program. Load memory, create environment (user land)…
    - Syscalls
- Driver: a program used to communicate with a peripheric
- Processor needs to be configured as well, but it is not really called a “driver”
  
# First week
## Initialisation of the kernel
- The bootloader is GRUB. It launches the kernel in memory.
- The kernel entry point follow the multiboot specification.
- The kernel is 32 bits

> [!important] We are using quemu.
> 
>   
> Bochs can act as a debugger
### [Frame buffer](https://k.lse.epita.fr/internals/framebuffer.html)
Certain peripheric are mapped on hardware addresses. When we want to write on screen, we write at those address to write on screen.

> [!important] fb stands for frame buffer
- A frame buffer is the
    - first byte is the character
    - second byte is the color
## Materials
- [https://k.lse.epita.fr/](https://k.lse.epita.fr/)
- The 3d manual of intel
    
    - Chapter 3 for protected mode. Only the segmentation part.
    
    > [!important] The kernel needs to follow the ABI
    
- Setup
    - Setup nix.shell
    - Create .clang-format | .gitignore | .editorconfig
    - Use bear
    - Create pre-commit-hook
## Rings
- The kernel runs in ring 0
- The userland runs in ring 3
## Structure of the folders
- The kernel is in the k folder
- libs
    - libc usable in the ROMs
    - libk tools
- roms contains the ROMs we want to run