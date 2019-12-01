		global	ft_list_size
		section	.text
ft_list_size:
		mov		rax, 0
loop:
		cmp		rdi, 0
		je		end
		mov		rdi, [rdi + 8] ; rdi = rdi->next
		mov		rdi, [rcx + 8]
		jmp		loop
end:
		ret
