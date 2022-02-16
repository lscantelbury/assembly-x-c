section .bss
	
	n1 resb 4 ; i32 for input
	n2 resb 4 ; i32 for input

section .data
	
	input_msg1 db "Please enter N1: " ; request user input for n1
	len_msg1 equ $-input_msg1 ; length of message 1

	input_msg2 db "Please enter N2: " ; request user input for n2
	len_msg2 equ $-input_msg2 ; length of message 2

	equals db "Numbers are equals ", 10, 0 ; output message if numbers are equals
	len_equals equ $-equals 

	n1_bigger db "N1 is bigger than N2", 10, 0 ; output message if n1 > n2
	len_n1_bigger equ $-n1_bigger

	n2_bigger db "N2 is bigger than N1", 10, 0 ; output message if n2 > n1
	len_n2_bigger equ $-n2_bigger

section .text 

	global _start

	_start: 
		
		; Diplaying input_msg1
		mov eax, 4
		mov ebx, 1
		mov ecx, input_msg1
		mov edx, len_msg1
		int 0x80

		; Receiving user input
		mov eax, 3
		mov ebx, 2
		mov ecx, n1 ; storing user input in n1
		mov edx, 4; number of bytes of user's input
		int 0x80

		; Diplaying input_msg2
		mov eax, 4
		mov ebx, 1
		mov ecx, input_msg2
		mov edx, len_msg2
		int 0x80

		; Receiving user input
		mov eax, 3
		mov ebx, 2
		mov ecx, n2 ; storing user input in n2
		mov edx, 4; number of bytes of user's input
		int 0x80

		mov bh, [n1]
		mov bl, [n2]
		cmp bh, bl
		jg greater
		jl less
		je equal

		equal: 
			mov eax, 4
			mov ebx, 1
			mov ecx, equals
			mov edx,len_equals
			int 0x80
			jmp end

		less:
			mov eax, 4
			mov ebx, 1
			mov ecx, n2_bigger
			mov edx, len_n2_bigger
			int 0x80
			jmp end
		
		greater: 
			mov eax, 4
			mov ebx, 1
			mov ecx, n1_bigger
			mov edx, len_n1_bigger
			int 0x80

		end: 
			mov eax, 1
			mov ebx, 0
			int 0x80

