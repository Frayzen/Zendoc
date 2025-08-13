---
title: Process
Owner: "Florian "
---
# Definition
**Program**: This is a set of instructions or a file on your computer that doesn't do anything on its own. It's like a recipe waiting to be cooked.
**Process**: When a program is running, it becomes a process. It's like when you follow the recipe and actually make the dish in your kitchen. So, a process is an active, running program on your computer.

> [!important] **Definition:**
> 
> Program in execution**Remember:** Program is _passive_ - Process is _active_
The program itself, which is a set of instructions and data, is typically stored in non-volatile storage (like your hard drive or SSD). When you run a program, it's loaded from this storage into the computer's RAM (Random Access Memory) for execution.
# Memory Layout of a process
![[Untitled 141.png|Untitled 141.png]]
_Here, “text” represents the code_
  
# Components
1. **PID / GID:** The PID is the Process Identifier wich is unique for each process. The GID is an identifier for a group of processes.
2. **Permissions:** Each process is executed with a certain level of permission. Therefore, a process is restricted to the set of permission it has been launched with. A root access is the highest level of permission (_[[Security]]_) in UNIX systems.
3. [[Scheduler]]: a state to keep track of the “[[Scheduler]]” of the process.
4. **Program Counter**: The program counter (PC) is a special register that keeps track of the address of the next instruction to be executed in the program. It ensures that the CPU knows what to do next and helps in the sequential execution of program instructions.
5. **Data and Code in Memory**: A process contains both the program's code (instructions) and its data in the computer's RAM (memory). This includes variables, data structures, and any information the program needs to work with during its execution.
6. **Access to Files**: A process may have access to files on the computer's storage devices. In Linux, a process manages its interaction with files through the [[Long-Term Storage]] (FD) table.  
    The FD table is a list of open files and their associated file descriptors. This allows the process to read from and write to files, making it possible for the program to store or retrieve data from external storage, such as reading a text file or saving a document.
7. **Access to I/O Devices**: Processes can interact with input/output (I/O) devices like keyboards, mice, screens, printers, and network interfaces. This enables the program to send and receive data to and from these devices.  
    The FD table in Linux manages I/O operations, which encompass interactions with files, sockets, pipes, and other devices, making it a fundamental part of process I/O management.
  
# Organisation of the processes
Processes are organized as a general tree. Each process has a parent and can have several children.
A parent has the right to read the RAM of its children, kill them, and do basically anything with them. This behavior is for debugging purpose mainly.
## Once dead…
Once a process is finished executing, its memory is **not** immediately freed. The process has to be waited by its parent to release the memory held. This behavior as well is for debugging purpose in order for a parent process to be able to access the memory of the child once dead and understand its state before it died.
- **Zombie:** It is a terminated process that has completed its execution but still has an entry in the process table, waiting for its parent process to collect its exit status and release associated resources.
- **Daemon:** A daemon is a process that is the child of the [[ING1/OS Operating System/Kernel/Process/Process|Process]] and is still running. It can be seen as a process running in the background. It can be really useful when handling wifi, bluetooth, hdmi or any other external tool that needs to be constantly updated. The [[ING1/OS Operating System/Kernel/Process/Process|Process]] is the main creator of daemon of the system.
## Well-known processes
- **INIT**: The init process is the root process. It is the only one that has no parent. It is the first process launched by the kernel. Its purpose is to setup the whole system. Once this task achieved, it waits for its children to avoid the creation of an army of [[ING1/OS Operating System/Kernel/Process/Process|Process]] in the system.
- **SYSTEMD:** The systemd process is a process responsible for the startup and management of services or daemons. He also provide logging and journaling on the system as well as login checks. It is a really multitask process that most of the linux distributions use. Its ancestors were rc (_not used anymore_) and sysinit (_still used on lightweight distribs_). One of the drawback of systemd is its weight. It can be criticized for managing to much things on the system.

> [!important] What if the user tries to kill the init process ? The kernel simply panics and the whole system crashes. (Not a good idea…)
## Communication among processes
Processes can communicate using:
- Shared memory. A page (see [[Paging]]) can be shared between two processes allowing both of them to read / write into it. This memory can be really usefull to communicate but the drawback is that the processes need to care for thread-safety. It means that two different process should not write on the same memory space at the same time (doable if we consider multi-core computers) or the memory could be corrupted.
- Pipes (using _pipe(2)_ or _pipe2(2)_) returns two [[Long-Term Storage]]: one can be written on and the other can be read from.  
    The buffer used has a fixed size and is managed by the kernel.  
    Pipes can also be named and part of the [[Filesystem]] and be associated with an [[Filesystem]].

