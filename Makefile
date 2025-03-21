NAME			=	philo
SHELL			=	/bin/bash

CC				=	cc
CFLAGS			=	-g -Wall -Wextra -Werror

SRCS_DIR		=	srcs/
C_SRCS_LIST		=	main.c init.c utils.c time.c routine.c monitor.c cleanup.c
C_SRCS			=	$(addprefix $(SRCS_DIR), $(SRCS_LIST))

OBJS_DIR		=	objs/
OBJS_LIST		:=	$(patsubst %.c, %.o, $(C_SRCS_LIST))
OBJS			=	$(addprefix $(OBJS_DIR), $(OBJS_LIST))

HEADERS			=	-I ./includes

.PHONY : all clean fclean re

all : $(NAME)

$(NAME) : $(OBJS)
	@echo "\033[37mLinking...\033[0m"
	@$(CC) $(CFLAGS) $^ -o $@
	@echo "\033[32mBinary \033[1;32m$(NAME)\033[1;0m\033[32m created.\033[0m"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c includes/*.h
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(CFLAGS) $(HEADERS) -c $< -o $@
	@echo "\033[34mCompilation of \033[36m$(notdir $<)\033[34m done.\033[0m"

clean :
	@rm -rf $(OBJS_DIR)
	@echo "\033[31mObjects files \033[1;31m$(OBJS_LIST)\033[1;0m\033[31m removed.\033[0m"

fclean : clean
	@rm -rf $(OBJS_DIR)
	@rm -rf $(NAME)
	@echo "\033[31mBin \033[1;31m$(NAME)\033[1;0m\033[31m removed.\033[0m"

re : fclean all
