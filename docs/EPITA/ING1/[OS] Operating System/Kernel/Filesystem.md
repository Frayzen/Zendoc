---
title: "Filesystem"
---
Last edited time: December 17, 2023 8:39 PM

# The concept

<aside>
🧠 A **filesystem** is a way to structure data on storage devices

</aside>

There is A LOT of differents filesystems. Each has different features, limits and caveats, target OS differs as well.

**Example**: different ways of handling the selection of application to open a file with. 

- Windows rely on the *extension of the file*.
- Linux rely on *Shebangs*.
- MacOS stores metadatas (such as the type of file or the program that created it) of file *alongside the file*.

Filesystems provide organization in the form of directories, files, ACLs (permissions) and many others…

<aside>
💡 The command to create filesystem in linux is ***mkfs***

</aside>

Nowadays, filesystems have a lot more features than just providing hierarchical structures.

Some like **ZFS** or **btrfs** go into volume management territory like:

- Logical volumes (*the idea is to subdivide a filesystem into different space area to dynamically allocate memory depending on the requirements of each area*)
- Checksuming (*if a sector is corrupted, the system can detect it by “[checksuming](https://www.howtogeek.com/363735/what-is-a-checksum-and-why-should-you-care/)” it. btrfs is good at it. It informs the user that the disk is dying before too late* )
- Copy-on-write & snapshoting ( *instead of modifying the file, a new version is created allowing the computer to never lose the file even if the computer shuts down abruptly* )
- Software RAID ( *filesystem on several disk. The filesystem can be duplicated or extended on other disks…*  )

## Superblock

The superblock is the metadata of your filesystem. It generally fits a single block (*explaining its name*).

Amongst (many) other things:

- Size
- Block size: depending on the filesystem, we can gather several “sector” of the disk to create a single “block” for the file system. (*eg: ISO filesystems were initially made for CDROM wich are make of 2kb blocks*)
- Number of block free
- State (if the disk shuts down unexpectedly, I wanna know what it was doing to try to fix the potential errors)
- Root directory entry
- …

<aside>
⚠️ The corruption of your superblock makes your whole filesystem unreadable. Therefore, it is usually **duplicated a few times on disk**. The larger the partition is, the more backups is gonna be created.

</aside>

## Inode

All the metadata of a file are stored inside of an Inode. There is a fix amount of inode per filesystem. It is pre-created on filesystem creation. It is often duplicated as well…

In the reprensentation of the filesystem as a tree, the inodes represent the leafs.

It contains:

- The location of the data (*The file starts at the nth LBA*)
- The file size
- ACLs & Ownership (permissions…)
- A refcount (the number of file directory pointing to this inode [see directories](Long-Term%20Storage.md))
- Lots of other things depending on your filesystem…

When we use an inode, it can be said that we **allocate** it. When we stop using it, it can be said that we **free** it.

<aside>
🧠 There is **no filename** in an inode !

</aside>

<aside>
💡 The fs does some optimization. Given a file of 1GB, if the fs figures out that 800MB are allocated for only 0s, it while shorten the file to 200MB and just specify the number of 0s after.
- All fs don’t support that feature altough. -

</aside>

## Directories

Directories in fs are represented by tables of directory entries.

![Untitled](Filesystem/Untitled.png)

<aside>
💡 You can have **mulitple directory** **entries** pointing to **one inode** ! (*It is called **hardlink***)
You can have **multiple inode** pointing to one **file** ! (*It* *is called **symlink***)

</aside>

In the reprensentation of the filesystem as a tree, the directory represent the internal nodes.

Since data are only stored in the table, information are also stored about the directory itself inside of the table. Therefore, an entry will represent the directory in the table. An entry can even exist to represent the parent directory.

It can have a type: directory, file, symlink, char device, etc… In case of a file, it links *names* and *inode*. 

<aside>
🧠 Directories are files ⇒ they have an inode

</aside>

## UNIX Way of Life

In a UNIX system, “**everything** is a file”. What it truly means is that everything is abstracted to the userland through file-like objects. It can be:

- Actual file
- Unix sockets, Named pipe
- Devices (char devices & block device)
    - A char device is a device when the granularity is of *1 byte* (Example: a terminal)
    - A block device has a granularity of a **block** (*= any number of byte*)
- Partitions
- Even some kernel interfaces (sysfs & procfs, for example)

<aside>
🧠 This is what we call the **VFS (Virtual file system)**

</aside>

Here are a non exhaustive list of the available directories and their content

| Where ? | What ? | Info 💡 |
| --- | --- | --- |
| /dev | The devices, char and block  |  |
| /boot | The kernel (EFI system partition) |  |
| /proc | The processus running | *the content of procfs* |
| /sys | Information and configuration settings | *the content of sysfs* |

The VFS is a **logical abstraction** provided by your kernel, not real filesystem. That is what we truly talk to when using open(2) read(2)…

Filesystems are **mounted** on the VFS (*eg rootfs is mount under / directory, other filesystems can be mounted inside of anty directory, such as /proc or /sys*)

## File descriptors

A file descriptor is an integer. But what does that integer represent exactly ?

For each process, the kernel has a table of file descriptors: the **File descriptor Table**. 

File descriptors are essentially handles or references that your operating system uses to access files, sockets, or other input/output (I/O) resources. They're represented by integers. When a process opens a file, for instance, it gets a file descriptor that uniquely identifies that file within the operating system.

These descriptors are part of a table maintained by the operating system that keeps track of all the files that processes have open. Each process has its own table of file descriptors.

These integers serve as a link between the opened file and the process that opened it. So, when a program reads from a file or writes to it, it uses the file descriptor associated with that file to tell the operating system which file it wants to work with.

File descriptors also extend beyond just files – they're used for any I/O operation, like reading from a network socket or writing to a pipe. They're a fundamental part of how processes interact with I/O resources in an operating system.
