.data
src:.string "madam"
res1:.string "sey"
res2:.string "on"
.text
la x1,src
li sp,0x5000
li x3,0
back: lbu x4,0(x1)
beq x4,x0,retrive
addi x3,x3,1
addi sp,sp,-1
addi x1,x1,1
sb x4,0(sp)
beq x0,x0,back
retrive:la x1,src
rpt:lbu x4,0(x1)
lbu x5,0(sp)
bne x4,x5,exit
addi x1,x1,1
addi sp,sp,1
addi x3,x3,-1
bne x3,x0,rpt
la x9,res1
lw x10,0(x9)
sw x10,0(x7)
beq x0,x0,rd
exit:la x9,res2
lw x10,0(x9)
sw x10,0(x7)
rd: nop