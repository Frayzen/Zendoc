---
Owner: Matcha
---
### APL = A Programming Language
### First Langauge to have an optimizing compiler = Fortran
### In BNF, B = John Backus
### Language introducing contract programming = Eiffel
### C void* are an example of genericity by boxing
### No pass-by-name mode in Ada
### C++ templates are compiled using monomorphization
### Rust macros are an example of metaprogramming
### Mode to give to pass arguments by name in Ada = in
### Eiffel supports multiple inheritance
### Go is structurally typed
### Go doesn’t nativly support concurrent programming
### In Ada you need to explicitly instantiate parameterized types before being able to use them
  
### Simula inroduced : objects, classes
### Languages influenced by Simula
SmallTalk, C++ & Objective C (not Algol)
### Language supporting the dynamic dispatch
C++, Eiffel & Go (not C)
### Language who monomorphize its generics
C++, Rust, Ada (npt OCaml)
  
## Publication Date
FORTRAN - 1956, ALGOL - 1958, COBOL - 1959, Prolog - 1972, Ada - 1983, Go - 2009
## Authors
Kay - Smalltalk, Backus - FORTRAN, Wirth - Pascal, McCarthy - Lisp, Liskov - CLU, Meyer - Eiffel, Colmerauer - Prolog, Thompson Go, Hopper - COBOL, Ichbiah - Ada
### Unix creator = Ken Thompson
### Mouse creator = Douglass Engelbart
  
  
Give the values of the variables at the end of the execution of the program depending on the argument passing mode used.
```Bash
var t : integer
	foo : array [0..1] of integer;
	
procedure shoot_my(x : Mode integer);
begin
	foo[0] := 43;
	t := 0;
	x := x + 8;
end;
begin
	foo[0] := -1;
	foo[1] := 0;
	t := 1;
	shoot_my(foo[t]);
end;
```
foo[0] = 43, foo[1] = 0, t = 0  
**Using pass-by-value-result**, à la **Algol W**  
(the l-value in which we copy the result  
value is evaluated at function return)
foo[0] = 8, foo[1] = 0, t = 0
  
**Using pass-by-value-result**, à la **Ada** (the  
l-value in which we copy the result value  
is evaluated at function call):
foo[0] = 43, foo[1] = 8, t = 0
  
**Using pass-by-reference:**  
foo[0] = 43, foo[1] = 8, t = 0
**Using pass-by-name:**  
foo[0] = 51, foo[1] = 0, t = 0
  
**Using by-pass value**
foo[0] = 43, foo[1] = 8, t = 0