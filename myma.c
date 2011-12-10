#include "cma.h"
#include <stdlib.h>

int main(int argc, char * argv[]) {
	int MSIZE;
	MSIZE = atoi(argv[1]);
	char * mem;
        mem = malloc(MSIZE);
	class_memory(mem,MSIZE); // give it memory allocator
	int n = 1;
	while (mem) {
		mem = class_malloc(n);
	        n *= 2;
	}	
	class_free(mem);
	class_stats();

	return 0;
}
