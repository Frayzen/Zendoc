---
Owner: "Florian "
---
# Leson
[https://youtu.be/jxsLrl8Kmj8](https://youtu.be/jxsLrl8Kmj8)
# TD 1
![[Affiche_Atelier_Recrutement_Paris.pdf]]
# Notes
## BIS encryption
- **Integrity:** The message is not modified
- **Privacy:** The message can be read by the receiver
- **Authenticity:** The sender can be identified
- **Non-repudiation:** The sender cannot denied to be the source of the message
  
A cryptosystem schema holds:
![[Untitled 158.png|Untitled 158.png]]
  
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
The **Caesar encryption**: (basically, a shifting of a _key_ letter in the alphabet for every letter of the mes sage)
**But:** attacks exist based on frequency analysis (how often a char is used)
![[Untitled 1 107.png|Untitled 1 107.png]]
  
## Diffe-Hellman encryption
![[Untitled 2 75.png|Untitled 2 75.png]]
- Explanation of $(Z/nZ)^\times$
    
    $(Z/nZ)^\times$ means a number modulo n. Here, n is a prime number p. A generator g is a value that makes a loop in the set (using the modulo multiplication) begining with g and timing by g (n-1) time. By conention, the generation’s loop ends with 1.
    
    _Example: Z/3Z is the set { 0, 1, 2, 3 }. The group is cyclic with the generator g=2 and the sequence is { 2, 1 }_
    
Let Alice take $p^a, g^a$ as prime number and generator.
Let Bob take $p^b, g^b$ as prime number and generator.
![[Untitled 3 55.png|Untitled 3 55.png]]
If we take $p = 173, g = 17, a = 13, b = 37$ and compute the private key, $K = 44$
## The attacks of symmetric encryption
If we know $g, p,g^a, g^b$ can we compute $g^{ab}$ ?
Try to find x for:
![[Untitled 4 38.png|Untitled 4 38.png]]
It is a **logarithm problem** since the unknown variable is at the exponent.
![[Untitled 5 26.png|Untitled 5 26.png]]
![[Untitled 6 18.png|Untitled 6 18.png]]
(The whole difficulty is than all numbers are **integers**)
  
### Shank’s Algorithm
![[Untitled 7 16.png|Untitled 7 16.png]]
We create 2 lists of element of Z/pZ and try to find an element that is in both.
1. Pick n > sqrt(p). For example n = 1 + round(sqrt(p))
2. Create the list
    1. First (baby steps) : $L_1 = [1,g,g^2,g^3 ..., g^{n-1}]$
    2. Second (giant steps) : $L_2 = [b, bg^{-n}, bg^{-2n}, bg^{-3} ... bg^{-(n-1)}]$
3. Find the collision $g^r = bg ^{-qn}$
4. $r+qn = x$
Validity :
Let $x = nq+r$ the eclidian division of $x$ by $n$
Then $r<n$ and $\frac{x-r}{n}<\frac{p}{n}<n$ by assumption
Then $g^r=bg^{-qn}$
  
- Example : resolve $g^x=b$ with $x<p$
    
    $5^x=2\ mod\ 7$
    
    $L_1=\{1,5,5^2\equiv4 \}$
    
    $L_2=\{2,2^2\equiv4\}$
    
- Complexity:
    
    ![[Untitled 8 13.png|Untitled 8 13.png]]
    
## RSA
- $n=pq$ with $q$ and $p$ primes
- $e.d\equiv 1\ mod\ (p-1)(q-1)$
- Encryption $c=m^e$
- Decryption $m =c^d$
- ${(m^e)}^d=m$ and ${(m^d)^e}=m$
- Here only $d$ is private
  
- Complexity
    
    ![[Untitled 9 11.png|Untitled 9 11.png]]
    
  
## ELGamal
We are using the same protocol as Diffie Hellmann. We take p as prime, a generator g and K the shared key.
A message m element of $(Z/pZ)^\times$ is an integer between 1 and p-1
The encrypted message is therefore $c = m\times K$ which is also an integer between 1 and p-1
To decrypt, we only need to compute $c \times K^{-1}$ because $m = c \times K^{-1} = m \times K \times K{-1}$
![[Untitled 10 10.png|Untitled 10 10.png]]
### Vulnerabilities
We can compute $c_1.c_2^{-1}=m_1.K.K{-1}.m_2{-1}=m_1.m_2{-1}$ and obtain valuable informations on the source message.
A **solution** would be to send the message using a different key every time.