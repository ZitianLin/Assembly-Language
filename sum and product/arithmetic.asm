; Name: Zitian Lin
; 10/23/19

global arithmetic
extern printf
extern scanf

segment .data
Intro db "This Program was built by Zitian Lin.", 10, 0
prompt db "Please input the first integer: ", 10, 0
prompt2 db "Please input the second integer: ", 10, 0
respond db "You entered: %ld", 10, 0
sum db  "The sum of these two integers is %ld", 10, 0
product db  "The product of these two integers is %ld", 10, 0

;Assemble: nasm -f elf64 -l arithmetic.lis -o arithmetic.o arithmetic.asm


segment .bss
;Empty
segment .text


format db "%ld", 0

arithmetic:		; arithmetic function
push  rbp		; push all the register in
mov   rbp, rsp
push  rbx
push  rcx
push  rdx
push  rdi
push  rsi
push  r8
push  r9
push  r10
push  r11
push  r12
push  r13
push  r14
push  r15
pushf

mov   rax, 0	
mov   rdi, Intro	; print out the Introduction message by calling the 
call  printf		; printf function, mov Intro text as the argument
			; and put it into rdi
mov   rdi, prompt	; print prompt and ask for user input.
call  printf

push  qword 0		; allocate space for incoming number
mov   rax, 0
push  qword 0
mov   rdi, format	; create the format to hold the number
mov   rsi,  rsp		
call  scanf		; call scanf function and let user input the number
pop   r15		; input number store in r15
pop   rax

mov   rax, 0
mov   rdi, respond	; print out the respond text
mov   rsi,  r15		; the number that we have as the second argument.
call  printf		; call the printf function

mov   rdi, prompt2	
call  printf		; print the prompt message
push  qword 0		; allocate space for the incoming number
mov   rax, 0
push  qword 0
mov   rdi, format	; create the format to hold the number
mov   rsi, rsp		
call  scanf		; call scanf function
pop   r14		; input number store in r14
pop   rax

mov   rax, 0		
mov   rdi, respond	; print the respond message
mov   rsi, r14		; r14 as the second argument to print out
call  printf

mov   r13, r14		; copy one of the number store in r13
add   r13, r15        	; r13 hold the sum
imul  r14, r15        	; r14 hold the product

mov   rax, 0		
mov   rdi, sum		; print out the sum message 
mov   rsi, r13		; with second argument as sum
call  printf

mov   rax, 0
mov   rdi, product	; print out the product message
mov   rsi, r14		; with second argument as product
call  printf


mov   rax, 5		; set a return value

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
pop   rbp		; pop out all the register

ret			; return
