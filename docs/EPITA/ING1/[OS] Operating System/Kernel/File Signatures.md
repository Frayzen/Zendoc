---
title: "File Signatures"
---
Last edited time: December 17, 2023 8:46 AM

In **windows**, the file type is determined by the extension: the last characters located after the trailing “.” at the end of the name of the file.

In **linux**, the file type is stored inside of the file directly, as a “magic number” or a “metadata”. The first bytes of the file determine how the os should interpret it.

<aside>
⚠️ Since in linux, only the first bytes matter, a *hello_world.exe* file could be executed if the sequence of bytes is correct whereas a windows file could not execute a file named *hello_world* ****even tho the sequence of bytes is valid.

</aside>

# Shebang

**Shebang** is a special character sequence that appears at the beginning of a script file, typically in Unix-like operating systems. The shebang is used to specify the interpreter that should be used to execute the script.

The shebang is represented by the characters **`#!`** followed by the path to the interpreter. For example:

```bash
#!/path/to/interpreter
```

# ELF

[https://www.youtube.com/watch?v=nC1U1LJQL8o](https://www.youtube.com/watch?v=nC1U1LJQL8o)

<aside>
💭 **Definition:** Common file format for executable files

</aside>

<aside>
⚠️ It is **not** portable across different [ABI](Standards.md) and CPU architectures...

</aside>

ELF stands for "Executable and Linkable Format." In simple terms, ELF is a file format used for programs and libraries on Unix-like operating systems. It is mainly used for **Executable**, **Shared library** and **Object files**.

It is widely used on Linux, OpenBSD, Solaris, Android…

**ELF Header:** It is the “magic number”

## Architecture of the file

### Section

Only relevant at **link time**

It is useful for the linker when it needs to “merge” several object files for example.

### Segments

Only relevant at **runtime**

It contains the information for the computer to know where to load the data in memory.

![Untitled](File%20Signatures/Untitled.png)

*A segment represent the data that needs to be load (the size might be larger since we do not store uninitialized data). A segment represent the code data as well.* 

### Details

![Untitled](File%20Signatures/Untitled%201.png)

**Program header table:** information about the location and size of program segments.

**.text:** contain the program compiled

**.rodata** contain the read only values (*eg const values)*

**.data:** initialized global and static variables

**.bss:** uninitialized read-write data (filled with 0)

…

**Section header table:** information about sections within the ELF file

<aside>
🧠 In summary, an ELF file contains:
- Program header table
- Section header table
- Data

</aside>
