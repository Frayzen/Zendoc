---
title: "AST in C++"
---
Last edited time: March 19, 2024 3:23 PM

### Example of unambiguous grammar

```bnf
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

![Untitled](AST%20in%20C++/Untitled.png)

We could keep this parse tree but it :

- Retain syntactic information (punctuation symbols, …)
- Reflect the underlying grammar
- Has redundant informationo (parenthesis)

That’s why we will construct a new type of tree with only abstract grammar

### RTG (Regular Tree Grammar)

Formal grammar used to describe trees

```bnf
<exp> ::= Add(<exp>, <exp>)
	| Sub(<exp>, <exp>)
	| Mul(<exp>, <exp>)
	| Div(<exp>, <exp>)
	| Num(<num>)
```

## AST (Abstract Synthax Tree)

It’s the translation of the parse tree to match an abstract grammar

```bnf
exp:
	exp "+" term { $$ = new Add($1, $3); }
```

![Untitled](AST%20in%20C++/Untitled%201.png)

### Hierarchy

![Untitled](AST%20in%20C++/Untitled%202.png)

⬅️ Not suitable because the subclasses share a lot

$\Longrightarrow$ Refractorisation

![Untitled](AST%20in%20C++/Untitled%203.png)

```cpp
class Exp {
protected:
		Exp() = default;
		Exp(const Exp& e) = default;
		Exp& operator=(const Exp& e) = default;
public:
		virtual ~Exp();
};
```

```cpp
class Num : public Exp {
public:
	Num(int val)
		: Exp(), val_(val)
	{}
private:
	int val_;
};
```

```cpp
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

```cpp
int main()
{
	Exp* tree = new Bin('+',new Num(42),
											new Num(51));
	delete tree;
}
```

Memory reclamation is (transitively) done through destructors.

Explicit (and recursive) **delete** instructions!

<aside>
💡 Use smart pointers

</aside>
