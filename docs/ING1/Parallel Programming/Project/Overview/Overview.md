---
Owner: Tim Pearson
---
![[Untitled 124.png|Untitled 124.png]]
  
### Part 1: Otsu's Method for Binarization
1. **Objective**: Implement and benchmark a real-time image binarization algorithm using Otsu's method.
2. **Requirements**:
    - **Baseline Version**: A naive, single-threaded implementation of Otsu's method.
    - **Optimized Single-threaded Version**: A single-threaded version with algorithmic or SIMD optimizations.
    - **Multithreaded Version**: A multithreaded version to enhance performance.
3. **Code Structure**:
    - `otsu_baseline(ImageView<rgb8> input)`: The naive single-threaded version.
    - `otsu_st(ImageView<rgb8> input)`: The optimized single-threaded version.
    - `otsu_mt(ImageView<rgb8> input)`: The multithreaded version.
4. **Compilation and Execution**:
    - Use CMake for building the project.
    - Execute the code on a video and display the result in FPS with GStreamer.
5. **Benchmarking**:
    - Run benchmarks to compare the performance of different versions.
    - Example benchmark output:
        
        ```Plain
        plaintextCopy code
        ---------------------------------------------------------------------------------------------
        Benchmark Time CPU Iterations UserCounters...
        ---------------------------------------------------------------------------------------------
        otsu_baseline 4.39 ms 4.38 ms 127 items_per_second=227.751k/s
        otsu_st 6.67 ms 6.65 ms 86 items_per_second=149.902k/s
        otsu_mt 6.67 ms 6.65 ms 86 items_per_second=149.902k/s
        
        ```
        
### Part 2: Concurrent Data Structure for PES
1. **Objective**: Implement a concurrent data structure to manage a Pending Event Set (PES) with 24-bit integers.
2. **Requirements**:
    - Support concurrent insertion, removal, and search operations.
    - Ensure that operations are thread-safe and that the structure maintains sequential consistency.
3. **Interface**:
    
    ```C++
    cppCopy code
    class PrioritySet {
    public:
        bool insert(int value);   // Inserts an element
        bool remove(int value);   // Removes an element
        bool has(int value);      // Checks if an element is present
        int get_min();            // Returns the smallest element
        int pop_min();            // Returns and removes the smallest element
    };
    
    ```
    
4. **Implementation**:
    - Use a bitset to store values for efficiency.
    - Ensure thread safety using atomic operations and proper synchronization mechanisms.
5. **Testing and Verification**:
    - Verify that concurrent insertions, removals, and lookups work correctly.
    - Ensure the structure maintains correctness under concurrent modifications.
### File Structure
The provided file tree includes various components necessary for the implementation:
```Objective-C
objectivecCopy code
├── CMakeLists.txt                // CMake configuration file for building the project
├── CMakePresets.json             // CMake presets
├── conanfile.txt                 // Conan package manager configuration
├── images                        // Directory for test images and video
│   ├── test1.jpg
│   ├── test2.jpg
│   └── video.mp4
├── README.md                     // Project readme file
├── shell.nix                     // Nix shell configuration
└── src                           // Source code directory
    ├── argh.h
    ├── bench.cpp                 // Benchmarking code
    ├── gstfilter.c               // GStreamer filter code
    ├── gstfilter.h
    ├── Image.hpp                 // Image handling code
    ├── JobQueue.cpp              // Job queue implementation
    ├── JobQueue.hpp
    ├── logo.c
    ├── logo.h
    ├── Otsu.cpp                  // Otsu's method implementation
    ├── Otsu.hpp
    ├── resources.cpp.in
    ├── stb_image.c
    ├── stb_image.h
    ├── stream.cpp                // Main streaming application code
    └── stream.cpp.old
```
### Steps Involved
1. **Setting Up the Environment**:
    - Ensure all dependencies are installed (e.g., via `conan` and `nix`).
    - Configure the build environment using CMake.
2. **Implementing Otsu's Method**:
    - **Baseline Version**: Implement the naive version of Otsu's method in `Otsu.cpp`.
    - **Optimized Version**: Apply optimizations and implement in the same file.
    - **Multithreaded Version**: Use parallel processing techniques to improve performance.
3. **Testing Otsu's Method**:
    - Use the provided images and video to test the binarization.
    - Execute the code using the `stream` application to display the results in real-time.
4. **Benchmarking**:
    - Run benchmarks using the `bench` application.
    - Compare the performance of different implementations.
5. **Implementing PrioritySet**:
    - Implement the `PrioritySet` class with concurrent operations in `JobQueue.cpp` and `JobQueue.hpp`.
    - Ensure the implementation supports insertion, removal, and lookup efficiently.
6. **Testing PrioritySet**:
    - Write tests to verify the correctness of concurrent operations.
    - Use thread sanitizers and other tools to detect and resolve concurrency issues.
7. **Final Testing and Validation**:
    - Ensure all components work correctly together.
    - Validate the performance and correctness under concurrent conditions.
8. **Documentation and Presentation**:
    - Document the design choices, algorithms, and optimizations used.
    - Prepare slides for the project presentation.