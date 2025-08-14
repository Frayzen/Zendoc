---
title: Compiler Construction
Owner: Tim Pearson
---
### repdnT(ombstone) -Diagrams
![[Untitled 82.png|Untitled 82.png]]

- T-diagrams are an efficient way to describe a compiler
![[Untitled 1 57.png|Untitled 1 57.png]]

![[Untitled 2 42.png|Untitled 2 42.png]]

  
  
  
![[Untitled 3 33.png|Untitled 3 33.png]]

  
- Front End (Analysis of the input language)
    - handle everything related to the source code
    - read file, build syntactically correct sentences, get rid of useless info (comments..)
    - lexical analysis → separate words
    - Syntactic analysis → check validity of the order of the words
    - Static semantic analysis:
        - type checking
        - context sensitive check
  
- Back end (Synthesis of the output)
    - output machine code
    - will handle everything that is implementation dependent on the machine that you will execute the program
    - depends on the processor
    - instruction selection
    - Register allocation
    - Assembly specific optimizations
        - SIMD
        - caches
  
- Middle End (Generic synthesis and optimizations)
    - doesn't depend that doesn't fit in the back or front
    - validity checks
    - generic and does not depend on the machine
    - Stepwise refinement of the intermediate representation
    - Generic optimizations
  
## Classical Architecture: a long pipe
![[oie_HztEIZNO1wbg.png]]

- anonizatoin = simplification
- back tracking in the red part
### Scanner
- Breaks the source file into individual words called tokens
- chars ⇒ tokens
### Parser
- Analyze the phrase structure of the program
- token ⇒ AST
  
  
![[Untitled 4 26.png|Untitled 4 26.png]]

![[Untitled 5 19.png|Untitled 5 19.png]]

## Wide compilers vs narrow compilers
- A narrow compiler is a compiler that only read a few chars from the input, typically one line or one function.
- A wide compiler is a compiler that works on the whole source file.
- mainly we no just work with wide compilers
## Wide Compiler
- broad compatibility and support across various architectures, platforms, and programming languages
- prioritize portability and versatility over optimization for specific hardware architectures or performance enhancements
- used in environments where flexibility and compatibility are crucial, such as in cross-platform development
- Examples:
    - GCC (GNU Compiler Collection)
    - LLVM (Low-Level Virtual Machine)
## Narrow Compilers
- designed with a specific focus, such as optimizing code for a particular hardware architecture
- often sacrifice broad compatibility for specialized optimizations, extract the best performance for a specific target platform
- user when performance is critical
- Exmples:
    - Intel's ICC (Intel C++ Compiler) optimized for Intel architectures
    - NVIDIA's NVCC (NVIDIA CUDA Compiler) optimized for GPU computing