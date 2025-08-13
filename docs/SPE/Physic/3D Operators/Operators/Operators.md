|Name|Input|Output|Example Input|Example output|Infos|
|---|---|---|---|---|---|
|[[Gradient]]|scalar-valued|vector|3x + y - z|(3, 1, -1)|derivative|
|[[Curl - Rotation]]|vector|vector|(a, b, c)|(dc/dy - db/dz , da/dz - dc/dx , db/dx - da/dy)|cross product with gradient|
|[[Divergence]]|vector|scalar-valued|(a, b, c)|a’ + b’ + c’|dot product with gradient|
|[[Laplacian]]|scalar-valued, vector|same type|(a, b, c) → vector  <br>xy^2 + z^3 → field|(a’’, b’’, c’’) → vector  <br>2x + 6z → field|double derivative|