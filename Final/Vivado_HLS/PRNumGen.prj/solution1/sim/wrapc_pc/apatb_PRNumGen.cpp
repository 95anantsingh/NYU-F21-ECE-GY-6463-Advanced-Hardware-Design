// ==============================================================
// File generated on Fri Dec 24 03:15:08 -0500 2021
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// apint = uint1
#define uint1 bool
// apint = uint8
#define uint8 char

// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "rstn"
#define AUTOTB_TVIN_rstn  "../tv/cdatafile/c.PRNumGen.autotvin_rstn.dat"
// wrapc file define: "get_random"
#define AUTOTB_TVIN_get_random  "../tv/cdatafile/c.PRNumGen.autotvin_get_random.dat"
// wrapc file define: "load_seed"
#define AUTOTB_TVIN_load_seed  "../tv/cdatafile/c.PRNumGen.autotvin_load_seed.dat"
// wrapc file define: "data_in"
#define AUTOTB_TVIN_data_in  "../tv/cdatafile/c.PRNumGen.autotvin_data_in.dat"
// wrapc file define: "data_out"
#define AUTOTB_TVOUT_data_out  "../tv/cdatafile/c.PRNumGen.autotvout_data_out.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "data_out"
#define AUTOTB_TVOUT_PC_data_out  "../tv/rtldatafile/rtl.PRNumGen.autotvout_data_out.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			rstn_depth = 0;
			get_random_depth = 0;
			load_seed_depth = 0;
			data_in_depth = 0;
			data_out_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{rstn " << rstn_depth << "}\n";
			total_list << "{get_random " << get_random_depth << "}\n";
			total_list << "{load_seed " << load_seed_depth << "}\n";
			total_list << "{data_in " << data_in_depth << "}\n";
			total_list << "{data_out " << data_out_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int rstn_depth;
		int get_random_depth;
		int load_seed_depth;
		int data_in_depth;
		int data_out_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern "C" void PRNumGen (
uint1 rstn,
uint1 get_random,
uint1 load_seed,
uint8 data_in,
uint8* data_out);

