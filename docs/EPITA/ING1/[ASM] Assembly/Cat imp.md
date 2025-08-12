---
title: "Cat imp"
---
Last edited time: January 29, 2024 12:06 PM

```nasm
.data
    filename:   .asciz "example.txt"
    buffer:     .space 100
    mode_read:  .quad 0400  # read-only mode

.text
.global main

main:
    # Open file for reading
    mov $2, %rax           # syscall number for open
    mov $filename, %rdi    # pointer to the filename
    mov $0, %rsi           # O_RDONLY flag (read only)
    mov mode_read, %rdx    # file mode
    syscall
    mov %rax, %rdi         # save file descriptor for later use

    # Read from file into buffer
    mov $0, %rax           # syscall number for read
    mov %rdi, %rdi         # file descriptor for the opened file
    mov $buffer, %rsi      # pointer to the buffer
    mov $100, %rdx         # maximum number of bytes to read
    syscall

    # Write buffer to stdout
    mov $1, %rax           # syscall number for write
    mov $1, %rdi           # file descriptor for stdout
    mov $buffer, %rsi      # pointer to the buffer
    mov $100, %rdx         # length of the buffer
    syscall

    # Close the file
    mov $3, %rax           # syscall number for close
    mov %rdi, %rdi         # file descriptor to close
    syscall

    # Exit the program
    mov $60, %rax          # syscall number for exit
    xor %rdi, %rdi         # exit code 0
    syscall

```

![DE1C7488-BC5A-4215-96AF-0D5C0F4E3F7C.jpeg](Cat%20imp/DE1C7488-BC5A-4215-96AF-0D5C0F4E3F7C.jpeg)
