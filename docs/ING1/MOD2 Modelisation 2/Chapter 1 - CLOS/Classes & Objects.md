---
Owner: Matcha
---
# Class and Objects
## Classes
```Lisp
(defclass human () (name size birth-year))
```
- We use the macro `defclass` to define a class
- Dynamic cycle: class is built at runtime, as objects
- Dynamic typing
- No member method
- No abstract, final ect…
## Types
- A type is a set of classes that share common attributes
    
    > [!important] For example, let’s say we have a class
    > 
    > **Human** that owns a _name_ and a _size._ Let’s say we have a class **Dog** that owns a _name_ and a _color_.  
    > In this context, **Human and Dog** share a type that contains the attribute **name**.
    
- Dynamic cycle: class is built at runtime, as objects
- subclass <=> subtype
## Instantiation
### Allocation
```Lisp
(make-instance 'human)
```
Quote to not evaluate `human`
Functional instantiation ($\neq$ constructor)
No destructor → Lisp handle it automatically
### Initialization
```Lisp
(defclass human ()
	((name :initarg :name)
	 (size :initarg :size)
	 (birth-year :initarg :birth-year)))
	 
(make-instance 'human
	:name "Alain Terieur" :size 1.80 :birth-year 1970)
```
`initarg` allows to initialize a slot with a keyword → `:keyword` (here : name, size and birth-year)
⚠️ If not given the arguments, it will not be instantiated → ==unbound==
```Lisp
(defclass human ()
	((name :initarg :name)
	 (size :initarg :size)
	 (birth-year :initarg :birth-year :initform 1970)))
	 
(make-instance 'human
	:name "Alain Terieur" :size 1.80)
```
  
**Instantiation function**
```Lisp
(defun make-human (name size &rest keys &key birth-year)
	(apply #'make-instance 'human :name name : size size .keys))
(make-human "Alain Terieur" 1.80)
(make-human "Alain Terieur" 1.80 :birth-year 1939)
```
`make-<class>` is a convention to force to give arguments
Recommended to use keywords to optional arguments
Function call semantic $\neq$ overloading (replaces it)
  
# Range and information accessibility
  
## Range
### Local vs Shared slots
```Lisp
(defclass human ()
	((population :allocation :class :initform ())
	 (name :initarg :name)
	 (size :initarg :size)
	 (birth-year :initarg :birth-year :initform 1970))
```
- `:allocation class` is the equivalent of `static` in the lisp language
    - By default, every slot are defined as `:allocation :instance`
    - To have shared slots across all instances of a class you need to specify that the `:allocation` is of `:class` level.
- `:initform` is the default value of the attribute
- No equivalent to static methods since methods are not in class
  
## Accessibility
### General mechanism
```Lisp
(slot-value alain 'birth-year)
```
- Functional access $\neq$ syntactic
- All the defined function are common to all classes and can be used with any kind of instance as long as it has the required slots.
- There is no way to protect access to the slots (_no private or protected_)

> [!important] This structure leads to a lack of abstraction
### Accessors
```Lisp
(defclass human ()
	(name :initarg :name :reader getname :writer rename)
	(size :initarg :size :accessor size)
	(birth-year :initarg :birth-year :initform 1970 :reader birth-year))
;; Definition of an alain human
(getname alain) ;; => retrieve the name of alain
(rename "Alain Verse" alain) ;; => "Alain Verse"
(size alain) ;; => retrive the size of alain
(setf (size alain) 1.78) ;; => 1.78
(birth-year alain) ;; => retrive the birth-year of alain
(setf (birth-year alain) 1971) ;; error at runtime because no writer
```
- `:reader` and `:write` will automatically create two function to read or write the value of the slot
- `:accessor` is the two combined
    - to use it in write mode use `setf`
- Those are **generic functions** (_poly-morphs_) and can therefore take any kind of input
  
## Behavior outside classes
```Lisp
(defun hello (human)
	(format t "Hello! -A, -Am, -Ayo.~%")
		(name human)
		(size human)
		(age human))
	(values))
```
- `format` is the equivalent of printf
    - `~%` is the equivalent of `\n`
    - `(values)` is the return type of format (_equivalent to void_)
- Simple function and not a method but is still generic → dynamic typing
- Will work for every given value if we can call `name`, `size` and `age` on it (not just human instances)
- Any function is a polymorphism
  
# Classes integration / Types
## Strong class / type integration
Unique hierarchy : class root `t` mother of all classes (`class-of`)
Class / type correspondence (`typep`, `type-of`)
Native type /class correspondence : possible specification, forbidden instantiation
  
“subclassing”<=> subtyping (`subtypep`)
  
## MOP (total reflexivity : introspection / intercession)
Strong relationship between class and types
Meta-class : class of class
`standard-class` : class of user classes (mother of all created classes by user)