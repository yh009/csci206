.data 

.text
.globl matrix_sum

matrix_sum:
       move $s0, $a0         # load A into $s0
       move $s1, $a1         # load B into $s1
       move $s2, $a2         # load C into $s2
       addi $sp, $sp, -4     
       sw   $a2, 0($sp)      # save C in stack
       
       li $t3, 0             # counter = 0
       
loop:
       beq $t3, 6, return    # if counter = 6, return
       nop
       lw  $t0, 0($s0)       # load vlaue on the first index of A into $t0
       lw  $t1, 0($s1)       # load vlaue on the first index of B into $t1     
       lw  $t2, 0($s2)       # load vlaue on the first index of C into $t2
       
       add $t2, $t0, $t1     # $t2 = $t0 + $t1
        
       sw  $t2, 0($s2)       # store the sum into C
       
       addi $s0, $s0, 4      # next element of A
       addi $s1, $s1, 4      # next element of B
       addi $s2, $s2, 4      # next element of C
       
       addi $t3, $t3, 1      # counter ++
       j loop                # loop
       nop
       
return:
       lw $v0, 0($sp)        # load the result into $v0
       addi $sp, $sp, 4
       jr $ra
       nop
       