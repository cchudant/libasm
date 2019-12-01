#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libasm.h"

int		main(void)
{
	printf("-- ft_strlen\n");
	printf("%ld\n", ft_strlen(""));
	printf("%ld\n", ft_strlen("a"));
	printf("%ld\n", ft_strlen("aa"));
	printf("%ld\n", ft_strlen("licorne"));

	// ft_strcpy
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

	printf("-- strcmp\n");
	printf("%d\n", strcmp("a", "b"));
	printf("%d\n", strcmp("", "a"));
	printf("%d\n", strcmp("aaaaa", "a"));
	printf("%d\n", strcmp("a", "aaaaa"));

	printf("-- ft_write\n");
	printf("ret was %ld\n", ft_write(1, "licorne\n", 8));
	printf("ret was %ld\n", ft_write(1, "aaa\n", 4));
	printf("ret was %ld\n", ft_write(-1, "a\n", 2));

	/*
	printf("-- ft_read\n");
	int ret;
	ret = (int)ft_read(0, dest, 2);
	printf("ret is %d, read '%.*s'\n", ret, ret, dest);
	ret = (int)ft_read(0, dest, 8);
	printf("ret is %d, read '%.*s'\n", ret, ret, dest);
	printf("ret is %ld\n", ft_read(-1, dest, 2));
	*/
	
	printf("-- ft_strdup\n");
	printf("'%s'\n", ft_strdup("hello"));
	printf("'%s'\n", ft_strdup("unicorn"));
	printf("'%s'\n", ft_strdup(""));
}
