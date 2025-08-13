---
title: OpenBSD
Owner: "Florian "
---
> [!info] GitHub - openbsd/src: Read-only git conversion of OpenBSD's official CVS src repository. Pull requests not accepted - send diffs to the tech@ mailing list.  
> Read-only git conversion of OpenBSD's official CVS src repository.  
> [https://github.com/openbsd/src/tree/master](https://github.com/openbsd/src/tree/master)  
# Folders & Files
- `/arch/xxx/conf/GENERIC` for an architecture specific configuration
- `/conf/GENERIC` is the general configuration of the kernel
- `/arch/xxx/conf/GENERIC.MP` contains the multiprocessing configuration.
- `/bsd` is the kernel of the system
- `/bsd.booted` is a copy of /bsd kernel that is currently in use
- `/bsd.rd` is the ramdisk utility that contains all the tools to install the kernel
# Recompile the kernel
RTFM ([https://man.openbsd.org/release](https://man.openbsd.org/release)) or `man release` (_2 first steps only required_)
- `src/sys/dev/pci/drm`/ folder is the graphic card driver sources
- `distrib/miniroot/` folder contains most of the ramdisk scripts
  
## Steps
```Shell
$ cd /usr
$ cvs -qd anoncvs@anoncvs.fr.openbsd.org:/cvs chckout -P src
$ cd /usr/src && cvs up -r TAG -Pd
$ cd /usr/xenocara && cvs up -r TAG -Pd
$ cd /usr/ports && cvs up -r TAG -Pd
```
## Tips
`nm -go *.o | grep sys_write` : prints int which .o file the sys_write function is defined
`boot -v -c` to reboot in autoconf mode and be able to set verbose mode
`make obj` is often more used that just `make`
# Pinsyscalls
The pinsyscalls is a system that registers the precise locations of the syscalls in the address space. It is called by the dynamic linker [ld.so](http://ld.so) and inside the kernel.
`/usr/src/sys/sys/syscall_mi.h:86` instead of `goto die` do `return 0`
# Which
https://github.com/openbsd/src/blob/master/usr.bin/which/which.c
There’s an implementation in C.
**Exercise:** recreate the `which` command using **Borne Shell**.
In the C implementation, the `__progname` contains the name of the program calling it.
## Tips
`cron` is a daemon & util present in all linux system to allow a user to schedule scripts (every _x_ time)
```Shell
#!/bin/sh
dir=`mktemp -d /tmp/mytest.XXXXXXX`
trap "rm -rf $dir" EXIT INT HUP QUIT
fulldir=$dir/1
for cmd in /usr/bin/which mywhich
do
	mkdir $fulldir
	cd $fulldir
	$cmd "$@" >stdout 2>stderr
	echo $? >rc
	fulldir=$dir/2
done
diff -r $dir/1 $dir/2
```
  
sys conf generic ALL DEVICES  
create generic_short where only devices that we are interested in (compare with dmesg)
  
`regexec` is the part of the libc used for handling regex
`man re_format`
  
# Config
`/usr/src/usr.sbin/config/` is the source of the config program. In the `see also` part, you have bsd-rec-config as OpenBSD is now linking the kernel dynamically.
the `config` command is used to:
- recompile the kernel
- ukc (unified kernel config). An option that is used to tweak by hand the kernel.
It is able to change settings in a kernel at runtime.
If you do `boot -c` u end up in ukc and can enable / disable devices for example.
`config -e /bsd.booted` to change the current kernel. You need to reboot on it to make it work.
# Ncurses
`man termios`