.data
mat1:  .word 1,2,3,4,5,6,7,8,9,10,11,12
mat2:  .word 13,14,15,16,17,18,19,20,21,22,23,24
 .equ row1, 3
 .equ row2, 4
 .equ col2, 3
res: .zero 36

.text
       li x4,row1
       la x1,mat1
       la x3,res # result address
nextrow:li x5,col2 
        la x2,mat2
nextcol:li x6,row2 # op_counter
        li x7,0 # sum
    
dotprod:lw x8,0(x1) # a[i]
        lw x9,0(x2) # b[j]
        mul x10,x8,x9 # a[i]*b[j]
       add x7,x7,x10 # sum+=product
       addi x1,x1,4 # increment mat1 counter by 1 add. (next col)
       addi x2,x2,col2*4 # increment mat2 counter by no.ofcol add. (next row) 
       addi x6,x6,-1 # decrement op counter
       bne x6,x0,dotprod # if op counter not 0 => dotprod
       sw x7,0(x3) # store result (sum)
       addi x3,x3,4 # sw counter increment
       
       addi x5,x5,-1
       beq x5,x0,skip
       addi x1,x1,-row2*4
       addi x2,x2,4-row2*col2*4
       j nextcol
       
skip:  addi x4,x4,-1
       bne x4,x0,nextrow