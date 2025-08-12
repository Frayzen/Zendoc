---
title: "How to code good ?"
---
Last edited time: April 10, 2024 5:08 PM

# Optimization

- Your program spend 90% of its time in 10% of the functions.
- CPUs are crazily fast. Most of the time, the issue is accessing memory.

![Untitled](How%20to%20code%20good/Untitled.png)

![Untitled](How%20to%20code%20good/Untitled%201.png)

<aside>
🧠 The Low-hanging fruit is the easiest to get. It means that there is easy-to-apply habits that makes your code better really easily.

</aside>

- Do not try to optimize other’s code

## Profiler

A profiler is an option of the compiler that add some metadata specifying where, when, and how many times parts of the code have been executed. It leads to a “profile” that represent a very complete representation of your program resources’ consumption.

It often generate a **flame graph**:

![Untitled](How%20to%20code%20good/Untitled%202.png)

<aside>
🧠 It is really likely that your idea about your own code is completely wrong about performances and results.

</aside>

# Compilers help

<aside>
🧠 **Read** the error messages of your compiler

</aside>

- Always be able to explain the Warnings of your compiler
- Be able to use fsanitize, valgrind…

## Example

```c
#include <stdio.h>
#define MAXBUF 512
char *
make_filename(const char *file, const char *dir)
{
	char buffer[MAXBUF];
	snprintf(buffer, sizeof buffer, "%s/%s", file, dir);
	return buffer;
}
```

```c
1 hub$ cc -c -Wall localarray.c
2 localarray.c:8:9: warning: address of stack memory associated with local
3 variable 'buffer' returned [-Wreturn-stack-address]
4 return buffer;
5 ^~~~~~
```

- Easy to do misstake
    
    ```c
    #include <stdio.h>
    #define MAXBUF 512
    char *
    make_filename(const char *file, const char *dir)
    {
    	char *buffer = emalloc(MAXBUF);
    	snprintf(buffer, sizeof buffer, "%s/%s", file, dir);
    	return buffer;
    }
    ```
    

## Too much warnings

Initially there was only gcc that lead the whole world of compilation.

But clang went on the field and there is now two compilers on the throne.

Usually, both compilers share the same flags but not always. For example, clang decided to raise a warning for any unknown flag begin by -f or -W.

![Untitled](How%20to%20code%20good/Untitled%203.png)

<aside>
🧠 -Werror is not always useful. As precised before, you should be able to explain all of the warnings.
If you don’t have the hand on all of the code, it can’t be used.
In case of any update of the system or compiler, it can’t be used.

</aside>
