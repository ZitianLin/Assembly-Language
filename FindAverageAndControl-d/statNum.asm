; Name: Zitian Lin
; 10/29/19

extern printf				; External c++ function for writing standard output
extern scanf				; External c++ function for reading standard input
extern getchar				; External c++ function for reading character
extern clearerr
extern stdin

global stat				; Enable this program can be called outside the file

segment .data
intro db "We will compute the mean for you using only integers.", 10, 0
prompt db "Enter a sequence of long integers separated by white space. After the last input press Control+D. ", 10, 0

outputCount db "The number of numbers entered was %ld", 10, 0
outputMean db "The integer mean was %ld", 10, 0
againMess db "Do you have more sets of integers to process (y or n)? ", 10, 0

endMess db "This sofeware will return the last mean to the driver program. Bye ", 10, 0

yesString db 'y', 0
noString db 'n', 0

numFormat db "%lf ", 0
stringFormat db "%s", 0


segment .bss
;Empty Declare pointers to un-initialized space in segment

segment .text				; place executable instructions

stat:					; main program start

push 	rbp
mov	rbp, rsp
push	rbx
push	rcx
push	rdx
push 	rdi
push 	rsi
push	r8
push	r9
push	r10
push	r11
push	r12
push	r13
push	r14
push	r15
pushf

main_loop:				; Main loop(user enter y, come back here)

push qword 0				; To stay on 16-byte boundary pushes done in pairs
mov	rax, 0				; No data from SSE will be printed.
mov	rdi, stringFormat		; "%s"
mov	rsi, intro			; "We will compute the mean for you using only integers."
call	printf				; Call printf to output the string

mov	rax, 0				
mov	rdi, stringFormat		
mov	rsi, prompt			;  "Enter a sequence of long integers separated by white space.
					;  After the last input press Control+D. ",
call 	printf

mov	r15, 0				; Initialize r15 to 0, r15 save number of count.
mov	r14, 0				; Initialize r14 to 0, r14 save the total sum
mov	r13, 0

start_loop:

push qword 0
mov	rax, 0			
mov	rdi, numFormat			
mov	rsi, rsp
call 	scanf				; Call scanf function to get the number

cdqe					; Example code: Control-d testbook p77

cmp	rax, -1				; If rax is -1 (empty)
je	end_loop			; The loop end, jump to end_loop

movsd	xmm15, [rsp]			; Else case, move the int into xmm15(from example code)
cvtsd2si r13, xmm15			; Textbook page 261: Convert 64-bit floating-point source
					; operand to 32-bit interger destination operand.
add	r14, r13			; r14 = r14 + r13
inc	r15				; r15 = r15 + 1
pop	rax
jmp	start_loop			; jmp back to the start of the loop

end_loop:				; loop end


pop	rax			
pop	rax

mov	rax, 0				
mov	rdi, outputCount		; "The number of numbers entered was %1ld"
mov	rsi, r15
call	printf

cmp 	r15, 0
je	moreset

mov	rax, r14			; r14 as the numerator
cqo					; r15 as the denominator
idiv	r15				; rax as the quotient, save into r13
mov	r13, rax

mov	rdi, outputMean			; "The integer mean was %ld"
mov	rsi, r13
call	printf

moreset:

mov	rax, 0
mov	rdi, stringFormat		
mov	rsi, againMess			; "Do you have more sets of integers to process (y or n)? "
call	printf


mov	rax, 0
mov	rdi, [stdin]
call	clearerr

mov	rax, 0				; Get the charator from the user input
call	getchar

cmp	rax, 'y'			; Compare the char that user enter with char 'y'	
je	main_loop			; If equal, jump back to the start of the program

mov	rax, 0				; If not equal, continue
mov	rdi, stringFormat		
mov	rsi, endMess			; "This sofeware will return the last mean to the driver
					;  program. Bye "
call	printf

mov	rax, r13			; Put the last mean of the program as the return value.

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

