ASM=nasm
ASMFLAGS=-f macho64 -g
OBJECTS=ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o \
	ft_strdup.o
BONUS_OBJECTS=ft_list_push_front.o ft_list_size.o ft_list_remove_if.o
NAME=libasm.a
TEST_BINARY=test
TEST_FILES=main.c
TEST_CC=gcc
TEST_CFLAGS=-Wall -Wextra -Werror -g -fsanitize=address

.PHONY: all re clean fclean bonus

%.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)

bonus: $(OBJECTS) $(BONUS_OBJECTS)
	ar rc $(NAME) $(OBJECTS) $(BONUS_OBJECTS)

all: $(NAME)


$(TEST_BINARY): bonus $(TEST_FILES)
	$(TEST_CC) $(TEST_CFLAGS) $(TEST_FILES) $(NAME) -o $(TEST_BINARY)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all
