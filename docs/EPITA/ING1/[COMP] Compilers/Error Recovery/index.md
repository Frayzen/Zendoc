---
title: "Error Recovery"
---
Last edited time: March 12, 2024 10:52 AM

We want to report all (syntactic) errors simultaneously.

## What is it ?

 The process of adjusting input stream to handle errors

- Deletion
- Substitution
- Insertion

## Local Recovery

Adjust input at point where error was detected

Use an error symbol ! ⇒ Try to find a synchronizing token and resume parsing!

```bash
exps -> exp
exps -> exps ; exp
exp -> NUMBER
exp -> exp + exp
exp -> (exps)
exp -> (error)
exps -> error ; exp
```

<aside>
☝ error is considered a terminal symbol

</aside>

## Global Recovery

Adjust input before point where error was detected

The parser finds the smallest set of insertions and deletions that would turn the input stream into a correct stream.

Burke-Fisher error repair

Try every single token insertion, deletion or replacement at every point that occurs no earlier than K tokens in the past. The grammar stays unmodified, only the parsing engine is modified

<aside>
📎 An AST node must be produced for errors!

</aside>
