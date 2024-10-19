
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
# Write your code here!
    
    li s0, 0 # to keep future memory address or 0 if not found
    li s1, 0 # i -> s1, initialize i = 0 
    
    #check if array is empty    
    bne a1, zero, loop
    j done
    
loop:
    #while(i<a1) loop:
    bge s1, a1, done # if i < a1 
    
    #load array[i]:
    slli t0, s1, 2 #calculate offset: i*4
    add t0, t0, a0 # add to base of array
    lw t1, 0(t0) # t1 = Mem[t0]
    
    # if statement:
    bne t1, a2, continue # if(t1 != a2) goto continue
    add s0, t0, zero #store position to s0
    
continue:
    addi s1,s1,1
    j loop
    
# Do not remove the prog label or write code above it!
#-----------------------------
done:
    addi a7, zero, 10 
    ecall
