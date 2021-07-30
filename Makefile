SRC		= 		hello.s
OBJ 	= 		$(SRC:.s=.o)

NA 		= 		nasm
FL 		=  		-f macho64
FLAGS 	= 		-Wall -Wextra -Werror
TEST 	= 		test 
NAME	=		libasm.a

%.o:			%.s
				$(NA) $(FL) $<

all:			$(NAME)

$(NAME):		$(OBJ)
				ar rcs $(NAME) $(OBJ)

clean:
				rm -rf $(OBJ)

fclean:			clean
				rm -rf $(NAME) $(TEST)

re:				fclean $(NAME)

test:			$(NAME)
				@gcc $(FLAGS) -Wl,-no_pie -L. -lasm -o $(TEST) main.c
				@./$(TEST)