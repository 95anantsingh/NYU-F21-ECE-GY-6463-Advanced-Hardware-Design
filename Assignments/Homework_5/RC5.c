/*

Code Reference: https://people.csail.mit.edu/rivest/Rivest-rc5.pdf (Appendix) C Code

How to run:

gcc RC5.c
./a.out key first_32_bit_in_hexadecimal rest_32_bit_in_hexadecimal

For example:

./a.out 915F4619BE41B2516355A50110A9CE91 EEDBA521 6D8F4B15

where key= 915F4619BE41B2516355A50110A9CE91
      plain text =  EEDBA521 6D8F4B15

*/


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
typedef uint32_t WORD;          /* Should be 32-bit = 4 bytes        */
#define w        32             /* word size in bits                 */
#define r        12             /* number of rounds                  */  
#define b        16             /* number of bytes in key            */
#define c         4             /* number  words in key = ceil(8*b/w)*/
#define t        26             /* size of table S = 2*(r+1) words   */
WORD S[t];                      /* expanded key table                */
WORD P = 0xb7e15163, Q = 0x9e3779b9;  /* magic constants             */
/* Rotation operators. x must be unsigned, to get logical right shift*/
#define ROTL(x,y) (((x)<<(y&(w-1))) | ((x)>>(w-(y&(w-1)))))
#define ROTR(x,y) (((x)>>(y&(w-1))) | ((x)<<(w-(y&(w-1)))))

void RC5_ENCRYPT(WORD *pt, WORD *ct) /* 2 WORD input pt/output ct    */
{ WORD i, A=pt[0]+S[0], B=pt[1]+S[1];
  // printf("\nA\n");
  // for (i=0;i<26;i++){
  //   printf("%.8X\n",S[i]);
  // }

  for (i=1; i<=r; i++) { 
    A = ROTL(A^B,B)+S[2*i]; 
    B = ROTL(B^A,A)+S[2*i+1]; 
  }
  ct[0] = A; ct[1] = B;  
} 

void RC5_DECRYPT(WORD *ct, WORD *pt) /* 2 WORD input ct/output pt    */
{ WORD i, B=ct[1], A=ct[0];
  for (i=r; i>0; i--){ 
    // printf("\n%d",i);
    B = ROTR(B-S[2*i+1],A)^A; 
    // printf("\n%.8X",B);
    A = ROTR(A-S[2*i],B)^B; 
    // printf("\n%.8X",A);
  }
  pt[1] = B-S[1]; pt[0] = A-S[0];  
} 

void RC5_SETUP(unsigned char *K) /* secret input key K[0...b-1]      */
{  WORD i, j, k, u=w/8, A, B, L[c]; 
  /* Initialize L, then S, then mix key into S */
  // printf("\n");
  // for (i=0;i<16;i++){
  //   printf("%.2X",K[i]);
  // }
  // printf("\n");
  for (i=b-1,L[c-1]=0; i!=-1; i--) L[i/u] = (L[i/u]<<8)+K[i];

  // for (i=0;i<4;i++){
  //   printf("%.8X\n",L[i]);
  // }
  // printf("\n");
  for (S[0]=P,i=1; i<t; i++) S[i] = S[i-1]+Q;
  for (A=B=i=j=k=0; k<3*t; k++,i=(i+1)%t,j=(j+1)%c){ 
    // printf("\n%d\n",k);
    // printf("a_tmp1: %.8X\n",S[i]+(A+B));
    A = S[i] = ROTL(S[i]+(A+B),3);  
    // printf("a_tmp2: %.8X\n",A);
    // printf("ab_tmp2: %.8X\n",(A+B));
    // printf("L[j]: %.8X\n",L[j]);
    // printf("b_tmp1: %.8X\n",L[j]+(A+B));
    B = L[j] = ROTL(L[j]+(A+B),(A+B)); 
    // printf("b_tmp2: %.8X\n\n",B);
  } 
  printf("\n");
  for (i=0;i<26;i++){
    printf("%.8X\n",S[i]);
  }
} 

int main(int argc, char *argv[]) {
  WORD i, j, pt1[2], pt2[2], ct[2]; // = {0,0}; // unused 
  unsigned char key[b];
  char val1[100]; // unsigned causes compiler warnings
  char val2[100]; // unsigned causes compiler warnings
  printf("RC5-32/12/16\n");
  char *key1 = "915F4619BE41B2516355A50110A9CE91"; //was missing 2 zeros
  strcpy(val1, "00000000");
  strcpy(val2, "00000000");
  if (argc>1) key1=argv[1];
  if (argc>2) strcpy(val1, argv[2]);
  if (argc>3) strcpy(val2, argv[3]);
  pt1[0] = (int)strtol(val1, NULL, 16);
  pt1[1] = (int)strtol(val2, NULL, 16);
  int str_len = strlen(key1);
  for (i = 0; i < (str_len / 2); i++) 
    sscanf(key1 + 2 * i, "%2hhx", &key[i]);
  RC5_SETUP(key);  
  RC5_ENCRYPT(pt1,ct);  
  RC5_DECRYPT(ct,pt2);
  printf("\nKey:\t\t");
  for (j = 0; j<b; j++) printf("%.2X", key[j]);
  printf("\nPlaintext\t%.8X %.8X",pt1[0], pt1[1]);
  printf("\nCiphertext\t%.8X %.8X\n",ct[0], ct[1]);
  if (pt1[0]!=pt2[0] || pt1[1]!=pt2[1]) 
     printf("Decryption Error!");
}  
