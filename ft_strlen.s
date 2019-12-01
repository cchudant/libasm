		global	ft_strlen
		section	.text
ft_strlen:
		mov		rax, 0
		mov		rcx, 0
loop:
		mov		cl, [rdi + rax]
		cmp		rcx, 0
		jne		reloop
		jmp		end
reloop:
		inc		rax
		jmp		loop
end:
		ret
