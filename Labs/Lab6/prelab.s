# Yuxuan Huang
# csci206 prelab6

	.data
	.align 2
C:	.word	1

print1: .asciiz "The first result is: "
print2: .asciiz "The second result is: "
nextline: .asciiz "\n"
	.text

main:
	# Call myFunc(2, 3)
	addi	$a0, $zero, 2
	addi	$a1, $zero, 3
	jal	myFunc
	add	$s0, $zero, $v0		# save result in $s0

	# Call myFunc(5, 6)
	addi	$a0, $zero, 5
	addi	$a1, $zero, 6
	jal	myFunc
	add	$s1, $zero, $v0     	# save result in $s1

    	#add $s1, $s1, $s0

    	li $v0, 4			# print the result
	la $a0, print1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, nextline
	syscall
	
	li $v0, 4			# print the result
	la $a0, print2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall

	addi	$v0, $zero, 10		# system call for exit
	syscall

# myFunc = 4x - (2y + 1)
myFunc:
	mul $v0, $a1, 2			# Start of the function
	li $t0, 0
	lw $t1, C($t0)
	add $v0, $v0, $t1
	mul $t2, $a0, 4
	sub $v0, $t2, $v0 
	jr $ra

# The first value for $ra is: 0x0040000c, and it represents the line 45
# The second value of $ra is: 0x0040001c, and it represents the line 51
