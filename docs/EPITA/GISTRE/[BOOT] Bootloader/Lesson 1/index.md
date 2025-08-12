---
title: "Lesson 1"
---
Last edited time: May 23, 2025 11:37 AM

# Memories

**ROM**

- Read only
- Writing on it = burning component, can’t be reversed
- Filled by manufacturers

**EEPROM**

- Just like ROM
- Can be overwritten (but not meant to be often) ~ 1000 times
- Preferred mainly for future patches

**SRAM**

- 6 transistor
- Takes space and does not scale well
- Very fast and multipurpose
- Used on L1 L2 L3 cache and CPU registers

**DRAM**

- Only 1 transistor and 1 capacitor
- Requires refresh cycles to not let the capacitor weaken
- Slower and cheaper to scale

**FLASH (***NOR / NAND*)

- Basically an *EEPROM* of better quality ~ up to 10 000 overwrites

<aside>
📌

The NOR is not used much anymore as NAND is smaller to manufacture. However, NAND requires block addressing.

</aside>

**HDD**

- Mechanical

**SDD**

- NAND again
- S. M. A. R. T (not standard)
- Either SATA (M2) or PCI-E (nvme)

<aside>
📌

SCSI commands are transmitted over SATA using the ATAPI protocol

</aside>

# ISA (Instruction Set Architecture)

MAinly of 3 kinds:

- **ARM**
- **x86-64 (AMD64 / Intel 64)**
- **x86 (Intel/AMD 32-bit)**

The two later being similar

# Communication

**Problem:** how to set registers on another device ?

- **Intel with port IO**: few instructions in the architecture (inb/outb)
- **MMIO** (memory mapped IO): assume all memory in a range will go on the bus but instead of reaching the RAM it goes to the associated MCU.

mmu = addressage virtuel

device tree is description of where each device on each range.

it is a tree because we can have several components behind a single one.

example: usb controller → it can redirect to multiple usb devices (think about usb splitter tools)

the device tree exists in two versions: one human readable (DTS) and one kernel targetted (DTB). 

## ACPI

It is a standard that defines where the data will be located. It was originally created to manage the state of external devices (eg: hard drive doing something and suddenly powers off, we want to know its state at any time).

Mainly supported on x86 and AMD 64, not much ARM.

It is a mechanism to discover and locate devices. This is building the table of the range of MMIO.

# BIOS

It is a program stored in ROM on the motherboard. It will be assigned to a very low memory space (before 0xFF). The CPU then tries to jump somewhere here. The BIOS code starts with bunch of instructions jumping to the first BIOS instruction. That ensures the CPU can find the beginning of the BIOS.

The BIOS only supports a single instruction architecture set (ISA) as it is hardcoded. A motherboard is only compatible with a single kind of CPU then.

<aside>
ℹ️

You can check the BIOS-provided physical RAM map using:
`sudo dmesg | grep 'BIOS-provided\|e820’`

</aside>

# UEFI

In essence, UEFI is similar to BIOS as it is the code that make up the very first step of the boot process.

UEFI brings a standard to store secrets and secure boot principle. It can therefore check that the OS has not been modified and the boot sequence is the one intended.

# Initial ram disk

We need an utilitary to load in the early user space and which purpose is to load the kernel in the fs.

There is currently two kind of utilitary mainly used:

- Initrd
    - block device
    - fixed size
- Initramfs
    - based on cpio archive
    - based on tmpfs

They aim to load the kernel (located in `/vmlinuz` or `/boot/vmlinuz`) in RAM. The initrd or initrafs image is usually aside from the kernel (`/initramfs-linux.img` or `/boot/initramfs-linux.img`).

<aside>
💡

The /tmp is a ramfs as well

</aside>

You can check out 

`lsinitcpio /boot/initramfs-linux.img` or `lsinitramfs /boot/initramfs-linux.img`

We can among other thing notice:

- `.ko`: kernel objects
- `/usr/bin/` some binaries
- …

# Partitions

The partition table is either

- **MBR** (master boot record)
    - older
    - limited to 4 physical partitions
    - limited to 2TiB
- **GPT**
    - Newer
    - Headers are mirrored
    - UEFI
    - Mostly compatible with MBR

A partition holds a filesystem:

- ISO9660 (*readonly*)
- BTRFS
- FAT
- ZFS
- XFS
- EXT
- AFS
- VFS
