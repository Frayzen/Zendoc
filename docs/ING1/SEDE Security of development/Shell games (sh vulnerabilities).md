---
title: Shell games (sh vulnerabilities)
Owner: "Florian "
---
# argument issue
if you want to create a sh file that wraps another command. You **need** to use the ‘$@’ variable.

> [!important] It is
> 
> **not enough** to guarantee that everything goes well.
Let’s suppose a file named **s** contains:
```C
#!/bin.sh
rm "$@"
```
```Shell
./s -rf / # this is considering -rf as a modifier of rm and NOT an argument
```
## GNU introduction of vulnerability
GNU introduced **huge** vulnerabilities by allowing any order of argument and modifier in the executables (using _getopt_long_).
Hopefully, they introduced a rule allowing us to use ‘+’ symbol at the begining of the arguments to force them to be parsed **in order**.

> [!important] **tar**
> 
> and **find** commands are pretty weird function considering their way of handling arguments (tar does **not** need the ‘-’ and find is… even weirder)
## Solution
You **NEED** to use the “—” in the command to specify that the next arguments are **NOT** modifiers (such as -rf) but rather an **arguments**.
You **NEED** to use ‘set -e’ at the beggining of any **sh file**. This allows the file to be executed **as long as no command fails**. In case of any fail, the process is killed. Of course, the **conditional structures** are **not affected**.
```Shell
#!/bin/sh
set -e
# Example of very useful set -e script
mkdir myfolder
cd myfolder
# IF the mkdir function fails, we are STILL in the current directory...
rm -rf $(pwd)
```

> [!important] As a reminder, a command succeed
> 
> **only** if the return code of the command is **0**.  
> Also, **piping** command (using ‘|’) only consider the return of the **last command**.

> [!important] **But why isn’t set -e by default ?**
> 
> In any kind of interactive sell, we do not want this behavior…