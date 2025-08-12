---
title: "SQL Injections"
---
Last edited time: April 2, 2024 4:16 PM

# Sql Injection

![Untitled](SQL%20Injections/Untitled.png)

Let’s assume you coded this part of code:

![Untitled](SQL%20Injections/Untitled%201.png)

## What you assume

```c
user=robin
select * from users where user=’robin’
```

## What the attacker will do

```c
user=robin’; drop all tables; --
select * from users where user=’robin’; drop all tables; --’
```

```c
user=robin’ or 1==1; --
select * from users where user=’robin’ or 1==1; --’
```

# Solutions

A bad solution can be to **quote the argument.**

Now, what about Mr O’Brien ?

The actual solution is one of the following:

- Use prepared statements

```c
// the better way
function ask_user_info($user)
{
	stmt = $db->prepare("select * from users where user=?");
	stmt->bind_param("s", $user);
	stmt->execute();
}
```

- Use an **ORM** (such as symfony in php)

## What to retain from that

- **Never** do matching against negative patterns. (*e.g, an email is NOT smt that does not contain some chars*)
