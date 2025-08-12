---
title: "Notes"
---
Last edited time: December 17, 2023 10:57 AM

LBA = Logical Block Address

VFS = Virtual File System

INODES is the entity of the file system that points to data.

- Directories are represented by inodes
- Inodes point to file data
- Directory entries point to inodes

Some folder are root are really part of file system such as /usr/bin

But /proc of /sys let us gather some information about processes or buses.

Anytime we write in /tmp we actually write in RAM.

Aller voir la video de Guillaume Pagnoux sur Moodle

# What of the following is abstracted as a file in Linux?

- Files
- Unix sockets
- Partitions (ex: /dev/sdaX)
- Devices (in /dev/ as well)
- Pipes

# What of the following is true about file descriptors?

- They are an index into the per-process file descriptor table
- Entries in the per-process file descriptor table point to the system-wide open-file table
- Read and write functions depend on to the respective file type

File descriptors let the system to open once the file and let several process to access it thanks to file descriptors.

# Superblock

Let us find the data from the root of the disk

If the superblock is lost we can’t find the file anymore

In modern file system, we duplicate superblock

They point to inodes (that contains metadata)

Directories are inodes

DLTrees are another table linking file name to file data

We don’t want to duplicate data so several file name can point to same file data ⇒ it is the case for symlink

Hardlink are not like symlink cause it creates a reference to an existing inode. The OS is checking the number of reference to an inode before deleteing it.

# Journaling

It means writing on the disk the action you’re gonna do before doing them. It let us to execute the actions backward to recover data.

# Plus:

Begining of the disk: GUIPD Partition Table to define partitions

FreeBSD = great OS

Servers: ZFS

btrfs

**Checksuming: to research**

archlinux: tmpfs (a file system that fits in ram)

# Scheduling

p_thread stands for POSIX thread, in that way, macOS can run some C made for linux initially.

In the /proc/(PID)/ folder is contained all the ressources used by a certain process. 

Eg. In the /fd is contained all the file descriptors. 

Command for a pipe

mkfifo pipe_inter

echo hello > pipe_inter

( here the program is not exiting until someone reads the pipe content)

In another term: cat pipe_inter

both process resume

When launching a big program (eg Video Game) on Windows, the UI can get frozen for a few seconds. It is a priority issue: the ui is not prioritized by the kernel to display something.
