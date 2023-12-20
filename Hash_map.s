.data
arr: .word 871, 929, 797, 494, 549, 268, 728, 400, 918, 893, 974, 937, 948, 598, 382, 551, 855, 847, 124, 323, 777, 434, 399, 636, 370, 269, 745, 795, 503, 683, 912, 365, 43, 496, 686, 601, 808, 803, 747, 24, 303, 176, 975, 378, 433, 986, 699, 131, 249, 73
hash: .zero 50*4  

.text
    la a1, arr
    la a2, hash
    li t1, 50 #11 # Size of input array counter
    li s0, 51 #17 # Size of hash table
    li s1, 47 # prime number smaller than the TABLE_SIZE
first_hash_function:
    lw t3, 0(a1) # Load next element of array
    rem s11, t3, s0 # Calculate the reminder (ele%HASH_SIZE)
    slli s11,s11,2 # Multiply remainder by 4
    mv a3,a2 # Location where element must be stored
    add a3,a3,s11
    lw t4,0(a3) # Load the word in the address to be stored
    beq t4,x0,store_element # if the word in address is not zero
    srli s11,s11,2 # Reversing the operation done in line 15 (slli)
    li t5,1 # i -> collision counter
second_hash_function:
    rem t6, t3, s1 # Calculate the reminder (ele%PRIME)
    sub t6,s1,t6 # hash2(key) = PRIME ? (key % PRIME)
    mul t6,t6,t5 # i * hash2(key)
    add s10,s11,t6 # hash1(key) + i * hash2(key)
    rem s10,s10,s0 # (hash1(key) + i * hash2(key)) % TABLE_SIZE 
    slli s10,s10,2 # Multiply remainder by 4
    mv a3,a2 # Location where element must be stored
    add a3,a3,s10
    lw t4,0(a3) # Load the word in the address to be stored
    beq t4,x0,store_element # if the word in address is not zero
    addi t5,t5,1 # increment collision counter
    j second_hash_function
store_element:
    sw t3,0(a3)
    addi t1,t1,-1
    addi a1,a1,4
    bne t1,x0,first_hash_function
exit:
    nop