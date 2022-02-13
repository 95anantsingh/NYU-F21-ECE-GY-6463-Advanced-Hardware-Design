// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "PRNumGen.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic PRNumGen::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic PRNumGen::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<6> PRNumGen::ap_ST_fsm_state1 = "1";
const sc_lv<6> PRNumGen::ap_ST_fsm_state2 = "10";
const sc_lv<6> PRNumGen::ap_ST_fsm_state3 = "100";
const sc_lv<6> PRNumGen::ap_ST_fsm_state4 = "1000";
const sc_lv<6> PRNumGen::ap_ST_fsm_state5 = "10000";
const sc_lv<6> PRNumGen::ap_ST_fsm_state6 = "100000";
const sc_lv<32> PRNumGen::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<3> PRNumGen::ap_const_lv3_0 = "000";
const sc_lv<1> PRNumGen::ap_const_lv1_1 = "1";
const sc_lv<32> PRNumGen::ap_const_lv32_3 = "11";
const sc_lv<1> PRNumGen::ap_const_lv1_0 = "0";
const sc_lv<32> PRNumGen::ap_const_lv32_1 = "1";
const sc_lv<32> PRNumGen::ap_const_lv32_4 = "100";
const sc_lv<32> PRNumGen::ap_const_lv32_5 = "101";
const sc_lv<32> PRNumGen::ap_const_lv32_2 = "10";
const sc_lv<3> PRNumGen::ap_const_lv3_1 = "1";
const sc_lv<8> PRNumGen::ap_const_lv8_0 = "00000000";
const sc_lv<3> PRNumGen::ap_const_lv3_4 = "100";
const bool PRNumGen::ap_const_boolean_1 = true;

