; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 14:27:52 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 14:28:53 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_strcpy
		section	__TEXT,__text
_ft_strcpy:
		mov		rax, 0
		mov		rcx, 0
loop:
		mov		cl, [rsi + rax]
		cmp		cl, 0
		je		end
		mov		[rdi + rax], cl
		inc		rax
		jmp		loop
end:
		mov		cl, 0
		mov		[rdi + rax], cl
		mov		rax, rdi
		ret
