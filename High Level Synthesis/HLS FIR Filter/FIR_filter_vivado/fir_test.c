#include <stdio.h>
#include "fir.h"

int main() {
	
	int i;
	
	int in, out;
	
	for(i = 0 ; i < 20; i++) {
	    in = i;
		fir(&out, in);
		printf("out = %d\n",out);
	}
	
	return 0;
}