#pragma line 1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
#pragma line 1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 1
#pragma line 1 "<built-in>" 1
#pragma line 1 "<built-in>" 3
#pragma line 149 "<built-in>" 3
#pragma line 1 "<command line>" 1
#pragma line 1 "<built-in>" 2
#pragma line 1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 2
#pragma line 1 "/home/dss545/small_projects/FIR_filter_vivado/fir.h" 1
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
void fir(int *y, int x);
#pragma line 2 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 2
#pragma empty_line
#pragma empty_line
#pragma empty_line
void fir(int *y, int x){
#pragma line 19 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
 int C[11] = {53,0, -91, 0, 313, 500, 313, 0, -91, 0, 53};
#pragma empty_line
#pragma empty_line
#pragma empty_line
 int Xreg ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 static int shift_reg[11] ;
#pragma line 43 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
 int acc ;
 int i,j ;
#pragma empty_line
 acc = 0;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 for(i=11 -1 ; i>0 ; i--)
{
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  shift_reg[i] = shift_reg[i-1];
  acc += shift_reg[i-1] * C[i] ;
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 acc += x * C[0] ;
 shift_reg[0] = x ;
#pragma empty_line
#pragma empty_line
 *y = acc ;
}
