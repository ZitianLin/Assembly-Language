; Name: Zitian Lin
; Date: 11/06/2019

extern printf				; External c++ function for writing standard output
extern getchar				; External c++ function for reading character
extern fill				; External fill function for filling the array			
extern display				; External display function for output the array
extern sum				; External sum function for getting the sum of array

extern clearerr
extern stdin

global control				; Enable this program can be called outside the file

segment .data				; Place initialized data here

intro1 db "Hi, you are in Control Module now.", 10, 0
intro2 db "Are you ready? (Press 'c' to continue or 'x' to exit)", 10, 0
prompt db "Are these values correct(y or n)?", 10, 0

string_format db "%s", 0

segment .bss				; Declare pointers to un-initialized space in this segment.
array_space resq 20			; Long array[20], 160 byte = 8 x 20

segment .text				; Place executable instructions in this segment 

control:				; Execution begins

push	rbp
mov	rbp, rsp
push 	rbx
push	rcx
push	rdx
push	rdi
push	rsi
push 	r8
push	r9
push	r10
push	r11
push	r12
push	r13
push	r14
push	r15
pushf

mov	rax, 0				
mov	rdi, string_format		
mov	rsi, intro1			; "Hi, you are in Control Module now."
call	printf

mov	rax, 0
mov	rdi, string_format		
mov	rsi, intro2			; "Are you ready? (Press 'c' to continue or 'x' to exit)"
call	printf

mov	rax, 0
call	getchar				; Call the c++ getchar function to read a character

mov	r8, 0				; r8 hold the return value of this control function
cmp	rax, 'c'			; Comparing character with char 'c'
jne 	end				; if not equal 'c', jump the function to the end.

start:

mov	rdi, array_space		; Put the array memory location as the argument
mov	rsi, 20				; Maximum number of element of array is 20, as second argument
call	fill				; Call the fill function

mov	r14, rax			; r14 save the return value(the number of element filled in array)
	
mov	rdi, array_space		; Put the array memory location as the argument
mov	rsi, r14			; Put the number of element in array as second argument
call	display				; Call the display function to output the array

mov	rdi, string_format	
mov	rsi, prompt			; "Are these values correct(y or n)?"
call	printf

mov	rax, 0
mov	rdi, [stdin]
call	clearerr

mov	rax, 0				
call 	getchar				; Call c++ getchar function to read a character

cmp	rax, 'y'			; Compare character with char 'y'
jne	start				; if character is not equal to 'y', jump back to the beginning

mov	rdi, array_space		; Put the array memory location as the argument
mov	rsi, r14			; Put the number of element in array as second argument
call	sum				; Call the sum function to recieve the value of sum

mov	r8, rax				; r8 save the return value of control function
	
end:	
mov	rax, r8				; move r8 to rax, put the return value into rax
					; If user enter x at the beginning, sum should be 0(r8)
popf
pop	r15
pop	r14
pop	r13
pop	r12
pop	r11
pop	r10
pop	r9
pop	r8
pop	rsi
pop	rdi
pop	rdx
pop	rcx
pop	rbx
pop	rbp

ret
