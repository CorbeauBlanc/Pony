PC=ponyc
PFLAGS= --linker="gcc -no-pie"
MAKE=/usr/bin/make
NAME=$(notdir $(CURDIR))

.PHONY: all clean re

all: $(NAME)
	$(PC) $(PFLAGS)

clean:
	rm $(NAME)

re: clean all
