---
Owner: Matcha
---
### Turn on compiler warning
- Wall, Wextra, Werror
- fanalyze static analyzer
- fsanitize=XXX runtime verification
### Process
- write code
- test
- submit
The evaluation will not be only on the grade on the intra. The commits and code will be checked.
### Commits
- smallest possible
- serve a clear purpose
- have a meaningful message
- ref the bug / issue / other
- check before pushing
### Keep you history clean
- Have a branch for features
- Rebase on main instead of merging

> [!important] Comments are part of the documentation of the project (use doxygen to generate documentation)
  
### Carreful
- optimize after benchmarking
- use 3rd party library
- 1 function = 1 purpose
- you can use :
    - templates
    - classical inheritance
    - functional style code
- make your API hard to use wrong
    - smart pointer
    - ranges / itterator instead of ptr + size
    - enum instead of int
[https://youtu.be/LJh5QCV4wDg](https://youtu.be/LJh5QCV4wDg)