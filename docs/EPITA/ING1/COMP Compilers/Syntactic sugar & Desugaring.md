---
title: Syntactic sugar & Desugaring
Owner: Matcha
---
## Syntactic Sugar
Additions to a language to make it easier to read or write, but that do not change the  
expressiveness
  
## Desugaring
Higher-level features that can be decomposed into language core of essential constructs. Remove syntactic sugar.
  
  
# In Tiger
- Light
    - if then
- Regular
    - Unary -
    - & and |
    - Beware of ( exp ) vs. ( exps )
- Extra
    
    - for
    - ?: as in GNU C (a ?: b)
    - where
    - Function overload
    
      
    
## Example : $\alpha \le \beta \le \gamma$
Initial Sugared
```C++
let
in
	if α ≤ β & β ≤ γ
	then
	1
	else
	0
end
```
  
Solution
```C++
let var _alpha := α
	var _beta := β
in
	if _alpha ≤ _beta
	then
		let var _gamma := γ
		in
			if _beta ≤ _gamma
				then 1
			else 0
	else 0
end
```
### What not to do
```C++
let var _beta := β
in
	if α ≤ _beta & _beta ≤ γ
		then 1
	else 0
end
```
```C++
let 
	var _alpha := α
	var _beta := β
	var _gamma := γ
in
	if _alpha ≤ _beta &
			_beta ≤ _gamma
	then 1
	else 0
end
```
# Steps
1. Walk the AST using a visitor
2. Focus on the type of node to be replaced
3. Build new sub-AST
4. Replace the nodes (and associated sub-trees) by the new sub-AST
  
## Tweast - Text With Embedded AST
Desugar directly inside the parser
### Abstract Synthax
### Concrete Synthax
```C++
exp: exp "&" exp {
	$ = new IfExp(@$, $1,
				new OpExp(@$,$3, OpExp::ne,
										new IntExp(@2, 0)),
				new IntExp(@2, 0));
}
```
```C++
exp: exp "&" exp {
	$ = parse::parse(parse::Tweast() <<
		"if " << $1 << " then " << $3 << "<> 0 else 0");
}
```