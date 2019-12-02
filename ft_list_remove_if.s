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
		extern	_free
		section	__TEXT,__text
_ft_list_remove_if:
		push	rdi
		mov		rdi, [rdi]
		push	qword 0
		push	qword 0
loop:
		cmp		rdi, 0
		je		end
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
		jne		next_elem_nofree
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
		push	rdi
		push	rsi
		push	rdx
		push	rcx
		call	_free ; free(...)
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		pop		rax
		cmp		rax, 0
		je		set_begin_lst
fix_next:
		pop		r9
		mov		r8, [rdi + 8] ; r8 = rdi->next
		mov		[r9 + 8], r8 ; rax->next = r8
		push	r9
		push	rax
		jmp		next_elem
set_begin_lst:
		pop		r9
		pop		r8
		push	rax
		mov		rax, [rdi + 8] ; r8 = rdi->next
		mov		[r8], rax
		pop		rax
		push	r8
		push	r9
		push	rax
		jmp		next_elem
next_elem_nofree:
		pop		r9
		push	qword 1
next_elem:
		pop		r9
		pop		rax
		push	rdi
		push	r9
		mov		rdi, [rdi + 8] ; rdi = rdi->next
		jmp		loop
end:
		pop		rax
		pop		rax
		pop		rax
		ret