PRNumGen::PRNumGen(sc_module_name name) : sc_module(name), mVcdFile(0) {
    grp_Din_fu_106 = new Din("grp_Din_fu_106");
    grp_Din_fu_106->ap_ready(grp_Din_fu_106_ap_ready);
    grp_Din_fu_106->data_in_read(data_in);
    grp_Din_fu_106->in_cnt(in_cnt);
    grp_Din_fu_106->d_in_i(d_in);
    grp_Din_fu_106->d_in_o(grp_Din_fu_106_d_in_o);
    grp_Din_fu_106->d_in_o_ap_vld(grp_Din_fu_106_d_in_o_ap_vld);
    grp_LFSR_fu_116 = new LFSR("grp_LFSR_fu_116");
    grp_LFSR_fu_116->ap_clk(ap_clk);
    grp_LFSR_fu_116->ap_rst(ap_rst);
    grp_LFSR_fu_116->ap_start(grp_LFSR_fu_116_ap_start);
    grp_LFSR_fu_116->ap_done(grp_LFSR_fu_116_ap_done);
    grp_LFSR_fu_116->ap_idle(grp_LFSR_fu_116_ap_idle);
    grp_LFSR_fu_116->ap_ready(grp_LFSR_fu_116_ap_ready);
    grp_LFSR_fu_116->rstn(grp_LFSR_fu_116_rstn);
    grp_LFSR_fu_116->w_en(grp_LFSR_fu_116_w_en);
    grp_LFSR_fu_116->d_in(d_in);
    grp_LFSR_fu_116->d_out(grp_LFSR_fu_116_d_out);
    grp_LFSR_fu_116->d_out_ap_vld(grp_LFSR_fu_116_d_out_ap_vld);
    grp_Dout_fu_131 = new Dout("grp_Dout_fu_131");
    grp_Dout_fu_131->ap_ready(grp_Dout_fu_131_ap_ready);
    grp_Dout_fu_131->data_out(grp_Dout_fu_131_data_out);
    grp_Dout_fu_131->data_out_ap_vld(grp_Dout_fu_131_data_out_ap_vld);
    grp_Dout_fu_131->out_cnt(out_cnt);
    grp_Dout_fu_131->d_out(d_out);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state4);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state5);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state6);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_CS_fsm_state5 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm_state5 );

    SC_METHOD(thread_data_out);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( load_seed_read_read_fu_64_p2 );
    sensitive << ( get_random_read_read_fu_70_p2 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_fu_162_p2 );
    sensitive << ( tmp_1_fu_172_p2 );
    sensitive << ( grp_Dout_fu_131_data_out );
    sensitive << ( grp_Dout_fu_131_data_out_ap_vld );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_data_out_ap_vld);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( load_seed_read_read_fu_64_p2 );
    sensitive << ( get_random_read_read_fu_70_p2 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_fu_162_p2 );
    sensitive << ( tmp_1_fu_172_p2 );
    sensitive << ( grp_Dout_fu_131_data_out_ap_vld );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_get_random_read_read_fu_70_p2);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( get_random );

    SC_METHOD(thread_grp_LFSR_fu_116_ap_start);
    sensitive << ( load_seed_read_read_fu_64_p2 );
    sensitive << ( get_random_read_read_fu_70_p2 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_reg_233 );
    sensitive << ( tmp_1_reg_242 );
    sensitive << ( tmp_5_reg_246 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_grp_LFSR_fu_116_rstn);
    sensitive << ( load_seed_read_read_fu_64_p2 );
    sensitive << ( get_random_read_read_fu_70_p2 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_reg_233 );
    sensitive << ( tmp_1_reg_242 );
    sensitive << ( tmp_5_reg_246 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_grp_LFSR_fu_116_w_en);
    sensitive << ( load_seed_read_read_fu_64_p2 );
    sensitive << ( get_random_read_read_fu_70_p2 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_reg_233 );
    sensitive << ( tmp_1_reg_242 );
    sensitive << ( tmp_5_reg_246 );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( ap_CS_fsm_state5 );
    sensitive << ( ap_CS_fsm_state6 );

    SC_METHOD(thread_grp_fu_152_p2);
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( ap_CS_fsm_state3 );
    sensitive << ( grp_fu_90_p2 );

    SC_METHOD(thread_grp_fu_90_p0);
    sensitive << ( out_cnt_load_reg_228 );
    sensitive << ( in_cnt_load_reg_237 );
    sensitive << ( ap_CS_fsm_state4 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_grp_fu_90_p2);
    sensitive << ( grp_fu_90_p0 );

    SC_METHOD(thread_load_seed_read_read_fu_64_p2);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( load_seed );

    SC_METHOD(thread_p_s_fu_184_p3);
    sensitive << ( grp_fu_152_p2 );
    sensitive << ( grp_fu_90_p2 );

    SC_METHOD(thread_rstn_read_read_fu_76_p2);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( rstn );

    SC_METHOD(thread_tmp_1_fu_172_p2);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( in_cnt );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_fu_162_p2 );

    SC_METHOD(thread_tmp_fu_162_p2);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( out_cnt );
    sensitive << ( rstn_read_read_fu_76_p2 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( rstn_read_read_fu_76_p2 );
    sensitive << ( tmp_fu_162_p2 );
    sensitive << ( tmp_1_fu_172_p2 );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    ap_CS_fsm = "000001";
    out_cnt = "000";
    d_out = "00000000000000000000000000000000";
    in_cnt = "000";
    d_in = "00000000000000000000000000000000";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "PRNumGen_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, rstn, "(port)rstn");
    sc_trace(mVcdFile, get_random, "(port)get_random");
    sc_trace(mVcdFile, load_seed, "(port)load_seed");
    sc_trace(mVcdFile, data_in, "(port)data_in");
    sc_trace(mVcdFile, data_out, "(port)data_out");
    sc_trace(mVcdFile, data_out_ap_vld, "(port)data_out_ap_vld");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, out_cnt, "out_cnt");
    sc_trace(mVcdFile, d_out, "d_out");
    sc_trace(mVcdFile, in_cnt, "in_cnt");
    sc_trace(mVcdFile, d_in, "d_in");
    sc_trace(mVcdFile, load_seed_read_read_fu_64_p2, "load_seed_read_read_fu_64_p2");
    sc_trace(mVcdFile, get_random_read_read_fu_70_p2, "get_random_read_read_fu_70_p2");
    sc_trace(mVcdFile, rstn_read_read_fu_76_p2, "rstn_read_read_fu_76_p2");
    sc_trace(mVcdFile, out_cnt_load_reg_228, "out_cnt_load_reg_228");
    sc_trace(mVcdFile, tmp_fu_162_p2, "tmp_fu_162_p2");
    sc_trace(mVcdFile, tmp_reg_233, "tmp_reg_233");
    sc_trace(mVcdFile, in_cnt_load_reg_237, "in_cnt_load_reg_237");
    sc_trace(mVcdFile, tmp_1_fu_172_p2, "tmp_1_fu_172_p2");
    sc_trace(mVcdFile, tmp_1_reg_242, "tmp_1_reg_242");
    sc_trace(mVcdFile, grp_fu_152_p2, "grp_fu_152_p2");
    sc_trace(mVcdFile, tmp_5_reg_246, "tmp_5_reg_246");
    sc_trace(mVcdFile, ap_CS_fsm_state4, "ap_CS_fsm_state4");
    sc_trace(mVcdFile, grp_Din_fu_106_ap_ready, "grp_Din_fu_106_ap_ready");
    sc_trace(mVcdFile, grp_Din_fu_106_d_in_o, "grp_Din_fu_106_d_in_o");
    sc_trace(mVcdFile, grp_Din_fu_106_d_in_o_ap_vld, "grp_Din_fu_106_d_in_o_ap_vld");
    sc_trace(mVcdFile, grp_LFSR_fu_116_ap_start, "grp_LFSR_fu_116_ap_start");
    sc_trace(mVcdFile, grp_LFSR_fu_116_ap_done, "grp_LFSR_fu_116_ap_done");
    sc_trace(mVcdFile, grp_LFSR_fu_116_ap_idle, "grp_LFSR_fu_116_ap_idle");
    sc_trace(mVcdFile, grp_LFSR_fu_116_ap_ready, "grp_LFSR_fu_116_ap_ready");
    sc_trace(mVcdFile, grp_LFSR_fu_116_rstn, "grp_LFSR_fu_116_rstn");
    sc_trace(mVcdFile, grp_LFSR_fu_116_w_en, "grp_LFSR_fu_116_w_en");
    sc_trace(mVcdFile, grp_LFSR_fu_116_d_out, "grp_LFSR_fu_116_d_out");
    sc_trace(mVcdFile, grp_LFSR_fu_116_d_out_ap_vld, "grp_LFSR_fu_116_d_out_ap_vld");
    sc_trace(mVcdFile, grp_Dout_fu_131_ap_ready, "grp_Dout_fu_131_ap_ready");
    sc_trace(mVcdFile, grp_Dout_fu_131_data_out, "grp_Dout_fu_131_data_out");
    sc_trace(mVcdFile, grp_Dout_fu_131_data_out_ap_vld, "grp_Dout_fu_131_data_out_ap_vld");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, ap_CS_fsm_state5, "ap_CS_fsm_state5");
    sc_trace(mVcdFile, ap_CS_fsm_state6, "ap_CS_fsm_state6");
    sc_trace(mVcdFile, p_s_fu_184_p3, "p_s_fu_184_p3");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, grp_fu_90_p2, "grp_fu_90_p2");
    sc_trace(mVcdFile, grp_fu_90_p0, "grp_fu_90_p0");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
    mHdltvinHandle.open("PRNumGen.hdltvin.dat");
    mHdltvoutHandle.open("PRNumGen.hdltvout.dat");
}

