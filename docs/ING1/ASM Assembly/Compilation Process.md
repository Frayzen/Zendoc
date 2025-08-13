---
Owner: Tim Pearson
---
## Preprocessing
==gcc -E source_file.c -o output_file.i==
- Expands macros and handles preprocessor directives (e.g., `**#include**`, `**#define**`).
- Generates an intermediate file with the expanded source code.
- The preprocessor reads the source code and performs macro replacements and file inclusions.
- The output is a preprocessed file (with a `**.i**` extension) containing the expanded source code.
## Compilation
==gcc -S output_file.i -o output_file.s==
- Translates the preprocessed code (in C) to assembly code.
- Generates a file with assembly instructions.
- The compiler takes the preprocessed file and produces an assembly file (with a `**.s**` extension).
- Each line in the assembly file corresponds to a low-level operation in the program.
  
## Assembly
==as output_file.s -o output_file.o==
- Translates the assembly code to machine code (object file).
- Generates a binary file containing machine code instructions.
- The assembler reads the assembly file and generates an object file (with a `**.o**` extension).
- The object file contains machine code instructions along with information about the program's data and code sections.
## Linking
==gcc output_file1.o output_file2.o -o executable==
- Combines multiple object files into an executable.
- Resolves references between different parts of the program.
- Links with external libraries if necessary.
- The linker takes one or more object files and produces an executable file.
- It resolves symbols (variables and functions) by connecting references in different object files.
- If the program uses external libraries, the linker links with those libraries to complete the executable.