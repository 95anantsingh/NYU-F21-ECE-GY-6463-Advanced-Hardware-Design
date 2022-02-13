#include <stdio.h>

#define TAPS 0x8C540001

//char rstn, char get_random, char load_seed, char * data_in, char * data_out
void main (){

  unsigned int rnum = 0x9AEB7F45;
  unsigned int xor;

  char i;
  char n = 10;

  for (i=0;i<n;i++){
    xor = rnum & TAPS;
    xor ^= xor >> 16;
    xor ^= xor >> 8;
    xor ^= xor >> 4;
    xor ^= xor >> 2;
    xor ^= xor >> 1;

    rnum = (rnum >> 1 )| (xor<<31);
    printf("%.8X\n", rnum);
  }
  // int i;
  // printf("Rnum: %X\n",rnum); 
  // unsigned char k = 0x7F;
  // for(i = 1; i < 5; i++){
  //   rnum = (rnum << 8)  | k;
  //   printf("%.8X\n",rnum); 
  // }

}