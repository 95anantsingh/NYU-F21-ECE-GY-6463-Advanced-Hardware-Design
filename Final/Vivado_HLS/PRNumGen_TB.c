#include <stdio.h>
#include <stdlib.h>
#include "PRNumGen.h"

int main() {

	uint1 rstn;
	uint1 get_random;
	uint1 load_seed;
	uint8 output;
	uint8 input;

	unsigned int seed;
	unsigned int out;
	FILE *fp;

	fp = fopen("Testcases.txt","r");

	printf("______________________________\n\n");

	if (fp == NULL){
		printf("Error while opening the file.\n");
		exit(0);
	}

	fscanf(fp,"%X\n",&seed);
	printf("Seed: %.8X\n",seed);

	fscanf(fp,"%X\n",&out);

//	Test 1 - Test for zero output if get_random = 0, load_seed =0
	rstn = 1;
	get_random = 0;
	load_seed = 0;
	input = 0x0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != 0x00){
		printf("\nError in Test 1\n\n");
		exit(0);
	}
	else{
		printf("\nTest 1 - Passed\n");
	}

//	Test 2 - Reset Test
	rstn = 1;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	PRNumGen(rstn, get_random, load_seed, input, &output);
	PRNumGen(rstn, get_random, load_seed, input, &output);

	rstn = 0;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	get_random = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 2a\n\n");
		exit(0);
	}
	get_random = 0;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 2b\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 16 & 0xFF)){
		printf("\nError in Test 2c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 24 & 0xFF)){
		printf("\nError in Test 2d\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 2e\n\n");
		exit(0);
	}
	printf("\nTest 2 - Passed\n");


//	Test 3 - get_random more than 4 cycle
	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	get_random = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 3a\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 3b\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 16 & 0xFF)){
		printf("\nError in Test 3c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 24 & 0xFF)){
		printf("\nError in Test 3d\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 3e\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 3f\n\n");
		exit(0);
	}
	get_random = 0;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 16 & 0xFF)){
		printf("\nError in Test 3g\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 24 & 0xFF)){
		printf("\nError in Test 3h\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 3i\n\n");
		exit(0);
	}


	printf("\nTest 3 - Passed\n");


//	Test 4 - Reset in between of a cycle get_random cycle

	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	get_random = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 4a\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 4b\n\n");
		exit(0);
	}

	rstn = 0;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;
	get_random = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 4c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 4d\n\n");
		exit(0);
	}
	printf("\nTest 4 - Passed\n");


//	Test 5 - load_seed less than 4 cycle
	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 1;

	fscanf(fp,"%X\n",&seed);
	printf("\nSeed: %.8X\n",seed);
	fscanf(fp,"%X\n",&out);

	input = seed & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 8 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 0;
	input = seed >> 16 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 24 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	PRNumGen(rstn, get_random, load_seed, input, &output);
	get_random = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 5a\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 5b\n\n");
		exit(0);
	}

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 16 & 0xFF)){
		printf("\nError in Test 5c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 24 & 0xFF)){
		printf("\nError in Test 5d\n\n");
		exit(0);
	}
	printf("\nTest 5 - Passed\n");


//	Test 6 - load_seed more than 4 cycle
	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 1;

	input = seed & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 8 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 16 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 24 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	load_seed=0;

	input = seed >> 8 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 16 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 24 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	PRNumGen(rstn, get_random, load_seed, input, &output);
	get_random = 1;



	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out & 0xFF)){
		printf("\nError in Test 6a\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 8 & 0xFF)){
		printf("\nError in Test 6b\n\n");
		exit(0);
	}

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 16 & 0xFF)){
		printf("\nError in Test 6c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (out >> 24 & 0xFF)){
		printf("\nError in Test 6d\n\n");
		exit(0);
	}
	printf("\nTest 6 - Passed\n");


//	Test 7 - Reset in between load_seed cycle
	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 1;

	input = seed & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 8 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	rstn = 0;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;
	get_random = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 7c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 7d\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 7c\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 7d\n\n");
		exit(0);
	}
	PRNumGen(rstn, get_random, load_seed, input, &output);
	if(output != (0x00)){
		printf("\nError in Test 7c\n\n");
		exit(0);
	}
	printf("\nTest 7 - Passed\n");


//	Test 8 - Extensive testing against 1000 test vectors
	rstn = 0;
	get_random = 0;
	load_seed = 0;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	rstn = 1;

	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 1;

	fscanf(fp,"%X\n",&seed);
	printf("\nSeed: %.8X\n",seed);

	input = seed & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 8 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);
	load_seed = 0;
	input = seed >> 16 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);

	input = seed >> 24 & 0xFF;
	PRNumGen(rstn, get_random, load_seed, input, &output);


	while((fscanf(fp,"%X\n",&out)) != EOF){
		PRNumGen(rstn, get_random, load_seed, input, &output);
		get_random = 1;
		PRNumGen(rstn, get_random, load_seed, input, &output);
	    if(output != (out & 0xFF)){
			printf("\nError in Test 8a\n\n");
			exit(0);
		}
		PRNumGen(rstn, get_random, load_seed, input, &output);
		if(output != (out >> 8 & 0xFF)){
			printf("\nError in Test 8b\n\n");
			exit(0);
		}
		get_random = 0;
		PRNumGen(rstn, get_random, load_seed, input, &output);
		if(output != (out >> 16 & 0xFF)){
			printf("\nError in Test 8c\n\n");
			exit(0);
		}
		PRNumGen(rstn, get_random, load_seed, input, &output);
		if(output != (out >> 24 & 0xFF)){
			printf("\nError in Test 8d\n\n");
			exit(0);
		}
	}

	printf("\nTest 8 - Passed\n\n");

	fclose(fp);

	return 0;
}
