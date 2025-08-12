---
title: "Symetric & asymetric encryption, discrete logarithm, integer factorisation"
---
Last edited time: March 6, 2024 4:58 PM

# Leson

[https://youtu.be/jxsLrl8Kmj8](https://youtu.be/jxsLrl8Kmj8)

# TD 1

[Affiche Atelier Recrutement Paris.pdf](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Affiche_Atelier_Recrutement_Paris.pdf)

# Notes

## BIS encryption

- **Integrity:** The message is not modified
- **Privacy:** The message can be read by the receiver
- **Authenticity:** The sender can be identified
- **Non-repudiation:** The sender cannot denied to be the source of the message

A cryptosystem schema holds:

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled.png)

## Symetric encryption

The symetric encryption has a **single** key: both sender and receiver are meant to be aware of that key and use it to encrypt **and** decrypt it.

## Pros

- Very **quick**
- **Same key** for encryption and decryption

## Cons

- A **lot** of keys (one key per duo communicating)
- Initial exchange of the key unprotected
- Non-repudiation (same key for both sender)
- Weak to:
    - known-plaintext attack (message & encryption known)
    - chosen-plaintext attack (encryption algo known)

### Example

The **Caesar encryption**: (basically, a shifting of a *key* letter in the alphabet for every letter of the mes  sage)

**But:** attacks exist based on frequency analysis (how often a char is used)

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%201.png)

## Diffe-Hellman encryption

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%202.png)

- Explanation of $(Z/nZ)^\times$
    
    $(Z/nZ)^\times$ means a number modulo n. Here, n is a prime number p. A generator g is a value that makes a loop in the set (using the modulo multiplication) begining with g and timing by g (n-1) time. By conention, the generation’s loop ends with 1.
    
    *Example: Z/3Z is the set { 0, 1, 2, 3 }. The group is cyclic with the generator g=2 and the sequence is { 2, 1 }*  
    

Let Alice take $p^a, g^a$ as prime number and generator.

Let Bob take $p^b, g^b$ as prime number and generator.

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%203.png)

If we take $p = 173, g = 17, a = 13, b = 37$ and compute the private key, $K = 44$

## The attacks of symmetric encryption

If we know $g, p,g^a, g^b$  can we compute $g^{ab}$ ?

Try to find x for: 

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%204.png)

It is a **logarithm problem** since the unknown variable is at the exponent.

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%205.png)

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%206.png)

(The whole difficulty is than all numbers are **integers**)

### Shank’s Algorithm

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%207.png)

We create 2 lists of element of Z/pZ and try to find an element that is in both.

1. Pick n > sqrt(p). For example n = 1 + round(sqrt(p))
2. Create the list
    1. First (baby steps) : $L_1 = [1,g,g^2,g^3 ..., g^{n-1}]$
    2. Second (giant steps) : $L_2 = [b, bg^{-n}, bg^{-2n}, bg^{-3} ...  bg^{-(n-1)}]$
3. Find the collision $g^r = bg ^{-qn}$
4. $r+qn = x$
5. 

Validity :

Let $x = nq+r$  the eclidian division of $x$ by $n$

Then  $r<n$ and $\frac{x-r}{n}<\frac{p}{n}<n$ by assumption

Then $g^r=bg^{-qn}$ 

- Example : resolve $g^x=b$ with $x<p$
    
    $5^x=2\ mod\ 7$
    
    $L_1=\{1,5,5^2\equiv4 \}$
    
    $L_2=\{2,2^2\equiv4\}$
    
- Complexity:
    
    ![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%208.png)
    

## RSA

- $n=pq$ with $q$ and $p$ primes
- $e.d\equiv 1\ mod\ (p-1)(q-1)$
- Encryption $c=m^e$
- Decryption $m =c^d$
- ${(m^e)}^d=m$  and  ${(m^d)^e}=m$
- Here only $d$ is private

- Complexity
    
    ![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%209.png)
    

## ELGamal

We are using the same protocol as Diffie Hellmann. We take p as prime, a generator g and K the shared key.

A message m element of $(Z/pZ)^\times$ is an integer between  1 and p-1

The encrypted message is therefore $c = m\times K$ which is also an integer between 1 and p-1

To decrypt, we only need to compute $c \times K^{-1}$ because $m = c \times K^{-1} = m \times K \times K{-1}$

![Untitled](Symetric%20&%20asymetric%20encryption,%20discrete%20logarith/Untitled%2010.png)

### Vulnerabilities

We can compute $c_1.c_2^{-1}=m_1.K.K{-1}.m_2{-1}=m_1.m_2{-1}$ and obtain valuable informations on the source message.

A **solution** would be to send the message using a different key every time.
