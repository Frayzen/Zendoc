---
Owner: Matcha
---
Used to check if the first steps of the compiler are good.
  
### Definition
A pretty-printer converts source-code into source-code that respects a coding-style.
- ==indentation==
- ==spaces before or after parenthesis==
- ==remove empty lines==
- ==multiple consecutive spaces==
- ==block indentation==
  
==The pretty-printer will walk the== **==entire AST==**==, and produce an equivalent but formatted  
output==
  
![[Untitled 84.png|Untitled 84.png]]

> [!important] If the input file respects the coding style, the output file must be identical!
  
  
We will use the ==**dynamic dispatch**==
```C++
class Exp
{
public:
		virtual ostream& print(ostream& o) const = 0;
};
class Num : public Exp
{
public:
...
	ostream& print(ostream& o) const override
	{
		return o << val_;
	}
...
};
class Bin : public Exp {
public:
...
	ostream& print(ostream& o) const override
	{
		o << '('; lhs_->print(o);
		o << oper_;
		rhs_->print(o);
		return o << ')';
	}
...
};
```
  
### Testing
```C++
int main() {
	Bin* bin = new Bin( '+',
	new Num(42),
	new Num(51)
	);
	Exp* exp = bin;
	bin.print(cout)
	exp.print(cout)
	delete bin;
}
(42+51)
(42+51)
```