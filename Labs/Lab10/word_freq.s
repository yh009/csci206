.data
cannot_find_file:
.asciiz "Could not open %s.\n"
read:
.asciiz "r"
print_result:
.asciiz "%d: '%s' ---> %5d/n"


.text
    .global main
    .global slist_create
    .global snode_create
    .global slist_add_back
    .global slist_getnode
    .global open_file
    .global print_results
 
main:
    # allocate space on the stack, get an extra 32 bytes for argumnets
    addiu $sp, $sp, -36
    # store the stack pointer
    sw $ra, 32($sp)

    # args are in a0 and a1 already, just pass them to C
    # after this continue to process input
    # you are to move these functions into assembly
    jal init_and_check_args
    jal open_file
    jal process_file
    jal print_results

    # restore stack pointer
    lw $ra, 32($sp)
    # deallocate stack
    addiu $sp, $sp, 36
    # return
    jr      $ra

slist_create:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $a0, 1
    li $a1, 12
    jal calloc
    nop
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    nop
    
    
snode_create:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $a0, 1
    li $a1, 12
    jal calloc
    nop
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    nop
    
    
slist_add_back:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)			
    jal snode_create		
    nop
    lw $ra, 0($sp)
    lw $a0, 4($sp)			
    lw $a1, 8($sp)
    addi $sp, $sp, 12		
    sw $a1, 4($v0)		
    lw $t0, 0($a0)			
    beq $t0, 0, add_null		
    nop				
    lw $t0, 4($a0)			
    sw $v0, 0($t0)			
    sw $v0, 4($a0)			
    jr $ra
    nop
add_null:
    sw $v0, 0($a0)
    sw $v0, 4($a0)
    jr $ra
    nop
    
slist_getnode:
    move $t1, $a0	            #load the address of the struct to $t1
    lw $t2, 0($t1)		    #load the address of the first node into $t2
    addi $sp, $sp, -12
    sw $a1, 0($sp)		    #allocate the stack and save the $a1 into the stack
    sw $ra, 8($sp)
while:
    beq $t2,0,return_null
    sw $t2, 4($sp)                  #allocate stack and save $t2 to stack
    lw $a1, 4($t2)                  #load address of text into $a1
    lw $a0, 0($sp)                  #load address of str_input into $a0
    jal strcmp
    lw $t2, 4($sp)
    beq $v0, 0, return              
    nop
    lw $t2, 0($t2)                  #load next node into $t2
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

open_file:
     addi $sp, $sp, -4
     sw $ra, 0($sp)
     la $a0, filename
     lw $a0, 0($a0)
     la $a1, read
     jal fopen
     nop
     bnez $v0, find_file
     la $a0, cannot_find_file
     la $a1, filename
     lw $a1, 0($a1)
     jal printf
     nop
     addi $sp, $sp, 4
     li $a0, -2
     jal exit
     lw $ra, 0($sp)
     addi $sp, $sp, 4
     jr $ra
     nop
	
find_file:
     la $t0, input_file
     sw $v0, 0($t0)
     lw $ra, 0($sp)
     addi $sp, $sp, 4
     jr $ra
     nop

	
	
print_results:
     addi $sp, $sp, -12
     sw $ra, 0($sp)
     li $t7, 0
     lw $t0, list
     lw $t1, 0($t0)			
	
print_result_loop:
     beq $t1, 0x00, print_return
     nop
     lw $t2, 8($t1)
     lw $t3, threshold
     blt $t2, $t3, no_print
     nop
     la $a0, print_result
     move $a1, $t7
     addi $t7, $t7, 1
     sw $t1, 4($sp)
     sw $t7, 8($sp)
     lw $a2, 4($t1)
     lw $a3, 8($t1)
     jal printf
     nop
     lw $t1, 4($sp)
     lw $t7, 8($sp)
	
no_print:
     lw $t1, 0($t1)
     j print_result_loop
     nop
	
print_return:
     lw $ra, 0($sp)
     addi $sp, $sp, 12
     jr $ra
     nop	
