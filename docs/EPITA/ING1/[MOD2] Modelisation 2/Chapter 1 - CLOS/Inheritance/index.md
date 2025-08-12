---
title: "Inheritance"
---
Last edited time: April 14, 2024 11:54 PM

# Reminders

## Aggregation

### Simple

relationship “ensemble / parts”

eex : football team is an aggregation of football players but each one has a life outside the teamx : football team is an aggregation of football players but each one has a life outside the team

### Composition / composite aggregation

Stringer aggregation

Parts of the ensemble don’t have a life outside the ensemble

If an ensemble is destroyed so are all its part

ex : ensemble body, parts : arm, leg, foot… They don’t exist outside

## Inheritance

Represent an implicit notion of inclusion → include what's above in what’s down

ex : an employee doesn’t include a human, they are a human but also more than that (an employee)

# Inheritance in CLOS

```lisp
(defclass employee (human)
	((company :initarg :company :reader company)
	 (salary :initarg :salary :accessor salary)
	 (hiring-year :initarg :hiring-year)))
```

You can give a list of superclass in a specific order from left to right

## Characteristics

### Implicit hierarchy

Unique class hierarchy : `user-class` → … → `standard-object` → `t`

`standard-object` : superclass of all object instantiated by the user

It has no slots (equivalent to the Object class in Java)

- example
    
    If you create an object of type human it will be an object of type standard-object
    If you create an employee it will also be a human and a standard-object
    

<aside>
💡 Don’t mix up `standard-object` and `standard-class`
`standard-class` : superclass of all classes that you define by `defclass`

</aside>

### Slots hierarchy

No ambiguity when **multiple** slots have the same name

A slot is unique → the multiple definitions are concatenated → they’re all merged

### Options hierarchy

The modality are different between options (*initargs, reader etc…*)

### Methods hierarchy

If a method can be used on a certain class → can be used on all subclasses of this class

Because subclass <=> subtype

## Instantiation with inheritance

```lisp
(defun make-employee (name size company salary hiring-year 
											&rest keys &keys birth-year)
	(let ((employee (apply #'make-instance 'employee
													:name name :size size
													:company company :salary salary
													:hiring-year hiring-year
													keys)))
		(incf (slot-value employee 'population))
		employee))
```

Only one entry point : `make-instance`

No chain constructor(*no call to human constructor since… there is no constructor*). All arguments need to be specified.

# Problems

## Persistent from classic approach

Don’t mix up inheritance and instantiation (”is a”)

- example
    
    alex:Employee → Employee → Human
    
    alex “is a” Employee : its an instance of the class Employee
    
    an Employee “is a” Human : all Employee object are a Human object
    

Ambivalence of inheritance : inheritance of static attributes and behavior → all method applicable to a superclass is still applicable to a child class → **inherit interface & implementation**

Equivalence between subclassing and subtyping

## Alternative

### Inheritance by restriction / differential programming

Subclassing to restrain the capacity of subclasses (square is a rectangle where length = width)

We can resolve that (trust: no explanation on this course but true)

### Multiple inheritance / diamond

When a class inherits of 2 superclass that inherit of a unique superclass (platypus: mammal & oviparous)

⇒ merge the definition
