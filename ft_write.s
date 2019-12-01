		global	ft_write
		section	.text
ft_write:
		mov		rax, 1 ; syscall write
		syscall
		ret
