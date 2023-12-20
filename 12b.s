.text
li s0,LED_MATRIX_0_BASE
li s1,LED_MATRIX_0_WIDTH
li s2,LED_MATRIX_0_HEIGHT
li s3,0xff0000
li s4,0xee000
li x31,LED_MATRIX_0_SIZE
add s5,s0,x31
li s6, SWITCHES_0_BASE

reset: mv x2,s0
li x3,1

start: lw x1,0(s6)
and x1,x1,x3
bne x1,x0,bgcl
sw s3,0(x2)
cont: slli x3,x3,1
addi x2,x2,4
beq x2,s5,reset
j start
bgcl: sw s4,0(x2)
j cont
