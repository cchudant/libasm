		global	ft_strdup
		extern	malloc
		section	.text
ft_strdup:
		mov rax, 0
strlen_loop:
		cmp		[rdi + rax], byte 0
		je		alloc
		inc		rax
		jmp		strlen_loop
alloc:
		push	rdi
		mov		rdi, rax
		call	malloc
		pop		rdi
		mov		rcx, 0
copy_loop:
		mov		dl, [rdi, rcx]
		cmp		dl, 0
		jz		end
		mov		[rax + rcx], dl
		inc		rcx
		jmp		copy_loop
end:
		ret

