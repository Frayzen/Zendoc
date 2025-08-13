---
title: Exam 1
Owner: Tim Pearson
---
# Discrete logarithm
$g^x \equiv v \pmod{p}$

> [!important] take primes with 2048 bits
### Attack with:
- brute force
- baby step giant step
### Used in:
- Diffie-hellman keygen
- El Gamal encryption
  
# Integer Factorization
$n = pq \ \ \ \ \ \ \ \text{(p,q prime)}$
- given n, find q and p
### Attack with:
- brute force
- Fermats algo
- Pho Pollard (fastest)
### Used in:
- RSA
    - deterministic ⇒ dangerous
    - we can add random numbers to the message using optical asymmetric padding)
    - good practices:
        
        - large p, q
        - large distance between p and q
        - e not small (usually e = 2^16 + 1)