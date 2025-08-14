---
title: stdlib vulnerabilities
Owner: Matcha
---
# system(3) issue
```C
int r = fork();
if (r == -1)
	err(1, "fork");
if (r == 0) {
	execlp("mycmd", "cmd", "param", ..., NULL);
	err(1, "exec");
}
int status;
r = wait(&status); // XXX
// check status
```
`wait()` waits for all children processes → some children will already be dead (zombie)

> [!important] wait includes a big issue: it wait for the first child dead.
Therefore, in the context of a bigger application, you have **no guarantee** that you’ll get the status of the program you just forked.

> [!important] Moreover, we need to consider the state of the program as unknown after the fork,
> 
> **especially the signals**. We **need** to remove the signal handlers already setup.
## Solution
A solution to this issue would be to use _waitpid(3)_ with the pid of the fork specified.
# popen(3) issue
```C
int fd[2];
int r = pipe(fd);
if (r == -1)
	err(1, "pipe");
int r = fork();
if (r == -1)
	err(1, "fork");
if (r == 0)
{
	close(fd[0]);
	dup2(fd[1],1); // XXX
	close(fd[1]);
	execlp("mycmd", "cmd", "param", ..., NULL);
	err(1, "exec");
}
close(fd[1]);
r = wait(&status); // XXX oops bad cut&paste
// check status
FILE * f = fdopen(fd[0], "r");
```
In the context of popen, we open a pipe and wait **before reading** the pipe.
That means that the child is gonna try to write on the pipe all of its output. But the pipe has a finite amount of memory. If the buffer is full, the write command will be blocking. Therefore, the wait being blocking as well, **we have a dead lock**.

> [!important] It is a bad idea to have a bidirectional pipe. That is the best idea to get a dead lock.
> 
>   
> You’d rather use two pipes.
  
We need to handle the case where 0 1 and 2 are not defined initially to stdin stdout and stderr.
popen does not handle that and if we consider a usage of the call without no fds open initially, **the line dup2(fd[1], 1) will fail**. In fact, pipe[0] = 0 and pipe[1] = 1 in this context since pipe allocates the 2 firsts available file descriptors.
## Solution
Do **NOT** assume any file descriptor

> [!important] A solution can be to use the
> 
> **close on exec** flag on our file descriptors
# Return value

> [!important] Some fork can take days or weeks to return, that is handled
- grep is one of the few command that has more than 2 levels of return (usually 0 and 1):
    - 0 if found
    - 1 if not found but everything went fine
    - 2 if an error ocured

> [!important] The exit value of a program on linux is always encoded on 1 byte.
> 
>   
> Therefore, the exit value is included between 0 and 255.