PRNumGen::~PRNumGen() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
    delete grp_Din_fu_106;
    delete grp_LFSR_fu_116;
    delete grp_Dout_fu_131;
}

void PRNumGen::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ((esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()))) {
        in_cnt = ap_const_lv3_1;
    } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        in_cnt = grp_fu_90_p2.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
                (esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
                 esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_233.read()) && 
                 esl_seteq<1,1,1>(tmp_1_reg_242.read(), ap_const_lv1_0) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_5_reg_246.read())))) {
        in_cnt = ap_const_lv3_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
         esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
         esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_1))) {
        out_cnt = ap_const_lv3_1;
    } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        out_cnt = p_s_fu_184_p3.read();
    } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        out_cnt = ap_const_lv3_0;
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
  esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
  esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && 
  esl_seteq<1,1,1>(tmp_1_fu_172_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_1, grp_Din_fu_106_d_in_o_ap_vld.read())) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
  esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
  esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_172_p2.read()) && 
  esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_1) && 
  esl_seteq<1,1,1>(ap_const_logic_1, grp_Din_fu_106_d_in_o_ap_vld.read())))) {
        d_in = grp_Din_fu_106_d_in_o.read();
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, grp_LFSR_fu_116_d_out_ap_vld.read())) || (esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_233.read()) && 
  esl_seteq<1,1,1>(tmp_1_reg_242.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_lv1_1, tmp_5_reg_246.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, grp_LFSR_fu_116_d_out_ap_vld.read())) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
  esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0) && 
  esl_seteq<1,1,1>(ap_const_logic_1, grp_LFSR_fu_116_d_out_ap_vld.read())))) {
        d_out = grp_LFSR_fu_116_d_out.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()))) {
        in_cnt_load_reg_237 = in_cnt.read();
        tmp_1_reg_242 = tmp_1_fu_172_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1))) {
        out_cnt_load_reg_228 = out_cnt.read();
        tmp_reg_233 = tmp_fu_162_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        tmp_5_reg_246 = grp_fu_152_p2.read();
    }
}

