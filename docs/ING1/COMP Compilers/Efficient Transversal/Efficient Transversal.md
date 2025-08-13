---
Owner: Matcha
---
  
In a compiler we have a lot of AST transversal :
- Pretty-printer
- Name analysis
- Unique identifiers
- Desugaring
- Type Checking
- Escaping variables
- Inlining
- High level optimization
- Translation to intermediate  
    representation
  
## Inheritence problems
![[Untitled 94.png|Untitled 94.png]]
Too much methods, need to implement a lot of things
Obfuscate AST classes  
⇒ hard to maintain  
⇒ can no longer be generated
Spread traversal code into multiple files ⇒ Error-prone
  
==$\Longrightarrow$== ==Build an external processing==
  
# External processing
Get out of the AST everything that is not directly in correlation with the AST
![[Untitled 1 65.png|Untitled 1 65.png]]
  
## Why not using “<<”
```C++
friend ostream& operator<<(ostream& o, const Class& c);
ostream& operator<<(ostream& o, const Exp& tree) {
	return o << "Uh oh...";
}
ostream& operator<<(ostream& o, const Bin& tree) {
	return o
		<< '(' << *tree.lhs_
		<< *tree.oper_
		<< *tree.rhs_ << ')'
		;
}
	
ostream& operator<<(ostream& o, const Num& tree) {
	return o << tree.val_;
}
```
```C++
int main() {
	Bin* bin = new Bin( '+',
	new Num(42),
	new Num(51)
	);
	Exp* exp = bin;
	cout <<
	"Exp
	:
	" << *exp;
	cout <<
	"Bin
	:
	" << *bin;
	delete bin;
}
Exp: Uh oh...
Bin: (Uh oh...+Uh oh...)
```
The oprator doesn’t find the **==dynamic type==** of our type This comes from the fact that we have two types in C++ :
- **Static type :** compile time, based on the containing/variable type.
- **Dynamic Type :** run time, based on the contained / object type.
    
    → polymorphism, provided by **virtual**
    
      
    
      
    
# Seperate processing and dispatching
### Processing
- Keep it external
- Add new processings easily
### Dispatching
- Keep it internal
- All processings will be dispatched in  
    the same way: **factorize it!**
We can now add new processing easily
Unfortunatly we do not have multimethods in C++
### Simulate via trampoline
The **processing** is gonna go **ask the AST** what its type is wich will return the **right type**.
This allows us to find the dynamic type by asking the hierarchy while keeping the processing external.
  
  
## Example :
```C++
class Exp
{
public:
	virtual ~Exp() = default;
	// Define two new types for callbacks
	using bin_cb = std::function<auto (const Bin&) -> void>;
	using num_cb = std::function<auto (const Num&) -> void>;
	// Write a "dispatcher" using virtual
	virtual void dispatch(bin_cb bin, num_cb num) const = 0;
};
void Bin::dispatch(bin_cb bin, num_cb) const
{
	bin(*this);
}
void Num::dispatch(bin_cb, num_cb num) const
{
	num(*this);
}
std::ostream& operator<<(std::ostream& o, const Exp& e)
{
	e.dispatch([&o](const Bin& b) { o << b; }, [&o](const Num& n) { o << n; });
	return o;
}
std::ostream& operator<<(std::ostream& o, const Num& n)
{
	return o << n.val();
}
std::ostream& operator<<(std::ostream& o, const Bin& b)
{
	return o << *b.lhs() << ' ' << *b.oper() << ' ' << *b.rhs();
}
```