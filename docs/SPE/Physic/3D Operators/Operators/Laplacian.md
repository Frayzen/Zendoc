---
Input:
  - scalar-valued
  - vector
Example Input: (a, b, c) → vectorxy^2 + z^3 → field
Example output: (a’’, b’’, c’’) → vector2x + 6z → field
Infos: double derivative
Output:
  - same type
---
  

> [!important] Takes
> 
> **both vector and scalar-valued** and returns **the same type**
It is the second derivative of the function
$\Delta v = div(\vec{grad}(\vec{A}))$
We end up with a scalar (need to sum every component of the vector up at the end) or vector