#include "fir.h"
#define N 11
#define SIZE 128

void fir(int *y, int x){
//#pragma HLS ALLOCATION instances=DSP_Macro limit=1 core
//#pragma HLS ALLOCATION instances=AddSub_DSP limit=1 core
//#pragma HLS ALLOCATION instances=mul limit=2 operation
	// RESOURCE CONSTRAINED
	//#pragma HLS ALLOCATION instances=add limit=2 operation
//#pragma HLS INTERFACE ap_none port=y
//#pragma HLS INTERFACE ap_none port=y
//#pragma HLS INTERFACE ap_vld port=y
//#pragma HLS INTERFACE ap_none port=x
//#pragma HLS INTERFACE ap_vld port=x
//#pragma HLS INTERFACE ap_hs port=y
//#pragma HLS INTERFACE ap_none port=x

	int C[N] = {53,0, -91, 0, 313, 500, 313, 0, -91, 0, 53};
//#pragma HLS ARRAY_PARTITION variable=C complete dim=1
//#pragma array partition variable=C factor=2 cyclic
//#pragma HLS RESOURCE variable=C core=ROM_1P_BRAM
	int Xreg ;

//#pragma HLS RESOURCE variable=C core=ROM_1P_BRAM
//#pragma HLS RESOURCE variable=C core=RAM_1P_BRAM
	// C is a read-only array so we can switch it to ROM
// we can also map it to array partitions
//#pragma HLS ARRAY_PARTITION variable=C complete dim=1

	static int shift_reg[N] ;
//#pragma HLS ARRAY_PARTITION variable=shift_reg complete dim=0
//#pragma HLS ARRAY_PARTITION variable=shift_reg complete dim=1
	// resource conrstrained scheduling
//#pragma HLS RESOURCE variable=shift_reg core=RAM_1P_BRAM
//#pragma HLS RESOURCE variable=shift_reg core=RAM_2P_BRAM

//#pragma HLS ARRAY_PARTITION variable=shift_reg complete dim=1
	// synthesize array to RAM ports OR FIFO OR discrete ports
	// if the loop is unrolled, then multiple-port RAM is required here, else it is single-port RAM


	int acc ;
	int i,j ;

	acc = 0;
	//Xreg = x ;
//for(j=0; j<SIZE ; j++){
//#pragma HLS UNROLL factor=128
	//Shift_Accum_loop
	for(i=N-1 ; i>0 ; i--)
{
//#pragma HLS PIPELINE
//#pragma HLS UNROLL factor=2
//#pragma HLS PIPELINE II=1
		// resource constrained
//#pragma HLS PIPELINE II=1
//#pragma HLS PIPELINE II=1
		shift_reg[i] = shift_reg[i-1];
		acc += shift_reg[i-1] * C[i] ;
}
	//shift_reg[0] = x ;

//	for(i=0;i<N;i++){
////#pragma HLS UNROLL factor=11
//		acc += shift_reg[i] * C[i] ;
//	}
//#ifdef UNOPT
	acc += x * C[0] ;
	shift_reg[0] = x ;
//#endif

	*y = acc ;
}

