---
Owner: "Florian "
---
# System calls
In computing, a **system call** is the programmatic way in which a computer program requests a service from the kernel of the operating system it is executed on. This may include hardware-related services (for example, accessing a hard disk drive), creation and execution of new processes, and communication with integral kernel services such as process scheduling. System calls provide an essential interface between a process and the operating system.
---
They can be seen as the endpoints of the kernel API
• User processes call them to interact with the kernel  
• Kernel checks parameters validity  
• Kernel performs restricted actions for the user process  
• Eventually, kernel returns to user mode
# Interrupts
Interrupts are like "Hey, listen to me!" signals that your computer hardware or software sends to the central control unit (CPU). They say, "_Pause what you're doing, something important needs attention_." The CPU stops its current task, handles the important thing, and then goes back to what it was doing. It's a way for the computer to manage multiple tasks and respond quickly to important events.
---
Software interrupts and hardware interrupts are like two types of phone calls your computer gets:
## Software Interrupts
A **software interrupt** is caused either by an exceptional condition in the processor itself, or a special instruction in the instruction set which causes an interrupt when it is executed. The former is often called a trap or exception and is used for errors or events occurring during program execution that are exceptional enough that they cannot be handled within the program itself. For example, a divide-by-zero exception will be thrown if the processor's arithmetic logic unit is commanded to divide a number by zero as this instruction is in error and impossible. The operating system will catch this exception, and can choose to abort the instruction. Software interrupt instructions can also function similarly to subroutine calls and be used for a variety of purposes, such as to request services from device drivers, like interrupts sent to and from a disk controller to request reading or writing of data to and from the disk.
## Hardware Interrupts
This is like when an external device (like a keyboard or a mouse) makes a call to the computer's control center because something important just happened. For example, when you press a key on your keyboard, it sends a hardware interrupt to get the CPU's attention. The CPU pauses what it's doing, handles the keyboard input, and then goes back to its task.
## Interrupt Handler
An interrupt handler is like a "problem solver" in your computer. When something important happens, like a key press or data arriving from a device, the computer interrupts what it's doing and says, "Hey, interrupt handler, please deal with this!" The interrupt handler then takes care of the issue, like reading the keypress or processing the incoming data. Once it's done, the computer goes back to its regular tasks.
![[Untitled 137.png|Untitled 137.png]]
Interrupt handlers are typically part of the operating system **kernel**. The kernel is responsible for managing hardware and system-level tasks, and it includes a set of interrupt handlers to respond to various hardware and software events. When an interrupt occurs, the CPU transfers control to the appropriate interrupt handler in the kernel, which then manages the specific event or condition that triggered the interrupt. This is an essential part of how the operating system interacts with hardware and manages system resources.
## Timer Interrupt
A timer interrupt is like a reminder for your computer. It's a little alarm that goes off at regular intervals to say, "Hey, time to check on things!" When the timer interrupt happens, your computer stops what it's doing, takes a quick look at what's going on, and then goes back to its tasks. It's a way for the computer to keep track of time and perform tasks at specific intervals, like updating the clock or running scheduled tasks.

> [!important] Timer regularly raises an interrupt (
> 
> _e.g., 250 interrupts per second_)
Timer interrupt is necessary for the OS to reclaim control from an errant/malicious user process
# Signals
Signals are like messages or notifications that one program or process sends to another to communicate or request some action. They are a way for programs to talk to each other or for the operating system to notify processes about events.
- Inter-Process Communication (IPC)
- Communication from kernel to user process

> [!important] User can define signal handler
## Examples
- SIGINT (Ctrl-C), SIGKILL, SIGQUIT (Ctrl-\),
- SIGTSTP (Ctrl-Z), SIGCONT,
- SIGSEGV, . . .