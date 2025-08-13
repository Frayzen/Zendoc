---
title: Leson 2
Owner: "Florian "
---
# **MBR (Master Boot Record)**
MBR is a disk partitioning standard that divides the disk into 512-byte sectors, reserving the first sector for the bootloader.
Since 512 bytes is insufficient for a full bootloader capable of loading the kernel, we utilize the unused space between the MBR partition table (located at the end of the first sector) and the first aligned partition to store a secondary bootloader ("Stage 1.5"). This extended bootloader has the ability to read a specific filesystem type—the one containing the initramfs binary.
# **EFI (Extensible Firmware Interface)**
EFI (or UEFI) is the successor to MBR. For backward compatibility and safety (preventing older systems from accidentally overwriting the disk), it retains a legacy MBR structure spanning the entire disk. However, the actual partitioning is defined by a GPT (GUID Partition Table).
The EFI firmware can read the GPT to locate bootable partitions and load the operating system from them, offering more flexibility and support for modern hardware compared to MBR.

> [!important] The first sector on a EFI system is likely to contain only zeros as it is able to boot from a partition directly.