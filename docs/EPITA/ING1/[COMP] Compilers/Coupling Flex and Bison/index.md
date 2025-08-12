---
title: "Coupling Flex and Bison"
---
Last edited time: March 12, 2024 10:42 AM

![Untitled](Coupling%20Flex%20and%20Bison/Untitled.png)

```bash
$ bison -o parser.cc -d --graph tmp.yy
$ flex -o lexer.cc tmp.ll
$ g++ -std=c++20 lexer.cc parser.cc
$ echo "1+2+3+98" | ./a.out
104
$ echo "1+2+3++98" | ./a.out
1.7: syntax error, unexpected +, expecting number
0
```

![Untitled](Coupling%20Flex%20and%20Bison/Untitled%201.png)

### Summary

![Untitled](Coupling%20Flex%20and%20Bison/Untitled%202.png)
