---
title: "Karatsubas Multiplication algorithm"
---
Last edited time: January 28, 2024 6:10 PM

## basis

Its purpose is to multiply large numbers using a divide and conquer method

Say we wanted to workout x * y = 146123 * 352120 . let n be the number of digits.

Can multiply 2 polynomes of degree $n$ in $\Theta (n^{log_2(3)})$ operations

![Untitled](Karatsubas%20Multiplication%20algorithm/Untitled.png)

At this point you would think we need 4 recursive calls however **ad + bc** can be computer with one recursive call.

![Untitled](Karatsubas%20Multiplication%20algorithm/Untitled%201.png)

![Untitled](Karatsubas%20Multiplication%20algorithm/Untitled%202.png)

## Using Mod

![Untitled](Karatsubas%20Multiplication%20algorithm/Untitled%203.png)

## Using Arrays

```objectivec
def karatsuba(A, B, n):
    if n == 1:
        # Base case: single-digit multiplication
        return [A[0] * B[0], 0]

    # Split A and B into halves
    RA, QA = A[:n//2], A[n//2:]
    RB, QB = B[:n//2], B[n//2:]

    # Recursively compute three products
    T1 = karatsuba(RA, RB, n//2)
    T2 = karatsuba(QA, QB, n//2)
    T3 = [QA[i] - RA[i] for i in range(n//2)]
    T4 = [RB[i] - QB[i] for i in range(n//2)]
    T5 = karatsuba(T3, T4, n//2)

    # Combine results to get the final product
    C = [0] * (2 * n)
    for i in range(n):
        C[i] += T2[i]
        C[i + n] += T1[i]
    for i in range(n//2, 3 * (n//2)):
        C[i] += T1[i - n//2] + T2[i - n//2] + T5[i - n//2]

    return C

# Example usage:
A = [1, 2, 3, 4]  # Replace with your own input
B = [5, 6, 7, 8]  # Replace with your own input
n = len(A)
result = karatsuba(A, B, n)
print(result)
```

## Complexity

![Untitled](Karatsubas%20Multiplication%20algorithm/Untitled%204.png)
