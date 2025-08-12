---
title: "AST and Visitors in TC"
---
Last edited time: March 23, 2024 5:45 PM

## Example of the classes we’ll have

### For the expressions

![Untitled](AST%20and%20Visitors%20in%20TC/Untitled.png)

For declarations

![Untitled](AST%20and%20Visitors%20in%20TC/Untitled%201.png)

For types

![Untitled](AST%20and%20Visitors%20in%20TC/Untitled%202.png)

Some of these classes also derive from other classes.

![Untitled](AST%20and%20Visitors%20in%20TC/Untitled%203.png)

## Visitors

- PrettyPrinter Pretty-printer
- Binder Bind uses to declarations
- Renamer Unique names
- TypeChecker Annotate nodes with their type
- object::Binder Bind for Object Tiger
- object::TypeChecker Check types for Object Tiger
- overload::Binder Bind for overloaded Object Tiger
- overload::TypeChecker Check types for overloaded Object Tiger
- DesugarVisitor Handling syntactic sugar
- object::DesugarVisitor Desugar Object Tiger code into the non-object core
- BoundCheckingVisitor Bounds checking
- Inliner Function inlining
- Pruner Remove useless function definitions
- EscapesVisitor Escaping variables
- Translator Conversion to HIR
