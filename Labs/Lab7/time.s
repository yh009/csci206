.data

.text
.globl add_second

add_second:
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        
        move $t0, $a0          # load tm to $t0
        lw $t1, 0($t0)         # load second to $t1
        addi $t1, $t1, 1       # add 1 sec
        sw $t1, 0($t0)         # store sec 
        bne $t1, 60, return    # if sec != 60, return
        nop
        li $a0, 60
        jal check
        li $a0, 24
        jal check
        li $a0, 30
        jal check
        li $a0, 12
        jal check
        li $a0, 12
        jal check
        
check:
        li $t1, 0              # change sec to 0
        sw $t1, 0($t0)         # save sec
        addi $t0, $t0, 4       # move to min
        lw $t1, 0($t0)         # save min
        addi $t1, $t1, 1       # add i to min
        sw $t1, 0($t0)         # save min
        bne $t1, $a0, return   # if min != 60, return
        nop
        jr $ra
        
return:
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra
        nop
        
        