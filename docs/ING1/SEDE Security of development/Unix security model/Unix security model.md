---
title: Unix security model
Owner: "Florian "
---
# Access
You should check access of a file on **open action** (_more exactly at the creation of the file descriptor_). That is what makes Unix usable. You specify the flags when using the _open(2)_ function.
```Shell
int fd = open("/tmp/foo", O_WRONLY|O_CREAT|O_EXCL);
```

> [!important] O_EXCL specify that the file should not exist.
An exception is made for **exec**. Unix decided to not ask for a file descriptor when using _exec(2)_ functions.

> [!important] If you are root, u
> 
> **cant** use open to check for writes and **need to use access**.
## Order of access
1. If you are root, you can
2. If you are the owner of the file, check for owner bits
3. If you are in the group of the file, check for group bits
4. Otherwise, check for the remaining bits

> [!important] If you are the owner
> 
> **and** in the group, the permission of the owner takes the lead.
## Issue when being root (Priv Drop)
You should be really careful when creating a software supposed to run as root.
The mechanism of **Priv Drop** is really useful in this context to prevent dangerous behaviors.
- Start as root since it is absolute on the system
    
    - Exception on Read Only Medias
    - Exception on Network (fds).
    
    > [!important] Any PID under 1024 can only be killed by root.
    
- Do privileged operation yielding fds
- … Then change identity !
    - Using the functions _setgroups setresgid setresuid_ **in that order.**
- **The fds are still available !**
In this context, all of the initialization should be made at the very beginning of the program. One should focus on having the least amount of code running as root.
### What about setuid ?
![[Untitled 161.png|Untitled 161.png]]
You are encouraged to read the **intro(2)** and **setuid(2)**.
# Designing software
The notion of **role** in any software is an identity that can:
- do thinks
- access data (_write and read_)
The more complex the code, the less right is should have.
You also should always sanitize input once thoroughly.
Separate roles should run as separate uses. That is why it should always be simple to create users. You also should never reuse users for something else.

> [!important] The technical term for modern software with roles is
> 
> _privilege separation_

> [!important] There exist a user
> 
> **nobody** in any linux. You should **never use** it because its access is restrained to nfs.