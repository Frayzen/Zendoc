---
title: TOOL C Compilation process
Owner: "Florian "
---
### a. Pre-Processing
Pre-processing is the first step in the compilation process in C performed using the _pre-processor tool_ (A pre-written program invoked by the system during the compilation). All the statements starting with the \# symbol in a C program are processed by the pre-processor, and it converts our program file into an intermediate file with no # statements. Under following pre-processing tasks are performed :
### i. Comments Removal
Comments in a C Program are used to give a general idea about a particular statement or part of code actually, comments are the part of code that is removed during the compilation process by the pre-processor as they are not of particular use for the machine. The comments in the below program will be removed from the program when the pre-processing phase completes.
```C
/* This is a
 multi-line comment in C */
\#include<stdio.h>
int main()
{
// this is a single-line comment in C
    return 0;
}
```
### ii. Macros Expansion
Macros are some constant values or expressions defined using the **\#define** directives in C Language. A macro call leads to the macro expansion. The pre-processor creates an intermediate file where some pre-written assembly level instructions replace the defined expressions or constants (basically matching tokens). To differentiate between the original instructions and the assembly instructions resulting from the macros expansion, a '+' sign is added to every macros expanded statement.
**Macros Examples:**
**Defining a value**
```C
\#define G 9.8
```
**Defining an expression**
```C
\#define SUM(a,b) (a + b)
```
### iii. File inclusion
File inclusion in C language is the addition of another _file_ containing some pre-written code into our C Program during the pre-processing. It is done using the **\#include** directive. File inclusion during pre-processing causes the entire content of **filename** to be added to the source code, replacing the **#include<filename>** directive, creating a new intermediate file.
**Example:** If we have to use basic input/output functions like printf() and scanf() in our C program, we have to include a pre-defined **standard input output header file** i.e. **stdio.h**.
```C
\#include <stdio.h>
```
### iv. Conditional Compilation
Conditional compilation is running or avoiding a block of code after checking if a **macro** is defined or not (a constant value or an expression defined using \#define). The preprocessor replaces all the conditional compilation directives with some pre-defined assembly code and passes a newly expanded file to the compiler. Conditional compilation can be performed using commands like \#ifdef, \#endif, #ifndef, #if, #else and #elif in a C Program. Example :
- Printing the AGE macro, if AGE macro is defined, else printing Not Defined and ending the conditional compilation block with an \#endif directive.
```C
\#include <stdio.h>
// if we uncomment the below line, then the program will print AGE in the output.// \#define AGE 18
int main()
{
// if `AGE` is defined then print the `AGE` else print "Not Defined"
	\#ifdef AGE
		printf("Age is %d", AGE);
	\#else
		printf("Not Defined");
	\#endif
	return 0;
}

```
**OUTPUT:**
```C
Not Defined
```
You can run and check your code [here](https://www.interviewbit.com/snippet/9bce8a60fb429240bacd/). (IDE by InterviewBit)
**Explanation:**
\#ifdef directive checks if the macro AGE is defined or not, and as we have commented the \#define statement the #ifdef AGE block of code will not execute and control flow will move to the \#else block and Not Defined will be printed on the output screen, #endif ensures that the conditional compilation block ends there.
Now let's see the below figure that shows how a pre-processor converts our source code file into an intermediate file. **Intermediate file** has an extension of .i, and it is the expanded form of our C program containing all the content of header files, macros expansion, and conditional compilation.
[![](https://scaler.com/topics/images/preprocessing-start-sample.webp)](https://scaler.com/topics/images/preprocessing-start-sample.webp)
### b. Compiling
Compiling phase in C uses an inbuilt _compiler software_ to convert the intermediate (.i) file into an **Assembly file** (.s) having assembly level instructions (low-level code). To boost the performance of the program [C compiler](https://www.scaler.com/topics/c/online-c-compiler/) translates the intermediate file to make an assembly file.
Assembly code is a simple English-type language used to write low-level instructions (in micro-controller programs, we use assembly language). The whole program code is parsed (syntax analysis) by the compiler software in one go, and it tells us about any **syntax errors** or **warnings** present in the source code through the terminal window.
The below image shows an example of how the compiling phase works.
[![](https://scaler.com/topics/images/compiler-start-samplee.webp)](https://scaler.com/topics/images/compiler-start-samplee.webp)
### c. Assembling
Assembly level code (.s file) is converted into a machine-understandable code (in binary/hexadecimal form) using an _assembler_. Assembler is a pre-written program that translates assembly code into machine code. It takes basic instructions from an assembly code file and converts them into binary/hexadecimal code specific to the machine type known as the object code.
The file generated has the same name as the assembly file and is known as an **object file** with an extension of **.obj** in DOS and **.o** in UNIX OS.
The below image shows an example of how the assembly phase works. An assembly file area.s is translated to an object file area.o having the same name but a different extension.
[![](https://scaler.com/topics/images/assembler-start-sample.webp)](https://scaler.com/topics/images/assembler-start-sample.webp)
### d. Linking
Linking is a process of including the library files into our program. _Library Files_ are some predefined files that contain the definition of the functions in the machine language and these files have an extension of .lib. Some unknown statements are written in the object (.o/.obj) file that our operating system can't understand. You can understand this as a book having some words that you don't know, and you will use a dictionary to find the meaning of those words. Similarly, we use _Library Files_ to give meaning to some unknown statements from our object file. The linking process generates an **executable file** with an extension of **.exe** in DOS and **.out** in UNIX OS.
The below image shows an example of how the linking phase works, and we have an object file having machine-level code, it is passed through the linker which links the library files with the object file to generate an executable file.
[![](https://scaler.com/topics/images/linker-start-sample.webp)](https://scaler.com/topics/images/linker-start-sample.webp)
## Example
### C program to display Hello World! on the output screen.
```C
// Simple Hello World program in C
\#include<stdio.h>
int main()
{
// printf() is a output function which prints// the passed string in the output console
    printf("Hello World!");
    return 0;
}
```
**OUTPUT:**
```C
Hello World!
```
You can run and check this program [here](https://www.interviewbit.com/snippet/6de5da72090002503453/). (IDE by InterviewBit)
**Note:**
This tiny Hello World! program has to go through several steps of the compilation process to give us the output on the screen.
**Explanation:**
- To compile the above code, use this command in the terminal : gcc hello.c -o hello
- First, the pre-processing of our C Program begins, comments are removed from the program, as there are no macros directives in this program so macro expansion doesn't happen, also we have included a stdio.h header file and during pre-processing, declarations of standard input/output functions like printf(), scanf() etc. is added in our C Program. During the compilation phase of our program, all the statements are converted into assembly-level instructions using the compiler software.
- Assembly level instructions for the above program (hello.s file) :
```C
	.file	"hello.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Hello World!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
```
- You can get the above hello.s file using the command: g++ -S hello.c in the terminal.
- hello.s file is converted into binary code using the assembler program and generates an object file hello.obj in DOS and hello.o in UNIX OS.
- Now, the linker adds required definitions into the object file using the library files and generates an executable file hello.exe in DOS and hello.out in UNIX OS.
- When we run hello.exe/hello.out, we get a Hello World! output on the screen.
## Flow Diagram of the Program
Let us look at the flow diagram of a program in the compilation process in C :
[![](https://scaler.com/topics/images/Compilation-Flow-Diagram.webp)](https://scaler.com/topics/images/Compilation-Flow-Diagram.webp)
- We have a C Program file with an extension of .c i.e. hello.c file.
- **Step 1** is **preprocessing of header files**, all the statements starting with \# (hash symbol) and comments are replaced/removed during the pre-processing with the help of a pre-processor. It generates an intermediate file with .i file extension i.e. a hello.i file.
- **Step 2** is a compilation of hello.i file. Compiler software translates the hello.i file to hello.s with assembly level instructions (low-level code).
- **Step 3**, assembly-level code instructions are converted into machine-understandable code (binary/hexadecimal form) by the assembler. The file generated is known as the object file with an extension of .obj/.o i.e. hello.obj/hello.o file.
- **Step 4**, _Linker_ is used to link the library files with the object file to define the unknown statements. It generates an executable file with .exe/.out extension i.e. a hello.exe/hello.out file.
- Next, we can run the hello.exe/hello.out executable file to get the desired output on our output window, i.e., Hello World!.
## Conclusion
- Compilation process in C is also known as the process of converting Human Understandable Code (_C Program_) into a Machine Understandable Code (_Binary Code_))
- Compilation process in C involves four steps: pre-processing, compiling, assembling, and linking.
- The preprocessor tool helps in comments removal, macros expansion, file inclusion, and conditional compilation. These commands are executed in the first step of the compilation process. Compiler software helps boost the program's performance and translates the intermediate file to an assembly file.
- Assembler helps convert the assembly file into an object file containing machine-level code.
- Linker is used for linking the library file with the object file. It is the final step in compilation to generate an executable file.