PC=ponyc
PFLAGS= --linker="gcc -no-pie"
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all clean re

$(NAME):
	$(PC) $(PFLAGS)

all: $(NAME)

clean:
	@if [ -e *.o ]; then\
		rm *.o;\
	fi
	@if [ -e $(NAME) ]; then\
		rm $(NAME);\
	fi

re: clean all
