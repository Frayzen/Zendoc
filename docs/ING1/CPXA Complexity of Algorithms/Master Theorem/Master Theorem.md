---
title: Master Theorem
Owner: Tim Pearson
---
Used for divide and conquer algorithms
  
  
  
$T(n)=a\cdot T(\frac{n}{b}) + c(n)$
![[Untitled 49.png|Untitled 49.png]]
![[Untitled 1 29.png|Untitled 1 29.png]]
![[Untitled 2 19.png|Untitled 2 19.png]]
$height \ = \ log_b(n) \\  
n.o. \ leafs \ =a^{log_b(n)}$
![[Untitled 3 15.png|Untitled 3 15.png]]
![[Untitled 4 12.png|Untitled 4 12.png]]
$\text{if we are in the thrid case we need to check : } \\  
\exists c < 1 : a \cdot c(\frac{n}{b}) \le c \cdot c(n) \\  
\text{this is always true if c is a polynomial}$
## Examples:
- Merge sort (CASE 2)
    
    ![[EE2CAD8A-EF5A-4C60-AB31-865A19B0E832.jpeg]]
    
- T(n) = 3T(n/2) + n (CASE 1)
    
    ![[C85DD226-8B08-4570-B870-BA09174629F3.jpeg]]
    
- T(n) = 3T(n/2) + n^2 (CASE 3)
    
    ![[EE570037-9A35-45FC-AB6D-4C781916C710.jpeg]]
    
- T(n) = 2T(n/2) + nlog2(n) (CASE 4)
    
    ![[B42ED0CC-2C57-436E-A455-0C8D8551C3FF.jpeg]]