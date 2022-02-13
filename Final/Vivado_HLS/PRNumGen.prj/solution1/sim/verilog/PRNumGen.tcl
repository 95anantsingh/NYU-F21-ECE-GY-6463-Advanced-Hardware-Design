
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set data_out_group [add_wave_group data_out(wire) -into $coutputgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/data_out_ap_vld -into $data_out_group -color #ffff00 -radix hex
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/data_out -into $data_out_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set data_in_group [add_wave_group data_in(wire) -into $cinputgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/data_in -into $data_in_group -radix hex
set load_seed_group [add_wave_group load_seed(wire) -into $cinputgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/load_seed -into $load_seed_group -radix hex
set get_random_group [add_wave_group get_random(wire) -into $cinputgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/get_random -into $get_random_group -radix hex
set rstn_group [add_wave_group rstn(wire) -into $cinputgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/rstn -into $rstn_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_start -into $blocksiggroup
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_done -into $blocksiggroup
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_idle -into $blocksiggroup
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_PRNumGen_top/AESL_inst_PRNumGen/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_PRNumGen_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_PRNumGen_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_PRNumGen_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_PRNumGen_top/LENGTH_rstn -into $tb_portdepth_group -radix hex
add_wave /apatb_PRNumGen_top/LENGTH_get_random -into $tb_portdepth_group -radix hex
add_wave /apatb_PRNumGen_top/LENGTH_load_seed -into $tb_portdepth_group -radix hex
add_wave /apatb_PRNumGen_top/LENGTH_data_in -into $tb_portdepth_group -radix hex
add_wave /apatb_PRNumGen_top/LENGTH_data_out -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_data_out_group [add_wave_group data_out(wire) -into $tbcoutputgroup]
add_wave /apatb_PRNumGen_top/data_out_ap_vld -into $tb_data_out_group -color #ffff00 -radix hex
add_wave /apatb_PRNumGen_top/data_out -into $tb_data_out_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_data_in_group [add_wave_group data_in(wire) -into $tbcinputgroup]
add_wave /apatb_PRNumGen_top/data_in -into $tb_data_in_group -radix hex
set tb_load_seed_group [add_wave_group load_seed(wire) -into $tbcinputgroup]
add_wave /apatb_PRNumGen_top/load_seed -into $tb_load_seed_group -radix hex
set tb_get_random_group [add_wave_group get_random(wire) -into $tbcinputgroup]
add_wave /apatb_PRNumGen_top/get_random -into $tb_get_random_group -radix hex
set tb_rstn_group [add_wave_group rstn(wire) -into $tbcinputgroup]
add_wave /apatb_PRNumGen_top/rstn -into $tb_rstn_group -radix hex
save_wave_config PRNumGen.wcfg
run all
quit

