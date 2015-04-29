.data
MAX_ITEMS: .word 100
arrow:     .asciiz "-->"
nextline:  .asciiz "\n"

.text

main:

     li $s0,0
     lw $s1,MAX_ITEMS

loop:
      
                