#include "PRNumGen.h"
#include <math.h>

#define TAPS 0x8C540001
#define RSEED 0x02468ACD

void LFSR(uint1 rstn, uint1 w_en, uint32 d_in, uint32 *d_out){

	static uint32 rnum = RSEED;
	uint32 xor;

	char i;
	if(rstn){
		if(w_en){
			rnum = d_in;
		}
		else{
			xor = rnum & TAPS;
			xor ^= xor >> 16;
			xor ^= xor >> 8;
			xor ^= xor >> 4;
			xor ^= xor >> 2;
			xor ^= xor >> 1;
			rnum = (rnum >> 1) | (xor << 31);
			*d_out = rnum;
		}
	}
	else{
		rnum = RSEED;
	}
}

void Din (uint3 *sel, uint32 *d_in, uint8 *data_in){

	if (*sel==0)
		*d_in = *data_in;
	else if (*sel==1)
		*d_in = *d_in | (*data_in << 8);
	else if (*sel==2)
		*d_in = *d_in | (*data_in << 16);
	else if (*sel==3)
		*d_in = *d_in | (*data_in << 24);
}

void Dout (uint3 *sel, uint32 *d_out, uint8 *data_out){
	if (*sel==0)
		*data_out = (*d_out);
	else if (*sel==1)
		*data_out = (*d_out >> (8));
	else if (*sel==2)
		*data_out = (*d_out >> (16));
	else if (*sel==3)
		*data_out = (*d_out >> (24));
}

void PRNumGen(uint1 rstn, uint1 get_random, uint1 load_seed,
		uint8 data_in, uint8 *data_out){
//#pragma HLS PIPELINE II=2
//#pragma HLS ALLOCATION instances=add limit=1 operation

	static uint3 in_cnt;
	static uint3 out_cnt;
	static uint32 d_in;
	static uint32 d_out;

	if(rstn){
		//State 4
		if(out_cnt){
			Dout(&out_cnt, &d_out, data_out);
			++out_cnt;
			if(out_cnt==4){
				out_cnt=0;
			}
		}
		//State 3
		else if(in_cnt){
			Din(&in_cnt, &d_in, &data_in);
			++in_cnt;
			if(in_cnt==4){
				in_cnt=0;
				LFSR(rstn, 1, d_in, &d_out);
			}

		}
		else{
			//State 2
			if(load_seed){
				Din(&in_cnt, &d_in, &data_in);
				++in_cnt;
			}
			//State 1
			else if(get_random){
				Dout(&out_cnt, &d_out, data_out);
				++out_cnt;
			}
			//State 0
			else{
				LFSR(rstn, 0, d_in, &d_out);
				*data_out = 0x00000000;
			}
		}
	}
	else{
		out_cnt = 0;
		in_cnt = 0;
		LFSR(rstn, 0, d_in, &d_out);
		*data_out = 0x00000000;
	}
}
