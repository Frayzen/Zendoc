---
title: Error Recovery
Owner: Matcha
---
We want to report all (syntactic) errors simultaneously.
  
## What is it ?
The process of adjusting input stream to handle errors
- Deletion
- Substitution
- Insertion
  
## Local Recovery
Adjust input at point where error was detected
==Use an error symbol ! ⇒ Try to find a synchronizing token and resume parsing!==
```Shell
exps -> exp
exps -> exps ; exp
exp -> NUMBER
exp -> exp + exp
exp -> (exps)
exp -> (error)
exps -> error ; exp
```

> [!important] error is considered a terminal symbol
  
  
## Global Recovery
Adjust input before point where error was detected
The parser finds the smallest set of insertions and deletions that would turn the input stream into a correct stream.
==Burke-Fisher error repair==
Try every single token insertion, deletion or replacement at every point that occurs no earlier than K tokens in the past. The grammar stays unmodified, only the parsing engine is modified
  
  

> [!important] An AST node must be produced for errors!