---
Owner: Tim Pearson
---
[[Keywords]]
### Compiler Definition
A compiler is a program that accepts as input a program text in a certain language and produces as output a program text in another language, while preserving the meaning of that text

> [!important] Good definition if we don’t talk about abstraction
  
## Coarse-grained steps in GCC
![[Untitled 91.png|Untitled 91.png]]
Actually between 50 and 60 steps (see later)
### Processor
source code → source code (multiple file to multiple file)
- make the job of the compiler easier
- macro expansion
- ==no processioning in this course==
### Actual C Compiler
- Many challenges:
- Lexing, Parsing,
- Type checking
- Linearizing
- SSA
- Register allocation
- Optimisation
- …
  
### Assembler
- An assembler translates assembly language programs into **machine code.**
- The output of an assembler is called an object file, which contains a combination of machine instructions as well as the data required to place these instructions in memory.
- example : **==gcc -S foo.c && as foo.s -o foo.o==**
  
### Linker
- A linker is a program that links and merges various object files together in order to make an executable file.
- The major task of a linker is to search and locate referenced module/routines in a program and to determine the memory location where these codes will be loaded, making the program instruction to have absolute references.
- example : **==ld foo.o -o foo -lSystem==**
- Call other programs from a program
  
### Cross Compiler
- A cross-compiler is a compiler capable of creating executable code for a platform other than the one on which the compiler is running.
    - allows developers to target specific architectures or platforms without needing to compile on the target machine directly
- Regardless on the machine you are on
- example : **==aarch64-linux-gnu-gcc -o main main.c==**  
    **qemu-aarch64 main**
- used for embedded systems of when targeting platforms on different archis
## Bootstrapping
### Definition
The technique for producing a self-compiling compiler
- Writing the compiler in the language it is compiling
- Advantages:
    - Developers only need to know and work in one language
    - Non-trivial test of the language being compiled
    - Improvement of compiler generated code benefits both compiler and users programs
- examples of bootstrap compiler
    
      
    
    - C++ (clang)
    - C (gcc)
    - Go
    - Java (not the runtime)
    - Ada (gnat)
    - Haskell (ghc)
    - Delphi
    - Common Lisp
    - Eiffel
    - Rust
    - Ocaml
    - Zig
    - Tiger (WIP)
  
  
Interpreter = Front + Middle
Going from cpp to c is called a transpiler
  
## Back-end
- Instr. select
- Reg. Alloc
  
## Middle
- Lowering/ translate
- Option
  
## Front-End
- Lex/parse
- Semantic analysis
- Segmentation
    - Binding
    - Typing
- Code generation