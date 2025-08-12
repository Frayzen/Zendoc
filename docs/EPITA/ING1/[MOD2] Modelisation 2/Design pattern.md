---
title: "Design pattern"
---
Last edited time: April 14, 2024 10:24 PM

# Introduction

A design pattern is an already-made solution to common problematic faced by software engineers (as well as other jobs).

<aside>
🧠 However, design pattern are **not** an alternative to good-send or reflexion.

</aside>

A design pattern can be expressed as:

- A context, problem, solution
- A problem, solution, consequences

A design pattern is subdivided in usage:

- Creation
- Structure
- Behavior

Or in abstraction:

- Architecture
- Conception
- Idiom

![Untitled](Design%20pattern/Untitled.png)

# Visitor design pattern (CPP)

![Untitled](Design%20pattern/Untitled%201.png)

This kind of representation has several issues:

- What if I want to add a new method ? I need to replicate it everywhere
- There is a lot of code duplicated
    
    ![Untitled](Design%20pattern/Untitled%202.png)
    

### Implementation

![Untitled](Design%20pattern/Untitled%203.png)

All of the object have to implement the accept method that has as only purpose to call the visitor appropriate visit method

![Untitled](Design%20pattern/Untitled%204.png)

It is really easy to add more visitor1

![Untitled](Design%20pattern/Untitled%205.png)

# Visitor design pattern (Lisp)

TODO
