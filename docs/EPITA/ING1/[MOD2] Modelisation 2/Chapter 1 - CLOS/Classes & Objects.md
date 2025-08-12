---
title: "Classes & Objects"
---
Last edited time: April 14, 2024 11:43 PM

# Class and Objects

## Classes

```lisp
(defclass human () (name size birth-year))
```

- We use the macro `defclass` to define a class
- Dynamic cycle: class is built at runtime, as objects
- Dynamic typing
- No member method
- No abstract, final ect…

## Types

- A type is a set of classes that share common attributes
    
    <aside>
    👁️ For example, let’s say we have a class **Human** that owns a *name* and a *size.* Let’s say we have a class **Dog** that owns a *name* and a *color*.
    In this context, **Human and Dog** share a type that contains the attribute **name**.
    
    </aside>
    
- Dynamic cycle: class is built at runtime, as objects
- subclass <=> subtype

## Instantiation

### Allocation

```lisp
(make-instance 'human)
```

Quote to not evaluate `human` 

Functional instantiation ($\neq$ constructor)

No destructor → Lisp handle it automatically

### Initialization

```lisp
(defclass human ()
	((name :initarg :name)
	 (size :initarg :size)
	 (birth-year :initarg :birth-year)))
	 
(make-instance 'human
	:name "Alain Terieur" :size 1.80 :birth-year 1970)
```

`initarg` allows to initialize a slot with a keyword → `:keyword` (here : name, size and birth-year)

⚠️ If not given the arguments, it will not be instantiated → unbound

```lisp
(defclass human ()
	((name :initarg :name)
	 (size :initarg :size)
	 (birth-year :initarg :birth-year :initform 1970)))
	 
(make-instance 'human
	:name "Alain Terieur" :size 1.80)
```

**Instantiation function**

```lisp
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

```lisp
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

```lisp
(slot-value alain 'birth-year)
```

- Functional access $\neq$ syntactic
- All the defined function are common to all classes and can be used with any kind of instance as long as it has the required slots.
- There is no way to protect access to the slots (*no private or protected*)

<aside>
⚠️ This structure leads to a lack of abstraction

</aside>

### Accessors

```lisp
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
- Those are **generic functions** (*poly-morphs*) and can therefore take any kind of input

## Behavior outside classes

```lisp
(defun hello (human)
	(format t "Hello! -A, -Am, -Ayo.~%")
		(name human)
		(size human)
		(age human))
	(values))
```

- `format` is the equivalent of printf
    - `~%` is the equivalent of `\n`
    - `(values)` is the return type of format (*equivalent to void*)
- Simple function and not a method but is still generic → dynamic typing
- Will work for every given value if we can call `name`, `size` and `age` on it (not just human instances)
- Any function is a polymorphism

# Classes integration / Types

## Strong class / type integration

Unique hierarchy : class root `t`  mother of all classes (`class-of`)

Class / type correspondence (`typep`, `type-of`)

Native type /class correspondence : possible specification, forbidden instantiation

“subclassing”<=> subtyping (`subtypep`)

## MOP (total reflexivity : introspection / intercession)

Strong relationship between class and types

Meta-class : class of class

`standard-class` : class of user classes (mother of all created classes by user)
