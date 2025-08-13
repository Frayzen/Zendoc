---
Owner: Tim Pearson
---
```Assembly
def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a
def find_generators(modulus):
    generators = []
    for g in range(1, modulus):
        if gcd(g, modulus) == 1:
            group_elements = {pow(g, exp, modulus) for exp in range(1, modulus)}
            if group_elements == set(range(1, modulus)):
                generators.append(g)
    return generators
# Find generators of (Z/5Z)*
generators = find_generators(5)
print("Generators of (Z/5Z)*:", generators)
```
  
```Assembly
  1 def extended_gcd(a, b):
  2     if a == 0:
  3         return b, 0, 1
  4     else:
  5         gcd, x, y = extended_gcd(b % a, a)
  6         return gcd, y - (b // a) * x, x
  7 
  8 def mod_inverse(a, m):
  9     gcd, x, y = extended_gcd(a, m)
 10     if gcd != 1:
 11         return None  # inverse doesn't exist
 12     else:
 13         return x % m
 14 
 15 elements = [1, 2, 3, 4, 5, 7, 9, 12, 13, 14]  # Elements in     Z/15Z
 16 
 17 invertible_elements = []
 18 for element in elements:
 19     inverse = mod_inverse(element, 15)
 20     if inverse is not None:
 21         invertible_elements.append((element, inverse))
 22 
 23 print("Invertible elements in Z/15Z:")
 24 for element, inverse in invertible_elements:
 25     print(f"{element} has inverse {inverse}")
```