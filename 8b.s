.data
A: .word 90
B: .word 8 # Divisor number

.text
la x3,A
lw a0,0(x3)
la t0,B
lw t0,0(t0)
chk_loop: 
    beq a0,x0,yes
    blt a0,x0,no
    sub a0,a0,t0
    j chk_loop
yes:
    addi a2,x0,1
    j exit
no:
    addi a2,x0,0
exit:
    nop