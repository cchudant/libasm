		global	ft_strcpy
		section	.text
ft_strcpy:
		mov		rax, 0
		mov		rcx, 0
loop:
		mov		cl, [rsi + rax]
		cmp		cl, 0
		je		end
		mov		[rdi + rax], cl
		inc		rax
		jmp		loop
end:
		mov		cl, 0
		mov		[rdi + rax], cl
		mov		rax, rdi
		ret
