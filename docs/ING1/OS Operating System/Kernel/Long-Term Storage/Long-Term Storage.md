---
title: Long-Term Storage
Owner: "Florian "
---
# Storage device
![[Untitled 140.png|Untitled 140.png]]
## Secondary storage (or mass storage)
A lot of different norms & physical connections throughout decades.
The main ones:
- ATA (**oldest,** from 1986)
    - Very simple to use and cheap but does not handle “ejectable” (CDROM…)
- Parallel ATA (IDE)
    - Sends data in a parallel way (all wire represent a bit)
    - Issue: magnetic field created by the wires implies a limited frequency.
    - Only [[Intro]]
- SCSI (from 1986, side to side with ATA)
    - Got lots of evolution, lots more freature than ATA
    - Lots of command you can send to your disk
    - Expensive
- ATAPI (_ATA with Packet Interface_)
    - SCSI was nice but the hardware super expensive ⇒ just send SCSI commands over ATA commands
    - That’s why we can see IDE naps linked with CDROMs. 😉
- SATA (First version in 2000)
    - Incremental updates on it. First version is 1Gb/s, Now 6Gb/s
    - NCQ (Native Command Queuing) featutre: the disk controller (AHCI) optimizes the moves of the **head** based on the queue to avoid wasting too much time moving. (Command queue allows 32 entries)
    - hot plugging feature: you **should** be able to plug a cable in the disk while the computer is up and be able to read on it.
    - Still uses ATA & ATAPI commands for backward compatibility (Still _SCSI commands_)
    - It is now is serie: a single wire sends all the bits ⇒ enables higher frequencies
- NVMe (Non volatile memory Express = SSD memory ) also over PCIe
    - [[Intro]], very low latency, very long command queues (More than 65 000 entries)
    - Communication over the PCIe bus (The faster bus of the computer) = 64GBytes/s.
  
### Similarities
**LBA**
- Disk are usually divided in blocks of fixed size
- When doing a disk operation, you must specify the block you want to readwrite… You chose it with a LBA (Logical Block Adress)
You talk to a **Controller that manages the disk:**
- Your kernel never talks with the drives directly. (NVMe includes the controller inside of the disk ⇒ no need to change motherboard if you change disk).
- Everything goes through controllers to wich it gives order.
  
## Kernel abstraction
Disks are divided in _blocks_ or _sectors._ They are often called **block devices**. Therefore, the kernel only sees the disk as container of several “ Blocks “.

> [!important] The kernel has an abstraction called the
> 
> **Block Layer**. It allow other subsystems (like the user) to ineract with those devices in a generic way.
Linux implements a generic interface to communicate with this blocks (since it’s more or less always the same kind of command that we send to the disks…). It automatically transfers the commands to the right driver that knows how to proceed.
  
# Partitions
Disk are divided into several part called **partition**.
It allows us to have several [[Filesystem]] per disk.
Each partition has:
- a starting LBA
- a size (in disk blocks)
- a type
- some flags… (Eg. bootable partition)

> [!important] The first code that gets executed is called firmware (BIOS, EFI). It checks that your memory is working good, that the alimentation is stable, wich partition to boot on etc…
There exists different **layout**:
### MBR
The MBR (==the blue part==) is an old (_but still used_) way of holding the information on how the disc's sectors (aka “blocks”) are divided into partitions, each partition notionally containing a [[Filesystem]].
- Legacy boot sector format
- First sector of the disk (512 bytes), loaded by the BIOS.
- 440 bytes for boot routine (usually used to load an actual bootloader). Main role is **often** (but not always) to load a real BootLoader such as GRUB that is larger.
- 4 primary partitions table entries followed by a MBR signature. (_Possibility to have extended partitions if you need more = basically a pointer to another table elsewhere on the disk_)

> [!important] A partition has a maximum size of 2TB
  
![[Untitled 1 94.png|Untitled 1 94.png]]

> [!important] An entry is a part of memory that stores the begin, length and metada of the partitions.
## **GPT**
It is a modern way of partionning, with EFI firmwares. It has up to 128 entries and duplicates its table for robustness (to avoid corruption).
- Each LBA represent a block.
- MBR is still present.
- We can set some partition as “EFI boot partition” (EBP) = system can boot from those partitions. There is _no bootloader_ required anymore.
- Theorical maximum size of a disk is 9 billions TB.
  
![[Untitled 2 69.png|Untitled 2 69.png]]