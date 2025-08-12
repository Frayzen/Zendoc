---
title: "Escaping variable"
---
Last edited time: April 10, 2024 10:44 PM

The **variable analysis** phase is a semantic phase to find out if each variable escapes or not. It is:

- required for  the translation into intermediate code
- the last time we can compute this information that is source related

## Escaping variable

Variable that can’t be stored in a register

### In Tiger

- Variables accessed from a nested function
- Arguments accessed from a nested scope → non local

### In C

- Large values (arrays, structs)
- Variables whose address is taken
- Variables arguments

Examples:

```fsharp
let
	var one := 1
	var two := 2
	function incr (x: int) : int =
			x + one
in
	incr (two)
end
```

Here the variable one in the incr function is escaping

It is used in a scope which is not it’s declaration scope

### Solution → Annotating the AST

We’re gonna have a boolean that is gonna say if each variable is escaping or not 

## Conservative approach

Consider all variables as escaping, since it is safe to put a non escaping variable
onto the stack, while the converse is unsafe!

```fsharp
let
	var /*escaping*/ one := 1
	var /*escaping*/ two := 2
	function incr (/*escaping*/ x: int) : int =
			x + one
in
	incr (two)
end
```

## Computing approach

Tag all variables as non-escaping
Detect and tag all escaping variables
Only need to know the depth of the
declaration’s scope

```fsharp
let
		var /*escaping*/ one := 1
		var two := 2
		function incr (x: int) : int =
				x + one
in
		incr (two)
end
```
