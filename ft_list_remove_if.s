
		global	ft_list_remove_if
		section	.text
ft_list_remove_if:
		push	rdi
		mov		rdi, [rdi]
		push	qword 0
loop:
		cmp		rdi, 0
		jz		end
		push	rdi
		push	rsi
		push	rdx
		push	rcx
		mov		rdi, [rdi] ; rdi->data
		call	[rdx] ; cmp(...)
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		cmp		rax, 0
		jne		next_elem
del_one:
		push	rdi
		push	rsi
		push	rdx
		push	rcx
		mov		rdi, [rdi] ; rdi->data
		call	[rax] ; free_fct(...)
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		pop		rax
		cmp		rax, 0
		je		set_begin_lst
		mov		rcx, [rdi + 8] ; rcx = rdi->next
		mov		[rax + 8], rcx ; rax->next = rcx
		push	rax
		jmp		next_elem
set_begin_lst:
		pop		rcx
		mov		rbp, [rdi + 8] ; rbp = rdi->next
		mov		[rcx], rbp
		push	rcx
		push	rax
		jmp		next_elem
next_elem:
		pop		rax
		push	rdi
		mov		rdi, [rdi + 8] ; rdi = rdi->next
		jmp		loop
end:
		pop		rax
		pop		rax
		ret
