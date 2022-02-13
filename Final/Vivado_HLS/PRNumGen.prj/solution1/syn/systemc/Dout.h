// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Dout_HH_
#define _Dout_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct Dout : public sc_module {
    // Port declarations 5
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<8> > data_out;
    sc_out< sc_logic > data_out_ap_vld;
    sc_in< sc_lv<3> > out_cnt;
    sc_in< sc_lv<32> > d_out;


    // Module declarations
    Dout(sc_module_name name);
    SC_HAS_PROCESS(Dout);

    ~Dout();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<1> > tmp_fu_41_p2;
    sc_signal< sc_lv<1> > tmp_5_fu_51_p2;
    sc_signal< sc_lv<1> > tmp_8_fu_57_p2;
    sc_signal< sc_lv<1> > tmp_2_fu_63_p2;
    sc_signal< sc_lv<8> > tmp_15_fu_102_p1;
    static const sc_logic ap_const_logic_1;
    static const bool ap_const_boolean_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<3> ap_const_lv3_1;
    static const sc_lv<3> ap_const_lv3_2;
    static const sc_lv<3> ap_const_lv3_3;
    static const sc_lv<32> ap_const_lv32_18;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_F;
    // Thread declarations
    void thread_ap_ready();
    void thread_data_out();
    void thread_data_out_ap_vld();
    void thread_tmp_15_fu_102_p1();
    void thread_tmp_2_fu_63_p2();
    void thread_tmp_5_fu_51_p2();
    void thread_tmp_8_fu_57_p2();
    void thread_tmp_fu_41_p2();
};

}

using namespace ap_rtl;

#endif