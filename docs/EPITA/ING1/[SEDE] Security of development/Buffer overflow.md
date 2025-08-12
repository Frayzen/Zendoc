---
title: "Buffer overflow"
---
Last edited time: April 14, 2024 8:12 PM

# gets

```bash
#include <stdio.h>

void f(0
{
	char s[70];
	gets(s);
}

int main()
{
	f();
}
```

In C, if we only provide a pointer to a function, it has **NO IDEA** about how much memory is allocated over there.

The function **gets** has a buffer overflow vulnerability. It will allow the user to write more content that the maximum allocated memory pointed. This is an issue that **cannot be fixed**.

This function is marked as deprecated and should never be used because of that.

<aside>
💡 The function has been removed from C in 2020. It is one of the really few functions that has been removed.

</aside>

## Solution

- One possible alternative would be **fgets**.
    
    fgets is not perfect, it ends the string by the *null character* and would truncate the input if this one is too long. But the advantage is that fgets can take a static pointer.
    
- Another alternative is **getline**.
    
    The issue here is that getline forces you to use the team *malloc, realloc, free…* In some project, it is not an option. On the other hand, it is robust to most inputs.
    
- But the best alternative depends on the usage and requirements. It needs to find a good balance between efficiency and memory allocation.

# Canary

In programming, a "canary" typically refers to a security mechanism used to detect buffer overflows in a program's stack.

Here's how it works:

1. **Initialization**: When a program starts, a unique value (the "canary") is placed between the local variables and the control data (like the return address) in the stack frame of a function.
2. **Checking**: Before a function returns, it checks if the canary value has been modified. If it has, it indicates that the stack has been corrupted, likely due to a buffer overflow or similar exploit.
3. **Protection**: If the canary check fails, the program can respond in various ways, such as terminating execution, logging the incident, or taking other security measures.

Canary values are chosen to be distinct and easily recognizable if tampered with. This technique is widely used in modern software development to mitigate the risk of buffer overflow attacks, which can be used by malicious actors to execute arbitrary code or gain unauthorized access to a system.

# Overflows, the return (integer overflow)

```c
int *
alloc_array(int n)
{
	int *t = emalloc(n*sizeof(int))
	return t;
}
int *
read_array()
{
	int s = 0;
	scanf("%d", &s);
	if (s == 0)
		exit(1);
	int *t = alloc_array(s);
	for (int i = 0; i != s; i++)
		scanf("%d", &t[i]);
	return t
}
```

- The non signed arithmetic also called modular arithmetic is fully defined in C.
- It converts the smallest type (in term of memory taken) to the largest one and multiply them.
- The cast of n * sizeof(int) truncate the larger value given by the multiplication.

Therefore, n * sizeof(int) can overflow and the rest of the program might think that the allocated memory is larger than the real one. The user can therefore access memory he should not be able to.

## Solution

<aside>
🚨 Do not mix unsigned and signed values in arithmetic because there is a lot of overflows and cast that need to be handled.

</aside>

- In this context, calloc is more suited because it checks for the values and returns NULL if that overflows.
- If you have 3 table to allocate, use 3 callocs. Do **NOT** merge them under one allocation (to save time ?) because it leads to multiplication and possibly overflow.
