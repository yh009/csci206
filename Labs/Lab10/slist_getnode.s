# Yuxuan Huang

.text
.align 2
.global slist_getnode

      
slist_getnode:
	move $t1, $a0			#load the address of the struct to $t1
	lw $t2, 0($t1)			#load the address of the first node into $t2
	addi $sp, $sp, -12
	sw $a1, 0($sp)			#allocate the stack and save the $a1 into the stack
	sw $ra, 8($sp)
while:
        beq $t2,0,return_null
        sw $t2, 4($sp)
        lw $a1, 4($t2)
        lw $a0, 0($sp)
        jal strcmp
        lw $t2, 4($sp)
        beq $v0, 0, return
        nop
        lw $t2, 0($t2)
        j while
        nop
return:
        move $v0, $t2
        lw $ra, 8($sp)
        addi $sp, $sp, 12
        jr $ra
        nop
        
return_null:
        li $v0, 0
        lw $ra, 8($sp)
        addi $sp, $sp, 12
        jr $ra
        nop
        
 