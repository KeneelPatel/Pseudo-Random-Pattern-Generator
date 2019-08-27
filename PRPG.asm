#Name - Keneel Patel
#UIN - 675960838
#Class - ECE - 366
#Purpose - The main purpose of this program is to use mid square method to generate the 
#	   pesuedo random pattern generator.
addi $8, $0, 2019				#initializing the register by adding a number
sw $8, 0x2010				#stroing register 8 value at memory address 0x2010
addu $9, $0, $8				#copying the same value at register 8 into the register 9
addi $10, $0, 0				#initializing the register 10 with number 0
addi $13, $0, 15			#adding number 15 to the register 13
addi $14, $0, 0x2010			#adding the number 0x2010 to register 14

square: 				#loop to calculate the square of a number
beq $9, $0, end				#whenever register 9 has 0 number it will call to 'done'
addu $10, $10, $8			#adding register 8 everytime loop iterates
addi $9, $9, -1				#decreasing the register 9 value by -1
bne $9, $0, square			#whenever the register 9 value does not equal to 0, it calls itself 

andi $11, $10, 4278190080		#anding the number at register at 8 with the decimal number 42781900980(making the other bits zero except last eight )
andi $12, $10, 255			#anding the number at register at 10 with the decimal number 255(making the other bits zero except first eight)
addi $10, $0, 0				#reseting the register 10 to number 0
srl $11, $11, 16			#logic shifting right in register 11
add $11, $12, $11			#adding register 11 and 12
addi $12, $0, 0				#reseting the register 12
add $12, $0, $11			#copying the number at register 11 ti register 12
addi $14, $14, 4			#adding 4 to the register 14
sw $11, ($14)				#storing word of register 11 to the memory address stored at register 14
addi $8, $0, 0				#reseting register
addi $9, $0, 0				#reseting register
addu $8, $0, $11			#copying values from the register 11 to register 8
addu $9, $0, $8				#copying the values from register 8 to register 9
addi $11, $0, 0				#reseting register
addi $12, $0, 0				#reseting register
addi $13, $13, -1			#decreasing the number at register 13 by -1
beq $13, $0, end			#if register 13 equals to 0, then call to done
j square					#calling back to loop

end:					#done mostly, resets the registers and set some values to some registers
addi $8, $0, 0				#reseting register
addi $9, $0, 0				#reseting register
addi $10, $0, 0				#reseting register
addi $11, $0, 0				#reseting register
addi $12, $0, 0				#reseting register
addi $13, $0, 16			#copying the value from register 16 to register 13
addi $14, $0, 10			#setting register 14 to number 10
addi $15, $0, 0				#reseting register
addi $12, $0, 16			#seting the register 12 to number 16
addi $8, $0, 0x2010			#adding value 0x2010 to register 8
lw  $9,($8)				#loading word stored at register 8 to register 9

hammingweight:				#loop1 to find the hamming weight
beq $12, -1, endhammingweight		#is register equals to -1, it calls done2
and $10, $9, 1				#anding register 9 with 1
srl $9, $9, 1				#logic right shifting register 9 by 1
add $11, $11, $10			#adding register 10 & 11
addi $10, $0, 0				#reseting register
addi $12, $12, -1			#decreasing the value by 1
bne $12, $0, hammingweight		#if register 12 does not equal to 0 then, calls itself


endhammingweight:			#done2 to go to the next memory address
addi $8, $8, 4				#adding 4 to go to the new memory address
lw  $9,($8)				#loading the word saved at 8 to register 9 
addi $12, $0, 0				#reseting register
addi $12, $0, 16			#adding register 16 to register 12
addi $10, $0, 0				#reseting register
addi $13, $13, -1			#decreasing the value by 1
beq $13, $0, hammingdistance		#if register 13 does not equal to 1 then, calls itself
j hammingweight				#calling loop1 again

hammingdistance:			#done3 to calculate the hamming weight
srl $11, $11, 4
sw $11, 0x2000
addi $8, $0, 0				#reseting register
addi $9, $0, 0				#reseting register
addi $10, $0, 0				#reseting register
addi $11, $0, 0				#reseting register
addi $12, $0, 0				#reseting register
addi $13, $0, 0				#reseting register
addi $14, $0, 0				#reseting register
addi $15, $0, 0				#reseting register
addi $16, $0, 0				#reseting register
addi $8, $0, 0x2010			#adding 0x2010 to register 8
lw  $9,($8)				#loading value stored at memory address at register 8 to register 9
addi $10, $0, 0x2014			#add 0x2014 to register 10
lw $11, ($10)				#loading value stored at memory address 10 to register 11
xor $14, $9, $11			#x-or register 9&11
addi $13, $0, 14			#copying the value to register 13
addi $12, $0, 16			#adding 16 to the register 12

distanceloop:				#loop3 to find the hamming distance
beq $12, -1, enddistanceloop		#if register 12 equals to the -1, it calls to done5
andi $15, $14, 1			#anding register 14 with 1
srl $14, $14, 1				#shifting logic right by 1 bit
add $16, $16, $15			#adding register 15 to register 16
addi $15, $0, 0				#reseting register
addi $12, $12, -1			#decreasing by 1
bne $12, $0, distanceloop		#whenever register 12 not equals to 0, it calls itself

