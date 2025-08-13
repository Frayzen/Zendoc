---
title: Docker
Owner: Tim Pearson
---
- I want to run a webserver quickly
- I don’t really know in details any
- I don’t want to mess with the things installed on my computer
    - Libraries, general packages …
- I just need it for some time and then forget about it
- Maybe I’ll need it again in some months
- [https://asciinema.org/a/484825](https://asciinema.org/a/484825)
  
## What is docker?
- Docker is a container engine
- It allows you to:
    - Create images
    - Start containers from those images
    - Manage containers
    - Exchange images
## What are containers and images?
- A container is “kinda” like a virtual machine but not
- A container is not a universal definition
    - We’re talking about linux containers in this course
    - different on different OSs
    - we will only focus on linux containers
- A container is essentially a process (and its sub-processes if  
    any) which is isolated
    - can behave like a process (can be started and stopped whenever)
- A container is ephemeral by design
- An image (in docker/OCI) is the source of a container
    - From an image you can create multiple containers
    - Each container is created from an image
    - See the relation like class/object in OOP
  
## Container vs VM
![[Untitled 125.png|Untitled 125.png]]
- VM uses CPU mechanisms (+ bits of hypervisor)
    - VM needs its own kernel (hardware access)
- VM can be of different architecture (x86, ARM, RISC-V, …
    - emulation
    - Virtualization, paravirtualization, emulatio
- Host (hypervisor) doesn’t have much access in the VM
    - i.e. can’t see natively its process, load, etc
- Container is simply a linux process isolated with kernel  
    mechanisms
    - not isolated the same way
- Host has full access on the container
    - because the contianer is just like a process
- VM needs to be setup with RAM amount, CPU count, disk, etc
- Container is a process. You can limit resources but not  
    mandatory
- Containers are lighter:
    - No kernel
    - Faster to start
    - Can even run without an OS
- Containers are less secure
- Containers can’t run everything (i.e. no windows on linux)
- Containers are ephemeral by nature
## Container vs regular process
- to differentiate between:
- What makes a process a container ?
- Isolation of:
    - Filesystem
    - Other running processes
        - htop in a container only shows the processes inside container
    - Users
    - And also: network, mountpoints, UTS (hostname),
- Can also have limitations (CPU, memory, etc)
- No clear way of identification
    
    - No “container id” or anything provided by the kernel
    
      
    
      
    
## Why do we use containers ?
- Control your OS (it’s in the image)
    - No dependency issue from a laptop to a server:  
        everything is in the image
    - Can have multiple libs in parallel (in different images)
- Common interface to build and run applications
- Share easily the images
    - The app and all its dependencies
- Version control
- Isolation
- Cheap
    - Quick to build
    - Quick to start
- No overhead (unlike VMs)  
    No difference between your laptop, dev server and prod  
    server
- Follow the 12 factors principles