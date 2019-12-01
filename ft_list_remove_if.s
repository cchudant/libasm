; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_remove_if.s                                :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 16:24:25 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 16:24:25 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_list_remove_if
		section	__TEXT,__text
_ft_list_remove_if:
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
		call	rdx ; cmp(...)
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
		call	rcx ; free_fct(...)
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		pop		rax
		cmp		rax, 0
		je		set_begin_lst
		mov		r8, [rdi + 8] ; rcx = rdi->next
		mov		[rax + 8], r8 ; rax->next = rcx
		push	rax
		jmp		next_elem
set_begin_lst:
		pop		r8
		push	rcx
		mov		rcx, [rdi + 8] ; rcx = rdi->next
		mov		[r8], rcx
		pop		rcx
		push	r8
		push	rax
next_elem:
		pop		rax
		push	rdi
		mov		rdi, [rdi + 8] ; rdi = rdi->next
		jmp		loop
end:
		pop		rax
		pop		rax
		ret
