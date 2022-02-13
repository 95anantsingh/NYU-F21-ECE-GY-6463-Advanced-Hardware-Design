############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project PRNumGen.prj
set_top PRNumGen
add_files PRNumGen.c
add_files PRNumGen.h
add_files -tb PRNumGen_TB.c
add_files -tb Testcases.txt
open_solution "solution1"
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
config_compile -no_signed_zeros=0 -unsafe_math_optimizations=0
config_sdx -optimization_level none -target none
config_schedule -effort medium -relax_ii_for_timing=0
config_bind -effort medium
#source "./PRNumGen.prj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
