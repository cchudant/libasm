		global	ft_read
		section	.text
ft_read:
		mov		rax, 0 ; syscall read
		syscall
		ret
