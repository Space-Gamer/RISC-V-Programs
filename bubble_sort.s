.data
num: .word 5,15,3,2,9

.text
la x11,num # permanent reg pointing to start of array
add x28,x0,x28  # i
add x29,x0,x28  # j
addi x30,x30,5
loop1:
    beq x28,x30,exit # when i=n
    add x5,x0,x11
    loop2: 
        addi x31,x30,-1 # n-1
        sub x31,x31,x28 # n-i-1
        beq x29,x31,exit # when j=n-i-1
        lw s2,0(x5)
        lw s3,4(x5)
        blt s3,s2,swap
        # bge s3,s2,swap # Descending order
        jump:
            addi x5,x5,4
            addi x29,x29,1
            bne x29,x31,loop2
            li x29,0
            addi x28,x28,1
            bne x28,x30,loop1
swap: sw s3,0(x5)
      sw s2,4(x5)
      j jump
      
exit: nop