---
title: "[ARM] ARM (x64) 󰿗"
---
Last edited time: March 10, 2025 12:09 PM

[](https://moodle.epita.fr/course/view.php?id=3991)

[gistre25-arm-1-identifying-a-microcontroller.pdf](ARM%20(x64)/gistre25-arm-1-identifying-a-microcontroller.pdf)

[gistre25-arm-02-the-basic-toolset.pdf](ARM%20(x64)/gistre25-arm-02-the-basic-toolset.pdf)

# Mounting

Various type of mounting:

![image.png](ARM%20(x64)/image.png)

BGA

![image.png](ARM%20(x64)/image%201.png)

TQFP

Another process associated with the mounting is the **bounding (**[https://en.wikipedia.org/wiki/Wire_bonding](https://en.wikipedia.org/wiki/Wire_bonding))

# What’s on the board

Finding what is on a board is called “Bill of material 🇬🇧” / “nomeclature 🇫🇷”.

Why are the other components so hard to find ?

- Passive components tend to get discontinued quickly
- The VAST majority come from China/Taiwan/Korea/... which your Google search engine might not know that well :-)
- When it's hard, try using a search engine like [octopart.com](http://octopart.com/)..
- Sometimes "teardown" or "reverse engineering" might help

[https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/14/devicemarkingconventions.pdf](https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/14/devicemarkingconventions.pdf)

## Example

![image.png](ARM%20(x64)/image%202.png)

**Rigol DS1054Z oscilloscope**

- Actel ProASIC3 A3P030 VQG100 – FPGA – Link
- TI HA04-37K-CPDD – TI – Mistral “Le Chat” says it could be close to SN74AHC04. Packaging matches but this is not a proof at all !
- SK Hynix H5PS5162GFR-Y5C – DRAM – Link
- The search bar on SK Hynix's own website does not find it !
- What we’re doing is rebuilding the Bill Of Materials…
- Read here for an introduction to BoMs

# Computer Vs MCUs

As a software developer, you'll have to get new habits

- Memory handling is more delicate
- You used to think RAM, or HDD/SSD
- Now you'll have to think Flash, EEPROM, PROM, RAM, fuses... Knowledge of hardware is nearly mandatory
- Each vendor (like ST, Espressif...) does provide a set of software libraries, linker scripts, code generators...named the Hardware Abstraction Layer (HAL) that eases the developers' lives
- But as soon as you need to write a driver, you have to know the
capabilities of your hardware

But the biggest difference with "classic" multiprocessors is I/O

- MCUs are I/O driven beasts, not compute driven
- Often this means handling several devices in parallel
- So expect to :
    - Design multi-entry, event-based applications
    - Eat hardware interrupts for breakfast
    - Forget threads : use timers to launch tasks
    - Handle various sleep modes to save power
    - Now that we've gathered some documentation, let's dive in

# STM32F429

Let's do a small presentation still :

- 1 Cortex-M4 core clocked @ 180MHz
- Up to 2MB of Flash memory
- Up to 256KB of SRAM
- 4 power modes : Run, Sleep, Stop and Standby
- Up to 168 I/O ports
- Up to 21 communication interfaces

MCUs, just like the processor in your laptop, come in variants. Identifying what your board contains means identifying the different levels of documentation. There is no single document to explain how your devkit works. We will see the datasheet, the user manual, and the reference manual

<aside>
💡

To understand what is linked to what, the block diagram is a good entry point, in the datasheet.

</aside>

[https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.st.com/resource/en/datasheet/stm32f427vg.pdf&ved=2ahUKEwiO9-bp4u2LAxUEU6QEHbVCFuUQFnoECB4QAQ&usg=AOvVaw1S2ajr3YhnSe-rPuwstp8n](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.st.com/resource/en/datasheet/stm32f427vg.pdf&ved=2ahUKEwiO9-bp4u2LAxUEU6QEHbVCFuUQFnoECB4QAQ&usg=AOvVaw1S2ajr3YhnSe-rPuwstp8n)

# How to compile for STM32

 Native compilers are not practical for MCUs, and compiling is very CPU intensive. Therefore, we use cross compiler (compile a program for another platform than the host one).

<aside>
💡

On Alpine Linux gcc binary is 1.7MB large (without dependencies). STM32F429ZIT internal flash is 2MB large.

</aside>

The simplest toolset for the ARM course could be:

- Writing ➔ vim
- Compiling ➔ arm-none-eabi-gcc
- Flashing (program the firmware) ➔ openocd
- Debugging ➔ openocd

<aside>
💡

 All are **open-source** are require no license

</aside>

# What is GPIO

A GPIO is a numerical signal on a PIN. It can be in 3 states:

- Input (reading)
- Output (writing)
- Floating (detached)

It is used for controlling devices with binary logic (buttons, lights, relays…). GPIOs can also be used for manual signal generation.

Programming the GPIO is possible thanks to registers. Some register bank is associated with the GPIO. The register bank is linked to the CPU through the I/O bus. This IOs have their own clocks.

## Bank

The “Pin A-3” means GPIO bank A pin number 3 (0 based counting). Each bank is powered separately and has its own register bank. Thus, each GPIO is operated independently

![image.png](ARM%20(x64)/image%203.png)

# Code

[https://www.st.com/resource/en/reference_manual/dm00031020-stm32f405-415-stm32f407-417-stm32f427-437-and-stm32f429-439-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf](https://www.st.com/resource/en/reference_manual/dm00031020-stm32f405-415-stm32f407-417-stm32f427-437-and-stm32f429-439-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf)

![image.png](ARM%20(x64)/image%204.png)

![image.png](ARM%20(x64)/image%205.png)

**HAL**: Hardware abstraction layer.

The *main.c* file is the
