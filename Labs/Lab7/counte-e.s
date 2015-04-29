.data

.text 
.globl counte

counte:

       
       move $t0, $a0                     # move the input string into $t0
       lb $t1, 0($t0)                    # load the first bit of the string
       li $v0, 0                         # counter = 0
loop:
       beq $t1, 0, return                # if first bit equal null, return
       nop
       beq $t1, 101, add_count         # if first bit is e, branch
       nop
       addi $t0, $t0, 1                  # shift right one bit
       lb  $t1, 0($t0)                   # load the new first bit
       j loop                            # loop
       nop
       
add_count:
       addi $v0, $v0, 1                  # counter ++
       addi $t0, $t0, 1                  # shift right one bit
       lb   $t1, 0($t0)                  # load new first bit
       j loop                            # loop
       nop
       
return:
       jr $ra                            # return
       nop
       
