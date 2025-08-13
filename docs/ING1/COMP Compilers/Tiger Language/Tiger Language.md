---
title: Tiger Language
Owner: Tim Pearson
---
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
```Assembly
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
```Assembly
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
```Assembly
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
```Assembly
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
```Assembly
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
![[Untitled 93.png|Untitled 93.png]]
![[Untitled 1 64.png|Untitled 1 64.png]]
![[Untitled 2 46.png|Untitled 2 46.png]]