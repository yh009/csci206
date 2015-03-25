.text
.global one_half_single
.global one_half_double
.align 2    # word align

# one_half_single is a function
# that loads a signle precision float
# from memory and returns the loaded
# value to the caller.
one_half_single:
    la $t0, ohs
    l.s $f0, 0($t0)
    jr $ra
    nop

# one_half_doubel is a function
# that loads a double precision float
# from memory and returns the loaded
# value to the caller.
one_half_double:
    la $t0, ohd
    l.d $f0, 0($t0)
    jr $ra
    nop



.data
.align 2    # word align
# the single precision float
ohs:    .word 0x3F000000

.align 3    # double word align
# the double precision float
ohd:    .word 0x3FE00000 
        .word 0x00000000

