---
title: "Insertions sort"
---
Last edited time: October 28, 2023 11:04 PM

```python
def insertion_sort(array):
	n = len(array)
	for i in range(1, n):
		key = array[i]
		j = i - 1
		while j >= 0 and array[j] > key:#FOCUS ON THE CONDITION HERE
			array[j + 1] = array[j]
			j = j - 1
		array[j + 1] = key

```

<aside>
📌 **(to double check this)**even though there are two comparisons in the while we will consider the whole condition

</aside>

- the number of comparisons depends on the array:

![Untitled](Insertions%20sort/Untitled.png)

![Untitled](Insertions%20sort/Untitled%201.png)

![after selecting the element at position **i**, we consider the potential number of comparisons made in the while loop depending on **i** . call t **ci.**](Insertions%20sort/Untitled%202.png)

after selecting the element at position **i**, we consider the potential number of comparisons made in the while loop depending on **i** . call t **ci.**

![Untitled](Insertions%20sort/Untitled%203.png)

![This is the number of comparisons made if we take the average case](Insertions%20sort/Untitled%204.png)

This is the number of comparisons made if we take the average case

$$
BEST=C(n)=n-1 \ \ =(LINEAR)\\
WORST = C(n)=\frac{(n+2)(n-1)}{2} \ \ = (QUADRATIC) \\
AVG = C(n)= \frac{(n+4)(n-1)}{4} \ \ = (QUADRATIC)
$$
