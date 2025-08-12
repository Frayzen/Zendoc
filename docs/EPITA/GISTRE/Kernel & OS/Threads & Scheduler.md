---
title: "Threads & Scheduler"
---
Last edited time: February 27, 2025 5:36 PM

[ivan_boule_epita_gistre_cours_os_3_threads.pdf](Threads%20&%20Scheduler/ivan_boule_epita_gistre_cours_os_3_threads.pdf)

# Threads

Inside of a process, we can create independent entity which each have their own heaps and register. The address space remains the same among all entities. These entities are called **threads**.

All of the threads share the same code (not the same PC !) and the same variables (because same address space).

![image.png](Threads%20&%20Scheduler/image.png)
