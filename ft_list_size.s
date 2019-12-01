; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2019/12/01 16:14:31 by cchudant          #+#    #+#              ;
;    Updated: 2019/12/01 16:14:31 by cchudant         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

		global	_ft_list_size
		section	__TEXT,__text
_ft_list_size:
		mov		rax, 0
loop:
		cmp		rdi, 0
		je		end
		mov		rdi, [rdi + 8] ; rdi = rdi->next
		inc		rax
		jmp		loop
end:
		ret
