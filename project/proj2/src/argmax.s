.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
#
# If the length of the vector is less than 1, 
# this function exits with error code 7.
# =================================================================
argmax:

    # Prologue
	lw t0, 0(a0)  	# largest value
    addi t1, x0, 0  # largest index
	addi t2, x0, -1 # current index
    
loop_start:
	beq a1, x0, loop_end
    addi t2, t2, 1
    addi a1, a1, -1
	slli t3, t2, 2
    add t3, t3, a0
	lw t3, 0(t3)
	blt t3, t0, loop_continue
	mv t0, t3
	mv t1, t2

loop_continue:
	j loop_start


loop_end:
    # Epilogue
	add a0, t1, x0

    ret