---
title: AST and Visitors in TC
Owner: Matcha
---
## Example of the classes we’ll have
### For the expressions
![[Untitled 87.png|Untitled 87.png]]

For declarations
![[Untitled 1 60.png|Untitled 1 60.png]]

For types
![[Untitled 2 43.png|Untitled 2 43.png]]

Some of these classes also derive from other classes.
![[Untitled 3 34.png|Untitled 3 34.png]]

  
  
## Visitors
- ==PrettyPrinter== Pretty-printer
- ==Binder Bind== uses to declarations
- ==Renamer== Unique names
- ==TypeChecker== Annotate nodes with their type
- ==object::Binder== Bind for Object Tiger
- ==object::TypeChecker== Check types for Object Tiger
- ==overload::Binder== Bind for overloaded Object Tiger
- ==overload::TypeChecker== Check types for overloaded Object Tiger
- ==DesugarVisitor== Handling syntactic sugar
- ==object::DesugarVisitor== Desugar Object Tiger code into the non-object core
- ==BoundCheckingVisitor== Bounds checking
- ==Inliner== Function inlining
- ==Pruner== Remove useless function definitions
- ==EscapesVisitor== Escaping variables
- ==Translator== Conversion to HIR