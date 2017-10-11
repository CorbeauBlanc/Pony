CC=gcc
PC=ponyc
C_DIR= c_functions
PFLAGS= --linker="gcc -no-pie $(C_DIR)/*.o"
DBG_FCTS= debug_fcts.o
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all debug clean re


$(NAME):
	cd $(C_DIR) && $(CC) -c *.c
	$(PC) $(PFLAGS)

all: $(NAME)

$(DBG_FCTS): $(DBG_FCTS:.o=.c)
	$(CC) -c $^

debug: $(DBG_FCTS)
	$(PC) --linker="gcc -no-pie debug_fcts.o"

clean:
	@if [ -e *.o ]; then\
		rm *.o;\
	fi
	@if [ -e $(NAME) ]; then\
		rm $(NAME);\
	fi
	rm $(C_DIR)/*.o

re: clean all
