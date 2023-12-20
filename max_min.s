# Write an ALP to search largest and smallest element in array and store location in consecutive memory locations after array elements.
.data
arr: .word 5,15,30,2,9,25

.text
la x5,arr # Address of the array
li x7,6 # Length of array
lw x6,0(x5) # Element of array
li x8,0 # i counter
addi x9,x6,0 # Max element
addi x10,x6,0 # Min element
loop:
    # bge x8,x7,exit
    lw x6,0(x5) # Element of array
    blt x6,x10,ch_min
    bge x6,x9,ch_max
loop_cont:
    addi x5,x5,4
    addi x8,x8,1
    bge x8,x7,exit
    j loop
ch_min:
    addi x10,x6,0
    j loop_cont
ch_max:
    addi x9,x6,0
    j loop_cont
exit:
    sw x10,0(x5) # store min element
    addi x5,x5,4
    sw x9,0(x5) # store max element
    nop