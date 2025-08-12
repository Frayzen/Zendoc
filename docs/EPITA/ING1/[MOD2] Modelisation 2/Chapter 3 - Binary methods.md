---
title: "Chapter 3 - Binary methods"
---
Last edited time: April 14, 2024 9:30 PM

<aside>
🧠 The binary methods leads to less protection. But more freedom. It means that we need to create ourselves the security checks for user input etc…

</aside>

# What is it

- Binary operators are arithmetic operators such as +, =, <…
- In the context of OO, it is applied to 2 object of the same type. We are taking advantage of the polimorphism here.
- In the traditionally approach of OOP, it can’t really be applied because of the relation class / type in an inheritance context.
- The first argument is always self (or this) which represent the object. The first argument can be omitted.
- The second argument is the second object of same type.

# Issue

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled.png)

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%201.png)

- Here, Point compare with another Point. ColorPoint nees to override the binary method to also check for color.
- However, the implementation is not correctly applied if we store a ColorPoint typed as a Point.
- The *ColorPoint::equal* method hides **statically** the *Point::equal* method.

## Cpp solution

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%202.png)

Here, we need to do dynamic polymorphism. That implies virtual methods and overriding.

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%203.png)

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%204.png)

- However, this leads to an issue if p1 is a **Point** and p2 is a **ColorPoint**
- That forces us to be **contravariant** about the arguments and **covariant** about the return values
- In practice, there is **ambiguity** due to overrides of arguments and  **invariance** about return values. ****

### Covariant further explanation

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%205.png)

### Contravariant further explanation

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%206.png)

## CLOS Solution

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%207.png)

Here, **call-next-method** calls the next method in the order of decreasing specificity. In other word, it calls the *point= (a point) (b point)* method.

The principle of a method taking different type of argument is called the **multiple dispatch.**

### Avoid code duplication

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%208.png)

We don’t like writing this code several times. Especially if we have a heavy hierarchy.

There exist **applicable methods**.

- They are ordered by decreasing specificity.
- We can use combination of method to specify the behavior of less specific function with more specific ones.
    
    <aside>
    🧠 In our context, the method-combination **and** suits perfectly our expectations.
    
    </aside>
    
    ![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%209.png)
    
- This is powerful since each method only focus on the differences between the specificities of the type taken as parameter.

# Different type issue on call

<aside>
🧠 You don’t need to understand deeply the code in this section. Just make sure to understand what happens here

</aside>

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2010.png)

In this context, it returns true because the method *point point* is called even if the types are not exactly in the same class.

We **could** fix that by simply adding

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2011.png)

<aside>
⚠️ We actually **don’t want to check for the type inside of the point = method.**

</aside>

## Fix

A better fix would be to express binary function as a **particular case** of a generic function. Therefore, we’d like to have a class for binary functions.

This class implements:

- **standard-generic-function** because it is a generic class.
- **funcallable-standard-class** to specify that its instance are callable

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2012.png)

This code coulb used using

```lisp
defbinary(point =)
```

<aside>
🧠 The concept imposes a **lambda list** of two elements of same class.

</aside>

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2013.png)

- comp-dscr-func compute all the possible method to call
- comp-app-meth-usg-cls sorts all the possible method by specificicities of parameters (*in other word, let’s ensure we chose the largest class possible for every parameters*)
- comp-eff-meth picks all the methods to call and apply the method-combination on them

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2014.png)

Here, we can specify that before the compute-applicable-methods-using-classes we want to ensure that the number of classes are 2 and that their types are equal.

# Different type issue on definition

<aside>
🧠 You don’t need to understand deeply the code in this section. Just make sure to understand what happens here

</aside>

What if we end up on a developer like **TIM** that doesn’t understand shit about binary methods and do that:

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2015.png)

## How to prevent it from happening ?

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2016.png)

This is the protocol for definition of generic functions

- defmethod is the function called whenever a new method is being defined
- ensure-method perfoms checks on the method
- make-method create the method if it doesnt exist
- add-method adds the method to the generic function

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2017.png)

This will ensure that the method has two “specializers” or class identical as the parameters.

# Binary completude issue

What if we end up on a developer like **TIM** that doesn’t understand shit about binary methods and end up creating a child type of point but forgets to create the equal method accordingly.

We’d rather check that later in the execution process in order to preserve the dynamic aspect of the method. 

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2018.png)

![Untitled](Chapter%203%20-%20Binary%20methods/Untitled%2019.png)

Here is the explanation of the left step

<aside>
🧠 class-precedence-list is an accessor for all the classes in order of precedence

</aside>
