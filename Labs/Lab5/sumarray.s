# CSCI 206 Computer Organization & Programming
# Date: 2011-09-13
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
#
# This program calculates the sum of the values in array A and counts
# the number of values in the array.
#
# Similarly to a C-string, the array is terminated by sentinel value
# equal to zero.
#
# The sum is stored in $s0 and the count in $s1

	.data
A:	.word 5 4 3 2 4 1 0	# declare array int A[]={5,4,3,2,4,1,0};
output1:
.asciiz "Number of elements = "
output2:
.asciiz "Summation = "
nextline:
.asciiz "\n"
count1: .word 0
count2: .word 0

	.text	
main:				# This symbols marks the first instruction of your program

       li $s0,0
       sw $s0,count1            # number counter
       li $s1,0
       sw $s1,count2            # sum counter
       li $t0,0
       
L1:
       lw $t1,A($t0)             
       beq $t1,0,terminate      # if end of array, terminate
       addi $s0,$s0,1           # counter = counter+1
       add $s1,$s1,$t1          # sum = sum + element
       addi $t0,$t0,4           # next element
       j L1
       
terminate:
       li $v0,4                 # print number of elements
       la $a0,output1
       syscall
       
       li  $v0,1
       add $a0,$s0,$zero
       syscall
       
       li $v0,4                 # change line
       la $a0,nextline
       syscall
       
       li $v0,4                 # print sum
       la $a0,output2
       syscall
       
       li  $v0,1
       add $a0,$s1,$zero
       syscall
       
       li  $v0,10
       syscall
       
       
       
        
#
# Add your code here
#

	li	$v0, 10		# system call for exit
	syscall			# Exit!

