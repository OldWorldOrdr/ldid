CXX = clang++
STRIP = strip

CFLAGS += -I. -O2 -Wno-deprecated-non-prototype
ifdef LTO
CFLAGS += -flto
endif
ifdef MARCHNATIVE
CFLAGS += -march=native
endif

PREFIX ?= /usr/local

all: ldid

ldid:
	$(CXX) -o ldid ldid.cpp -x c lookup2.c -x c sha1.c $(CFLAGS)
	$(STRIP) ldid

clean:
	rm -f ldid

install: ldid
	install -m 755 ldid $(DESTDIR)$(PREFIX)/bin/ldid