> [!important] - Pipes are unidirectional.
> 
>   
> - If the buffer overflows, the writing process will be blocking.
  
![[Untitled 1 95.png|Untitled 1 95.png]]
- Sockets (with the flag AF_UNIX flag). It can be anonymous or named, just like pipes. Sockets were originally used to communicate on the network but their behavior have been used to communicate internally between two processes as well.  
    There is several advantages with this method.
    
    - More than two processes can communicate.
    - It supports process credentials to restrain the access of the socket.
    - It is **not** unidirectional
    
    File descriptors can be passed using socket. A typical context for that is an unprivileged user asking to a privileged process to read from a specific file that is doesn’t have access on. After several checks, the privileged process can open the file and return a file descriptor with specific flags.
    
# Thread
Each process is made of of binary code. A Program Counter is a register in the CPU that keeps track of the current instruction executed.
In order to make an execution parallelized, we can create several [[Scheduler]] on a single process. It also mean several program counters executing different instructions on their own. The first thread, also called ‘main thread’ is always waiting for the other thread to finish before setting the process as [[Scheduler]].
It raises several problem.
## Race condition
Imagine you are flat-sharing and every morning, you open the fridge and check if there is some milk. If there is not you go buying a bottle of milk. Considering that, we can imagine that if you share the flat with 2 room mates that behave the same, you will end up with 3 bottles of milk if you don’t communicate about it. That is a race condition issue.

> [!important] A race issue is a result that depends on timing
In the context of C, if we consider the following code:
```C
void test(void)
{
	global int a; 
	for (a = 0; a < 1000; )
		a++; // this line
}
```
```Assembly
# translation of the line a++
mov 0x2eb3(%rip), %eax # load c in eax
add $0x1, %eax # increment
mov %eax, 0x2eb3(%rip) # store
```
And we consider 2 thread running in parallel calling this function. Since the single instruction is actually dived in 3 different instructions in assembly, a [[Scheduler]] can happen between two of these assembly instructions (especially when ran 1000 times). Since a [[Scheduler]] involves saving registers **and** the data is shared among threads on the same process, a could take successively values such as:
```Plain
0 1 2 3 4 5 3 4 5 6 7 8 9 10 8 11 12 13 14 15 16 17 18 24 25 26 27 etc...
```
## Thread-safety
Thread-safety refers to the property of a program or system where concurrent threads can execute operations on shared data structures without causing unexpected or erroneous behavior.
- **(Hardware) Atomic Operations** : CPUs can block memory bus for a few instructions
    - See [https://stackoverflow.com/questions/25319825/how-to-use-atomic-variables-in-c](https://stackoverflow.com/questions/25319825/how-to-use-atomic-variables-in-c)
- **Mutex:** Stands for mutual exclusion. Only one person can use a value. Here is the execution process.
    
    - We lock the mutex
    - We perform the critical instructions
    - We unlock the mutex
    
    Anyone else trying to lock the mutex will wait for you to unlock it first preventing him for executing critical instructions.
    
    > [!important] We call
    > 
    > **contention** the fact of trying to acquire a lock that is already locked
    
- **Spinlock:** like a mutex but does not block. a loop is made to check for the lock. it prevents the kernel to take the lead instead of a very quick wait. it should be used on tiny part of code.
- **Semaphore**: an integer shared among threads. When a thread ask for it, it is decreased. The semaphore cannot go under 0 and would be blocking if so.
    - More used in kernel
- **Monitor:** the thread takes a lock only if certain condition is satisfied.
    - Useful tool to work with FIFO
- **Futex:** like a mutex but no syscall (no context swapping) if the lock isn’t locked. Stands for fast mutex.
    
      
    
### Deadlock
A deadlock is a situation in computing where two or more processes are unable to proceed because each is waiting for the other to release a resource or complete a task, leading to a standstill where no progress can be made.
The easiest deadlock is a double lock on a single mutex in the same thread.
```C
lock(my_mutex);
lock(my_mutex); //will be stuck here
unlock(my_mutex);
unlock(my_mutex);
```