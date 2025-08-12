---
title: "Overloading"
---
Last edited time: June 24, 2024 8:31 AM

<aside>
📌 Not the same as aliasing

</aside>

### Overloading: Homonyms

Several entities bearing the same name, but statically distinguishable, e.g., by their arity,
type etc.

### Aliasing: Synonyms

One entity bearing several names.

```fsharp
// foo is overloaded
int foo(int);
int foo(float);

// x and y are aliases
int x;
int& y = x;
```

The overloading is gonna happen when we have multiple declaration with the same identifier 

ex : + in C for integer and floats

$\Longrightarrow$  The binder is gonna see the overloading as a for of **syntactic sugar**

### Overloaded

```c
void foo(int);
void foo(char);
void foo(const char*);
void foo(std::string);
int main ()
{
foo(0);
foo('0');
foo("0");
foo(std::string("0"));
}
```

### Un-overloaded

```c
void foo_int(int);
void foo_char(char);
void foo_char_p(const char*);
void foo_std_string(std::string);
int main ()
{
foo_int(0);
foo_char('0');
foo_char_p("0");
foo_std_string(std::string("0"));
}
```

### This process is called mangling or renaming

in g++ this is what is gonna happen

```cpp
_Z1fi -> int f(int);
_Z1fPc -> int f(char*);
```

<aside>
🚨 The problem here is that here is no convention for renaming so we have no way of knowing how g++ renamed our declaration

</aside>

# In Tiger

### Ordering

<, <=, >, and >= for pairs of integers, or strings.

### Identity

= and <> for (type coherent) pairs of integers, strings, arrays or records.
