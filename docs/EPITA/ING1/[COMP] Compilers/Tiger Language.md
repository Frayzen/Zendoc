---
title: "Tiger Language"
---
Last edited time: March 8, 2024 2:53 PM

- Imperative Language: descendant of Algol and Pascal
- Functional flavor, nested functions
- Well defined: simple and sound grammar
- typed statically
- expression have a value, instructions don’t

### Core of the language

- **C-style Comments: /∗ and ∗/**
- Identifier: sequence of letters, digits and underscore starting with a letter
- Built-ins: int and string
- User defined types: Records, arrays, recursive types
- Nested scopes with function declaration
- Minimal standard library

### Example Programs

```nasm
print("Hello World!\n")
-----
let
function cdown(i: int) : int =
if i = 0 then 0
else cdown(i-1)
in
cdown(3*3+1)
end
----
let
function hello(name: string) =
print(concat("Hello", name))
in
hello("you!")
end
```

```nasm
let
type intArray = array of int
var row := intArray[8] of 0
in
print_int(row[0])
end
----------
let
type rec = { a : int }
var b :=
if 0 then nil
else rec { a = 1 }
in
print_int(b.a)
end
```

```nasm
let
var myvar := 42
in
print_int(myvar)
end
---------
let function ten(): int
=
(print(
"Once.\
n
"); 10)
in
for i := 0 to ten() do
print_int(i)
end
---------
let var useless := 0
in
for i := 1 to 10 do break
end
```

```nasm
let
import "myimport.tih"
in
1
end
------------
let
class B
{
var a := 42
method m() : int = self.a
}
var b := new B
in
b.a := 51
end
```

```nasm
let
var a := nil
in
/* ... */
end
--------
if nil = nil then /* ... */
```

- nil must be used in a context where the type can be determined

## Remarks!!

![Untitled](Tiger%20Language/Untitled.png)

![Untitled](Tiger%20Language/Untitled%201.png)

![Untitled](Tiger%20Language/Untitled%202.png)
