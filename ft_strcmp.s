		global	ft_strcmp
		section	.text
ft_strcmp:
		mov		rcx, 0
loop:
		mov		rax, 0
		mov		al, [rdi]
		mov		cl, [rsi]
		inc		rdi
		inc		rsi
		sub		rax, rcx
		jz		loop
end:
		ret
