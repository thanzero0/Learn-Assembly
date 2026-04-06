.section .data
    hello_msg: .ascii "Halo, Dunia!\n"
    len = . - hello_msg

.section .text
    .global _start

_start:
    # Sycall write: ssize_t write(int fd, const void *buf, size_t count)
    mov $1, %rax        # syscall number for write (1)
    mov $1, %rdi        # file descriptor (1 = stdout)
    lea hello_msg(%rip), %rsi # pointer to message
    mov $len, %rdx      # length of message
    syscall             # call kernel


