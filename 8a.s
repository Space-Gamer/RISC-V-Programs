.data
A: .word 90

.text
la x3,A
lw a0,0(x3)
chk_loop: 
    beq a0,x0,yes
    blt a0,x0,no
    addi a0,a0,-9
    j chk_loop
yes:
    addi a2,x0,1
    j exit
no:
    addi a2,x0,0
exit:
    nop