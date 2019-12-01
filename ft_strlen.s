; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 14:28:02 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 14:29:39 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_strlen
		section	__TEXT,__text
_ft_strlen:
		mov		rax, 0
		mov		rcx, 0
loop:
		mov		cl, [rdi + rax]
		cmp		rcx, 0
		jne		reloop
		jmp		end
reloop:
		inc		rax
		jmp		loop
end:
		ret
