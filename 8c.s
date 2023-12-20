.data
A: .word 2,3,5,7,11
B: .word 1,3,5,7,9

.text
la t0,A
la t1,B
li t2,0 # Element of c
li x28,0 # Array index (i)
li s0,5 # Length of the array
li x15,0x100 # Store Word counter

forloop:
    lw a0,0(t0) # ith element of array A
    lw a1,0(t1) # ith element of array B
    mul s1,a0,a1 # Product
    add t2,t2,s1 # After adding with prev result
    sw t2,0(x15)
    addi x28,x28,1 # increment counter (i)
    addi t0,t0,4 # increment address of A
    addi t1,t1,4 # increment address of B
    addi x15,x15,4 # increment address of C
    blt x28,s0,forloop
exit:nop