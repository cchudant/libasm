ASM=nasm
ASMFLAGS=-f elf64 -g
OBJECTS=ft_strlen.o ft_strcpy.o ft_strcmp.o ft_write.o ft_read.o \
	ft_strdup.o ft_list_push_front.o ft_list_remove_if.o ft_list_size.o
NAME=libasm.a
TEST_BINARY=test
TEST_FILES=main.c
TEST_CC=gcc
TEST_CFLAGS=-Wall -Wextra -Werror -g

.PHONY: all re clean fclean

%.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJECTS)
	ar rc libasm.a $(OBJECTS)

all: $(NAME)

$(TEST_BINARY): $(NAME) $(TEST_FILES)
	$(TEST_CC) $(TEST_CFLAGS) $(TEST_FILES) $(OBJECTS) -o $(TEST_BINARY)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all
