# ==============================================================
# File generated on Fri Nov 19 13:27:25 EST 2021
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../fir_test.c -cflags { -Wno-unknown-pragmas}
add_files fir.c
set_part xa7a12tcsg325-1q
create_clock -name default -period 10
