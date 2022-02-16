section .bss

	iterations resb 1
	num resb 1

section .text

	global _start

	_start:

		mov eax, 3
		mov ebx, 2
		mov ecx, iterations
		mov edx, 1
		int 0x80

		mov ecx, [iterations]
		mov eax, 1

	loop:
		mov [num], eax
		mov eax, 4
		mov ebx, 1
		push ecx
	
		mov ecx, num
		mov edx, 1
		int 0x80

		mov eax, [num]
		sub eax, '0'
		inc eax
		add eax, '0'
		pop ecx
		loop loop

	end:
		mov eax, 1
		mov ebx, 0
		int 0x80
