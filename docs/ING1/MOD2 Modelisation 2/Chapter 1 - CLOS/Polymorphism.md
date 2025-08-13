---
Owner: Matcha
---
# Reminders
## Static Polymorphism
### Overloading → methods with the same name (intraclass)
- Types → no sense in a dynamic language
- Number of arguments → too ambiguous or too complex
- Replace by a richer call semantic
### Hiding → subclass methods with the same name as in super class (interclass)
- Hide previous definition
- Makes no sense since in CLOS, since it comes from the fact that methods are inside of classes
## Dynamic Polymorphism
### Overriding (see below)
- Generic functions
- Methods
  
# Generic functions and Methods
## Generic Functions
```Lisp
(defgeneric translate (object x &optional y))
```
- `defgeneric` is a macro : functional definition
- Life cycle of a 1rst class value : can be created and destroyed at runtime  
    It is a meta-object → instance of a class ==(usually standard-generic-function)==
- Dynamic Typing : don’t specify the type
- Usually only the interface $\neq$ function standard
- Optional declaration: if you don’t define the generic function it will be automatically created (not recommended)
- Accessors are generic functions
- Behavior identical to standard function: same call syntax, function-cell, anonymous ect
  
## Methods
```Lisp
(defmethod translate ((circle circle) x &optional (y,0))
	(translate (center circle) x y))
```
  
  
# Relationship (sub)Classes / (sub)Types