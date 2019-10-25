; Name: Zitian Lin
; 10/24/19

;long division();

global division

extern printf
extern scanf


segment .data
Intro db "The X86 program has begun", 10, 0
prompt1 db "Please enter the first integer and press enter: ", 10, 0
prompt2 db "Please enter the second integer and press enter: ", 10, 0
message db "Thank you.", 10, 0
answer db "The quotient of %ld divided by %ld is %ld with remainder %ld", 10, 0
positiveText db "The remainder is clearly positive.", 10, 0
negativeText db "The remainder is negative.", 10, 0
remainderZeroText db "The remainder is 0.", 10, 0 
zeroText db "Sorry: we do not handle zero here.", 10, 0
wrong db "Please run this program again.", 10, 0
negative1 db "Negative 1 will be returned to the caller program. Have a nice day.", 10, 0
finaltext db "The remainder will be returned to the caller program. Have a nice day.", 10, 0

segment .bss		;Empty
segment .text

format db "%ld", 0

division:

push 	rbp				; push in the register
mov	rbp, rsp
push 	rbx
push 	rcx
push 	rdx
push 	rdi
push 	rsi
push	r8
push	r9
push 	r10
push 	r11
push 	r12
push 	r13
push 	r14
push 	r15
pushf

mov	rax, 0				; print the intro
mov	rdi, Intro
call 	printf

mov	rdi, prompt1			; Please enter the first integer ...
call 	printf

push 	qword 0				; allocate space for incoming number
push	qword 0
mov	rax, 0				
mov	rdi, format			; put rdi into integer format
mov	rsi, rsp
call	scanf				; get the number from scanf
pop	r15				; put the first number in r15
pop	rax

mov	rdi, prompt2
call	printf

push 	qword 0
push	qword 0
mov	rax, 0
mov	rdi, format
mov	rsi, rsp
call 	scanf
pop	r14				; put the second number in r14
pop	rax

mov	rdi, message			; Thank you message
call	printf

cmp	r14, 0
jne	notZero				; if statement denominator is equal to 0
mov	rdi, zeroText			; yes, then jump to notZero
call 	printf				; no, print the wrong message
mov	rdi, wrong			; return -1 and jump to the end of the file.
call 	printf
mov	rdi, negative1
call	printf
mov	rax, -1
jmp	end




notZero:
mov	rax, r15			;not zero blanket
cqo
idiv	r14				;numerator is in r15
					;denominator is in r14
					;quotient is in rax
					;remainder is in rdx
mov	r13, rdx			;save the result of remainder
mov	rdi, answer			;put the text with format in rdi
					
					;because we need to use rdx, so save it to r8 first
mov	r8, rdx				;second parameter with numberator(rsi)
mov	rcx, rax			;third parameter with denominator(rdx)
mov	rsi, r15			;fourth parameter with quotient(rcx)
mov	rdx, r14				;fifth parameter with remainder(r8)
call 	printf

cmp	r13, 0				;compare r13 with 0 where r13 is the remainder
je	remainderZero			;if equal to zero, jump to remainderZero
cmp	r13, 0				;if greater to zero, jump to positive
jg	positive

mov	rdi, negativeText		;left over is the remainder is negative(less than 0)
call 	printf				
mov	rdi, finaltext			;output the text
call 	printf
mov	rax, r13			;put remainder to return value
jmp	end				;end the program



positive:

mov	rdi, positiveText		;output the text
call	printf
mov	rdi, finaltext
call	printf				
mov	rax, r13			;put remainder to return value
jmp	end				;end the program


remainderZero:

mov	rdi, remainderZeroText		;output the text
call	printf
mov	rdi, finaltext			
call	printf			
mov	rax, r13			;put remainder to return value
					;end the program

end:


popf
pop   r15
pop   r14
pop   r13
pop   r12
pop   r11
pop   r10
pop   r9
pop   r8
pop   rsi
pop   rdi
pop   rdx
pop   rcx
pop   rbx
pop   rbp				; pop out all the register

ret					; return

