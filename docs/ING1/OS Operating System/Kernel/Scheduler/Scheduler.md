---
title: Scheduler
Owner: "Florian "
---
# Scheduling

> [!important] A lot of information are present in the sched(7) section of the man page.
**Problem:** We have one core running one program at one time. But we have to share the CPU among several programs running concurrently.
Scheduling is all about keeping tasks organized and making sure everyone gets their fair share of the computer's attention.
**Scheduler** manages CPU time. It is typically a core component of the operating system kernel. It's responsible for managing and coordinating the execution of processes or threads on the CPU. The kernel's scheduler decides which process or thread to run next, based on scheduling algorithms and priority settings, in order to efficiently share the CPU among multiple tasks.

> [!important] A
> 
> **Task (or Thread)** is the name of a [[ING1/OS Operating System/Kernel/Process/Process|Process]] in the context of scheduling
## Context switching
When the control of the CPU shifts from one process to another, it's commonly referred to as a "context switch."
A context switch involves saving the state of a running process so that when the scheduler allocates CPU time to another process, the original process can later resume from where it left off without losing its progress.
Context switches are fundamental to multitasking operating systems, allowing them to efficiently share CPU time among multiple processes, giving the illusion that many processes are running simultaneously. Efficient handling of context switches is crucial for system performance, as they incur a certain amount of overhead due to the need to save and restore process states.
## Optimizations
A good scheduler is a scheduler that optimized its time and reduce the amount of context switching. Among the optimizations made by the scheduler, we can denote:
- Context switching while I/O operations: when a [[ING1/OS Operating System/Kernel/Process/Process|Process]] need to read on / write from a file, it can take quite some time and is therefore a perfect time to process to a context switch !
- Priority: we might want to run some task more than others, a priority associated to each task is therefore a good solution to make sure some task are called more often than others.
- Cache optimization: in the context of some heavy computing process, it is a good idea to give it some time to make a bunch of operation to take profit of the cache power of the CPU (see [[Paging]])
## Process state
Each [[ING1/OS Operating System/Kernel/Process/Process|Process]] has a state to let the scheduler know if it can be scheduled.

> [!important] To schedule a process means to put it on the list of the “
> 
> _runnable_” processes in order to perform a context switching and let it run.
  
![[Untitled 135.png|Untitled 135.png]]

- State New: The process has just been created and is not fully loaded in memory yet.
- State ready: The process is waiting to be run
- State running: The process is currently running
- State blocked (or waiting): The process cannot be run currently because it lacks of something (usually data)
- State Terminated: The program has finished running. (It is the state of [[ING1/OS Operating System/Kernel/Process/Process|Process]])
The kernel keeps a process table (with [task_structs](https://stackoverflow.com/questions/56531880/how-does-the-kernel-use-task-struct)). There is two queues, one for ready processes and one for blocked processes.
## When to schedule ?
- When the running process becomes blocked. During I/O for example, since the kernel is called in any way.
- When a process switch to terminated state.
- When a new process spawn (after a fork usually)
- When a blocked process becomes ready
Several scheduling algorithms exist. Choosing one depend on specific criteria and use case of the machine such as:
- CPU usage: optimizing the cores on the machine and always providing them with process to execute.
- Throughout: if we want processes to last long and reduce the context swtchings.
- Turnaround time: if we want processes to have a long lifetime or not.
- Waiting time: if we want to prevent some process from waiting to long or not (it goes along with priority)
- Response time: if we want to reduce the time between an event and its handling.
### Type of task
There is 2 types of tasks
- **Interactive:** the task that need a lot of context switching. The main goal is to spend the least time possible in ready state.
- **Real time:** the task that need the few or no context switching. The main goal is to respect deadlines.
### Algorithms
- **First come first served**: a simple queue. Easy to implement but absolutely not efficient.
    - SCHED_FIFO on linux kernel
- **Round robin:** like FCFS but each task has a fix amount of time preventing infinite process.
    - SCHED_RR on linux kernel
- **Multiple priority queue**: each task is associated with a priority and each priority has a queue. It involves a bit of scheduling between the queues but the idea is to keep the highest queues empty.
- **Completely Fair Scheduling**: Try to give the same amount of power for each task. Count with a fair clock the waiting time so that a higher priority means less time spent running but more often. Uses a [red-black tree](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree).
    - SCHED_NORMAL on linux kernel and _default scheduler mode_
## Multitasking

> [!important] CPU executes multiple processes concurrently
Multitasking leads to fast response times  
• switches occur frequently  
• processes waiting for I/O yield the CPU for other processes  
• concurrency creates impression that processes run in parallel