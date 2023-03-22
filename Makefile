CC = clang
CXX = clang++
STRIP = strip

CFLAGS = -I. -O2 -march=native -flto

PREFIX = /usr/local

OBJS = ldid.o lookup2.o sha1.o

all: ldid

ldid: $(OBJS)
	$(CXX) -o ldid $(OBJS) $(CFLAGS)
	$(STRIP) ldid

ldid.o:
	$(CXX) -c ldid.cpp $(CFLAGS)

lookup2.o:
	$(CC) -c lookup2.c -Wno-deprecated-non-prototype $(CFLAGS)

sha1.o:
	$(CC) -c sha1.c $(CFLAGS)

clean:
	rm -f *.o ldid

install: ldid
	install -m 755 ldid $(DESTDIR)$(PREFIX)/bin/ldid
