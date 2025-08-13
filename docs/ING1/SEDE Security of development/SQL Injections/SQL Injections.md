---
title: SQL Injections
Owner: "Florian "
---
# Sql Injection
![[Untitled 160.png|Untitled 160.png]]
  
Let’s assume you coded this part of code:
  
![[Untitled 1 108.png|Untitled 1 108.png]]
## What you assume
```C
user=robin
select * from users where user=’robin’
```
## What the attacker will do
```C
user=robin’; drop all tables; --
select * from users where user=’robin’; drop all tables; --’
```
```C
user=robin’ or 1==1; --
select * from users where user=’robin’ or 1==1; --’
```
# Solutions
A bad solution can be to **quote the argument.**
Now, what about Mr O’Brien ?
  
The actual solution is one of the following:
- Use prepared statements
```C
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
- **Never** do matching against negative patterns. (_e.g, an email is NOT smt that does not contain some chars_)