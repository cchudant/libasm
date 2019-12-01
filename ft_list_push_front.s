		global	ft_list_push_front
		extern	malloc
		section	.text
ft_list_push_front:
		push	rdi
		push	rsi
		mov		rdi, 16 ; sizeof(t_list)
		call	malloc
		pop		rsi
		pop		rdi
		mov		[rax], rsi ; rax->data = rsi
		mov		[rax + 8], rdi ; rax->next = rdi
		mov		[rdi], rax
		ret
