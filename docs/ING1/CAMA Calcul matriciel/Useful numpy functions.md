---
Owner: "Florian "
---
# Generation
## np.arange(int)
Equivalent to range but with nparray
## randint(int: low, int: high, tuple[int]: size)
Generate a nparray of size and populate it with random values from low to high.

> [!important] You need to call this function from np.random.RandomState(seed)
> 
>   
> The seed is arbitrary
# Operations
- **Multiplication** with @ (_mat1 @ mat2)_

> [!important] The matrices needs to be of shape n * p and p * m
- **Submatrice**
    - [lower:higher, lower:higher] **higher** can take negative values. It reduces the matrices by cutting off edges.
    - [begin::step, begin::step] **base** can be omitted
- **Subelements**
    - _array[index]_ Using index returns a specific value
    - _array[list<int>]_ reorder the column given the indexes in the list
    - array[_list<tuple_>] retrieving all the values at given coordinates.
- **Addition and substraction** with integers.
- **Condition** creates matrices checking the condition with all the values and creating the resulting boolean nparray
# Manipulation (from a nparray)
## nparray.reshape(list[int])
reshape the matrice given dimensions
## nparray.mean(_optional axis_)
returns the mean of the array. If the axis is specified, only applies to the given axis and flatten the array. Otherwise, apply to all axis and return the integer.
## nparray.round()
rounds all of the values of the nparray up.
## nparray.sum(_optional axis_)
returns the sum of the array. If the axis is specified, only applies to the given axis and flatten the array. Otherwise, apply to all axis and return the integer.
## nparray.diagonal()
returns the diagonal of the array flatten as a 1 dimensional nparray.
## nparray.min() max()

> [!important] This function can be prefixed with
> 
> **arg** to return the **index** instead of the **value**.
Return the mininmum / maximum value of the array.
## nparray.sort()

> [!important] This function can be prefixed with
> 
> **arg** to return the **index** instead of the **value**.
Return an array containing the same values but worted