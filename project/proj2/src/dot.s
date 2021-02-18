.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
#
# If the length of the vector is less than 1, 
# this function exits with error code 5.
# If the stride of either vector is less than 1,
# this function exits with error code 6.
# =======================================================
dot:

    # Prologue
    mv t0, x0 # sum
    mv t1, x0 # ans
    
loop_start:
	beq t1, a2, loop_end
    # v0[]
	slli t2, t1, 2
    mul t2, t2, a3
	add t2, t2, a0
	lw t2, 0(t2)
    # v1[]
	slli t3, t1, 2
    mul t3, t3, a4
	add t3, t3, a1
	lw t3, 0(t3)
    # v0[]+v1[]
    mul t2, t2, t3
    add t0, t0, t2

	addi t1, t1, 1
	j loop_start
    
loop_end:
    # Epilogue
	mv a0, t0
    
    ret