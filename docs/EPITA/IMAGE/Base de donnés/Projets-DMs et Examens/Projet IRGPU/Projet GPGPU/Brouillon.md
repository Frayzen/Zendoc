---
title: Brouillon
---

# Optimisations

> [!info] CUDA 4: Profiling CUDA Kernels  
> This is the fifth article in the series I have been writing about Programming in CUDA.  
> [https://medium.com/@rimikadhara/cuda-4-profiling-cuda-kernels-0664252f0ac5](https://medium.com/@rimikadhara/cuda-4-profiling-cuda-kernels-0664252f0ac5)  
  
The goal of this step is to look into different behaviors of our implementations and see where potential bottlenecks may arise.
  
For this we use Nsight Systems which provides System-level Examination. We’ve added the option
`--trace=cuda,nvtx`, specifying tracing for CUDA and NVTX runtime.
  
Overall, Nsight Systems allowed us to anaylze to areas of our implementation:
**Data Transfer Analysis:** moving data between host (CPU) and device (GPU)
**Kernel Overview:** analysis of CUDA kernels.
  
In particular, we looked at the the occupany of our implementation (how effectively we’re using the GPU’s compute resources):
1. **Memory Latency**: The time taken to access different types of memory
2. **Instruction Latency**: The time taken for instructions to complete execution
3. **Transfer Latency**: The time taken to move data between host and device
  
The first thing we realised is that memory transfer was incredibly ineffecient in our naive implementations.
  
In background Estimator we immediately recognized a bottleneck in memory transfers:
  
CUDA GPU MemOps Summary by Time (`cuda_gpu_mem_time_sum`)
|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|Time (%)|Total Time (ns)|Count|Avg (ns)|Med (ns)|Min (ns)|Max (ns)|StdDev (ns)|Operation|
|52.2|==**145,785,511**==|==**6,796**==|21,451.7|19,585.0|18,304|104,257|4,870.7|[CUDA memcpy Host-to-Device]|
|47.8|==**133,591,106**==|==**6,796**==|19,657.3|18,208.0|17,632|69,601|3,460.2|[CUDA memcpy Device-to-Host]|
  
In order to optimize the memory transfer several ideas came to mind:
1. **Memory Coalescing**
2. **Using Shared Memory**
3. **Persistent Memory**: optimizing the way memory is transferred and accessed by threads.
  
### Persistent Memory
In order to reduce initialization costs at each frame, we use persistent memory by defining several of our variables as global memory that will be re-utilized at each frame.
  
For example, in **background estimator**:
|   |   |   |   |
|---|---|---|---|
|Metric|**Before**|**Now**|**Improvement**|
|**Total Mem Transfers**|6,796|1,699|📉~75% fewer transfers|
|**Mem Transfer Time**|~270 ms|~64.4 ms|📈~76% faster|
|**Kernel Time**|~7.8 ms|~9.7 ms|📈Slight increase|
  
And in **moving average**:
|   |   |   |   |
|---|---|---|---|
|Metric|**Before**|**Now**|**Improvement**|
|**Total Mem Transfers (CUDA memcpy Host-to-Device + Device to host each)**|3,398|1,700|📉~ 50% fewer trasnfers|
|**Mem Transfer Time (total)**|~130 ms|~64 ms|📈 ~ 50% faster|
|**Kernel Time**|~5.7 ms|~9 ms|📈Slight increase|
→ Note on kernels: FIXME ANTOINE
  
Overall observations: adding persistent memory helped.
  
### Shared Memory
Another optimization we considered adding was using Shared Memory.
  
However, when looking into uses of shared memory in CUDA, we realised that it did not fit the implementation of our code. The results found with Nsight demonstarte this:
  
**Background Estimator:**
|   |   |   |   |
|---|---|---|---|
|Metric|**Before**|**Now**|**Improvement**|
|**Total Mem Transfers**|6,796|6,796|❌ no change|
|**Mem Transfer Time**|~270 ms|~273 ms|❌ no change|
|**Kernel Time**|~7.8 ms|~9.7 ms|📉 slower|
No improvement.
  
Overall observations:
In our edge case, using shared memory didn’t seem like the best choice. Our threads handle pixel by pixel while shared memory is more useful in cases where data is reused and threas within the same block need to access the same or nighbor data. It added an extra level of difficulty. Considering as well that
  
### Coalesced Memory
All our memory is coalesced which ensures that the threads within a warp access consecutive memory addresses, therefore minimizing latency.
  
### Conclusion:
FIXME