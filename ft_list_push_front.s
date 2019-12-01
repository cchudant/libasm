; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 16:01:48 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 16:01:48 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_list_push_front
		extern	_malloc
		section	__TEXT,__text
_ft_list_push_front:
		push	rdi
		push	rsi
		mov		rdi, 16 ; sizeof(t_list)
		call	_malloc
		pop		rsi
		pop		rdi
		mov		[rax], rsi ; rax->data = rsi
		mov		rcx, [rdi]
		mov		[rax + 8], rcx ; rax->next = *rdi
		mov		[rdi], rax
		ret
