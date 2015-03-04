# CSCI 206 Computer Organization & Programming
# Date: 2011-09-19
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
# Student name: Yuxuan Huang
#
#
# This program uses a procedure xfind to find a particular character.
# See detailed instructions in lab handout

	.data
# Define constants here

	.align 2

# These are the two test strings, use one at a time
string: .asciiz "Where is my xbox 360?"
#string: .asciiz "None of that character in here."

print: .asciiz "The memory address of the first x: "

	.text

main:
	# Prepare for procedure call
	addi	$sp, $sp, -4		# saving registers
	sw	$ra, 0($sp)
	
	la	$a0, string		# load address of string
	jal	xfind			# call function convert

#   write code here to print the result of the 
#   call to xfind
        

	lw	$ra, 0($sp)		# restoring registers
	addi	$sp, $sp, 4
        
        move    $t0,$v0
        
        li      $v0, 4
        la      $a0, print
        syscall
        
        li      $v0,34
        move    $a0,$t0
        syscall
        
	li	$v0, 10			# exit to OS
	syscall

xfind:
# write the code of function xfind after this comment
        move    $t0, $a0
        li      $t1, 0x78
        li      $t2, 0x00
xfind_loop:
        lb      $t3, ($t0)
        beq     $t3, $t1, return1
        beq     $t3, $t2, return2
        addi    $t0, $t0,1
        j       xfind_loop
        
        
return1:
        move    $v0,$t0
        jr      $ra
return2:
        li      $v0,-1
        jr      $ra
        
        
        