enddistanceloop:			#done5 to increase the memory address to move on
addi $8, $8, 4				#adding 4 to register 8
lw  $9,($8)				#loading value stored at memory address at register 8 to register 9
addi $10, $10, 4			#adding 4 to the register 10
lw $11, ($10)				#loading value stored at memory address at register 10 to register 11
addi $14, $0, 0				#reseting register
xor $14, $9, $11			#x-or register 9&11
addi $12, $0, 0				#reseting register
addi $12, $0, 16			#copying value from register 16 to 12
addi $15, $15, 0			#reseting register
addi $13, $13, -1			#decreasing value by 1
beq $13, $0, averagedistance		#when register 13 does not equal to 0, it calls itself
j distanceloop				#calling loop 3

averagedistance:			#done6 to find average hamming distance
addi $8, $0, 0				#reseting register
addi $9, $0, 0				#reseting register
addi $10, $0, 0				#reseting register
addi $11, $0, 0				#reseting register
addi $12, $0, 0				#reseting register
addi $13, $0, 0				#reseting register
addi $14, $0, 0				#reseting register
addi $15, $0, 0				#reseting register
addi $8, $0, 0x2010			#storing 0x2010 at register 8
lw  $9,($8)				#loading word atored at memory address of register 8 to 9
addi $10, $0, 0x204c			#storing 0x204c to register 10
lw $11, ($10)				#loading word stored at register 10 to register 11
xor $14, $9, $11			#x-or register 9&11
addi $12, $12, 16			#adding 16 to register 12

loop4:					#loop4 to find the average hamming distance
beq $12, -1, endloop4			#when 12 equals to -1, it calls done7
andi $15, $14, 1			#and register 14 with register 15
srl $14, $14, 1				#shifting register right by 1 bit
add $16, $16, $15			#adding register 15 and 16
addi $15, $0, 0				#reseting register
addi $12, $12, -1			#decreasing the register by 1
bne $12, $0, loop4			#if register 12 does not equal to 0, it calls itself

endloop4:					#done7
srl $16, $16, 4		
sw $16, 0x2004				#store word at register 17 to memory address 0x2024
addi $8, $0, 0				#reseting register
addi $9, $0, 0				#reseting register
addi $10, $0, 0				#reseting register
addi $11, $0, 0				#reseting register
addi $12, $0, 16			#reseting register
addi $13, $0, 0				#reseting register
addi $14, $0, 0				#reseting register
addi $15, $0, 0				#reseting register
addi $16, $0, 0				#reseting register
addi $17, $0, 0				#reseting register
addi $18, $0, 0				#reseting register
addi $19, $0, 0				#reseting register
addi $8, $0, 0x2010			#adding 0x2010 to register 8
lw  $9,($8)				#loading value stored at memory address at register 8 to register 9
addi $10, $0, 0x2010			#add 0x2014 to register 10
lw $11, ($10)				#loading value stored at memory address 10 to register 11
xor $14, $9, $11			#x-or register 9&11
addi $13, $0, 120			#copying the value to register 13
addi $12, $0, 16			#adding 16 to the register 12

pairwise:				#loop3 to find the hamming distance
beq $12, -1, done9			#if register 12 equals to the -1, it calls to done5
andi $15, $14, 1			#anding register 14 with 1
srl $14, $14, 1				#shifting logic right by 1 bit
add $16, $16, $15			#adding register 15 to register 16
addi $15, $0, 0				#reseting register
addi $12, $12, -1			#decreasing by 1
bne $12, $0, pairwise			#whenever register 12 not equals to 0, it calls itself

done9:					#done5 to increase the memory address to move on
addi $10, $10, 4			#adding 4 to the register 10
beq $10, 0x2050, done10
lw $11, ($10)				#loading value stored at memory address at register 10 to register 11
addi $14, $0, 0				#reseting register
xor $14, $9, $11			#x-or register 9&11
addi $12, $0, 0				#reseting register
addi $12, $0, 16			#copying value from register 16 to 12
addi $15, $15, 0			#reseting register
addi $13, $13, -1			#decreasing value by 1
beq $13, $0, done11			#when register 13 does not equal to 0, it calls itself
j pairwise

done10:
addi $8, $8, 4				#adding 4 to register 8
lw  $9,($8)				#loading value stored at memory address at register 8 to register 9
addi $10, $0, 0
addi $11, $0, 0
addi $10, $8, 4				#add 0x2014 to register 10
lw $11, ($10)				#loading value stored at memory address 10 to register 11
addi $14, $0, 0				#reseting register
xor $14, $9, $11			#x-or register 9&11
addi $12, $0, 0				#reseting register
addi $12, $0, 16			#copying value from register 16 to 12
addi $15, $15, 0			#reseting register
addi $13, $13, -1			#decreasing value by 1
beq $13, $0, done11			#when register 13 does not equal to 0, it calls itself
j pairwise				#calling pairwise again

done11:
srl $16, $16, 7				#shifting it right to devide it by 128
sw $16, 0x2008				#storing the final values to the address 0x2008
