CC=gcc
CFLAGS=-Wall -Wextra -Werror
PC=ponyc
#PFLAGS= --linker="gcc -no-pie"
DBG_FCTS= debug_fcts.o
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all debug clean re

$(NAME):
	$(PC) $(PFLAGS)

all: $(NAME)

$(DBG_FCTS): $(DBG_FCTS:.o=.c)
	gcc -c $^

debug: $(DBG_FCTS)
	$(PC) --linker="gcc -no-pie debug_fcts.o"

clean:
	@if [ -e *.o ]; then\
		rm *.o;\
	fi
	@if [ -e $(NAME) ]; then\
		rm $(NAME);\
	fi

re: clean all
