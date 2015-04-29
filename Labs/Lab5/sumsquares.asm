# Yuxuan Huang
# Lab5
.data
sum: .word 0
i: .word 0
squares: .word 0:100

print1:
.asciiz "squares["
print2:
.asciiz "]="
nextline:
.asciiz "\n"

finalprint:
.asciiz "sum of squares from 0 to 99 = "


.text
main:								
	la $s0, i		# Load the address of global var i into register s0
	la $s1, squares		# Load the address of global var squares into register s1
	la $s2, sum		# Load the address of global var sum into register s2
	li $t0, 100		# Load the value 100 to register t0
	
	lw $t4, ($s2)
	
loop1:				
	lw $t1, ($s0)		# Load the value of i into the register t1
	bge $t1, $t0, storeSum	# If i > t0 = 100, then jump out the while loop.
	mul $t3, $t1, 4		# Store the offset of the array into t3
	add $t3, $t3, $s1	# set t3 as the mem address of squares[i]
	mul $t2, $t1, $t1	# t2 = i^2
	sw $t2, ($t3)		# squares[i] = i ^ 2
	add $t4, $t4, $t2	# sum += squares[i]
	addi $t1, $t1, 1	# i++
	sw $t1, ($s0)		# i = t1
	j loop1						
	
storeSum:
	sw $t4, ($s2)		# store the sum value into the global var sum
	
	li $t0, 0
	sw $t0, ($s0)		# i = 0
	
	li $t1, 100
loop2:
	lw $t0, ($s0)		# t0 = i
	
	bge $t0, $t1, terminate	# if i > 100, jump out of the loop

	li $v0, 4		# Print the first part of the prompt
	la $a0, print1					
	syscall							
	
	add $a0, $t0, $zero	# a0 = i
	li $v0, 1						
	syscall			# Print i
	
	li $v0, 4		# Print the second part of the prompt
	la $a0, print2					
	syscall							
	
	mul $t2, $t0, 4
	add $t2, $t2, $s1	
	lw $a0, ($t2)		# a0 = squares[i]
	li $v0, 1						
	syscall							
	
	li $v0, 4						
	la $a0, nextline					
	syscall						
	
	addi $t0, $t0, 1	# i++
	sw $t0, ($s0)						
	
	j loop2					
	
terminate:						
	li $v0, 4	        # Print the prompt for sum
	la $a0, finalprint			
	syscall						
	
	li $v0, 1		# Print the sum
	lw $a0, ($s2)						
	syscall						
							
	li $v0, 4						
	la $a0, nextline					
	syscall							
	
	li $v0, 10		# end 
	syscall
  
  
  
