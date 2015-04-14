.data
str: .ascii "Hello World!"

.text
     .global main
 
main:
     addi    $sp, $sp, -4
     sw      $ra, 0($sp)
     la      $a0, str
     jal     printf
     
     lw      $ra, 0($sp)
     addi    $sp, $sp, 4
     
     li      $v0, 42
     jr      $ra
