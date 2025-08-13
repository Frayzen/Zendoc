---
Matière:
  - "[[Déploiement et Virtualisation]]"
Type: Cours
Date du cours: 2025-02-27
Supports:
  - "[[presentation_slides_compressed.pdf]]"
---
# Challenges de Déloppement et de Déployement
  
![[image 84.png|image 84.png]]
Beaucoup de solutions, certaines bonnes et certaines mauvaises.
Ce qu’on vuet réeellemnt
- Notre développement & stack logiciel produit
- Notre OS & stack logiciel utilisateur
![[image 1 17.png|image 1 17.png]]
![[image 2 17.png|image 2 17.png]]
Matrice de déploiment de l’enfer.
  
# Solutions
## Conteneurs
![[image 3 14.png|image 3 14.png]]
Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), and start almost instantly.
## Machine Virtuelle
![[image 4 13.png|image 4 13.png]]
Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, one or more apps, necessary binaries and libraries - taking up tens of GBs. VMs can also be slow to boot.
La limite de cette approche est l’espace de stockage. Et on a une consommation de RAM et CPU qu’il faut gérer et organisé pour chaue utilisateur. Il faut démarer le noyau à chaque fois.
  
# Docker Internals
  
Virtualization is performed by a special software: a hypervisor.
Virtualization requires hardware support like Intel-VT, AMD-V, etc.
Type-1, native or bare-metal hypervisors
These hypervisors run directly on the host’s hardware to control the hardware and to manage guest operating systems.
Examples: Nutanix AHV, AntsleOs, Xen, XCP-ng, Oracle VM Server, Microsoft Hyper-V, VMware ESXi
Type-2 or hosted hypervisors
These hypervisors run on a conventional operating system (OS) just as other computer programs do. A guest operating system runs as a process on the host.
Examples: VMware Workstation, VMware Player, VirtualBox, Parallels Desktop for Mac, QEMU
  
Under the hood, Docker is built on the following components:
- The Go programming language
- The following features of the Linux kernel:
- namespaces,
- cgroups
- capabilities
- (Seccomp, SELinux, AppArmor)...
- The following Open Container Initiative specifications:
- runtime (ie container)
- image
- distribution
## Namespace
According to man namespaces:
A namespace wraps a global system resource in an abstraction that makes it appear to the processes within the namespace that they have their own isolated instance of the global resource. Changes to the global resource are visible to other processes that are members of the names- pace, but are invisible to other processes.
namespaces supported by Docker
- `pid` processes inside the container will only be able to see other processes
- `inside` the same container / pid namespace.
- `network` the container will have its own network stack.
- `mount` the container will have an isolated mount table.
- `ipc` processes inside the container will only be able to communicate to
- `other` processes inside the same container via system level IPC.
- `uts` the container will have its own hostname and domain name.
- `user` the container will be able to remap user and group IDs from the host to
- `local` users and groups within the container.
- `cgroup` the container will have an isolated view of the cgroup hierarchy.
  
## Cgroups
According to man cgroups:
cgroups (abbreviated from control groups) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, etc.) of a collection of processes.
Features
- Resource limiting groups can be set to not exceed a configured memory limit, which also includes the file system cache
- Prioritization some groups may get a larger share of CPU utilization or disk I/O throughput
- Accounting measures a group’s resource usage, which may be used, for example, for billing purposes
- Control freezing, checkpointing and restarting groups of processes
To better understand
- Explore /sys/fs/cgroup, cgroups virtual file system
- docker inspect some container
- for each process: /proc/$PID/cgroup
Available controllers
- memory Report and limit of process memory, kernel memory, and swap used.
- devices Control which processes may create (mknod) devices as well as open them for reading or writing.
- cpu, cpuacct Account for CPU usage by groups of processes.
- cpuset Bind the processes in a cgroup to a specified set of CPUs and NUMA nodes.
- freezer Suspend and restore (resume) all processes in a cgroup.
- net_cls Place a classid on network packets created by a cgroup. Can then be used in firewall rules.
- blkio, io Control and limit access to specified block devices by applying IO control in the form of throttling and upper limits.
- perf_event Allow perf monitoring of the set of processes grouped in a cgroup.
- net_prio Allow priorities to be specified, per network interface, for cgroups.
- hugetlb Limit the use of huge pages by cgroups.
- pids Limit the number of process that may be created in a cgroup (and its descendants).
- rdma Limit the use of RDMA/IB-specific resources per cgroup
  
## Capabilities
### According to `man capabilities`:
Traditional UNIX implementations distinguish two categories of processes: privileged (PID = 0) and unprivileged processes (PID ≠ 0). Privileged processes bypass all kernel permission checks, while unpriv-ileged processes are subject to full permission checking based on the process’s credentials (usually: effective UID, effective GID, and supple-mentary group list).  
Starting with kernel 2.2, Linux divides the privileges traditionally associated with superuser into distinct units, known as capabilities, which canbe independently enabled and disabled. Capabilities are a per-thread attribute.
### Capabilities list
![[image 5 13.png|image 5 13.png]]