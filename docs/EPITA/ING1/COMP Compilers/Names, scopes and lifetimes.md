---
title: Names, scopes and lifetimes
Owner: Matcha
---
# Name
Name = Identifier = Symbol
Usually : alphanumeric and underscore, letter first, without whitespaces, case sensitive
==// We are capable of recognizing the langage according to the occurences of each identifier //==
  
# Scope
It’s the textual region in the source file in which the name is available
It is to know when are names created and destroyed
### Static scope
Can be compute a compile time
Enables static typing and static binding
→ cleaner, safer and clearer
### Dynamic scope
Depends on runtime conditions such as the function calls
Prevents static typing
```LaTeX
% \x, \y undefined.
{
	% \x, \y undefined.
	\def \x 1
	% \x defined, \y undefined.
	\ifnum \a < 42
		\def \y 51
	\fi
	% \x defined, \y may be defined.
}
% \x, \y undefined.
```
## In C++
- Block scope
- Function parameter scopes
- Function scopes
- Namespace scopes
- Class scopes
- Templates scopes
## In Tiger
- let / in / end
- Inside the functions
  
Here we have 4 scopes :
1. let/in/end external
2. let/in/end internal
3. f1
4. f2
```C++
let
	var a := 3
	function f1() = 
					( a := a + 1 )
in
	let var a := 4
			function f2() =
							( f1() )
	in
			f2()
	end
end
```

> [!important] Scope
> 
> $=$ visibility $\neq$ variable lifetime (it is related to the execution)