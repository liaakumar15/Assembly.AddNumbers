# Written by Vetriliaa Kumar for CS2340.003, assignment 1: add up numbers, 
# Starting September 3rd, 2023. NetID: vxk200058

# Assignment 1: This programs takes one integer as input from the user, 
# keeping track of how many numbers have been entered and summing them up 
# until the user inputs 0. Then the program returns the total sum, and total
# number of integers.

		.include "Syscalls.asm"  
		.data		     		  
usrPrompt:	.asciiz  "Enter an integer: " 
sumMsg: 	.asciiz  "The sum is: " 
numCountMsg:    .asciiz  "\nThe number of integers entered was: " 

		.text	
main:		
		li	$t0, 0				# Initializing $t0 = sum (stores final sum of all input)
		li	$t1, 0				# Initializing $t1 = count (stores final count of all input)
		
input_loop:	
		la	$a0, usrPrompt			# Address of user prompt
		li	$v0, SysPrintString		# Function for printing a string
		syscall
		
		li	$v0, SysReadInt			# Read in an integer from user
		syscall
		
		beq	$v0, $zero, calculate_sum	# Checks if user's input == 0
		add	$t0, $t0, $v0			# Adds user's input to sum
		add	$t1, $t1, 1			# Increments count by 1
		j 	input_loop			# Loops back to input

calculate_sum:
		la 	$a0, sumMsg			# Address of sum message
		li 	$v0, SysPrintString		# Function for printing a string
		syscall
		
		move 	$a0, $t0			# Copies $t0 into $a0 so it can be printed
		li 	$v0, SysPrintInt		# Function to print int: sum value 
    		syscall

    							
    		la 	$a0, numCountMsg		# Address of total num count message
    		li 	$v0, SysPrintString		# Function for printing a string
    		syscall
    
		
		la $a0, $t1				# Copies $t1 into $a0 so it can be printed
    		li $v0, SysPrintInt			# Function to print int: num count 		
    		syscall
    		

    		li $v0, SysExit				# Exit the program
    		syscall
		
		