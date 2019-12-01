; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 15:03:19 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 15:03:19 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_strdup
		extern	_malloc
		section	__TEXT,__text
_ft_strdup:
		mov		rax, 0
strlen_loop:
		cmp		[rdi + rax], byte 0
		je		alloc
		inc		rax
		jmp		strlen_loop
alloc:
		push	rdi
		mov		rdi, rax
		call	_malloc
		cmp		rax, 0
		je		end
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
		mov		[rax + rcx], byte 0
		ret

