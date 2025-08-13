---
title: Threads & Scheduler
Owner: "Florian "
---
![[ivan_boule_epita_gistre_cours_os_3_threads.pdf]]
# Threads
Inside of a process, we can create independent entity which each have their own heaps and register. The address space remains the same among all entities. These entities are called **threads**.
All of the threads share the same code (not the same PC !) and the same variables (because same address space).
  
![[image 7.png|image 7.png]]