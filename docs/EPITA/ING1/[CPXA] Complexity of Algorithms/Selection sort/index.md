---
title: "Selection sort"
---
Last edited time: October 29, 2023 12:58 AM

```python
def selection_sort(array):
	n = len(array)
	for i in range(0, n-1):
		minpos = i
		for j in range(i+1, n): 
			if array[j] < array[minpos]:#ALANYSE THE COMPARISON
				minpos = j
			array[i], array[minpos] = array[minpos], array[i]
```

- since comparisons take the most time in a program we count them
    
    $$
    C(n)=\sum_{i =0}^{n -2}\sum_{j = i +1}^{n -1}1 \\=\sum_{i =0}^{n -2}(n-1)-(i+1)+1\\ = \sum_{i =0}^{n -2}n-i-1 \\\text{arithetic series} \Leftrightarrow C(n) = (n-1) \cdot\frac{first+last}{2}  \\=\frac{(n-1)n}{2}
    $$
    
- Each instruction of selection_sort is run at most C(n) time. The runtime of this
algorithm should therefore be of the form an2 +bn +c. It’s a quadratic algorithm.
