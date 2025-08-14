---
title: Further on the Binder
Owner: Matcha
---
## Simultaneous symbol definition
```F#
let
	type t = { h: int, t: t }
	function t (h: int, t: t) : t = t { h = h, t = t }
	var t := t (12, nil)
	var t := t (12, t)
in
	t.t = t
end
```
We are gonna have several active environment at once, a symbol table for each of these categories
→ variables
→ types
→ functions
→ …
  
## Memory Managment
Multiple ways to do it :
- ==scope end== deallocate everything since the latest scope_begin
- ==pass end== deallocate auxiliary data after the traversal is completed
- ==ast== bind the data to the ast and delegate deallocation
- ==by hand== thanks God for Valgrind and Paracetamol
  
### With AST
This is the smartest way to do it :
- annotate each node of ast
- annotate each scoping node with a symbol table and link them
- leave tables outside