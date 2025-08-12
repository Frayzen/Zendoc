---
title: "Master Theorem"
---
Last edited time: November 6, 2023 1:19 PM

Used for divide and conquer algorithms

$$
T(n)=a\cdot T(\frac{n}{b}) + c(n)
$$

![Untitled](Master%20Theorem/Untitled.png)

![Untitled](Master%20Theorem/Untitled%201.png)

![Untitled](Master%20Theorem/Untitled%202.png)

$$
height \ = \ log_b(n) \\
n.o. \ leafs \ =a^{log_b(n)}
$$

![Untitled](Master%20Theorem/Untitled%203.png)

![Untitled](Master%20Theorem/Untitled%204.png)

$$
\text{if we are in the thrid case we need to check : } \\
\exists c < 1 : a \cdot c(\frac{n}{b}) \le c \cdot c(n) \\
\text{this is always true if c is a polynomial}
$$

## Examples:

- Merge sort (CASE 2)
    
    ![EE2CAD8A-EF5A-4C60-AB31-865A19B0E832.jpeg](Master%20Theorem/EE2CAD8A-EF5A-4C60-AB31-865A19B0E832.jpeg)
    
- T(n) = 3T(n/2) + n (CASE 1)
    
    ![C85DD226-8B08-4570-B870-BA09174629F3.jpeg](Master%20Theorem/C85DD226-8B08-4570-B870-BA09174629F3.jpeg)
    
- T(n) = 3T(n/2) + n^2 (CASE 3)
    
    ![EE570037-9A35-45FC-AB6D-4C781916C710.jpeg](Master%20Theorem/EE570037-9A35-45FC-AB6D-4C781916C710.jpeg)
    
- T(n) = 2T(n/2) + nlog2(n) (CASE 4)
    
    ![B42ED0CC-2C57-436E-A455-0C8D8551C3FF.jpeg](Master%20Theorem/B42ED0CC-2C57-436E-A455-0C8D8551C3FF.jpeg)
