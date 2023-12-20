.data
r1: .word 0b10101010

.text
li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH
li s2,LED_MATRIX_0_HEIGHT
li s3,0x0a3799
li s4,0xffc72c
addi s5,s0,8*4
li s6,255
li a1,0x000000
mv a0,s0
res:sw a1,0(a0)
addi a0,a0,4
bne a0,s5,res
li t1,8
mv a0,s0
start: li t1,8 
on:sw s4,0(a0)
addi a0,a0,4
addi t1,t1,-1
bne t1,x0, on 
li t3,8
off: sw a1,0(a0)
addi a0,a0,-4
addi t3,t3,-1
bne t3,x0, off
j start 
nop
