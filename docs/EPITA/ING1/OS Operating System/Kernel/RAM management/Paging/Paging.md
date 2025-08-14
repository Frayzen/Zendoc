---
title: Paging
Owner: "Florian "
---
# Definition
Paging is like dividing a big library book into many small, equally sized pages. Each page has a unique number and contains a part of the story. When you want to read the book, you look up the page numbers in a table to find the pages you need. This makes it easier to manage and access the book's content, even if the pages are scattered around the library. In computer memory, paging helps manage and access data more efficiently, just like paging through a book helps you find the right parts of the story.
![[Untitled 172.png|Untitled 172.png]]

- We divide address space into **fixed-size pages**
- We divide physical memory into **fixed-size frames**
- The size of the **frames** and **pages** is **identical**
- The process sees **virtual address space**

> [!important] The kernel memory is
> 
> **ALWAYS** mapped, even in user mode. Switching between kernel and user mode requires kernel code and we won’t lose time to unmap it.
## FAQ.
Read the FAQ after having read the other sections in order to deeper your understanding.
- What if a process is contained is more than a frame ? What if I malloc more than a frame size ?
    
    The allocation is split in several frames and the kernel can be asked to load the frames next to each other. Therefore, it is not a problem to have an allocation of more than a single frame’s size.
    
- Where are the link between pages and frames ?
    
    Each program has a unique page table that creates the link between the pages it owns and the frames. This page table is managed by the kernel.
    
- When are the links made ?
    
    At runtime
    
- When I malloc, do I allocate a whole frame ?
    
    No ! We wouldn’t waste 4KB+ data for every single malloc call. Instead, the C library handles the allocation of new frames and the inside-frame internal fragmentation for us.  
    There exist two [[Communication Kernel - Program]] used by malloc to allocate a new frame and free it:
    
    - For mapping : _mmap(2)_
    - For un-mapping: _munmap(2)_
- If I malloc and then fork, the two page tables are pointing toward the same frames ?
    
    Yes, exactly. Fork duplicates the page directory of the parent process. **But,** it set all the associate frames’ metadata to read only. Therefore, any time we need to write data, the kernel is duplicating the frame and let you modify the newly created one.
    
- What if I need to read a file ? How are file descriptors integrated here ?
    
    You can mmap(2) the file directly into a virtual memory address. The virtual memory is way larger than the physical one. Therefore, we can virtually “load” the whole file in virtual memory without overconsuming the physical memory. It is very useful !
    
- What if we are running low on physical memory ?
    
    We use [[Paging]] in this context
    
# MMU (hardware)

> [!important] **Page Table:**
> 
> Data structure to store the mapping
All the translations are done by the **MMU** (Memory Map Unit) _since 1982._
- The MMU provides:
    - **Address translations** when you are using segmentation or paging
    - **Caching** (TLB): Let’s remember the recently accessed memory in order to not compute several times the same operation.
    - **Memory protection checks**
- The process of address translation is done in 2 steps:
    - Virtual address translated to linear address (to handle _fragmentation_)
    - Linear address to physical address
CR3 contains the physical address of the page directory for the current process, which is an essential part of the MMU's address translation process.
## Caching
TLB stands for "Translation Lookaside Buffer." It is a small, high-speed cache in a computer's central processing unit (CPU) that stores a subset of the entries from the page table.
The TLB is used to accelerate the virtual-to-physical address translation process, making memory access more efficient. When a program needs to access data, the CPU first checks the TLB to see if the translation is already available, reducing the time it takes to find the physical memory location.
Whenever a physical address is computed, the link with its virtual associated address is made in the TLB. The addresses are said being “cached”.

> [!important] * Any modification in the configuration of the pagination and the cache is invalidated.
> 
>   
> * Any write on the CR3 register invalidates the entire TLB because we are not using the same page directory / table anymore.
## Result
The MMU returns values through register including:
- **CR3:** holds the resulting address in case of successful operation
- **CR2:** holds the address of the failed memory access if anything has gone wrong

> [!important] A
> 
> **page fault** is an **interrupt** for illegal memory access. The register **CR2** hold the address of the failed memory access.
# Page table
Each program has its own page table, which serves as a bridge connecting the program's virtual addresses to the physical locations in the computer's memory. It's like a personal address book for every program, helping them efficiently locate their data in memory, even if the data isn't stored in the same order in memory as it is in the program. This dedicated page table ensures that each program can access its data without interference from others.

> [!important] All structures are aligned on page size (4KiB = 2^12B)
  

> [!important] The page table also allow several
> 
> [[EPITA/ING1/OS Operating System/Kernel/Process/Process|Process]] to share memory since two process can access a same page after a fork.
### Examples
### Simple (1 level of pagination)
![[Untitled 1 117.png|Untitled 1 117.png]]

- **p** is the page number
- **d** is the page offset
- **f** is the frame
We split logical address in two parts
![[Untitled 2 83.png|Untitled 2 83.png]]


> [!important] For
> 
> **small** frames, the page table become **huge**
  
### Hard (2 level of pagination)
![[Untitled 3 60.png|Untitled 3 60.png]]

The address is divide in 3: **p1 p2 and d**
- p1 represents the page directory  
    (10 bytes = 1KB)
- p2 represents the page table  
    (10 bytes = 1KB)
- d represents the offset  
    (12 bytes = 4KB)

> [!important] We can also omit p2. In that case, the offset is extended to 22 bytes and the page is of size 4MB (instead of 4KB)
- The structures page directory and page table (contained in the virtual address) are used to configure the MMU to read the data
- The OS is managing the page table directory and tables
- The OS is placing setting the register **CR3** to the physical address of the given virtual address
### Impossible (4-level)
At that point, it’s most likely to not be asked in the test.
We uses 48 bit addresses and 4 level paging scheme.
## Zero Page
When using mmap, we expect to have zero-filled pages. In reality, there exists some zero page filled with zero in the RAM in read only access.
- mmap(2) returns read-only pages mapping to the zero page
- On write access:
    - Page fault is emitted
    - Kernel checks vm area and maps a new physical frame

> [!important] In that way, calloc is much faster (100 times faster for a GB) that malloc + memset
## Page swapping
If the system is low on RAM, it can swap out frames to a **backing store**.
- Pages are marked as invalid in the metadata of the page table (lower 12 bits of addresses)
- Mark virtual memory area as swapped out
- Unmap frames from physical memory
- Copy frames to backing store

> [!important] A
> 
> **backing store** is a fiile or disk partition in [[RAM management]]

Historically, swapping moved entire processes to the backing store. Modern swapping of pages is also called paging.
The swapping back is applied when a [[Paging]] is raised.
![[Untitled 4 42.png|Untitled 4 42.png]]

1. Invalid page is accessed
2. [[Paging]] occurs
3. Kernel searches frame data
4. Frame is loaded to memory
5. Page table is updated
6. Instruction is restarted

> [!important] You can run
> 
> **htop** or **top** in terminal to see the amount of memory asked to your kernel (_VIRT_) and the amount actually mapped (_RESI_) by each process
  
# Metadata
We use the lower 12 bits of page directory / table entries to store metadata. It might contain:
- Is the page loaded ? Is the page valid ?
- Is the page executable ? readable ? writable ?
- Is it a kernel page ? A user page ? (_[[Security]]_)

> [!important] Virtual address space can be larger than physical address space
> 
>   
> ⇒ many entries will be marked invalid