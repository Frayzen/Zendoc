---
title: "Useful numpy functions"
---
Last edited time: March 24, 2024 4:33 PM

# Generation

## np.arange(int)

Equivalent to range but with nparray

## randint(int: low, int: high, tuple[int]: size)

Generate a nparray of size and populate it with random values from low to high.

<aside>
🧠 You need to call this function from np.random.RandomState(seed)
The seed is arbitrary

</aside>

# Operations

- **Multiplication** with @ (*mat1 @ mat2)*

<aside>
⚠️ The matrices needs to be of shape n * p and p * m

</aside>

- **Submatrice**
    - [lower:higher, lower:higher] **higher** can take negative values. It reduces the matrices by cutting off edges.
    - [begin::step, begin::step] **base** can be omitted
- **Subelements**
    - *array[index]* Using index returns a specific value
    - *array[list<int>]* reorder the column given the indexes in the list
    - array[*list<tuple*>] retrieving all the values at given coordinates.
- **Addition and substraction** with integers.
- **Condition** creates matrices checking the condition with all the values and creating the resulting boolean nparray

# Manipulation (from a nparray)

## nparray.reshape(list[int])

reshape the matrice given dimensions

## nparray.mean(*optional axis*)

returns the mean of the array. If the axis is specified, only applies to the given axis and flatten the array. Otherwise, apply to all axis and return the integer. 

## nparray.round()

rounds all of the values of the nparray up.

## nparray.sum(*optional axis*)

returns the sum of the array. If the axis is specified, only applies to the given axis and flatten the array. Otherwise, apply to all axis and return the integer. 

## nparray.diagonal()

returns the diagonal of the array flatten as a 1 dimensional nparray.

## nparray.min() max()

<aside>
💡 This function can be prefixed with **arg** to return the **index** instead of the **value**.

</aside>

Return the mininmum / maximum value of the array.

## nparray.sort()

<aside>
💡 This function can be prefixed with **arg** to return the **index** instead of the **value**.

</aside>

Return an array containing the same values but worted
