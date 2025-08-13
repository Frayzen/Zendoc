---
Owner: Matcha
---
## Type in Tiger
- int
- string
- user-defined structure
- arrays
  
### Type checking
ensuring that the operands of an operator are of compatible types
### Compatible type
legal for the operator or allowed under language rules to be implicitly converted by compiler-generated code (or the interpreter) to a legal type
  
## Coercion
automatic (implicit) conversion from a type to another.
### widening convertions
from a ”smaller” type to a ”larger one”
```C
int i = 42;
float f = i;
```
### narrowing convertions
from a ”larger” type to a ”smaller one”
```C
float f = 42.0;
int i = f;
```
  
### Strong Typing
Type errors are always detected.  
The types of all operands can be determined, either at compile time or at runtime.  
run time, detection of incorrect type values in variables that can store values of more than one type
Examples: F# and ML, Ada is almost (Unchecked_Conversion), C and C++ are not
  
## Type Equivalence
Two types are equivalent if an operand of one type in an expression is substituted for one of the other type, without coercion → **strict form of type compatibility without coercion**.
### **Name type equivalence**
variables defined either in the **same declaration** or in declarations that use the **same type name**
```C
int i = 42; int j = 51;
```
### **Structural type equivalence**
variables whose types have **identical structures**  
```C
struct A { int a; int b;};
struct B { int c; int d;};
```
## Static Typing
### Statically typed language :
all or almost all type checking occurs at compilation time.==Ex : C, Java…==
  
encapsulates all possible types the expression could take
## Dynamic Typing
### Dynamically typed language
almost all checking of types is done  
as part of program execution.==Ex: Scheme==
  
class C that is used in the new C() expression that construct the object