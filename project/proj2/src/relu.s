.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    # Prologue


loop_start:
    beq a1, x0, loop_end
	addi a1, a1, -1
	slli t0, a1, 2
	add t0, t0, a0
	lw t1, 0(t0)
	bgt t1, x0, loop_continue
	sw x0, 0(t0)

loop_continue:
	j loop_start


loop_end:


    # Epilogue

    
	ret