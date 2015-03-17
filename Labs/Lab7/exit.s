        .text
        .global __start
__start:
        li $a0, 42
        li $v0, 4001
        syscall