extern "C" void AESL_WRAP_PRNumGen (
uint1 rstn,
uint1 get_random,
uint1 load_seed,
uint8 data_in,
uint8* data_out)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "data_out"
		aesl_fh.read(AUTOTB_TVOUT_PC_data_out, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_data_out, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_data_out, AESL_token); // data

			sc_bv<8> *data_out_pc_buffer = new sc_bv<8>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'data_out', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'data_out', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					data_out_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_data_out, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_data_out))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: data_out
				{
					// bitslice(7, 0)
					// {
						// celement: data_out(7, 0)
						// {
							sc_lv<8>* data_out_lv0_0_0_1 = new sc_lv<8>[1];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: data_out(7, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(data_out[0]) != NULL) // check the null address if the c port is array or others
								{
									data_out_lv0_0_0_1[hls_map_index].range(7, 0) = sc_bv<8>(data_out_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: data_out(7, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : data_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : data_out[0]
								// output_left_conversion : data_out[i_0]
								// output_type_conversion : (data_out_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(data_out[0]) != NULL) // check the null address if the c port is array or others
								{
									data_out[i_0] = (data_out_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] data_out_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "rstn"
		char* tvin_rstn = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_rstn);

		// "get_random"
		char* tvin_get_random = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_get_random);

		// "load_seed"
		char* tvin_load_seed = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_load_seed);

		// "data_in"
		char* tvin_data_in = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_data_in);

		// "data_out"
		char* tvout_data_out = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_data_out);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_rstn, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_rstn, tvin_rstn);

		sc_bv<1> rstn_tvin_wrapc_buffer;

		// RTL Name: rstn
		{
			// bitslice(0, 0)
			{
				// celement: rstn(0, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : rstn
						// sub_1st_elem          : 
						// ori_name_1st_elem     : rstn
						// regulate_c_name       : rstn
						// input_type_conversion : rstn
						if (&(rstn) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> rstn_tmp_mem;
							rstn_tmp_mem = rstn;
							rstn_tvin_wrapc_buffer.range(0, 0) = rstn_tmp_mem.range(0, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_rstn, "%s\n", (rstn_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_rstn, tvin_rstn);
		}

		tcl_file.set_num(1, &tcl_file.rstn_depth);
		sprintf(tvin_rstn, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_rstn, tvin_rstn);

		// [[transaction]]
		sprintf(tvin_get_random, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_get_random, tvin_get_random);

		sc_bv<1> get_random_tvin_wrapc_buffer;

		// RTL Name: get_random
		{
			// bitslice(0, 0)
			{
				// celement: get_random(0, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : get_random
						// sub_1st_elem          : 
						// ori_name_1st_elem     : get_random
						// regulate_c_name       : get_random
						// input_type_conversion : get_random
						if (&(get_random) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> get_random_tmp_mem;
							get_random_tmp_mem = get_random;
							get_random_tvin_wrapc_buffer.range(0, 0) = get_random_tmp_mem.range(0, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_get_random, "%s\n", (get_random_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_get_random, tvin_get_random);
		}

		tcl_file.set_num(1, &tcl_file.get_random_depth);
		sprintf(tvin_get_random, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_get_random, tvin_get_random);

		// [[transaction]]
		sprintf(tvin_load_seed, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_load_seed, tvin_load_seed);

		sc_bv<1> load_seed_tvin_wrapc_buffer;

		// RTL Name: load_seed
		{
			// bitslice(0, 0)
			{
				// celement: load_seed(0, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : load_seed
						// sub_1st_elem          : 
						// ori_name_1st_elem     : load_seed
						// regulate_c_name       : load_seed
						// input_type_conversion : load_seed
						if (&(load_seed) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> load_seed_tmp_mem;
							load_seed_tmp_mem = load_seed;
							load_seed_tvin_wrapc_buffer.range(0, 0) = load_seed_tmp_mem.range(0, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_load_seed, "%s\n", (load_seed_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_load_seed, tvin_load_seed);
		}

		tcl_file.set_num(1, &tcl_file.load_seed_depth);
		sprintf(tvin_load_seed, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_load_seed, tvin_load_seed);

		// [[transaction]]
		sprintf(tvin_data_in, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_data_in, tvin_data_in);

		sc_bv<8> data_in_tvin_wrapc_buffer;

		// RTL Name: data_in
		{
			// bitslice(7, 0)
			{
				// celement: data_in(7, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : data_in
						// sub_1st_elem          : 
						// ori_name_1st_elem     : data_in
						// regulate_c_name       : data_in
						// input_type_conversion : data_in
						if (&(data_in) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> data_in_tmp_mem;
							data_in_tmp_mem = data_in;
							data_in_tvin_wrapc_buffer.range(7, 0) = data_in_tmp_mem.range(7, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_data_in, "%s\n", (data_in_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_data_in, tvin_data_in);
		}

		tcl_file.set_num(1, &tcl_file.data_in_depth);
		sprintf(tvin_data_in, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_data_in, tvin_data_in);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		PRNumGen(rstn, get_random, load_seed, data_in, data_out);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_data_out, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_data_out, tvout_data_out);

		sc_bv<8>* data_out_tvout_wrapc_buffer = new sc_bv<8>[1];

		// RTL Name: data_out
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: data_out(7, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : data_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : data_out[0]
						// regulate_c_name       : data_out
						// input_type_conversion : data_out[i_0]
						if (&(data_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> data_out_tmp_mem;
							data_out_tmp_mem = data_out[i_0];
							data_out_tvout_wrapc_buffer[hls_map_index].range(7, 0) = data_out_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_data_out, "%s\n", (data_out_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_data_out, tvout_data_out);
		}

		tcl_file.set_num(1, &tcl_file.data_out_depth);
		sprintf(tvout_data_out, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_data_out, tvout_data_out);

		// release memory allocation
		delete [] data_out_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "rstn"
		delete [] tvin_rstn;
		// release memory allocation: "get_random"
		delete [] tvin_get_random;
		// release memory allocation: "load_seed"
		delete [] tvin_load_seed;
		// release memory allocation: "data_in"
		delete [] tvin_data_in;
		// release memory allocation: "data_out"
		delete [] tvout_data_out;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}


// apint = uint1
#undef uint1

// apint = uint8
#undef uint8
