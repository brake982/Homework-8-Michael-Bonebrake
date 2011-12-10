exe = ma myma

.PHONY: all clean test dist

all:cma.o ma.o libcma.so $(exe)

cma.o: cma.c cma.h
	gcc -c cma.c

ma.o: ma.c cma.h
	gcc -c ma.c

libcma.so: cma.o
	gcc -shared cma.o -o libcma.so

ma: ma.o libcma.so
	gcc ma.o -o ma -L./ -lcma

myma: myma.c libcma.so
	gcc myma.c -L./ -lcma -o myma

test: ma myma
	./ma
	./myma

dist: 
	tar -czvf HW6.tar.gz .
clean:
	rm *.o
	rm *.so
	rm $(exe)
