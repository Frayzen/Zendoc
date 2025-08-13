---
title: Coupling Flex and Bison
Owner: Matcha
---
![[Untitled 96.png|Untitled 96.png]]

  
```Shell
$ bison -o parser.cc -d --graph tmp.yy
$ flex -o lexer.cc tmp.ll
$ g++ -std=c++20 lexer.cc parser.cc
$ echo "1+2+3+98" | ./a.out
104
$ echo "1+2+3++98" | ./a.out
1.7: syntax error, unexpected +, expecting number
0
```
![[Untitled 1 66.png|Untitled 1 66.png]]

### Summary
![[Untitled 2 47.png|Untitled 2 47.png]]

