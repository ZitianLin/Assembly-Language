; Name: Zitian Lin
; Date: 11/06/19

global sum				; Enable this program can be called outside the file

segment .data				; Place initialized data here

segment .bss				; Declare pointers to un-initialized space in this segment

segment .text				; Place executable instructions in this segment

sum:					; Execution begins

push	rbp				
mov	rbp, rsp
push	rbx
push	rcx
push	rdx
push	rdi
push	rsi
push	r8
push	r9
push	r10
push	r11
push	r12
push	r13
push	r14
push	r15
pushf

mov	r12, rdi		; r12 saves the memory location of array
mov	r15, rsi		; r15 saves the number of times need to do

mov	r14, 0			; Initialize r14 to 0 as index
mov	r13, 0			; Initialize r13 to 0 as sum

start_loop:			
cmp	r14, r15		; If index is equal to given numbers of element
je	end_loop		; Jump out and end the loop

add	r13, [r12+r14*8]	; Else sum = sum + array[i]
add	r14, 1			; Increment index by 1

jmp	start_loop		; Jump back to start_loop

end_loop:			; End loop

mov	rax, r13		; Put the sum into rax as the retun value

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
