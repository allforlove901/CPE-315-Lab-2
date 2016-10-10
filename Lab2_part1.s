# Brett Nelson
# Lab 2: Using SPIM, Indexing and Looping (part 1)
# 10/8/16


#DEFINING GLOBAL DATA
.data                       # global data section
LENGTH: .word 5             # loop count
ARRAY: .word 4155543, 3112 , -2, 1054, -33543, 1233, -433433, 10101, 16384

str: .asciiz "Array Sum = " # string to print sum
SUM: .word 0                # location of the final sum



#DEFINING MAIN FUNCTION
.text                       # sets program location
.globl main                 # defines main program
main: lw $s0, LENGTH        # loads loop length into $s0
la $t0, ARRAY               # load address of ARRAY into $t0
and $s1, $s1, $zero         # clear $s1

#LOOP
loop: lw $t1, 0($t0)        # load the next value of array
add $s1, $s1, $t1           # add it to the running sum
addi $t0, $t0, 4            # increment address
addi $s0, $s0, -1           # decrement counter
bne $0, $s0, loop           # loop back until complete

#STORE TOTAL
sw $s1, SUM                 # store the final total

#PRINTING THE SUM
la $a0, str                 # load string into a0 to be printed
li $v0, 4                   # set syscall to print command
syscall
lw $a0, SUM                 # load sum into a0 to be printed
li $v0, 1                   # set syscall to print command
syscall

li $v0, 10                  # syscall to end program
syscall                     # ends program
.end