void PRNumGen::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void PRNumGen::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void PRNumGen::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void PRNumGen::thread_ap_CS_fsm_state4() {
    ap_CS_fsm_state4 = ap_CS_fsm.read()[3];
}

void PRNumGen::thread_ap_CS_fsm_state5() {
    ap_CS_fsm_state5 = ap_CS_fsm.read()[4];
}

void PRNumGen::thread_ap_CS_fsm_state6() {
    ap_CS_fsm_state6 = ap_CS_fsm.read()[5];
}

void PRNumGen::thread_ap_done() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read())) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void PRNumGen::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void PRNumGen::thread_ap_ready() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read())) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void PRNumGen::thread_data_out() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
          esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0)))) {
        data_out = ap_const_lv8_0;
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                 esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
                 esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
                 esl_seteq<1,1,1>(ap_const_logic_1, grp_Dout_fu_131_data_out_ap_vld.read()) && 
                 esl_seteq<1,1,1>(tmp_fu_162_p2.read(), ap_const_lv1_0)) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                 esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
                 esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_172_p2.read()) && 
                 esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
                 esl_seteq<1,1,1>(ap_const_logic_1, grp_Dout_fu_131_data_out_ap_vld.read()) && 
                 esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_1)))) {
        data_out = grp_Dout_fu_131_data_out.read();
    } else {
        data_out = "XXXXXXXX";
    }
}

void PRNumGen::thread_data_out_ap_vld() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
          esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0)))) {
        data_out_ap_vld = ap_const_logic_1;
    } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                 esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
                 esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
                 esl_seteq<1,1,1>(tmp_fu_162_p2.read(), ap_const_lv1_0)) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                 esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && 
                 esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && 
                 esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_172_p2.read()) && 
                 esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
                 esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_1)))) {
        data_out_ap_vld = grp_Dout_fu_131_data_out_ap_vld.read();
    } else {
        data_out_ap_vld = ap_const_logic_0;
    }
}

void PRNumGen::thread_get_random_read_read_fu_70_p2() {
    get_random_read_read_fu_70_p2 = get_random.read();
}

void PRNumGen::thread_grp_LFSR_fu_116_ap_start() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
         (esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_233.read()) && 
          esl_seteq<1,1,1>(tmp_1_reg_242.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_5_reg_246.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
          esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0)))) {
        grp_LFSR_fu_116_ap_start = ap_const_logic_1;
    } else {
        grp_LFSR_fu_116_ap_start = ap_const_logic_0;
    }
}

void PRNumGen::thread_grp_LFSR_fu_116_rstn() {
    if (((esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_233.read()) && 
          esl_seteq<1,1,1>(tmp_1_reg_242.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, tmp_5_reg_246.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
          esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
          esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0)))) {
        grp_LFSR_fu_116_rstn = ap_const_lv1_1;
    } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        grp_LFSR_fu_116_rstn = ap_const_lv1_0;
    } else {
        grp_LFSR_fu_116_rstn =  (sc_lv<1>) ("X");
    }
}

