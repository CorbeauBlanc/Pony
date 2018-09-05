CC=gcc
PC=ponyc
C_DIR= c_functions
PFLAGS= --linker="gcc -no-pie $(C_DIR)/*.o"
DBG_FCTS= debug_fcts.o
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all debug clean re


$(NAME):
	$(PC)

all: $(NAME)

$(DBG_FCTS): $(DBG_FCTS:.o=.c)
	$(CC) -c $^

clean:
	@if [ -e *.o ]; then\
		rm *.o;\
	fi
	@if [ -e $(NAME) ]; then\
		rm $(NAME);\
	fi

re: clean all
