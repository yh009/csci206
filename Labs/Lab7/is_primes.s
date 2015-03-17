.data

.text
.globl is_prime

is_prime:
      li $t0,2                  # i = 2

for:
      bge $t0, $a0, true        #  if i >= n, return true
      nop
      div $zero, $a0, $t0       #  m/i
      mfhi $t1                  # load reminder to $t1
      beqz $t1, false     # if reminder =  0, return false
      nop
      addi $t0, $t0, 1          # i = i + 1
      j for                     # loop
      nop

true:
      li $v0, 1                 # return 1
      jr $ra
      nop
false:
      li $v0, 0                 # return 0
      jr $ra
      nop
      
