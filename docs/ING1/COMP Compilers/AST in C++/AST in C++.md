---
title: AST in C++
Owner: Matcha
---
  
### Example of unambiguous grammar
```BNF
<E> ::= <E> "+" <T>
		| <E> "-" <T>
		| <T>
<T> ::= <T> "*" <F>
		| <T> "/" <F>
		| <F>
<F> ::= "(" <E> ")"
		| <num>
```
- E : expression
- T : term
- F : factor
  
Conventionally, terms are things you add, factor are things you multiply
![[Untitled 92.png|Untitled 92.png]]

  
  
We could keep this parse tree but it :
- Retain syntactic information (punctuation symbols, …)
- Reflect the underlying grammar
- Has redundant informationo (parenthesis)
  
That’s why we will construct a new type of tree with only abstract grammar
  
### RTG (Regular Tree Grammar)
Formal grammar used to describe trees
```BNF
<exp> ::= Add(<exp>, <exp>)
	| Sub(<exp>, <exp>)
	| Mul(<exp>, <exp>)
	| Div(<exp>, <exp>)
	| Num(<num>)
```
  
## AST (Abstract Synthax Tree)
It’s the translation of the parse tree to match an abstract grammar
```BNF
exp:
	exp "+" term { $ = new Add($1, $3); }
```
![[Untitled 1 63.png|Untitled 1 63.png]]

  
### Hierarchy
![[Untitled 2 45.png|Untitled 2 45.png]]

⬅️ Not suitable because the subclasses share a lot
  
$\Longrightarrow$ Refractorisation
![[Untitled 3 35.png|Untitled 3 35.png]]

```C++
class Exp {
protected:
		Exp() = default;
		Exp(const Exp& e) = default;
		Exp& operator=(const Exp& e) = default;
public:
		virtual ~Exp();
};
```
```C++
class Num : public Exp {
public:
	Num(int val)
		: Exp(), val_(val)
	{}
private:
	int val_;
};
```
  
```C++
class Binop : public Exp
{
public:
		Binop(char oper, Exp* lhs, Exp* rhs)
			: Exp(), oper_(oper), lhs_(lhs), rhs_(rhs)
		{}
		~Binop() override {
			delete lhs_; delete rhs_;
		}
private:
		char oper_;
		Exp* lhs_; Exp* rhs_;
};
```
  
  
We can now test our AST 🎉
```C++
int main()
{
	Exp* tree = new Bin('+',new Num(42),
											new Num(51));
	delete tree;
}
```
Memory reclamation is (transitively) done through destructors.
  
Explicit (and recursive) ==**delete**== instructions!
  

> [!important] Use smart pointers