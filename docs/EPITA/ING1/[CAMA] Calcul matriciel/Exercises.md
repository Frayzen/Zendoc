---
title: "Exercises"
---
Last edited time: June 2, 2024 12:49 PM

## ma1

```python
import numpy as np

# Square Matrix
# Create the 5x5 square matrix containing the first 25 integers, from 1 to 25.
square_matrix = np.arange(1, 26).reshape(5, 5)
print("Square Matrix:\n", square_matrix)

# Vector Norm
# Return the Euclidean norm of a vector without using the `norm` function.
def vector_norm(v):
    return np.sqrt(np.sum(v**2))

v = np.array([3, 4])
print("Vector Norm:", vector_norm(v))  # Expected output: 5.0

# Sub-Matrix
# Extract the sub-matrix of size (n-2)x(m-2) that removes the borders of the nxm matrix A.
def sub_matrix(A):
    return A[1:-1, 1:-1]

A = np.arange(1, 17).reshape(4, 4)
print("Sub-Matrix:\n", sub_matrix(A))

# Random Vector
# Create a function that takes a size n and returns a random integer vector of size n between -a and +a and centered as close as possible to 0.
def random_vector(n, a):
    return np.random.randint(-a, a+1, size=n)

print("Random Vector:", random_vector(5, 10))

# Trace
# Return the trace of a matrix without using the `trace` function.
def matrix_trace(A):
    return np.sum(np.diag(A))

print("Matrix Trace:", matrix_trace(square_matrix))

# Matrix of Multiples of 3
# Round the given matrix to the nearest multiple of 3 (for each value).
def round_to_multiples_of_3(A):
    return 3 * np.round(A / 3).astype(int)

B = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print("Matrix of Multiples of 3:\n", round_to_multiples_of_3(B))

# Count of 9s
# Count the number of 9s in an integer matrix A given as a parameter.
def count_nines(A):
    return np.sum(A == 9)

print("Count of 9s:", count_nines(B))

# Column with the Smallest Average
# Return the index of the column of a matrix with the smallest average.
def column_with_smallest_average(A):
    return np.argmin(np.mean(A, axis=0))

print("Column with the Smallest Average:", column_with_smallest_average(B))

# ChessSum
# Calculate the sum of the values on the white squares of a chessboard-like matrix.
def chess_sum(A):
    return np.sum(A[1::2, ::2]) + np.sum(A[::2, 1::2])

C = np.arange(1, 10).reshape(3, 3)
print("ChessSum:", chess_sum(C))

# 2 Minimums
# Return the 2 smallest values of a matrix using a method with linear complexity.
def two_minimums(A):
    flat = A.flatten()
    min1 = np.min(flat)
    min2 = np.min(flat[flat != min1]) if np.any(flat != min1) else min1
    return min1, min2

print("2 Minimums:", two_minimums(B))

# Rows in Order
# Sort the rows of a matrix in ascending order of their average.
def rows_in_order(A):
    return A[np.argsort(np.mean(A, axis=1))]

print("Rows in Order:\n", rows_in_order(B))

# Unique Values
# Provide the list of unique values (appearing only once) in a numpy array.
def unique_values(A):
    unique, counts = np.unique(A, return_counts=True)
    return unique[counts == 1]

D = np.array([1, 2, 2, 3, 4, 4, 5])
print("Unique Values:", unique_values(D))

# Magic Tensor
# Construct a 3D tensor of size nxnxn using n times the first n² integers and such that the sum of the elements of each plane (slice) is always the same.
def magic_tensor(n):
    return np.tile(np.arange(n*n), (n, 1, 1))

print("Magic Tensor:\n", magic_tensor(3))

# Tensor Slices
# Extract all the slices of a 3D tensor. We return a list of arrays.
def tensor_slices(T):
    return [T[i, :, :] for i in range(T.shape[0])] + [T[:, i, :] for i in range(T.shape[1])] + [T[:, :, i] for i in range(T.shape[2])]

T = np.arange(27).reshape(3, 3, 3)
print("Tensor Slices:", tensor_slices(T))

```
