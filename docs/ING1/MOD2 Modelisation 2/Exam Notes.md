---
Owner: Matcha
---
# CLOS = Common Lisp Object System
  
### Predecessors
Flavors & Common Loops
### Polymorphism forms
Generics due to dynamic typing
The rewriting
### **Characteristics of Classes**
- Is a value of a certain type
- Corresponds to a data type
### No Universal destructor
(automatic memory gestion)
  
### Number of layer = 3
### `make-instance` is on the 2nd layer
### `defgeneric` is on the 1rst layer
  
  
### Attributes of the classic approach
class attributes (static)
### Characteristics of classic methods in CLOS
We never execute it directly
Method are not a part of classes
We can specialize on multiple arguments (multi-methods)
### How its slot access mechanism is different
There is no particular syntax to access a slot, but a centralized function that works on all classes and slots
### How do class attributes differ from the classical approach
The notion of class methods doesn’t exist (only accessing class attributes)
There is not mechanism to access it through a class and not an instance
### How is the instantiation mechanism different from classic systems
There’s no constructor but an instantiation centralized function
### Lipsian Mechanism replacing the classical languages overloading
A more expressive function call semantic
  
  
### What is an `initform`
An expression for which its value is used to initialized a slot by default
### What is `call-next-method`
If it exists, it calls the next method in the order of applicable methods
### What is a `reader`
A generic function to access a slot in read mode
### What is a `writer`
A generic function to access a slot in write mode
### Why is `slot-value` considered low level
Its necessary to know the name of the slot to access it, we lack abstraction
### What is the `:allocation` option of a slot
Option specifying if a slot is local to an instance or shared by all instance of the class
  
  
### What happens if we define a method when its corresponding generic function doesn’t exist
The generic function is automatically created
### If a user class doesn’t specify a super-class
It still inherits t
It inherits the same `standard-object`
- But
    
    Isn’t at the root of its hierarchy
    
    Doesn’t inherits of `standard-class`
    
### ==Native type in Lisp correspond to classes but can’t be instantiated==
### What is a multi-method
A method specialized on multiple arguments
### What happens when an inheritance tree defines multiple slots of the same name
They are merged in a single slot
### What is the difference between classic and generic functions
Generic functions are poly-morph
Generic functions can exist without an implementation
### MOP = Meta-Object Protocol
### How to create a default method
Just don't specialize the arguments
### Why does a regular function, applied to objects, already provide a form of genericity?
Because of dynamic typing.
Because CLOS methods are external to classes.
### For any class 'foo', what is the function 'make-foo'?
An auxiliary function usually written to facilitate the instantiation of the 'foo' class.