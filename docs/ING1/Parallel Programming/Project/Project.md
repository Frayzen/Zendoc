---
title: Project
Owner: Tim Pearson
---
  
[[Overview]]
### Problem (1/2)
You need to code a real-time binarization algorithm (Otsu's method). Otsu's method is a simple binarization method where the threshold is defined based on histogram analysis. The method is described here.
### Input
- Histogram
- Thresholding
### Output
- Binarized image
### To be coded
The code should be written in C++ and should follow the prototype below (the transformation is done in place):
```C++
// Single threaded version (naive impl)
void otsu_baseline(ImageView<rgb8> input);
// Single threaded version (with any optimization on)
void otsu_st(ImageView<rgb8> input);
// Multithreaded version
void otsu_mt(ImageView<rgb8> input);
```
1. Basic naive version (used as reference)
2. Optimized single-threaded version (algorithmic or SIMD optimizations)
3. Optimized multi-threaded version
### Compile and run the code
```Bash
cmake -B /tmp/build -S . -D CMAKE_BUILD_TYPE=Release
cmake --build /tmp/build --target stream bench
```
Run the code on a video and display the result in FPS with GStreamer:
```Plain
/tmp/build/stream --method=base images/video.mp4
```
### Benchmarks
```Plain
shCopy code
/tmp/build/bench
---------------------------------------------------------------------------------------------
Benchmark             Time          CPU         Iterations    UserCounters...
---------------------------------------------------------------------------------------------
otsu_baseline         4.39 ms       4.38 ms     127           items_per_second=227.751k/s
otsu_st               6.67 ms       6.65 ms     86            items_per_second=149.902k/s
otsu_mt               6.67 ms       6.65 ms     86            items_per_second=149.902k/s
```
---
## Problem 2 - A Concurrent Structure for PES
You need to code a concurrent data structure to manage the Pending Event Set (PES). The goal is to manage pending events for processing concurrently.
![[Untitled 61.png|Untitled 61.png]]
**Simplified Problem: A set of 24-bit integers to be managed concurrently (addition, removal, search for the smallest element)**
### Interface
```C++
class PrioritySet {
public:
    // Returns true if the element was successfully inserted (false if already present)
    bool insert(int value);
    // Returns true if the element was successfully removed (false if absent)
    bool remove(int value);
    // Returns true if the element is present
    bool has(int value);
    // Returns the smallest element
    int get_min();
    // Returns and removes the smallest element
    int pop_min();
};
```
These operations must handle concurrent calls. If we execute 10 insertions from 0 to 9 concurrently, we should find all 10 elements at the end.
Assume `n` is atomic. If we have `k` threads executing `n += s.insert(99)` and `k` threads executing `n -= s.remove(99)`, then we should verify afterwards:
- `n >= 0`
- `n >= k` ⇒ `s.has(99) == true`
- `n == 0` ⇒ `s.has(99) == false`
The relevance of the tests will be taken into account in the grading.
### Warning
We expect a sequential consistency behavior, meaning the state of the structure should be consistent with a sequential execution of the operations.
---
## Exercise 1: Ignoring the min
If we ignore the `*_min()` operations, we can use a bitset to store the values. Note 2²⁴ = 16Mio bits = 2Mio bytes = 512 32-bit integers (atomic).
### Todo
Implement the `PrioritySet` class without the `*_min()` operation using a bitset to store the values.
---
## Exercise 2: Adding the min
We add the `*_min()` operations.
### Question
How to efficiently implement `min()` and `pop_min()`?  
How to retrieve the lowest set bit in the bitset?
### Example
Assume the integers to store are 6 bits. We can use a 64-bit bitset to store the values. To access a value, we decompose the index into 3 levels of `k=2` bits:
- Level 1: (2ᵏ)¹ = 4 bits
- Level 2: (2ᵏ)² = 16 bits
- Level 3: (2ᵏ)³ = 64 bits (the bitset)
### Hint
An index hierarchy where the position is the prefix of the next level:
---
### What are the values in this hierarchy for 6-bit integers?
We start with level 1 by finding the lowest set bit. This tells us where to search in level 2, and so on.  
Example: if the lowest bit is at position 3 in level 1, we look at the bucket of bits 12 to 16 in level 2 and find the lowest set bit, and so on.
### Question
How to search for the minimum in this hierarchy?
---
### The choice of `k` is related to:
- The number of bits you need to manage (24 bits)
- The data type on which we can perform atomic operations
The relevance of the tests will be taken into account in the grading.
### Question
What is the right choice of bucket size `k`?  
How to remove an element from this hierarchy?  
How to make all this concurrent?
### Hint
Compile and run your tests with a thread-sanitizer. If you choose `k = 6`, it's a good choice (needs to be justified).
---
### Practical Info
Groups:
- 1 group = 3-4 people to register on Moodle
### Presentation
- Presentation (20min + 5min of discussions) via Teams the week of July 15th
### Deliverables (to be submitted on Moodle)
- Source code
- Slides
---
### Grading Criteria
What is valued (non-exhaustive) beyond functional code:
### Part 1
- Explanation and design choices (parallelization patterns...)
- Benchmarks and performance
### Part 2
- Relevance of the tests (scenarios)
- Handling conflicts and concurrent accesses in a lock-free manner
  
## Workflow
### Workflow 1: Compilation
### At the root:
```Plain
shCopy code
autoreconf -i
./configure
make
```
### To compile for coverage:
You only need to run `./configure` once.
```Plain
shCopy code
./configure "CFLAGS=-g -fsanitize=address -fPIC --coverage" "LDL"
make
make check
make coverage
```
### To compile with debug flags:
```Plain
shCopy code
./configure "CFLAGS=-g"
make
gdb ./42sh
```
### To compile with ASan:
```Plain
shCopy code
./configure "CFLAGS=-fsanitize=address"
make
./42sh
```
### Creating a Unit Test
### Workflow 2:
Create a `test.c` file and write your Criterion tests inside it. Then add the following lines of code:
In `src/[Module]/Makefile.am`:
```Makefile
makefileCopy code
check_PROGRAMS = test_[Module]
test_[Module]_SOURCES = test.c
test_[Module]_CPPFLAGS = -I$(top_srcdir)/src
test_[Module]_LDADD = \
-lcriterion \
$(top_builddir)/src/[MODULE]/lib[Module].a
check-local: test_[Module]
./test_[Module]
```
Then, re-run `./configure` at the root, go to your module directory, and run `make check`.
### Doxygen
Add comments in the following format in the `.h` files:
```C
cCopy code
/**
 * \brief Description of the function
 * \fn Prototype
 * \param name1 Description of parameter 1
 * \param name2 Description of parameter 2
 * \param name3 Description of parameter 3
 * \return Description of the return value
 */
```
### Here is a concrete example:
```C
cCopy code
/**
 * \brief Creates a matrix and fills it.
 * \fn matrix_t *mat_create_fill(size_t rows, size_t columns, double *elements)
 * \param rows The number of rows.
 * \param columns The number of columns.
 * \param elements The values to fill in.
 * \return The created matrix.
 */
matrix_t *mat_create_fill(size_t rows, size_t columns, double *elements);
```
### Creating a Module
In `configure.ac`:  
Modify `AC_CONFIG_FILES` to add the path to the makefile.  
Add this line: `src/[Module Name]/Makefile`
```Plain
shCopy code
AC_CONFIG_FILES([
 Makefile
 src/lexer/Makefile
 src/parser/Makefile
 src/[Module Name]/Makefile
 tests/Makefile
])
```
In `Makefile.am`:  
Modify `SUBDIRS` and `42sh_LDADD` to add the new module.
```Makefile
makefileCopy code
SUBDIRS = src/lexer \
 src/parser \
 src/[Module Name] \
 tests/
42sh_LDADD = \
 src/parser/libparser.a \
 src/lexer/liblexer.a \
 src/[Module Name]/lib[Module Name].a
```
In `src/[Module Name]`:  
Create a directory `src/[Module Name]` and create your headers and sources. Then create a `Makefile.am` file.
In `src/[Module Name]/Makefile.am`:
```Makefile
makefileCopy code
# Name of the libraries
lib_LIBRARIES = lib[Module].a
# List of files to compile in lib[Module].a
lib[Module]_a_SOURCES = \
 [Source].c \
 [Source].h
lib[Module]_a_CPPFLAGS = -I$(top_srcdir)/src
lib[Module]_a_CFLAGS = -std=c99 -Werror -Wall -Wextra -Wvla -pedantic
noinst_LIBRARIES = lib[Module].a
```
You will then need to recompile everything (see Compilation).
### Creating a Branch
First, go to GitLab/42sh. Then go to "issues".
### Workflow 6
Create an issue.
### Workflow 7
Fill in the different fields.
### Workflow 8
Once the issue is created, you will be redirected to this page. Then create a merge request.
### Workflow 9
Fill in the fields.
### Workflow 10
You can now copy the name of the created branch.
Go to your terminal:
```Plain
shCopy code
git pull
git checkout -b [Branch Name]
```
Edit your source code, don't forget the documentation and the tests...
### Workflow 11
Once your work is finished, go to GitLab. If the pipeline is successful, you can mark your branch as "ready".
Anyone can then review your code and accept the merge request (only if the branch is ready and the pipeline is successful).
And that's it!
---
### Creating Your Own Branch:
1. Go to GitLab/42sh and create a new issue.
2. Fill in the necessary details for the issue.
3. Once the issue is created, you will be redirected to a page where you can create a merge request.
4. Fill in the merge request fields.
5. Copy the name of the created branch.
6. Open your terminal and execute:
    
    ```Plain
    shCopy code
    git pull
    git checkout -b [Branch Name]
    
    ```
    
7. Edit your source code, making sure to include documentation and tests.
8. Once your work is complete, go back to GitLab. If the pipeline is successful, mark your branch as "ready".
9. Your code can then be reviewed by others and accepted into the main branch if everything is correct and the pipeline is successful.
This should give you a clear understanding of the steps to create your own branch and follow the provided workflows.
4o