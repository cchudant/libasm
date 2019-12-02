/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cchudant <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/01 15:59:00 by cchudant          #+#    #+#             */
/*   Updated: 2019/12/02 17:50:02 by cchudant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int		cmp(void *d1, void *d2)
{
	printf("Compare '%s' - '%s'\n", d1, d2);
	return (((char *)d1)[0] != ((char *)d2)[0]);
}

void	free_fct(void *d1)
{
	printf("Freeing '%s'\n", d1);
}

int		main(void)
{
	printf("-- ft_strlen\n");
	printf("%ld\n", ft_strlen(""));
	printf("%ld\n", ft_strlen("a"));
	printf("%ld\n", ft_strlen("aa"));
	printf("%ld\n", ft_strlen("licorne"));

	char dest[50];
	printf("-- ft_strcpy\n");
	printf("%s\n", ft_strcpy(dest, "licorne"));
	printf("%s\n", ft_strcpy(dest, "aaa"));
	printf("%s\n", ft_strcpy(dest, "aa"));
	printf("%s\n", ft_strcpy(dest, ""));

	printf("-- ft_strcmp\n");
	printf("%d\n", ft_strcmp("a", "b"));
	printf("%d\n", ft_strcmp("", "a"));
	printf("%d\n", ft_strcmp("aaaaa", "a"));
	printf("%d\n", ft_strcmp("a", "aaaaa"));

	printf("-- ft_write\n");
	printf("ret was %ld\n", ft_write(1, "licorne\n", 8));
	printf("ret was %ld\n", ft_write(1, "aaa\n", 4));

	/*
	printf("-- ft_read\n");
	int ret;
	ret = (int)ft_read(0, dest, 2);
	printf("ret is %d, read '%.*s'\n", ret, ret, dest);
	ret = (int)ft_read(0, dest, 8);
	printf("ret is %d, read '%.*s'\n", ret, ret, dest);
	*/

	printf("-- ft_strdup\n");
	printf("'%s'\n", ft_strdup("hello"));
	printf("'%s'\n", ft_strdup("unicorn"));
	printf("'%s'\n", ft_strdup(""));

	t_list *lst = NULL;
	printf("-- ft_list_push_front\n");
	ft_list_push_front(&lst, "licorne");
	ft_list_push_front(&lst, "aya");
	ft_list_push_front(&lst, "ooooo");
	ft_list_push_front(&lst, "popcorn");
	while (lst)
	{
		printf("element: '%s'\n", lst->data);
		t_list *tmp = lst;
		lst = lst->next;
		free(tmp);
	}

	printf("-- ft_list_size\n");
	printf("size = %ld\n", ft_list_size(lst));
	ft_list_push_front(&lst, "aya");
	printf("size = %ld\n", ft_list_size(lst));
	ft_list_push_front(&lst, "ooooo");
	printf("size = %ld\n", ft_list_size(lst));
	ft_list_push_front(&lst, "ddd");
	printf("size = %ld\n", ft_list_size(lst));
	ft_list_push_front(&lst, "ooddd");
	printf("size = %ld\n", ft_list_size(lst));

	printf("-- ft_list_remove_if\n");
	t_list *lst2 = NULL;
	ft_list_push_front(&lst2, "o");
	ft_list_push_front(&lst2, "o");
	ft_list_push_front(&lst2, "o");
	ft_list_push_front(&lst2, "o");
	ft_list_remove_if(&lst2, "o", &cmp, &free_fct);
	printf("res: %p\n", lst2);
	while (lst2)
	{
		printf("element: '%s'\n", lst2->data);
		t_list *tmp = lst2;
		lst2 = lst2->next;
		free(tmp);
	}
}
