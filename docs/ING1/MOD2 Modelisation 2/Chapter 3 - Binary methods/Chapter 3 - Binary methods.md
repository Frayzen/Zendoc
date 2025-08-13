---
Owner: "Florian "
---
> [!important] The binary methods leads to less protection. But more freedom. It means that we need to create ourselves the security checks for user input etc…
# What is it
- Binary operators are arithmetic operators such as +, =, <…
- In the context of OO, it is applied to 2 object of the same type. We are taking advantage of the polimorphism here.
- In the traditionally approach of OOP, it can’t really be applied because of the relation class / type in an inheritance context.
- The first argument is always self (or this) which represent the object. The first argument can be omitted.
- The second argument is the second object of same type.
# Issue
![[Untitled 102.png|Untitled 102.png]]
![[Untitled 1 70.png|Untitled 1 70.png]]
- Here, Point compare with another Point. ColorPoint nees to override the binary method to also check for color.
- However, the implementation is not correctly applied if we store a ColorPoint typed as a Point.
- The _ColorPoint::equal_ method hides **statically** the _Point::equal_ method.
## Cpp solution
![[Untitled 2 51.png|Untitled 2 51.png]]
Here, we need to do dynamic polymorphism. That implies virtual methods and overriding.
![[Untitled 3 37.png|Untitled 3 37.png]]
![[Untitled 4 28.png|Untitled 4 28.png]]
- However, this leads to an issue if p1 is a **Point** and p2 is a **ColorPoint**
- That forces us to be **contravariant** about the arguments and **covariant** about the return values
- In practice, there is **ambiguity** due to overrides of arguments and **invariance** about return values.
### Covariant further explanation
![[Untitled 5 21.png|Untitled 5 21.png]]
### Contravariant further explanation
![[Untitled 6 14.png|Untitled 6 14.png]]
  
## CLOS Solution
![[Untitled 7 12.png|Untitled 7 12.png]]
Here, **call-next-method** calls the next method in the order of decreasing specificity. In other word, it calls the _point= (a point) (b point)_ method.
The principle of a method taking different type of argument is called the **multiple dispatch.**
### Avoid code duplication
![[Untitled 8 10.png|Untitled 8 10.png]]
We don’t like writing this code several times. Especially if we have a heavy hierarchy.
There exist **applicable methods**.
- They are ordered by decreasing specificity.
- We can use combination of method to specify the behavior of less specific function with more specific ones.
    
    > [!important] In our context, the method-combination
    > 
    > **and** suits perfectly our expectations.
    
    ![[Untitled 9 8.png|Untitled 9 8.png]]
    
- This is powerful since each method only focus on the differences between the specificities of the type taken as parameter.
# Different type issue on call

> [!important] You don’t need to understand deeply the code in this section. Just make sure to understand what happens here
![[Untitled 10 7.png|Untitled 10 7.png]]
In this context, it returns true because the method _point point_ is called even if the types are not exactly in the same class.
We **could** fix that by simply adding
![[Untitled 11 7.png|Untitled 11 7.png]]

> [!important] We actually
> 
> **don’t want to check for the type inside of the point = method.**
## Fix
A better fix would be to express binary function as a **particular case** of a generic function. Therefore, we’d like to have a class for binary functions.
This class implements:
- **standard-generic-function** because it is a generic class.
- **funcallable-standard-class** to specify that its instance are callable
![[Untitled 12 7.png|Untitled 12 7.png]]
This code coulb used using
```Lisp
defbinary(point =)
```

> [!important] The concept imposes a
> 
> **lambda list** of two elements of same class.
![[Untitled 13 7.png|Untitled 13 7.png]]
- comp-dscr-func compute all the possible method to call
- comp-app-meth-usg-cls sorts all the possible method by specificicities of parameters (_in other word, let’s ensure we chose the largest class possible for every parameters_)
- comp-eff-meth picks all the methods to call and apply the method-combination on them
![[Untitled 14 4.png|Untitled 14 4.png]]
Here, we can specify that before the compute-applicable-methods-using-classes we want to ensure that the number of classes are 2 and that their types are equal.
  
# Different type issue on definition

> [!important] You don’t need to understand deeply the code in this section. Just make sure to understand what happens here
What if we end up on a developer like **TIM** that doesn’t understand shit about binary methods and do that:
![[Untitled 15 4.png|Untitled 15 4.png]]
## How to prevent it from happening ?
![[Untitled 16 4.png|Untitled 16 4.png]]
This is the protocol for definition of generic functions
- defmethod is the function called whenever a new method is being defined
- ensure-method perfoms checks on the method
- make-method create the method if it doesnt exist
- add-method adds the method to the generic function
![[Untitled 17 3.png|Untitled 17 3.png]]
This will ensure that the method has two “specializers” or class identical as the parameters.
# Binary completude issue
What if we end up on a developer like **TIM** that doesn’t understand shit about binary methods and end up creating a child type of point but forgets to create the equal method accordingly.
We’d rather check that later in the execution process in order to preserve the dynamic aspect of the method.
![[Untitled 18 3.png|Untitled 18 3.png]]
![[Untitled 19 3.png|Untitled 19 3.png]]
Here is the explanation of the left step

> [!important] class-precedence-list is an accessor for all the classes in order of precedence