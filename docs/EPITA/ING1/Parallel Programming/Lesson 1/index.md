---
title: "Lesson 1"
---
Last edited time: May 27, 2024 4:05 PM

## Flynns Taxonomy

- classification of computer architectures
- used as a tool in the design of modern processors and their functionalities

### Definitions

- data streams -  a continuous sequence of data elements that are processed in a structured manner by a computer system.
- cache miss - CPU attempts to access data that is not currently in the cached memory
    - CPU has cache memory (L1, L2, L3, etc)
    - if data is not found in cache need to fetch it from main memory (slower)\
- pipeline flush - also known as pipeline stall or pipeline bubble, refers to the process of discarding or invalidating the instructions currently in the pipeline and resetting it to a known state. This typically occurs when there's a condition that prevents the pipeline from continuing its normal opipeline flushperation, such as a branch misprediction or data hazard.

### SISD

- Single instruction stream, single data
- sequential computer which exploits no parallelism

### SIMD (Single instruction stream, multiple data)

- A single instruction is simultaneously applied to multiple different data streams
- subdivided into three further categories
    - **Array Processor** - these receive the **one (same) instruction** but each parallel processing unit has its own separate and distinct memory and register file.
        - Rendering an Image
    - **Pipelined processor** – These receive the **one (same) instruction** but then read data from a central resource, each processes fragments of that data, then writes back the results to the same central resource.
        - overlapping instructinos so they are in different stages of execution simultaneously
        - example
            
            ![Untitled](Lesson%201/Untitled.png)
            
    - **Associative processor** – These receive the **one (same) instruction** but in each parallel processing unit an *independent* decision is made, based on data *local* to the unit, as to whether to perform the execution or whether to skip it. In modern terminology this is known as "predicated" (masked) SIMD.
    
    ### **MISD (Multiple instruction streams, single data )**
    
    - Multiple instructions operate on one data stream. This is an uncommon architecture which is generally used for fault tolerance. Heterogeneous systems operate on the same data stream and must agree on the result.
    - Examples include the [Space Shuttle](https://en.wikipedia.org/wiki/Space_Shuttle) flight control computer.

### MIMD (**Multiple instruction streams, multiple data)**

- Multiple autonomous processors simultaneously execute different instructions on different data. MIMD architectures include [multi-core](https://en.wikipedia.org/wiki/Multi-core) [superscalar](https://en.wikipedia.org/wiki/Superscalar) processors, and [distributed systems](https://en.wikipedia.org/wiki/Distributed_system), using either one shared memory space or a distributed memory space.

![Untitled](Lesson%201/Untitled%201.png)

## Practical Example

```cpp
long myaoti(const char* str)
{
	long res = 0;
	bool is_negative = 1;
	if (*str == '-') {
		is_negative = true;
		str++;
	}
	for (; *str; str++)
		res = (res * 10) + (*str - '0');
	return is_negative ? -res : res;
}
long sum_string_vector_ref(const char* strings[], std::size_t n) {
	long sum = 0;
	for (std::size_t i = 0; i < n; ++i)
		sum += myatoi(strings[i]);
	return sum
```

## Benchmark

Benchmark                              Time              CPU Iteration

 bench/reference/1000               0 ms       0 ms 33696 45.8368M items/s
bench/reference/10000             0 ms       0 ms 1778 24.2266M items/s
bench/reference/100000         12 ms     12 ms 58 8.17872M items/s
bench/reference/1000000     121 ms   121 ms 6 7.89396M items/s
bench/reference/10000000 1215 ms 1211 ms 1 7.87629M items/s

- The benchmark results show a general trend of increasing execution time and decreasing throughput as the dataset size grows larger. This is expected, as larger datasets require more computational resources and time to process.

### Perf Stat

![Untitled](Lesson%201/Untitled%202.png)

- Task Clock - totoal amount of time spent executing the task
- CPU Utilization - average CPU utilization
- Context Switches - occurs when the operating system switches the CPU from one task to another
- CPU Migrations - CPU Migrations: CPU migrations refer to moving a process from one CPU to another
- Page Faults - occur when a program tries to access a portion of memory that is not currently in physical RAM and needs to be loaded from disk
- Cycles - total number of CPU cycles executed during the task
- Instructions - total number of instructions executed by the CPU during the task
- Branches - total number of branches executed
- Branch Misses - occur when the CPU's branch prediction mechanism fails to predict the next branch correctly
- L1-dcache Loads and Load Misses - total number of loads and load misses in the Level 1 data cache
- LLC Loads and Load Misses - total number of loads and load misses in the Last Level Cache (LLC)
- Time Elapsed -  total time elapsed during the execution of the task

![Untitled](Lesson%201/Untitled%203.png)

- As the number of items increases, the rates of L1 cache loads and LLC loads decrease significantly.
- The miss rates for both L1 cache and LLC increase as the number of items increases.
- suggests that as the workload becomes heavier (more items to process), the cache effectiveness decreases, leading to more cache misses. This results in a decrease in the overall speed of processing, as more data needs to be fetched from main memory, which is slower compared to cache access.
- In summary, the decrease in speed as the number of elements increases is likely due to the diminishing effectiveness of the CPU caches in handling larger workloads, leading to higher cache miss rates and increased memory access latency.

![Untitled](Lesson%201/Untitled%204.png)

### Data Generation Example

```cpp
//Before:
const int N = 1e7;
vector<string> data;
vector<const char*> strings;
for (int i = 0; i < N; ++i)
{
	int number = randomint();
	data.push_back(to_string(number));
	strings.push_back(data[i].c_str());
}
shuffle(strings.begin(), strings.end());

//After:
const int N = 1e7;
vector<string> data;
vector<const char*> strings;
for (int i = 0; i < N; ++i)
{
	int number = randomint();
	data.push_back(to_string(number));
	strings.push_back(data[i].c_str());
}
```

### Take Home Message

1. A program can be memory- or cpu- bandwith limited.
2. The first case occurs more often so use cache coherent data structures (if possible):
• list -> vector or deque
• map, unordered-map, set, unordered-set
3. Data and cache is of prime importance (even more in a multithreaded context -see later-).
• Parallelization is worth-less if the data layout is not adapted
• You can get more speed-up with a proper data layout

 Caches

## Caches and ILP (Instruction Level Parallelism)

### Out-of-Order Execution (OoO)

- Modern processors employ out-of-order execution to maximize performance by dynamically reordering instructions to utilize available resources more efficiently.
- Instead of strictly following the original order of instructions, the processor analyzes dependencies and executes instructions that are not dependent on each other simultaneously or out of order.
- This technique allows the processor to exploit parallelism and overlap the execution of independent instructions, reducing idle time and improving overall throughput.
- Example:
    - given we have three arms
        - grab products
        - slice products
        - other tasks
    - since certian tasks have dependecies, we can utilize OoO to minimize Idle time for tasks or use the idle time to complete indpendent tasks
    

### ILP Example

![Untitled](Lesson%201/Untitled%205.png)

# Hardware Parallelism

## Pipeline

Pipeline RISC:

- IF: Instructions are serially fetched
- ID: Instructions are decoded (ID) and register are affected
- EX: Instruction Executed by an Unit (EX):
- MEM: LOAD or STORE from memory
- WB: Store a result in a register

![Untitled](Lesson%201/Untitled%206.png)

## Feeding the Pipeline

1. Data-dependent instructions is not ILP-friendly.
2. Branching (JUMP/IF) in not ILP-friendly (a branch-miss implies a pipeline flush)

**What the processor can do ?**

1. Use out-of-order execution
2. Do speculative-branching and branch-prediction.

**What you (or your compiler) can do:**

1. You can break data-dependant instructions
2. You can avoid branching

## Back to ATOI

Note: strings are NULL-terminated, have NULL beyond the end, and have SBO (Small Buffer Optimization)

1. Test if negative
2. Advance char pointer till NULL, computing x = x * 10 + k
3. Test if negative and returns -x or x

### Version 1 Reminder

1. **Test if negative**: This version checks if the input string represents a negative number by examining the first character. If it's '-', the negative flag is set, and the pointer is advanced.
2. **Advance char pointer till NULL**: The pointer is incremented until the end of the string ('\0') is reached, and during each iteration, the value is converted to an integer and added to the result after multiplying by 10.
3. **Return negative or positive result**: If the negative flag is set, the result is negated before returning.

```cpp
long res = 0;
bool negative = false;
if (*str == '-') { negative = true; str++; }
for (; *str; str++)
	res = res * 10 + (*str - '0');
return negative ? (-res) : res;

```

- Computes the result by iteratively advancing the character pointer, multiplying each digit by its corresponding power of 10.
- Returns the computed result, negated if the original string was negative.

### Version 2 Length Based

![Untitled](Lesson%201/Untitled%207.png)

- Uses a length-based approach to optimize string parsing, jumping to specific cases based on the string's length.
- Implements optimized multiplication by precomputing values based on the string's length and digit positions.

### Version 3 Reverse Length

![Untitled](Lesson%201/Untitled%208.png)

- Similar to Version 2, but with a reversed approach where it checks the length from the end of the string.
- Adjusts the multiplication factor based on the digit's position to optimize performance for different string lengths.

### Version 4 Reverse Iteration

![Untitled](Lesson%201/Untitled%209.png)

- Implements a multiplication optimization strategy that divides the computed result by a divisor, improving efficiency.
- Handles string parsing by directly accessing individual characters and performing arithmetic operations accordingly.

### Which one is the fastest ?

![Untitled](Lesson%201/Untitled%2010.png)

The fastest version is from 31% to 2X faster than the naïve one

![Untitled](Lesson%201/Untitled%2011.png)

- Algorithm 2 tests length increasingly: 7+ comparisons in 95% of cases
- Algorithm 3/4 test length decreasingly: 1 or 2 comparisons in 95% of cases

![Untitled](Lesson%201/Untitled%2012.png)

### About Version 4

- We avoid the integer division that would be required in 47% of cases
• We favor an integer multiplication required in 53% of cases, the division in only required in
5% of cases

## ILP Conclusion

You can get huge speed-up by organizing your program to favor ILP:

- Avoid data dependancy
- Avoid branches as much as possible
- Organize branches w.r.t the data:
    - Profiled-guided optimization can do that
    - Some compiler annotation can be used .e.g. __builtin_expect(...)
    

# Vector Processing (DLP)

- Processors have Intructions-Level Parallism with OoO.
- Most processors provide SIMD extensions:
    
    ![Untitled](Lesson%201/Untitled%2013.png)
    
- note GPU follows Single Input Multiple data
