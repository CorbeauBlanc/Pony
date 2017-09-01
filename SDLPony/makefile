PC=ponyc
PFLAGS= --linker="gcc -no-pie"
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all clean re

$(NAME):
	$(PC) $(PFLAGS)

all: $(NAME)

clean:
	rm *.o
	rm $(NAME)

re: clean all
