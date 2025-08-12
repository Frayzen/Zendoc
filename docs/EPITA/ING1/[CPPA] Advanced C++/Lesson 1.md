---
title: "Lesson 1"
---
Last edited time: May 22, 2024 3:36 PM

[Introduction](Lesson%201/Introduction.md)

## Rule o 0/3/5

If your class defines ANY of Destructor/Copy Constructor/Copy Assign-ment/(Move Constructor/Move Assignment) it must define ALL. Preferable, you need none of them.

```cpp
~my_class(), my_class(const my_class& other),
my_class& operator=(const my_class& rhs), my_class(my_class&& other),
my_class& operator=(my_class&& rhs)
```

## lvalue vs rvalue

![Untitled](Lesson%201/Untitled.png)

**lvalue:** A variable

**prvalue:** Expression returning an object

**xvalue:** A variable marked temporary by std::move

### Move assignment: Stealing assignment

![Untitled](Lesson%201/Untitled%201.png)

```cpp
class my_class{
private:
	std::vector<int> v_;
	std::map<int, std::string> m_;
// ...
public:
	std::vector<int>& v();
	const std::vector<int>& v() const;
// ...
};
// Somewhere we have my_class compute_instance();

auto c1 = my_class();
c1.v() = compute_instance().v();
```

***Which special member of vector<int> is called?***

**Copy Assignment**, that defies the whole point of rvalues. 

`c1` is a lvalue

`compute.instance()` is a rvalue

We need to propagate the value category to the members!

```cpp
class my_class{
private:
	std::vector<int> v_;
	std::map<int, std::string> m_;
	// ...
public:
	std::vector<int>& v() &;
	const std::vector<int>& v() const &;
	**std::vector<int>&& v() &&; // Note &&**
// ...
};
```

Otherwise, you would have to

```cpp
auto c1 = my_class();
auto tmp = compute_instance().v();
c1.v() = std::move(tmp);
```

To go further:

[C++23's Deducing this: what it is, why it is, how to use it - C++ Team Blog](https://devblogs.microsoft.com/cppblog/cpp23-deducing-this/)

```cpp
class my_class{
private:
	std::vector<int> v_;
	std::map<int, std::string> m_;
// ...
public:
	my_class(const std::vector<int>& v, const std::map<int, std::string>& m)
		: v_{v}
		, m_{m}
	{}
std::vector<int>& v() &;
const std::vector<int>& v() const &;
// ...
};

using li = std::initiliazer_list<int>;
using lm = std::initiliazer_list<std::map<int, std::string>>::value_type>>;
auto c1	= my_class(li{1,2,3}, lm{{1,"abc"}});
```

***Which operators are called?***

For vector/map **Ctor** (From initializer list), **Copy ctor** and **Dtor** are called ⇒ Waste

```cpp
class my_class{
private:
	std::vector<int> v_;
	std::map<int, std::string> m_;
// ...
public:
	my_class(const std::vector<int>& v,	const std::map<int, std::string>& m);
	my_class(const std::vector<int>& v,	std::map<int, std::string>&& m);
	my_class(std::vector<int>&& v, const std::map<int, std::string>& m);
	my_class(std::vector<int>&& v, std::map<int, std::string>&& m);
// ...
};
```

***Which operators are called?***

For vector/map **Ctor** (From initializer list), **Move ctor** and **Dtor** are called
That is better, yet **not optimal**

```cpp
class my_class{
private:
	std::vector<int> v_;
	std::map<int, std::string> m_;
// ...
public:
	template<class X, class Y>
	my_class(X&& x, Y&& y)
		: v_{std::forward<X>(x)}
		, m_{std::forward<Y>(y)}
	{}
// ...
};

auto v1 = std::vector<int>{1,2,3};
auto c1 = my_class(li{1,2,3}, lm{{1,"abc"}});
auto c2 = my_class(v1, c1.m());
```

***Which operators are called?***

**Ctor** (From initializer list) and **Copy Ctor**

When applied to an **actual type** && signifies that it is an rvalue
When applied to a **template parameter** && signifies universal / forwarding reference

That is the value category is deduced to the value category of the argument on the call-site.
You need to use `std::forward` to propagate the information (Note the difference to `std::move`)
This is also the main difference between `push_back` and `emplace_back` of containers.

## Variadic templates and perfect forwarding

```cpp
class my_class{
private:
	float f_;
	int i_;
	char c_;
	public:
	c(float f, int i, char c);
};

auto v = std::vector<my_class>;
auto c = my_class(1.f, 1, 'a');
v.push_back(c);
```

push_back calls the **Copy ctor**

```cpp
v.emplace_back(2.f, 2, 'b');
```

Tricky: In the definition of `std::vector<T>::emplace_back` number AND type of arguments unknown !

### Variadic templates

```cpp
template< class... Args >
T& emplace_back( Args&&... args );
```

<aside>
☝ Note the ellipsis (the …). It indicates that possible multiple (or none) arguments of possibly different type are grouped into a parameter pack.

</aside>

To use the pack or apply a action to each of them, the ellipsis is on the right

```cpp
template< class... Args >
T& emplace_back( Args&&... args ){
// Make sure there is enough place
auto* tptr = new(alloc_()) T(std::forward<Args>(args) ...);
return *tptr;
}
```

`std::forward` ensures that the each type is forwarded with exactly the same qualifiers and value category.

### Template Heritage

```cpp
struct NoBase{};
template<class BASE = NoBase>
struct animal : public BASE{
	float weight_;
	template<class... ARGS>
	animal(float weight, ARGS&&... args)
		: weight_{weight}
		, BASE(std::forward<ARGS>(args)...)
	{}
};

template<class BASE = NoBase>
struct human : public BASE{
	using date = std::tuple<int, int, int>;
	std::string name_;
	date bday_;
	template<class N, class D, class... ARGS>
	human(N&& name, D&& bday, ARGS&&... args)
		: name_(std::forward<N>(name))
		, bday_(std::forward<D>(bday))
		, BASE(std::forward<ARGS>(args)...)
	{}
};
template<class BASE = NoBase>
struct employee : public BASE{
	int id_;
	template<class... ARGS>
	employee(int id, ARGS&&... args)
		// ...
```

```cpp
auto emp1 = employee<human<animal<>>>(96352, "john",
																std::forward_as_tuple(8,10,1987), 79.5f);

auto emp2 = employee<animal<>>(96353,	4236.5f);
```

**Variadic templates** allow you to **take what you need** and **pass on the rest**.
