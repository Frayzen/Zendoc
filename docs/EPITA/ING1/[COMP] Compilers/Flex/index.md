---
title: "Flex"
---
Last edited time: March 12, 2024 9:57 AM

![Untitled](Flex/Untitled.png)

## Flex file

```jsx
%{
[pre-code C (nec. def.)]
%}
[definitions and options]
%%
[rules]
%%
[post-code C (subprograms)]
```

### Structure

- C declarations, prologue and custom code are copied to the lexer verbatim and can be used for auxiliary functions, global variables…
- Definitions can be used specify regex shorthands.
- Rules have the form pattern { action } where pattern is a regex and
action is C/C++ code.

### Details

- yytext the recognized text
- yyleng the size of the recognized text
yylex starts the scanning
- yywrap called when the end of the text to analyze is encountered. Can be refined if
needed.
- For each of matched regexps one can return and identifier (a token)

***Bison (the parser) will analyze this stream of tokens…***

## Careful

**Rules order :** Always start by the more specific rule!

**Reentrency :** Problems may occur when using simultaneously multiple instances of the lexer

![Untitled](Flex/Untitled%201.png)
