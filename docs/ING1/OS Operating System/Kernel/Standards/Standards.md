---
title: Standards
Owner: "Florian "
---
# API
**API:** Application **Programming** Interface
**Example:** The C standard libraries such as _stdio stdlib_…

> [!important] **Definition:**
> 
> Specifications needed for programming, source code based
- API defines how software components (usually in the form of functions, classes, or methods) interact with each other.
- It specifies the set of rules and protocols that allow different software components to communicate and work together.
- APIs are typically used by developers when writing code, as they define the available functions, parameters, and data structures that developers can use to build applications.
- API is more about the high-level programming interface and is often of interest to application developers.
# ABI
**ABI:** : Application **Binary** Interface
**Example:** Convention of putting the saved registers on the stack before calling a function in assembly

> [!important] **Definition:**
> 
> Specifications of calling conventions and file formats, binary based
- ABI deals with the low-level details of how compiled code (binaries) communicates with the system and other libraries.
- It defines the calling conventions, data representation, and binary structure used by the compiled code.
- ABI is essential for linking and running compiled programs and ensuring compatibility between different parts of a program, system libraries, and the operating system.
- It is more focused on binary compatibility and is often of interest to compiler developers, system programmers, and hardware architects.
In simpler terms, the **ABI** is about how **compiled code** talks to other compiled code and the operating system, while the API is about how developers write **code** to interact with **libraries** or services. The **ABI** is for **binary compatibility**, while the **API** is for **programming and development convenience**.
# POSIX
POSIX stands for "**Portable Operating System Interface for Unix**." It is a set of standardized operating system interfaces and functions that define how Unix-like operating systems should behave. POSIX is not an operating system itself but a specification or standard that helps ensure compatibility and portability between various Unix and Unix-like operating systems.
Those elements are part of the POSIX
- C API
- Command Line Interface utilities
- Shell language
- Environment variables
- Program exit status
- Expressions
- Structure
- Filenames

> [!important] Family of standards for maintaining compatibility between OSs
# ELF
- executable and linkable format
### Uses:
- executables
- shared libraries
- object files
- (dumps and etc)

> #!/path/to/interpreter at the first line of text files and tells the kernel/shell what interpreter to use to run as script
- very common for executable files
- Similar for object files and shared libraries
- Not portable across different ABI and CPU architecture, etc.
- Widely used on Linux, OpenBSD, Solaris, Android, …
  
## Header Format
![[Untitled 139.png|Untitled 139.png]]
  
- **ELF header** = “magic number” (shebang) + format configurations
- File data
    - Program header table
    - Section header table
    - Data
## Segments and Sections
- segments and sections are fundamental concepts that describe how the data in the file is organized and loaded into memory.
- represent data from the elf file
- point to absolute addresses and specify how many bytes there are
- they often overlap
![[Untitled 1 93.png|Untitled 1 93.png]]
  
  
  
![[Untitled 2 68.png|Untitled 2 68.png]]
![[Untitled 3 51.png|Untitled 3 51.png]]
[https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png](https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png)