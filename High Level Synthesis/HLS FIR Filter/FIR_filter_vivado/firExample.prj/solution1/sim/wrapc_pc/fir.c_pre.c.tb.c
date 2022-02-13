// ==============================================================
// File generated on Fri Nov 19 13:33:26 EST 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
#1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 1
#1 "<built-in>" 1
#1 "<built-in>" 3
#149 "<built-in>" 3
#1 "<command line>" 1
#1 "<built-in>" 2
#1 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 2
#1 "/home/dss545/small_projects/FIR_filter_vivado/fir.h" 1




void fir(int *y, int x);
#2 "/home/dss545/small_projects/FIR_filter_vivado/fir.c" 2



void fir(int *y, int x){
#19 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
 int C[11] = {53,0, -91, 0, 313, 500, 313, 0, -91, 0, 53};



 int Xreg ;







 static int shift_reg[11] ;
#43 "/home/dss545/small_projects/FIR_filter_vivado/fir.c"
 int acc ;
 int i,j ;

 acc = 0;




 for(i=11 -1 ; i>0 ; i--)
{






  shift_reg[i] = shift_reg[i-1];
  acc += shift_reg[i-1] * C[i] ;
}







 acc += x * C[0] ;
 shift_reg[0] = x ;


 *y = acc ;
}
