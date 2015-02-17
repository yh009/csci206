
# CSCI 206 Computer Organization & Programming
# Date: 2011-08-29
# Copyright (c) 2011 Bucknell University
#
# Permission is hereby granted, free of charge, to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software"), to use, copy, modify, and
# distribute without restriction, provided that this copyright and
# permission notice is maintained, intact, in all copies and
# supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
# KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
# THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#
# Student name:


	.data
	
unused:	.word 0xDEADBEEF			#label named 'unused' contains word '0xDEADBEEF'
						
x:	.word 89				#label named 'x' contains word '89'
						
	.text	
main:						# This tells the simulator
						# where start your program

	
	add		$t0, $zero, $zero	#add 0 and 0,and store the sum into memory address $t0. This line reset the content at $t0 to 0.	
	add		$t1, $zero, $zero	#add 0 and 0, and store the sum into memory address $t1. This line reset the content at $t1 to 0.	

loop:                                           #This tells the simulator here starts a loop.
	add		$t1, $t1, $t0		#add $t1 and $t0, store the sum into $t1.  $t1=$t1+$t0
	addi		$t0, $t0, 1		#add $t0 and the integer 1, store the sum into $t0. $t0=$t0+1
	ble		$t0, 10, loop		#This is the base statement of the loop. If content of $t0 smaller or equal to 10, return and keep looping. (branch to loop if $t0 <= 10)

	la		$t2, x                  #copy RAM address of x into register $t2.
	sw		$t1, 0($t2)             #store data from $t1 into memory address($t2+0) 
	
	li		$v0, 10			# system call for exit
	syscall					# Exit!

