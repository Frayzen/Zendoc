---
title: "Visitors"
---
Last edited time: March 19, 2024 2:16 PM

## Goal of the visitor pattern

Define new operations without changing the classes of the elements on which we operate.

Allows adding new virtual functions to a family of classes.

Solution to multiple dispatch (multimethods) when the language does not provide it.

## Main Idea

Augment all (AST) classes with an accept method (2 lines) wich performs the dynamic dispatch and calls the correct callback

Group all processing into a single visitor class, defining a visit method for each AST class
which calls accept on the visitor.

### Example:

```cpp
class PrettyPrinter {
public:
	void visitNum(Num& e) {
		ostr_ << e.val();
	}
	void visitBin(Bin& e) {
		ostr_ << '(';
		e.lhs()->accept(*this);
		// ...
	}
private:
	std::ostream& ostr_;
	unsigned tab_;
};

class Exp {
public:
	virtual void accept(Visitor& v) const = 0;
};

class Num : public Exp {
	public:
	Num(int val)
		: Exp(), val_(val)
	{}
	void accept(Visitor& v) const override {
		v.visitNum(*this);
	}
private:
	int val_;
};

class Bin : public Exp
{
public:
	// Constructors, Destructors, and getters
	void accept(Visitor& v) const override {
		v.visitBin(*this);
	}
private:
	char oper_;
	Exp* lhs_; Exp* rhs_;
};
```

## Sequence Diagram

![Untitled](Visitors/Untitled.png)

## A class diagram: Visitor and Composite Patterns

![Untitled](Visitors/Untitled%201.png)

### Using operator “<<”

```cpp
std::ostream& operator<<(std::ostream& o, const Exp& e)
{
	auto printer = PrettyPrinter{o};
		e.accept(printer);
return o;
}

int main() {
	Bin* bin = new Bin(/*..*/);
	std::cout << *bin;
	delete bin;
}
```

# Tips and Tricks

They are similar to iterator and const_iterator → const = do not modify the structure

Use C++ templates to factor Visitor and ConstVisitor
Use C++ overloading to have only visit instead of visitBin and visitNum

If we are only interested in variable declarations… ⇒ We still have to write a full visitor

That’s why we use a DefaultVisitor! Use inheritance to process!

To optimize we can use a combinasion of visitors (not the most useful for Tiger)
