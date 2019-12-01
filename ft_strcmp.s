; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 14:28:25 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 14:28:48 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_strcmp
		section	__TEXT,__text
_ft_strcmp:
		mov		rcx, 0
loop:
		mov		rax, 0
		mov		al, [rdi]
		mov		cl, [rsi]
		inc		rdi
		inc		rsi
		sub		rax, rcx
		jz		loop
end:
		ret
