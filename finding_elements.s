.data
arr: .word 1,2,3,4,5,6,7,5,9
ele: .word 5
.text
la x3,arr
la x4,ele
lw x4,0(x4)
li x10,9 #number of ele counter
li x11,0x50 #sw conuter
rpt: 
    lw x5,0(x3)
    beq x4,x5,found
loop1:addi x10,x10,-1
    addi x3,x3,4
    bne x10,x0,rpt
    j exit
found:
    sw x3,0(x11)
    addi x11,x11,4
    j loop1
exit:
    sw x0,0(x11)