void PRNumGen::thread_grp_LFSR_fu_116_w_en() {
    if ((esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state5.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, tmp_reg_233.read()) && 
         esl_seteq<1,1,1>(tmp_1_reg_242.read(), ap_const_lv1_0) && 
         esl_seteq<1,1,1>(ap_const_lv1_1, tmp_5_reg_246.read()))) {
        grp_LFSR_fu_116_w_en = ap_const_lv1_1;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) || 
                (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state6.read()) && 
                 esl_seteq<1,1,1>(load_seed_read_read_fu_64_p2.read(), ap_const_lv1_0) && 
                 esl_seteq<1,1,1>(get_random_read_read_fu_70_p2.read(), ap_const_lv1_0)))) {
        grp_LFSR_fu_116_w_en = ap_const_lv1_0;
    } else {
        grp_LFSR_fu_116_w_en =  (sc_lv<1>) ("X");
    }
}

void PRNumGen::thread_grp_fu_152_p2() {
    grp_fu_152_p2 = (!grp_fu_90_p2.read().is_01() || !ap_const_lv3_4.is_01())? sc_lv<1>(): sc_lv<1>(grp_fu_90_p2.read() == ap_const_lv3_4);
}

void PRNumGen::thread_grp_fu_90_p0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state4.read())) {
        grp_fu_90_p0 = in_cnt_load_reg_237.read();
    } else if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        grp_fu_90_p0 = out_cnt_load_reg_228.read();
    } else {
        grp_fu_90_p0 =  (sc_lv<3>) ("XXX");
    }
}

void PRNumGen::thread_grp_fu_90_p2() {
    grp_fu_90_p2 = (!grp_fu_90_p0.read().is_01() || !ap_const_lv3_1.is_01())? sc_lv<3>(): (sc_biguint<3>(grp_fu_90_p0.read()) + sc_biguint<3>(ap_const_lv3_1));
}

void PRNumGen::thread_load_seed_read_read_fu_64_p2() {
    load_seed_read_read_fu_64_p2 = load_seed.read();
}

void PRNumGen::thread_p_s_fu_184_p3() {
    p_s_fu_184_p3 = (!grp_fu_152_p2.read()[0].is_01())? sc_lv<3>(): ((grp_fu_152_p2.read()[0].to_bool())? ap_const_lv3_0: grp_fu_90_p2.read());
}

void PRNumGen::thread_rstn_read_read_fu_76_p2() {
    rstn_read_read_fu_76_p2 = rstn.read();
}

void PRNumGen::thread_tmp_1_fu_172_p2() {
    tmp_1_fu_172_p2 = (!in_cnt.read().is_01() || !ap_const_lv3_0.is_01())? sc_lv<1>(): sc_lv<1>(in_cnt.read() == ap_const_lv3_0);
}

void PRNumGen::thread_tmp_fu_162_p2() {
    tmp_fu_162_p2 = (!out_cnt.read().is_01() || !ap_const_lv3_0.is_01())? sc_lv<1>(): sc_lv<1>(out_cnt.read() == ap_const_lv3_0);
}

void PRNumGen::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_1_fu_172_p2.read()))) {
                ap_NS_fsm = ap_ST_fsm_state6;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_fu_162_p2.read()) && esl_seteq<1,1,1>(tmp_1_fu_172_p2.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state4;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(tmp_fu_162_p2.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1) && esl_seteq<1,1,1>(rstn_read_read_fu_76_p2.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        case 4 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        case 16 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        case 32 : 
            ap_NS_fsm = ap_ST_fsm_state5;
            break;
        default : 
            ap_NS_fsm =  (sc_lv<6>) ("XXXXXX");
            break;
    }
}

void PRNumGen::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvinHandle << mComma << "{"  <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_start\" :  \"" << ap_start.read() << "\" ";
        mHdltvoutHandle << mComma << "{"  <<  " \"ap_done\" :  \"" << ap_done.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_idle\" :  \"" << ap_idle.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_ready\" :  \"" << ap_ready.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"rstn\" :  \"" << rstn.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"get_random\" :  \"" << get_random.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"load_seed\" :  \"" << load_seed.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"data_in\" :  \"" << data_in.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"data_out\" :  \"" << data_out.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"data_out_ap_vld\" :  \"" << data_out_ap_vld.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}
