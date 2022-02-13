// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Dec 15 23:52:25 2021
// Host        : Note running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Anant/OneDrive/Documents/Courses/NYU/F21_ECE_GY_6463_Advanced_Hardware_Design/Project/ECE-GY-6463-NYU-6463-RV32I-Processor/Project_Vivado/Project_Vivado.sim/sim_1/synth/func/xsim/Processor_TB2_func_synth.v
// Design      : Processor
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU
   (CO,
    DI,
    S,
    result2_carry__1_0,
    result2_carry__1_1,
    result2_carry__2_0,
    result2_carry__2_1,
    \current_pc_reg[0] ,
    \current_pc_reg[0]_0 );
  output [0:0]CO;
  input [1:0]DI;
  input [3:0]S;
  input [2:0]result2_carry__1_0;
  input [3:0]result2_carry__1_1;
  input [0:0]result2_carry__2_0;
  input [3:0]result2_carry__2_1;
  input [0:0]\current_pc_reg[0] ;
  input [3:0]\current_pc_reg[0]_0 ;

  wire [0:0]CO;
  wire [1:0]DI;
  wire [3:0]S;
  wire [0:0]\current_pc_reg[0] ;
  wire [3:0]\current_pc_reg[0]_0 ;
  wire result2_carry__0_n_0;
  wire result2_carry__0_n_1;
  wire result2_carry__0_n_2;
  wire result2_carry__0_n_3;
  wire [2:0]result2_carry__1_0;
  wire [3:0]result2_carry__1_1;
  wire result2_carry__1_n_0;
  wire result2_carry__1_n_1;
  wire result2_carry__1_n_2;
  wire result2_carry__1_n_3;
  wire [0:0]result2_carry__2_0;
  wire [3:0]result2_carry__2_1;
  wire result2_carry__2_n_1;
  wire result2_carry__2_n_2;
  wire result2_carry__2_n_3;
  wire result2_carry_n_0;
  wire result2_carry_n_1;
  wire result2_carry_n_2;
  wire result2_carry_n_3;
  wire [3:0]NLW_result2_carry_O_UNCONNECTED;
  wire [3:0]NLW_result2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_result2_carry__1_O_UNCONNECTED;
  wire [3:0]NLW_result2_carry__2_O_UNCONNECTED;

  CARRY4 result2_carry
       (.CI(1'b0),
        .CO({result2_carry_n_0,result2_carry_n_1,result2_carry_n_2,result2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,DI}),
        .O(NLW_result2_carry_O_UNCONNECTED[3:0]),
        .S(S));
  CARRY4 result2_carry__0
       (.CI(result2_carry_n_0),
        .CO({result2_carry__0_n_0,result2_carry__0_n_1,result2_carry__0_n_2,result2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({result2_carry__1_0,1'b0}),
        .O(NLW_result2_carry__0_O_UNCONNECTED[3:0]),
        .S(result2_carry__1_1));
  CARRY4 result2_carry__1
       (.CI(result2_carry__0_n_0),
        .CO({result2_carry__1_n_0,result2_carry__1_n_1,result2_carry__1_n_2,result2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,result2_carry__2_0}),
        .O(NLW_result2_carry__1_O_UNCONNECTED[3:0]),
        .S(result2_carry__2_1));
  CARRY4 result2_carry__2
       (.CI(result2_carry__1_n_0),
        .CO({CO,result2_carry__2_n_1,result2_carry__2_n_2,result2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\current_pc_reg[0] ,1'b0,1'b0,1'b0}),
        .O(NLW_result2_carry__2_O_UNCONNECTED[3:0]),
        .S(\current_pc_reg[0]_0 ));
endmodule

module BranComp
   (BC_out,
    \current_pc[31]_i_5 ,
    S,
    result0_carry__1_0,
    result_reg_0);
  output BC_out;
  input \current_pc[31]_i_5 ;
  input [3:0]S;
  input [3:0]result0_carry__1_0;
  input [2:0]result_reg_0;

  wire BC_out;
  wire [3:0]S;
  wire \current_pc[31]_i_5 ;
  wire data0;
  wire result0_carry__0_n_0;
  wire result0_carry__0_n_1;
  wire result0_carry__0_n_2;
  wire result0_carry__0_n_3;
  wire [3:0]result0_carry__1_0;
  wire result0_carry__1_n_2;
  wire result0_carry__1_n_3;
  wire result0_carry_n_0;
  wire result0_carry_n_1;
  wire result0_carry_n_2;
  wire result0_carry_n_3;
  wire [2:0]result_reg_0;
  wire [3:0]NLW_result0_carry_O_UNCONNECTED;
  wire [3:0]NLW_result0_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_result0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_result0_carry__1_O_UNCONNECTED;

  CARRY4 result0_carry
       (.CI(1'b0),
        .CO({result0_carry_n_0,result0_carry_n_1,result0_carry_n_2,result0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_result0_carry_O_UNCONNECTED[3:0]),
        .S(S));
  CARRY4 result0_carry__0
       (.CI(result0_carry_n_0),
        .CO({result0_carry__0_n_0,result0_carry__0_n_1,result0_carry__0_n_2,result0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_result0_carry__0_O_UNCONNECTED[3:0]),
        .S(result0_carry__1_0));
  CARRY4 result0_carry__1
       (.CI(result0_carry__0_n_0),
        .CO({NLW_result0_carry__1_CO_UNCONNECTED[3],data0,result0_carry__1_n_2,result0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_result0_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,result_reg_0}));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    result_reg
       (.CLR(1'b0),
        .D(data0),
        .G(\current_pc[31]_i_5 ),
        .GE(1'b1),
        .Q(BC_out));
endmodule

module ControlUnit
   (\FSM_sequential_state_reg[1]_0 ,
    Q,
    E,
    \FSM_sequential_state_reg[1]_1 ,
    \FSM_sequential_state_reg[2]_0 ,
    \d_out_reg[31] ,
    \FSM_sequential_state_reg[1]_2 ,
    \FSM_sequential_state_reg[0]_0 ,
    CLK,
    p_0_in);
  output \FSM_sequential_state_reg[1]_0 ;
  output [2:0]Q;
  output [0:0]E;
  output \FSM_sequential_state_reg[1]_1 ;
  output [0:0]\FSM_sequential_state_reg[2]_0 ;
  input \d_out_reg[31] ;
  input \FSM_sequential_state_reg[1]_2 ;
  input \FSM_sequential_state_reg[0]_0 ;
  input CLK;
  input p_0_in;

  wire CLK;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[0]_0 ;
  wire \FSM_sequential_state_reg[1]_0 ;
  wire \FSM_sequential_state_reg[1]_1 ;
  wire \FSM_sequential_state_reg[1]_2 ;
  wire [0:0]\FSM_sequential_state_reg[2]_0 ;
  wire [2:0]Q;
  wire \d_out_reg[31] ;
  wire [0:2]next_state;
  wire p_0_in;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0111)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(\FSM_sequential_state_reg[0]_0 ),
        .I3(Q[0]),
        .O(next_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0074)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state_reg[1]_2 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(next_state[1]));
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(\FSM_sequential_state_reg[1]_2 ),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(next_state[0]));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:100,iSTATE3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(next_state[2]),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:100,iSTATE3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(next_state[1]),
        .Q(Q[1]));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:100,iSTATE3:011" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(next_state[0]),
        .Q(Q[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \current_pc[31]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \d_out[31]_i_3 
       (.I0(\d_out_reg[31] ),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .O(\FSM_sequential_state_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \instruction[17]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\FSM_sequential_state_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \r[1][31]_i_7 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(\FSM_sequential_state_reg[1]_1 ));
endmodule

module DMem
   (d_out0,
    \d_out_reg[31]_0 ,
    \d_out_reg[7]_0 ,
    \d_out_reg[28]_0 ,
    \d_out_reg[26]_0 ,
    \d_out_reg[22]_0 ,
    \d_out_reg[21]_0 ,
    \d_out_reg[20]_0 ,
    \d_out_reg[16]_0 ,
    \d_out_reg[10]_0 ,
    clk_IBUF_BUFG,
    \d_out[7]_i_2_0 ,
    result,
    \d_out[7]_i_2_1 ,
    \d_out[7]_i_2_2 ,
    \d_out[7]_i_2_3 ,
    \d_out[31]_i_7_0 ,
    \d_out[31]_i_7_1 ,
    \d_out[31]_i_7_2 ,
    \d_out[31]_i_7_3 ,
    \d_out_reg[4]_0 ,
    O,
    \r_reg[1][31] ,
    \r_reg[1][31]_0 ,
    E,
    D);
  output [1:0]d_out0;
  output \d_out_reg[31]_0 ;
  output [5:0]\d_out_reg[7]_0 ;
  output \d_out_reg[28]_0 ;
  output \d_out_reg[26]_0 ;
  output \d_out_reg[22]_0 ;
  output \d_out_reg[21]_0 ;
  output \d_out_reg[20]_0 ;
  output \d_out_reg[16]_0 ;
  output \d_out_reg[10]_0 ;
  input clk_IBUF_BUFG;
  input \d_out[7]_i_2_0 ;
  input [9:0]result;
  input \d_out[7]_i_2_1 ;
  input \d_out[7]_i_2_2 ;
  input \d_out[7]_i_2_3 ;
  input \d_out[31]_i_7_0 ;
  input \d_out[31]_i_7_1 ;
  input \d_out[31]_i_7_2 ;
  input \d_out[31]_i_7_3 ;
  input \d_out_reg[4]_0 ;
  input [0:0]O;
  input \r_reg[1][31] ;
  input \r_reg[1][31]_0 ;
  input [0:0]E;
  input [9:0]D;

  wire [9:0]D;
  wire [31:10]DM_out;
  wire [0:0]E;
  wire [0:0]O;
  wire clk_IBUF_BUFG;
  wire [1:0]d_out0;
  wire \d_out[28]_i_1_n_0 ;
  wire \d_out[31]_i_2_n_0 ;
  wire \d_out[31]_i_7_0 ;
  wire \d_out[31]_i_7_1 ;
  wire \d_out[31]_i_7_2 ;
  wire \d_out[31]_i_7_3 ;
  wire \d_out[4]_i_1_n_0 ;
  wire \d_out[6]_i_1_n_0 ;
  wire \d_out[7]_i_2_0 ;
  wire \d_out[7]_i_2_1 ;
  wire \d_out[7]_i_2_2 ;
  wire \d_out[7]_i_2_3 ;
  wire \d_out_reg[10]_0 ;
  wire \d_out_reg[16]_0 ;
  wire \d_out_reg[20]_0 ;
  wire \d_out_reg[21]_0 ;
  wire \d_out_reg[22]_0 ;
  wire \d_out_reg[26]_0 ;
  wire \d_out_reg[28]_0 ;
  wire \d_out_reg[31]_0 ;
  wire \d_out_reg[4]_0 ;
  wire [5:0]\d_out_reg[7]_0 ;
  wire \r_reg[1][31] ;
  wire \r_reg[1][31]_0 ;
  wire ram_reg_0_255_31_31_n_0;
  wire ram_reg_0_255_7_7_n_0;
  wire ram_reg_256_511_31_31_n_0;
  wire ram_reg_256_511_7_7_n_0;
  wire ram_reg_512_767_31_31_n_0;
  wire ram_reg_512_767_7_7_n_0;
  wire ram_reg_768_1023_31_31_n_0;
  wire ram_reg_768_1023_7_7_n_0;
  wire [9:0]result;

  LUT5 #(
    .INIT(32'hCACAFACA)) 
    \d_out[28]_i_1 
       (.I0(DM_out[28]),
        .I1(d_out0[1]),
        .I2(E),
        .I3(O),
        .I4(\d_out_reg[4]_0 ),
        .O(\d_out[28]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \d_out[31]_i_2 
       (.I0(d_out0[1]),
        .I1(\d_out_reg[4]_0 ),
        .I2(O),
        .O(\d_out[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_out[31]_i_7 
       (.I0(ram_reg_768_1023_31_31_n_0),
        .I1(ram_reg_512_767_31_31_n_0),
        .I2(result[9]),
        .I3(ram_reg_256_511_31_31_n_0),
        .I4(result[8]),
        .I5(ram_reg_0_255_31_31_n_0),
        .O(d_out0[1]));
  LUT5 #(
    .INIT(32'hCACAFACA)) 
    \d_out[4]_i_1 
       (.I0(\d_out_reg[7]_0 [2]),
        .I1(d_out0[0]),
        .I2(E),
        .I3(O),
        .I4(\d_out_reg[4]_0 ),
        .O(\d_out[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    \d_out[6]_i_1 
       (.I0(d_out0[0]),
        .I1(\d_out_reg[4]_0 ),
        .I2(O),
        .O(\d_out[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_out[7]_i_2 
       (.I0(ram_reg_768_1023_7_7_n_0),
        .I1(ram_reg_512_767_7_7_n_0),
        .I2(result[9]),
        .I3(ram_reg_256_511_7_7_n_0),
        .I4(result[8]),
        .I5(ram_reg_0_255_7_7_n_0),
        .O(d_out0[0]));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(DM_out[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(DM_out[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(\d_out_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(DM_out[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(DM_out[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[8]),
        .Q(DM_out[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[9]),
        .Q(DM_out[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\d_out[28]_i_1_n_0 ),
        .Q(DM_out[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\d_out[31]_i_2_n_0 ),
        .Q(DM_out[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(\d_out_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\d_out[4]_i_1_n_0 ),
        .Q(\d_out_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(\d_out_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\d_out[6]_i_1_n_0 ),
        .Q(\d_out_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_out_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(\d_out_reg[7]_0 [5]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][10]_i_2 
       (.I0(DM_out[10]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[10]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][16]_i_2 
       (.I0(DM_out[16]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[16]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][20]_i_2 
       (.I0(DM_out[20]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[20]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][21]_i_2 
       (.I0(DM_out[21]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[21]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][22]_i_2 
       (.I0(DM_out[22]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[22]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][26]_i_2 
       (.I0(DM_out[26]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[26]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][28]_i_2 
       (.I0(DM_out[28]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[28]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hE200)) 
    \r[1][31]_i_5 
       (.I0(DM_out[31]),
        .I1(\r_reg[1][31] ),
        .I2(\d_out_reg[7]_0 [5]),
        .I3(\r_reg[1][31]_0 ),
        .O(\d_out_reg[31]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_0_255_31_31
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_0_255_31_31_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[31]_i_7_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_0_255_7_7
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_0_255_7_7_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[7]_i_2_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_256_511_31_31
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_256_511_31_31_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[31]_i_7_1 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_256_511_7_7
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_256_511_7_7_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[7]_i_2_1 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_512_767_31_31
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_512_767_31_31_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[31]_i_7_2 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_512_767_7_7
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_512_767_7_7_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[7]_i_2_2 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_slice_begin = "31" *) 
  (* ram_slice_end = "31" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_768_1023_31_31
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_768_1023_31_31_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[31]_i_7_3 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S #(
    .INIT(256'h0000000000000000000000000000000000000000000000000000000000000000)) 
    ram_reg_768_1023_7_7
       (.A(result[7:0]),
        .D(1'b0),
        .O(ram_reg_768_1023_7_7_n_0),
        .WCLK(clk_IBUF_BUFG),
        .WE(\d_out[7]_i_2_3 ));
endmodule

module IMem
   (D,
    \instruction_reg[2]_0 ,
    \instruction_reg[13]_0 ,
    \instruction_reg[13]_1 ,
    \instruction_reg[6]_0 ,
    Q,
    \instruction_reg[13]_2 ,
    \instruction_reg[13]_3 ,
    \instruction_reg[13]_4 ,
    \instruction_reg[13]_5 ,
    \instruction_reg[2]_1 ,
    \instruction_reg[2]_2 ,
    \instruction_reg[2]_3 ,
    \instruction_reg[2]_4 ,
    \instruction_reg[7]_0 ,
    \current_pc_reg[15] ,
    S,
    DI,
    E,
    \instruction_reg[13]_6 ,
    \FSM_sequential_state_reg[1] ,
    \instruction_reg[4]_0 ,
    \current_pc_reg[3] ,
    \instruction_reg[6]_1 ,
    \instruction_reg[13]_7 ,
    \current_pc_reg[31] ,
    \instruction_reg[4]_1 ,
    \instruction_reg[13]_8 ,
    \instruction_reg[13]_9 ,
    \current_pc_reg[15]_0 ,
    \current_pc_reg[16] ,
    \current_pc_reg[17] ,
    \current_pc_reg[16]_0 ,
    \instruction_reg[9]_0 ,
    \instruction_reg[9]_1 ,
    \instruction_reg[9]_2 ,
    \instruction_reg[9]_3 ,
    \instruction_reg[9]_4 ,
    \instruction_reg[9]_5 ,
    \instruction_reg[9]_6 ,
    \current_pc_reg[11] ,
    data0,
    d_out0,
    \r_reg[4][31] ,
    \r_reg[1][31] ,
    PC_in0,
    \r_reg[1][28] ,
    \r_reg[1][26] ,
    \r_reg[1][22] ,
    \r_reg[1][21] ,
    \r_reg[1][20] ,
    \r_reg[1][16] ,
    \r_reg[1][10] ,
    \r_reg[1][7] ,
    out_OBUF,
    \current_pc_reg[19]_i_2 ,
    ALU_in1,
    \d_out_reg[31] ,
    ram_reg_512_767_7_7_i_1,
    BC_out,
    result2_carry__0,
    result2_carry__0_0,
    result2_carry__1,
    out_OBUF_inst_i_3,
    out_OBUF_inst_i_3_0,
    \current_pc_reg[11]_i_2 ,
    \current_pc_reg[19]_i_2_0 ,
    \instruction_reg[2]_5 ,
    \instruction_reg[17]_0 ,
    clk_IBUF_BUFG);
  output [6:0]D;
  output \instruction_reg[2]_0 ;
  output \instruction_reg[13]_0 ;
  output \instruction_reg[13]_1 ;
  output \instruction_reg[6]_0 ;
  output [2:0]Q;
  output \instruction_reg[13]_2 ;
  output \instruction_reg[13]_3 ;
  output \instruction_reg[13]_4 ;
  output [31:0]\instruction_reg[13]_5 ;
  output \instruction_reg[2]_1 ;
  output [9:0]\instruction_reg[2]_2 ;
  output \instruction_reg[2]_3 ;
  output \instruction_reg[2]_4 ;
  output [0:0]\instruction_reg[7]_0 ;
  output [2:0]\current_pc_reg[15] ;
  output [1:0]S;
  output [1:0]DI;
  output [0:0]E;
  output \instruction_reg[13]_6 ;
  output \FSM_sequential_state_reg[1] ;
  output \instruction_reg[4]_0 ;
  output [3:0]\current_pc_reg[3] ;
  output \instruction_reg[6]_1 ;
  output \instruction_reg[13]_7 ;
  output [30:0]\current_pc_reg[31] ;
  output \instruction_reg[4]_1 ;
  output \instruction_reg[13]_8 ;
  output \instruction_reg[13]_9 ;
  output [1:0]\current_pc_reg[15]_0 ;
  output [0:0]\current_pc_reg[16] ;
  output [1:0]\current_pc_reg[17] ;
  output [0:0]\current_pc_reg[16]_0 ;
  output [0:0]\instruction_reg[9]_0 ;
  output [0:0]\instruction_reg[9]_1 ;
  output [0:0]\instruction_reg[9]_2 ;
  output [0:0]\instruction_reg[9]_3 ;
  output [0:0]\instruction_reg[9]_4 ;
  output [0:0]\instruction_reg[9]_5 ;
  output [0:0]\instruction_reg[9]_6 ;
  output [0:0]\current_pc_reg[11] ;
  input [30:0]data0;
  input [1:0]d_out0;
  input \r_reg[4][31] ;
  input \r_reg[1][31] ;
  input [30:0]PC_in0;
  input \r_reg[1][28] ;
  input \r_reg[1][26] ;
  input \r_reg[1][22] ;
  input \r_reg[1][21] ;
  input \r_reg[1][20] ;
  input \r_reg[1][16] ;
  input \r_reg[1][10] ;
  input [5:0]\r_reg[1][7] ;
  input out_OBUF;
  input [6:0]\current_pc_reg[19]_i_2 ;
  input [6:0]ALU_in1;
  input \d_out_reg[31] ;
  input [2:0]ram_reg_512_767_7_7_i_1;
  input BC_out;
  input result2_carry__0;
  input result2_carry__0_0;
  input result2_carry__1;
  input out_OBUF_inst_i_3;
  input out_OBUF_inst_i_3_0;
  input \current_pc_reg[11]_i_2 ;
  input \current_pc_reg[19]_i_2_0 ;
  input [0:0]\instruction_reg[2]_5 ;
  input [11:0]\instruction_reg[17]_0 ;
  input clk_IBUF_BUFG;

  wire [6:0]ALU_in1;
  wire [20:20]\ArithmaticLogicUnit/result ;
  wire BC_out;
  wire [6:0]D;
  wire [1:0]DI;
  wire [0:0]E;
  wire \FSM_sequential_state_reg[1] ;
  wire [13:2]IM_out;
  wire [30:0]PC_in0;
  wire [2:0]Q;
  wire [1:0]S;
  wire clk_IBUF_BUFG;
  wire [0:0]\current_pc_reg[11] ;
  wire \current_pc_reg[11]_i_2 ;
  wire [2:0]\current_pc_reg[15] ;
  wire [1:0]\current_pc_reg[15]_0 ;
  wire [0:0]\current_pc_reg[16] ;
  wire [0:0]\current_pc_reg[16]_0 ;
  wire [1:0]\current_pc_reg[17] ;
  wire [6:0]\current_pc_reg[19]_i_2 ;
  wire \current_pc_reg[19]_i_2_0 ;
  wire [30:0]\current_pc_reg[31] ;
  wire [3:0]\current_pc_reg[3] ;
  wire [1:0]d_out0;
  wire \d_out[31]_i_4_n_0 ;
  wire \d_out[31]_i_5_n_0 ;
  wire \d_out_reg[31] ;
  wire [30:0]data0;
  wire \instruction_reg[13]_0 ;
  wire \instruction_reg[13]_1 ;
  wire \instruction_reg[13]_2 ;
  wire \instruction_reg[13]_3 ;
  wire \instruction_reg[13]_4 ;
  wire [31:0]\instruction_reg[13]_5 ;
  wire \instruction_reg[13]_6 ;
  wire \instruction_reg[13]_7 ;
  wire \instruction_reg[13]_8 ;
  wire \instruction_reg[13]_9 ;
  wire [11:0]\instruction_reg[17]_0 ;
  wire \instruction_reg[2]_0 ;
  wire \instruction_reg[2]_1 ;
  wire [9:0]\instruction_reg[2]_2 ;
  wire \instruction_reg[2]_3 ;
  wire \instruction_reg[2]_4 ;
  wire [0:0]\instruction_reg[2]_5 ;
  wire \instruction_reg[4]_0 ;
  wire \instruction_reg[4]_1 ;
  wire \instruction_reg[6]_0 ;
  wire \instruction_reg[6]_1 ;
  wire [0:0]\instruction_reg[7]_0 ;
  wire [0:0]\instruction_reg[9]_0 ;
  wire [0:0]\instruction_reg[9]_1 ;
  wire [0:0]\instruction_reg[9]_2 ;
  wire [0:0]\instruction_reg[9]_3 ;
  wire [0:0]\instruction_reg[9]_4 ;
  wire [0:0]\instruction_reg[9]_5 ;
  wire [0:0]\instruction_reg[9]_6 ;
  wire out_OBUF;
  wire out_OBUF_inst_i_3;
  wire out_OBUF_inst_i_3_0;
  wire \r[1][13]_i_2_n_0 ;
  wire \r[1][13]_i_3_n_0 ;
  wire \r[1][15]_i_2_n_0 ;
  wire \r[1][15]_i_3_n_0 ;
  wire \r[1][16]_i_3_n_0 ;
  wire \r[1][16]_i_4_n_0 ;
  wire \r[1][17]_i_2_n_0 ;
  wire \r[1][17]_i_3_n_0 ;
  wire \r[1][1]_i_2_n_0 ;
  wire \r[1][31]_i_3_n_0 ;
  wire \r[1][31]_i_4_n_0 ;
  wire \r[1][31]_i_6_n_0 ;
  wire \r_reg[1][10] ;
  wire \r_reg[1][16] ;
  wire \r_reg[1][20] ;
  wire \r_reg[1][21] ;
  wire \r_reg[1][22] ;
  wire \r_reg[1][26] ;
  wire \r_reg[1][28] ;
  wire \r_reg[1][31] ;
  wire [5:0]\r_reg[1][7] ;
  wire \r_reg[4][31] ;
  wire ram_reg_0_255_7_7_i_11_n_0;
  wire [2:0]ram_reg_512_767_7_7_i_1;
  wire result2_carry__0;
  wire result2_carry__0_0;
  wire result2_carry__1;
  wire result2_carry__1_i_6_n_0;
  wire result2_carry__1_i_8_n_0;
  wire result2_carry_i_10_n_0;
  wire result2_carry_i_8_n_0;

  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_state[0]_i_2 
       (.I0(IM_out[4]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[3]),
        .O(\instruction_reg[4]_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFFFFFFFFEE)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(ram_reg_512_767_7_7_i_1[1]),
        .I1(IM_out[2]),
        .I2(IM_out[5]),
        .I3(IM_out[3]),
        .I4(IM_out[4]),
        .I5(IM_out[6]),
        .O(\FSM_sequential_state_reg[1] ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[10]_i_1 
       (.I0(PC_in0[9]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[9]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [9]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[11]_i_1 
       (.I0(PC_in0[10]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[10]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [10]));
  LUT6 #(
    .INIT(64'h47B8B8B8B8B8B8B8)) 
    \current_pc[11]_i_6 
       (.I0(\current_pc_reg[19]_i_2 [2]),
        .I1(\instruction_reg[6]_1 ),
        .I2(\current_pc_reg[11]_i_2 ),
        .I3(IM_out[7]),
        .I4(result2_carry_i_10_n_0),
        .I5(result2_carry_i_8_n_0),
        .O(\current_pc_reg[11] ));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[12]_i_1 
       (.I0(PC_in0[11]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[11]),
        .O(\current_pc_reg[31] [11]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[13]_i_1 
       (.I0(PC_in0[12]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[12]),
        .O(\current_pc_reg[31] [12]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[14]_i_1 
       (.I0(PC_in0[13]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[13]),
        .O(\current_pc_reg[31] [13]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[15]_i_1 
       (.I0(PC_in0[14]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[14]),
        .O(\current_pc_reg[31] [14]));
  LUT4 #(
    .INIT(16'h47B8)) 
    \current_pc[15]_i_7 
       (.I0(\current_pc_reg[19]_i_2 [4]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__0_0),
        .I3(\instruction_reg[2]_3 ),
        .O(\current_pc_reg[15]_0 [1]));
  LUT4 #(
    .INIT(16'h47B8)) 
    \current_pc[15]_i_9 
       (.I0(\current_pc_reg[19]_i_2 [3]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__0),
        .I3(\instruction_reg[2]_4 ),
        .O(\current_pc_reg[15]_0 [0]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[16]_i_1 
       (.I0(PC_in0[15]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[15]),
        .O(\current_pc_reg[31] [15]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[17]_i_1 
       (.I0(PC_in0[16]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[16]),
        .O(\current_pc_reg[31] [16]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[18]_i_1 
       (.I0(PC_in0[17]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[17]),
        .O(\current_pc_reg[31] [17]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[19]_i_1 
       (.I0(PC_in0[18]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[18]),
        .O(\current_pc_reg[31] [18]));
  LUT4 #(
    .INIT(16'h47B8)) 
    \current_pc[19]_i_10 
       (.I0(\current_pc_reg[19]_i_2 [5]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__1),
        .I3(result2_carry__1_i_6_n_0),
        .O(\current_pc_reg[17] [0]));
  LUT4 #(
    .INIT(16'hB847)) 
    \current_pc[19]_i_9 
       (.I0(\current_pc_reg[19]_i_2 [6]),
        .I1(\instruction_reg[6]_1 ),
        .I2(\current_pc_reg[19]_i_2_0 ),
        .I3(result2_carry__1_i_8_n_0),
        .O(\current_pc_reg[17] [1]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[1]_i_1 
       (.I0(PC_in0[0]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[0]),
        .O(\current_pc_reg[31] [0]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[20]_i_1 
       (.I0(PC_in0[19]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[19]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [19]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[21]_i_1 
       (.I0(PC_in0[20]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[20]),
        .O(\current_pc_reg[31] [20]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[22]_i_1 
       (.I0(PC_in0[21]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[21]),
        .O(\current_pc_reg[31] [21]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[23]_i_1 
       (.I0(PC_in0[22]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[22]),
        .O(\current_pc_reg[31] [22]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[24]_i_1 
       (.I0(PC_in0[23]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[23]),
        .O(\current_pc_reg[31] [23]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[25]_i_1 
       (.I0(PC_in0[24]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[24]),
        .O(\current_pc_reg[31] [24]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[26]_i_1 
       (.I0(PC_in0[25]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[25]),
        .O(\current_pc_reg[31] [25]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[27]_i_1 
       (.I0(PC_in0[26]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[26]),
        .O(\current_pc_reg[31] [26]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[28]_i_1 
       (.I0(PC_in0[27]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[27]),
        .O(\current_pc_reg[31] [27]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[29]_i_1 
       (.I0(PC_in0[28]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[28]),
        .O(\current_pc_reg[31] [28]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[2]_i_1 
       (.I0(PC_in0[1]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[1]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [1]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[30]_i_1 
       (.I0(PC_in0[29]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[29]),
        .O(\current_pc_reg[31] [29]));
  LUT4 #(
    .INIT(16'h8B88)) 
    \current_pc[31]_i_2 
       (.I0(PC_in0[30]),
        .I1(\instruction_reg[4]_1 ),
        .I2(\instruction_reg[13]_0 ),
        .I3(data0[30]),
        .O(\current_pc_reg[31] [30]));
  LUT6 #(
    .INIT(64'hBABBFFFFFFFFFFFF)) 
    \current_pc[31]_i_5 
       (.I0(IM_out[4]),
        .I1(IM_out[2]),
        .I2(IM_out[3]),
        .I3(BC_out),
        .I4(IM_out[6]),
        .I5(IM_out[5]),
        .O(\instruction_reg[4]_1 ));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[3]_i_1 
       (.I0(PC_in0[2]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[2]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [2]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[4]_i_1 
       (.I0(PC_in0[3]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[3]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [3]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[5]_i_1 
       (.I0(PC_in0[4]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[4]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [4]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[6]_i_1 
       (.I0(PC_in0[5]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[5]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [5]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[7]_i_1 
       (.I0(PC_in0[6]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[6]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [6]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[8]_i_1 
       (.I0(PC_in0[7]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[7]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [7]));
  LUT4 #(
    .INIT(16'h88B8)) 
    \current_pc[9]_i_1 
       (.I0(PC_in0[8]),
        .I1(\instruction_reg[4]_1 ),
        .I2(data0[8]),
        .I3(\instruction_reg[13]_0 ),
        .O(\current_pc_reg[31] [8]));
  LUT5 #(
    .INIT(32'hFFBF00B0)) 
    \d_out[16]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[1]),
        .I2(data0[19]),
        .I3(\instruction_reg[13]_0 ),
        .I4(d_out0[1]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'hF704)) 
    \d_out[1]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[19]),
        .I2(\instruction_reg[13]_0 ),
        .I3(d_out0[0]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hF704)) 
    \d_out[21]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[19]),
        .I2(\instruction_reg[13]_0 ),
        .I3(d_out0[1]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hFFEF00E0)) 
    \d_out[22]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[1]),
        .I2(data0[19]),
        .I3(\instruction_reg[13]_0 ),
        .I4(d_out0[1]),
        .O(D[5]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \d_out[26]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[19]),
        .I2(\instruction_reg[13]_0 ),
        .I3(d_out0[1]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \d_out[26]_i_2 
       (.I0(\instruction_reg[2]_2 [1]),
        .I1(\d_out[31]_i_4_n_0 ),
        .I2(\instruction_reg[2]_2 [8]),
        .I3(\instruction_reg[2]_2 [7]),
        .I4(\instruction_reg[2]_2 [3]),
        .I5(\instruction_reg[2]_2 [2]),
        .O(\instruction_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h00002A00AAAAAAAA)) 
    \d_out[31]_i_1 
       (.I0(\d_out_reg[31] ),
        .I1(\instruction_reg[2]_2 [1]),
        .I2(data0[1]),
        .I3(\d_out[31]_i_4_n_0 ),
        .I4(\d_out[31]_i_5_n_0 ),
        .I5(\ArithmaticLogicUnit/result ),
        .O(E));
  LUT5 #(
    .INIT(32'hFF00FF01)) 
    \d_out[31]_i_4 
       (.I0(data0[5]),
        .I1(data0[10]),
        .I2(data0[7]),
        .I3(\instruction_reg[13]_0 ),
        .I4(data0[6]),
        .O(\d_out[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00FF00FE)) 
    \d_out[31]_i_5 
       (.I0(data0[9]),
        .I1(data0[8]),
        .I2(data0[4]),
        .I3(\instruction_reg[13]_0 ),
        .I4(data0[3]),
        .O(\d_out[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    \d_out[31]_i_6 
       (.I0(data0[19]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\ArithmaticLogicUnit/result ));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    \d_out[31]_i_8 
       (.I0(data0[10]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [9]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    \d_out[31]_i_9 
       (.I0(data0[9]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [8]));
  LUT4 #(
    .INIT(16'hFB08)) 
    \d_out[3]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[19]),
        .I2(\instruction_reg[13]_0 ),
        .I3(d_out0[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFFBF00B0)) 
    \d_out[7]_i_1 
       (.I0(\instruction_reg[2]_0 ),
        .I1(data0[1]),
        .I2(data0[19]),
        .I3(\instruction_reg[13]_0 ),
        .I4(d_out0[0]),
        .O(D[2]));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [8]),
        .Q(IM_out[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [9]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [10]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [11]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [0]),
        .Q(IM_out[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [1]),
        .Q(IM_out[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [2]),
        .Q(IM_out[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [3]),
        .Q(IM_out[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [4]),
        .Q(IM_out[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [5]),
        .Q(IM_out[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [6]),
        .Q(IM_out[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \instruction_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\instruction_reg[2]_5 ),
        .D(\instruction_reg[17]_0 [7]),
        .Q(IM_out[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000020)) 
    out_OBUF_inst_i_2
       (.I0(IM_out[13]),
        .I1(IM_out[3]),
        .I2(IM_out[4]),
        .I3(IM_out[6]),
        .I4(IM_out[2]),
        .O(\instruction_reg[13]_0 ));
  LUT4 #(
    .INIT(16'h47B8)) 
    out_OBUF_inst_i_5
       (.I0(\current_pc_reg[19]_i_2 [1]),
        .I1(\instruction_reg[6]_1 ),
        .I2(out_OBUF_inst_i_3_0),
        .I3(IM_out[3]),
        .O(\current_pc_reg[3] [3]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAA6AA)) 
    out_OBUF_inst_i_6
       (.I0(ALU_in1[2]),
        .I1(IM_out[9]),
        .I2(IM_out[3]),
        .I3(IM_out[5]),
        .I4(IM_out[4]),
        .I5(IM_out[2]),
        .O(\current_pc_reg[3] [2]));
  LUT6 #(
    .INIT(64'hFFFFFDFF00000200)) 
    out_OBUF_inst_i_7
       (.I0(IM_out[8]),
        .I1(IM_out[2]),
        .I2(IM_out[4]),
        .I3(IM_out[5]),
        .I4(IM_out[3]),
        .I5(ALU_in1[1]),
        .O(\current_pc_reg[3] [1]));
  LUT6 #(
    .INIT(64'hB847B8B8B8B8B8B8)) 
    out_OBUF_inst_i_8
       (.I0(\current_pc_reg[19]_i_2 [0]),
        .I1(\instruction_reg[6]_1 ),
        .I2(out_OBUF_inst_i_3),
        .I3(result2_carry_i_10_n_0),
        .I4(IM_out[7]),
        .I5(result2_carry_i_8_n_0),
        .O(\current_pc_reg[3] [0]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][0]_i_1 
       (.I0(\r[1][31]_i_4_n_0 ),
        .I1(out_OBUF),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [5]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(\current_pc_reg[19]_i_2 [0]),
        .O(\instruction_reg[13]_5 [0]));
  LUT6 #(
    .INIT(64'hAAEAFFFFAAEA0000)) 
    \r[1][10]_i_1 
       (.I0(\r_reg[1][10] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(data0[9]),
        .I3(\instruction_reg[13]_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[9]),
        .O(\instruction_reg[13]_5 [10]));
  LUT6 #(
    .INIT(64'hAAEAFFFFAAEA0000)) 
    \r[1][11]_i_1 
       (.I0(\r_reg[1][20] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(data0[10]),
        .I3(\instruction_reg[13]_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[10]),
        .O(\instruction_reg[13]_5 [11]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][12]_i_1 
       (.I0(\r_reg[1][21] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[11]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[11]),
        .O(\instruction_reg[13]_5 [12]));
  LUT6 #(
    .INIT(64'hFFAEFFFFFFAE0000)) 
    \r[1][13]_i_1 
       (.I0(\r_reg[1][22] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(\r[1][13]_i_2_n_0 ),
        .I3(\r[1][13]_i_3_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[12]),
        .O(\instruction_reg[13]_5 [13]));
  LUT6 #(
    .INIT(64'h00100000FFFFFFFF)) 
    \r[1][13]_i_2 
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[13]),
        .I5(data0[12]),
        .O(\r[1][13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \r[1][13]_i_3 
       (.I0(IM_out[13]),
        .I1(IM_out[4]),
        .I2(IM_out[5]),
        .I3(IM_out[2]),
        .I4(IM_out[3]),
        .I5(IM_out[6]),
        .O(\r[1][13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][14]_i_1 
       (.I0(\r_reg[1][26] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[13]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[13]),
        .O(\instruction_reg[13]_5 [14]));
  LUT6 #(
    .INIT(64'hFFAEFFFFFFAE0000)) 
    \r[1][15]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(\r[1][15]_i_2_n_0 ),
        .I3(\r[1][15]_i_3_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[14]),
        .O(\instruction_reg[13]_5 [15]));
  LUT6 #(
    .INIT(64'h00100000FFFFFFFF)) 
    \r[1][15]_i_2 
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[13]),
        .I5(data0[14]),
        .O(\r[1][15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \r[1][15]_i_3 
       (.I0(Q[0]),
        .I1(IM_out[4]),
        .I2(IM_out[5]),
        .I3(IM_out[2]),
        .I4(IM_out[3]),
        .I5(IM_out[6]),
        .O(\r[1][15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEEFEFFFFEEFE0000)) 
    \r[1][16]_i_1 
       (.I0(\r_reg[1][16] ),
        .I1(\r[1][16]_i_3_n_0 ),
        .I2(\r[1][31]_i_4_n_0 ),
        .I3(\r[1][16]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[15]),
        .O(\instruction_reg[13]_5 [16]));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \r[1][16]_i_3 
       (.I0(Q[1]),
        .I1(IM_out[4]),
        .I2(IM_out[5]),
        .I3(IM_out[2]),
        .I4(IM_out[3]),
        .I5(IM_out[6]),
        .O(\r[1][16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00100000FFFFFFFF)) 
    \r[1][16]_i_4 
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[13]),
        .I5(data0[15]),
        .O(\r[1][16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFAEFFFFFFAE0000)) 
    \r[1][17]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(\r[1][17]_i_2_n_0 ),
        .I3(\r[1][17]_i_3_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[16]),
        .O(\instruction_reg[13]_5 [17]));
  LUT6 #(
    .INIT(64'h00100000FFFFFFFF)) 
    \r[1][17]_i_2 
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[13]),
        .I5(data0[16]),
        .O(\r[1][17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \r[1][17]_i_3 
       (.I0(Q[2]),
        .I1(IM_out[4]),
        .I2(IM_out[5]),
        .I3(IM_out[2]),
        .I4(IM_out[3]),
        .I5(IM_out[6]),
        .O(\r[1][17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][18]_i_1 
       (.I0(\r_reg[1][22] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[17]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[17]),
        .O(\instruction_reg[13]_5 [18]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][19]_i_1 
       (.I0(\r_reg[1][20] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[18]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[18]),
        .O(\instruction_reg[13]_5 [19]));
  LUT6 #(
    .INIT(64'hF444FFFFF4440000)) 
    \r[1][1]_i_1 
       (.I0(\r[1][1]_i_2_n_0 ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [0]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[0]),
        .O(\instruction_reg[13]_5 [1]));
  LUT6 #(
    .INIT(64'h00100000FFFFFFFF)) 
    \r[1][1]_i_2 
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[13]),
        .I5(data0[0]),
        .O(\r[1][1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAEAFFFFAAEA0000)) 
    \r[1][20]_i_1 
       (.I0(\r_reg[1][20] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(data0[19]),
        .I3(\instruction_reg[13]_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[19]),
        .O(\instruction_reg[13]_5 [20]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][21]_i_1 
       (.I0(\r_reg[1][21] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[20]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[20]),
        .O(\instruction_reg[13]_5 [21]));
  LUT6 #(
    .INIT(64'hFF40FFFFFF400000)) 
    \r[1][22]_i_1 
       (.I0(\instruction_reg[13]_0 ),
        .I1(data0[21]),
        .I2(\r[1][31]_i_4_n_0 ),
        .I3(\r_reg[1][22] ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[21]),
        .O(\instruction_reg[13]_5 [22]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][23]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[22]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[22]),
        .O(\instruction_reg[13]_5 [23]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][24]_i_1 
       (.I0(\r_reg[1][28] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[23]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[23]),
        .O(\instruction_reg[13]_5 [24]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][25]_i_1 
       (.I0(\r_reg[1][28] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[24]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[24]),
        .O(\instruction_reg[13]_5 [25]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][26]_i_1 
       (.I0(\r_reg[1][26] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[25]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[25]),
        .O(\instruction_reg[13]_5 [26]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][27]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[26]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[26]),
        .O(\instruction_reg[13]_5 [27]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][28]_i_1 
       (.I0(\r_reg[1][28] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[27]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[27]),
        .O(\instruction_reg[13]_5 [28]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][29]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[28]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[28]),
        .O(\instruction_reg[13]_5 [29]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][2]_i_1 
       (.I0(\instruction_reg[2]_2 [0]),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [4]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[1]),
        .O(\instruction_reg[13]_5 [2]));
  LUT6 #(
    .INIT(64'hBAAAFFFFBAAA0000)) 
    \r[1][30]_i_1 
       (.I0(\r_reg[1][31] ),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[29]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[29]),
        .O(\instruction_reg[13]_5 [30]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \r[1][31]_i_1 
       (.I0(IM_out[9]),
        .I1(\r[1][31]_i_3_n_0 ),
        .I2(IM_out[8]),
        .I3(IM_out[7]),
        .O(\instruction_reg[9]_2 ));
  LUT6 #(
    .INIT(64'hFF40FFFFFF400000)) 
    \r[1][31]_i_2 
       (.I0(\instruction_reg[13]_0 ),
        .I1(data0[30]),
        .I2(\r[1][31]_i_4_n_0 ),
        .I3(\r_reg[1][31] ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[30]),
        .O(\instruction_reg[13]_5 [31]));
  LUT6 #(
    .INIT(64'hAAABAAABAAAAAEAA)) 
    \r[1][31]_i_3 
       (.I0(\r_reg[4][31] ),
        .I1(IM_out[2]),
        .I2(IM_out[4]),
        .I3(IM_out[3]),
        .I4(IM_out[6]),
        .I5(IM_out[5]),
        .O(\r[1][31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFBFFFFFE)) 
    \r[1][31]_i_4 
       (.I0(IM_out[6]),
        .I1(IM_out[5]),
        .I2(IM_out[3]),
        .I3(IM_out[4]),
        .I4(IM_out[2]),
        .O(\r[1][31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \r[1][31]_i_6 
       (.I0(IM_out[5]),
        .I1(IM_out[6]),
        .I2(IM_out[2]),
        .I3(IM_out[4]),
        .O(\r[1][31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    \r[1][31]_i_8 
       (.I0(IM_out[13]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[3]),
        .I4(IM_out[4]),
        .I5(IM_out[5]),
        .O(\instruction_reg[13]_6 ));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][3]_i_1 
       (.I0(\r[1][31]_i_4_n_0 ),
        .I1(\instruction_reg[2]_2 [1]),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [1]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[2]),
        .O(\instruction_reg[13]_5 [3]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][4]_i_1 
       (.I0(\r[1][31]_i_4_n_0 ),
        .I1(\instruction_reg[2]_2 [2]),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [2]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[3]),
        .O(\instruction_reg[13]_5 [4]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][5]_i_1 
       (.I0(\r[1][31]_i_4_n_0 ),
        .I1(\instruction_reg[2]_2 [3]),
        .I2(\instruction_reg[2]_1 ),
        .I3(\r_reg[1][7] [3]),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[4]),
        .O(\instruction_reg[13]_5 [5]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][6]_i_1 
       (.I0(\instruction_reg[2]_1 ),
        .I1(\r_reg[1][7] [4]),
        .I2(\instruction_reg[2]_2 [4]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[5]),
        .O(\instruction_reg[13]_5 [6]));
  LUT6 #(
    .INIT(64'hF888FFFFF8880000)) 
    \r[1][7]_i_1 
       (.I0(\instruction_reg[2]_1 ),
        .I1(\r_reg[1][7] [5]),
        .I2(\instruction_reg[2]_2 [5]),
        .I3(\r[1][31]_i_4_n_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[6]),
        .O(\instruction_reg[13]_5 [7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \r[1][7]_i_2 
       (.I0(IM_out[2]),
        .I1(IM_out[4]),
        .I2(IM_out[3]),
        .I3(IM_out[5]),
        .I4(IM_out[6]),
        .O(\instruction_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hAAEAFFFFAAEA0000)) 
    \r[1][8]_i_1 
       (.I0(\r_reg[1][28] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(data0[7]),
        .I3(\instruction_reg[13]_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[7]),
        .O(\instruction_reg[13]_5 [8]));
  LUT6 #(
    .INIT(64'hAAEAFFFFAAEA0000)) 
    \r[1][9]_i_1 
       (.I0(\r_reg[1][22] ),
        .I1(\r[1][31]_i_4_n_0 ),
        .I2(data0[8]),
        .I3(\instruction_reg[13]_0 ),
        .I4(\r[1][31]_i_6_n_0 ),
        .I5(PC_in0[8]),
        .O(\instruction_reg[13]_5 [9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \r[2][31]_i_1 
       (.I0(IM_out[9]),
        .I1(\r[1][31]_i_3_n_0 ),
        .I2(IM_out[7]),
        .I3(IM_out[8]),
        .O(\instruction_reg[9]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \r[3][31]_i_1 
       (.I0(IM_out[9]),
        .I1(\r[1][31]_i_3_n_0 ),
        .I2(IM_out[7]),
        .I3(IM_out[8]),
        .O(\instruction_reg[9]_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \r[4][31]_i_1 
       (.I0(\r[1][31]_i_3_n_0 ),
        .I1(IM_out[9]),
        .I2(IM_out[7]),
        .I3(IM_out[8]),
        .O(\instruction_reg[9]_6 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \r[5][31]_i_1 
       (.I0(\r[1][31]_i_3_n_0 ),
        .I1(IM_out[9]),
        .I2(IM_out[8]),
        .I3(IM_out[7]),
        .O(\instruction_reg[9]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \r[6][31]_i_1 
       (.I0(\r[1][31]_i_3_n_0 ),
        .I1(IM_out[9]),
        .I2(IM_out[7]),
        .I3(IM_out[8]),
        .O(\instruction_reg[9]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    \r[7][31]_i_1 
       (.I0(\r[1][31]_i_3_n_0 ),
        .I1(IM_out[9]),
        .I2(IM_out[7]),
        .I3(IM_out[8]),
        .O(\instruction_reg[9]_3 ));
  LUT5 #(
    .INIT(32'h44004404)) 
    ram_reg_0_255_31_31_i_1
       (.I0(\instruction_reg[6]_0 ),
        .I1(IM_out[13]),
        .I2(data0[9]),
        .I3(\instruction_reg[13]_0 ),
        .I4(data0[10]),
        .O(\instruction_reg[13]_1 ));
  LUT4 #(
    .INIT(16'h00CD)) 
    ram_reg_0_255_7_7_i_1
       (.I0(data0[9]),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[10]),
        .I3(\instruction_reg[6]_0 ),
        .O(\instruction_reg[13]_8 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEFFFFF)) 
    ram_reg_0_255_7_7_i_10
       (.I0(\ArithmaticLogicUnit/result ),
        .I1(IM_out[6]),
        .I2(ram_reg_512_767_7_7_i_1[1]),
        .I3(ram_reg_512_767_7_7_i_1[2]),
        .I4(ram_reg_512_767_7_7_i_1[0]),
        .I5(ram_reg_0_255_7_7_i_11_n_0),
        .O(\instruction_reg[6]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    ram_reg_0_255_7_7_i_11
       (.I0(IM_out[3]),
        .I1(IM_out[6]),
        .I2(IM_out[2]),
        .I3(IM_out[4]),
        .I4(IM_out[5]),
        .O(ram_reg_0_255_7_7_i_11_n_0));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_2
       (.I0(data0[8]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [7]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_3
       (.I0(data0[7]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [6]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_4
       (.I0(data0[6]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [5]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_5
       (.I0(data0[5]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [4]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_6
       (.I0(data0[4]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [3]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_7
       (.I0(data0[3]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [2]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_8
       (.I0(data0[2]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [1]));
  LUT6 #(
    .INIT(64'hAAAAA8AAAAAAAAAA)) 
    ram_reg_0_255_7_7_i_9
       (.I0(data0[1]),
        .I1(IM_out[2]),
        .I2(IM_out[6]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_2 [0]));
  LUT5 #(
    .INIT(32'h00000400)) 
    ram_reg_256_511_31_31_i_1
       (.I0(data0[10]),
        .I1(data0[9]),
        .I2(\instruction_reg[13]_0 ),
        .I3(IM_out[13]),
        .I4(\instruction_reg[6]_0 ),
        .O(\instruction_reg[13]_3 ));
  LUT5 #(
    .INIT(32'h00000400)) 
    ram_reg_512_767_31_31_i_1
       (.I0(data0[9]),
        .I1(data0[10]),
        .I2(\instruction_reg[13]_0 ),
        .I3(IM_out[13]),
        .I4(\instruction_reg[6]_0 ),
        .O(\instruction_reg[13]_4 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    ram_reg_768_1023_31_31_i_1
       (.I0(\instruction_reg[6]_0 ),
        .I1(IM_out[13]),
        .I2(data0[9]),
        .I3(\instruction_reg[13]_0 ),
        .I4(data0[10]),
        .O(\instruction_reg[13]_2 ));
  LUT4 #(
    .INIT(16'h0020)) 
    ram_reg_768_1023_7_7_i_1
       (.I0(data0[9]),
        .I1(\instruction_reg[13]_0 ),
        .I2(data0[10]),
        .I3(\instruction_reg[6]_0 ),
        .O(\instruction_reg[13]_9 ));
  LUT4 #(
    .INIT(16'h4700)) 
    result2_carry__0_i_1
       (.I0(\current_pc_reg[19]_i_2 [4]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__0_0),
        .I3(\instruction_reg[2]_3 ),
        .O(\current_pc_reg[15] [2]));
  LUT4 #(
    .INIT(16'h4700)) 
    result2_carry__0_i_2
       (.I0(\current_pc_reg[19]_i_2 [3]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__0),
        .I3(\instruction_reg[2]_4 ),
        .O(\current_pc_reg[15] [1]));
  LUT4 #(
    .INIT(16'h0080)) 
    result2_carry__0_i_3
       (.I0(IM_out[7]),
        .I1(result2_carry_i_10_n_0),
        .I2(result2_carry_i_8_n_0),
        .I3(ALU_in1[5]),
        .O(\current_pc_reg[15] [0]));
  LUT5 #(
    .INIT(32'h40001555)) 
    result2_carry__0_i_6
       (.I0(ALU_in1[4]),
        .I1(result2_carry_i_8_n_0),
        .I2(result2_carry_i_10_n_0),
        .I3(IM_out[7]),
        .I4(ALU_in1[5]),
        .O(\instruction_reg[7]_0 ));
  LUT6 #(
    .INIT(64'hFEFEF2FE00000000)) 
    result2_carry__0_i_8
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[3]),
        .I3(IM_out[5]),
        .I4(IM_out[4]),
        .I5(Q[0]),
        .O(\instruction_reg[2]_3 ));
  LUT6 #(
    .INIT(64'hFEFEF2FE00000000)) 
    result2_carry__0_i_9
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[3]),
        .I3(IM_out[5]),
        .I4(IM_out[4]),
        .I5(IM_out[13]),
        .O(\instruction_reg[2]_4 ));
  LUT6 #(
    .INIT(64'h000047004700FFFF)) 
    result2_carry__1_i_1
       (.I0(\current_pc_reg[19]_i_2 [5]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__1),
        .I3(result2_carry__1_i_6_n_0),
        .I4(ALU_in1[6]),
        .I5(result2_carry__1_i_8_n_0),
        .O(\current_pc_reg[16]_0 ));
  LUT6 #(
    .INIT(64'h0000B847B8470000)) 
    result2_carry__1_i_5
       (.I0(\current_pc_reg[19]_i_2 [5]),
        .I1(\instruction_reg[6]_1 ),
        .I2(result2_carry__1),
        .I3(result2_carry__1_i_6_n_0),
        .I4(result2_carry__1_i_8_n_0),
        .I5(ALU_in1[6]),
        .O(\current_pc_reg[16] ));
  LUT6 #(
    .INIT(64'hFFCF0000FFAA0000)) 
    result2_carry__1_i_6
       (.I0(IM_out[2]),
        .I1(IM_out[4]),
        .I2(IM_out[5]),
        .I3(IM_out[3]),
        .I4(Q[1]),
        .I5(IM_out[6]),
        .O(result2_carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'h555555555D5D55FF)) 
    result2_carry__1_i_8
       (.I0(Q[2]),
        .I1(IM_out[5]),
        .I2(IM_out[4]),
        .I3(IM_out[2]),
        .I4(IM_out[6]),
        .I5(IM_out[3]),
        .O(result2_carry__1_i_8_n_0));
  LUT5 #(
    .INIT(32'h2222B222)) 
    result2_carry_i_1
       (.I0(IM_out[3]),
        .I1(ALU_in1[3]),
        .I2(IM_out[9]),
        .I3(result2_carry_i_8_n_0),
        .I4(ALU_in1[2]),
        .O(DI[1]));
  LUT5 #(
    .INIT(32'hFFFEF6FE)) 
    result2_carry_i_10
       (.I0(IM_out[2]),
        .I1(IM_out[6]),
        .I2(IM_out[3]),
        .I3(IM_out[5]),
        .I4(IM_out[4]),
        .O(result2_carry_i_10_n_0));
  LUT5 #(
    .INIT(32'h00800420)) 
    result2_carry_i_13
       (.I0(IM_out[6]),
        .I1(IM_out[2]),
        .I2(IM_out[5]),
        .I3(IM_out[4]),
        .I4(IM_out[3]),
        .O(\instruction_reg[6]_1 ));
  LUT6 #(
    .INIT(64'h0040F0F000000040)) 
    result2_carry_i_2
       (.I0(result2_carry_i_10_n_0),
        .I1(IM_out[7]),
        .I2(result2_carry_i_8_n_0),
        .I3(ALU_in1[0]),
        .I4(ALU_in1[1]),
        .I5(IM_out[8]),
        .O(DI[0]));
  LUT5 #(
    .INIT(32'h90000999)) 
    result2_carry_i_5
       (.I0(IM_out[3]),
        .I1(ALU_in1[3]),
        .I2(result2_carry_i_8_n_0),
        .I3(IM_out[9]),
        .I4(ALU_in1[2]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h0000900095950595)) 
    result2_carry_i_6
       (.I0(ALU_in1[1]),
        .I1(IM_out[8]),
        .I2(result2_carry_i_8_n_0),
        .I3(IM_out[7]),
        .I4(result2_carry_i_10_n_0),
        .I5(ALU_in1[0]),
        .O(S[0]));
  LUT4 #(
    .INIT(16'h0004)) 
    result2_carry_i_8
       (.I0(IM_out[3]),
        .I1(IM_out[5]),
        .I2(IM_out[4]),
        .I3(IM_out[2]),
        .O(result2_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFDFFFFFFFFF)) 
    result_reg_i_1
       (.I0(IM_out[13]),
        .I1(IM_out[3]),
        .I2(IM_out[5]),
        .I3(IM_out[4]),
        .I4(IM_out[2]),
        .I5(IM_out[6]),
        .O(\instruction_reg[13]_7 ));
endmodule

module PCnt
   (D,
    \current_pc_reg[30]_0 ,
    \instruction_reg[13] ,
    \instruction_reg[13]_0 ,
    PC_in0,
    Q,
    ALU_in1,
    out_OBUF,
    \current_pc_reg[31]_0 ,
    \current_pc_reg[4]_0 ,
    S,
    \current_pc_reg[15]_0 ,
    \current_pc_reg[23]_0 ,
    \current_pc_reg[31]_1 ,
    \d_out_reg[5] ,
    \d_out_reg[5]_0 ,
    d_out0,
    ram_reg_512_767_7_7,
    \current_pc_reg[3]_0 ,
    \r_reg[1][11] ,
    \current_pc_reg[15]_1 ,
    \r_reg[1][19] ,
    result2_carry__2,
    result2_carry_i_2,
    out_OBUF_inst_i_7,
    result2_carry_i_5,
    out_OBUF_inst_i_3_0,
    \current_pc_reg[11]_i_2_0 ,
    result2_carry__0_i_3,
    \current_pc_reg[19]_i_2_0 ,
    \current_pc_reg[31]_2 ,
    \current_pc_reg[0]_0 ,
    CO,
    result2_carry,
    result2_carry_0,
    result2_carry_1,
    result2_carry_2,
    result2_carry__0,
    result2_carry__0_0,
    result2_carry__0_1,
    result2_carry__0_2,
    result2_carry__0_3,
    result2_carry__0_4,
    \current_pc_reg[19]_i_2_1 ,
    result2_carry__1,
    result2_carry__1_0,
    result2_carry__1_1,
    result2_carry__1_2,
    result2_carry__1_3,
    result2_carry__1_4,
    result2_carry__2_0,
    result2_carry__2_1,
    result2_carry__2_2,
    result2_carry__2_3,
    result2_carry__2_4,
    result2_carry__2_5,
    result2_carry__2_6,
    result2_carry__2_7,
    result2_carry__0_5,
    result2_carry__0_6,
    E,
    CLK,
    p_0_in);
  output [2:0]D;
  output [30:0]\current_pc_reg[30]_0 ;
  output \instruction_reg[13] ;
  output \instruction_reg[13]_0 ;
  output [30:0]PC_in0;
  output [6:0]Q;
  output [6:0]ALU_in1;
  output out_OBUF;
  output [0:0]\current_pc_reg[31]_0 ;
  output [11:0]\current_pc_reg[4]_0 ;
  output [1:0]S;
  output [2:0]\current_pc_reg[15]_0 ;
  output [2:0]\current_pc_reg[23]_0 ;
  output [3:0]\current_pc_reg[31]_1 ;
  input \d_out_reg[5] ;
  input \d_out_reg[5]_0 ;
  input [1:0]d_out0;
  input ram_reg_512_767_7_7;
  input [3:0]\current_pc_reg[3]_0 ;
  input [0:0]\r_reg[1][11] ;
  input [1:0]\current_pc_reg[15]_1 ;
  input [1:0]\r_reg[1][19] ;
  input result2_carry__2;
  input result2_carry_i_2;
  input out_OBUF_inst_i_7;
  input result2_carry_i_5;
  input out_OBUF_inst_i_3_0;
  input \current_pc_reg[11]_i_2_0 ;
  input result2_carry__0_i_3;
  input \current_pc_reg[19]_i_2_0 ;
  input [30:0]\current_pc_reg[31]_2 ;
  input \current_pc_reg[0]_0 ;
  input [0:0]CO;
  input result2_carry;
  input result2_carry_0;
  input result2_carry_1;
  input result2_carry_2;
  input result2_carry__0;
  input result2_carry__0_0;
  input result2_carry__0_1;
  input result2_carry__0_2;
  input result2_carry__0_3;
  input result2_carry__0_4;
  input \current_pc_reg[19]_i_2_1 ;
  input result2_carry__1;
  input result2_carry__1_0;
  input result2_carry__1_1;
  input result2_carry__1_2;
  input result2_carry__1_3;
  input result2_carry__1_4;
  input result2_carry__2_0;
  input result2_carry__2_1;
  input result2_carry__2_2;
  input result2_carry__2_3;
  input result2_carry__2_4;
  input result2_carry__2_5;
  input result2_carry__2_6;
  input result2_carry__2_7;
  input result2_carry__0_5;
  input result2_carry__0_6;
  input [0:0]E;
  input CLK;
  input p_0_in;

  wire [6:0]ALU_in1;
  wire [0:0]\ArithmaticLogicUnit/data0 ;
  wire CLK;
  wire [0:0]CO;
  wire [2:0]D;
  wire [0:0]E;
  wire [0:0]PC_in;
  wire [30:0]PC_in0;
  wire [31:1]PC_out;
  wire [6:0]Q;
  wire [1:0]S;
  wire \current_pc[11]_i_3_n_0 ;
  wire \current_pc[11]_i_4_n_0 ;
  wire \current_pc[11]_i_5_n_0 ;
  wire \current_pc[11]_i_7_n_0 ;
  wire \current_pc[11]_i_8_n_0 ;
  wire \current_pc[11]_i_9_n_0 ;
  wire \current_pc[15]_i_10_n_0 ;
  wire \current_pc[15]_i_3_n_0 ;
  wire \current_pc[15]_i_4_n_0 ;
  wire \current_pc[15]_i_5_n_0 ;
  wire \current_pc[15]_i_6_n_0 ;
  wire \current_pc[15]_i_8_n_0 ;
  wire \current_pc[19]_i_3_n_0 ;
  wire \current_pc[19]_i_4_n_0 ;
  wire \current_pc[19]_i_5_n_0 ;
  wire \current_pc[19]_i_6_n_0 ;
  wire \current_pc[19]_i_7_n_0 ;
  wire \current_pc[19]_i_8_n_0 ;
  wire \current_pc[23]_i_10_n_0 ;
  wire \current_pc[23]_i_3_n_0 ;
  wire \current_pc[23]_i_4_n_0 ;
  wire \current_pc[23]_i_5_n_0 ;
  wire \current_pc[23]_i_6_n_0 ;
  wire \current_pc[23]_i_7_n_0 ;
  wire \current_pc[23]_i_8_n_0 ;
  wire \current_pc[23]_i_9_n_0 ;
  wire \current_pc[27]_i_10_n_0 ;
  wire \current_pc[27]_i_3_n_0 ;
  wire \current_pc[27]_i_4_n_0 ;
  wire \current_pc[27]_i_5_n_0 ;
  wire \current_pc[27]_i_6_n_0 ;
  wire \current_pc[27]_i_7_n_0 ;
  wire \current_pc[27]_i_8_n_0 ;
  wire \current_pc[27]_i_9_n_0 ;
  wire \current_pc[31]_i_10_n_0 ;
  wire \current_pc[31]_i_11_n_0 ;
  wire \current_pc[31]_i_12_n_0 ;
  wire \current_pc[31]_i_13_n_0 ;
  wire \current_pc[31]_i_7_n_0 ;
  wire \current_pc[31]_i_8_n_0 ;
  wire \current_pc[31]_i_9_n_0 ;
  wire \current_pc[4]_i_3_n_0 ;
  wire \current_pc[7]_i_10_n_0 ;
  wire \current_pc[7]_i_3_n_0 ;
  wire \current_pc[7]_i_4_n_0 ;
  wire \current_pc[7]_i_5_n_0 ;
  wire \current_pc[7]_i_6_n_0 ;
  wire \current_pc[7]_i_7_n_0 ;
  wire \current_pc[7]_i_8_n_0 ;
  wire \current_pc[7]_i_9_n_0 ;
  wire \current_pc_reg[0]_0 ;
  wire \current_pc_reg[11]_i_2_0 ;
  wire \current_pc_reg[11]_i_2_n_0 ;
  wire \current_pc_reg[11]_i_2_n_1 ;
  wire \current_pc_reg[11]_i_2_n_2 ;
  wire \current_pc_reg[11]_i_2_n_3 ;
  wire \current_pc_reg[12]_i_2_n_0 ;
  wire \current_pc_reg[12]_i_2_n_1 ;
  wire \current_pc_reg[12]_i_2_n_2 ;
  wire \current_pc_reg[12]_i_2_n_3 ;
  wire [2:0]\current_pc_reg[15]_0 ;
  wire [1:0]\current_pc_reg[15]_1 ;
  wire \current_pc_reg[15]_i_2_n_0 ;
  wire \current_pc_reg[15]_i_2_n_1 ;
  wire \current_pc_reg[15]_i_2_n_2 ;
  wire \current_pc_reg[15]_i_2_n_3 ;
  wire \current_pc_reg[16]_i_2_n_0 ;
  wire \current_pc_reg[16]_i_2_n_1 ;
  wire \current_pc_reg[16]_i_2_n_2 ;
  wire \current_pc_reg[16]_i_2_n_3 ;
  wire \current_pc_reg[19]_i_2_0 ;
  wire \current_pc_reg[19]_i_2_1 ;
  wire \current_pc_reg[19]_i_2_n_0 ;
  wire \current_pc_reg[19]_i_2_n_1 ;
  wire \current_pc_reg[19]_i_2_n_2 ;
  wire \current_pc_reg[19]_i_2_n_3 ;
  wire \current_pc_reg[20]_i_2_n_0 ;
  wire \current_pc_reg[20]_i_2_n_1 ;
  wire \current_pc_reg[20]_i_2_n_2 ;
  wire \current_pc_reg[20]_i_2_n_3 ;
  wire [2:0]\current_pc_reg[23]_0 ;
  wire \current_pc_reg[23]_i_2_n_0 ;
  wire \current_pc_reg[23]_i_2_n_1 ;
  wire \current_pc_reg[23]_i_2_n_2 ;
  wire \current_pc_reg[23]_i_2_n_3 ;
  wire \current_pc_reg[24]_i_2_n_0 ;
  wire \current_pc_reg[24]_i_2_n_1 ;
  wire \current_pc_reg[24]_i_2_n_2 ;
  wire \current_pc_reg[24]_i_2_n_3 ;
  wire \current_pc_reg[27]_i_2_n_0 ;
  wire \current_pc_reg[27]_i_2_n_1 ;
  wire \current_pc_reg[27]_i_2_n_2 ;
  wire \current_pc_reg[27]_i_2_n_3 ;
  wire \current_pc_reg[28]_i_2_n_0 ;
  wire \current_pc_reg[28]_i_2_n_1 ;
  wire \current_pc_reg[28]_i_2_n_2 ;
  wire \current_pc_reg[28]_i_2_n_3 ;
  wire [30:0]\current_pc_reg[30]_0 ;
  wire [0:0]\current_pc_reg[31]_0 ;
  wire [3:0]\current_pc_reg[31]_1 ;
  wire [30:0]\current_pc_reg[31]_2 ;
  wire \current_pc_reg[31]_i_4_n_2 ;
  wire \current_pc_reg[31]_i_4_n_3 ;
  wire \current_pc_reg[31]_i_6_n_1 ;
  wire \current_pc_reg[31]_i_6_n_2 ;
  wire \current_pc_reg[31]_i_6_n_3 ;
  wire [3:0]\current_pc_reg[3]_0 ;
  wire [11:0]\current_pc_reg[4]_0 ;
  wire \current_pc_reg[4]_i_2_n_0 ;
  wire \current_pc_reg[4]_i_2_n_1 ;
  wire \current_pc_reg[4]_i_2_n_2 ;
  wire \current_pc_reg[4]_i_2_n_3 ;
  wire \current_pc_reg[7]_i_2_n_0 ;
  wire \current_pc_reg[7]_i_2_n_1 ;
  wire \current_pc_reg[7]_i_2_n_2 ;
  wire \current_pc_reg[7]_i_2_n_3 ;
  wire \current_pc_reg[8]_i_2_n_0 ;
  wire \current_pc_reg[8]_i_2_n_1 ;
  wire \current_pc_reg[8]_i_2_n_2 ;
  wire \current_pc_reg[8]_i_2_n_3 ;
  wire [1:0]d_out0;
  wire \d_out_reg[5] ;
  wire \d_out_reg[5]_0 ;
  wire \instruction_reg[13] ;
  wire \instruction_reg[13]_0 ;
  wire out_OBUF;
  wire out_OBUF_inst_i_3_0;
  wire out_OBUF_inst_i_3_n_0;
  wire out_OBUF_inst_i_3_n_1;
  wire out_OBUF_inst_i_3_n_2;
  wire out_OBUF_inst_i_3_n_3;
  wire out_OBUF_inst_i_4_n_0;
  wire out_OBUF_inst_i_7;
  wire p_0_in;
  wire [0:0]\r_reg[1][11] ;
  wire [1:0]\r_reg[1][19] ;
  wire ram_reg_512_767_7_7;
  wire result2_carry;
  wire result2_carry_0;
  wire result2_carry_1;
  wire result2_carry_2;
  wire result2_carry__0;
  wire result2_carry__0_0;
  wire result2_carry__0_1;
  wire result2_carry__0_2;
  wire result2_carry__0_3;
  wire result2_carry__0_4;
  wire result2_carry__0_5;
  wire result2_carry__0_6;
  wire result2_carry__0_i_3;
  wire result2_carry__1;
  wire result2_carry__1_0;
  wire result2_carry__1_1;
  wire result2_carry__1_2;
  wire result2_carry__1_3;
  wire result2_carry__1_4;
  wire result2_carry__2;
  wire result2_carry__2_0;
  wire result2_carry__2_1;
  wire result2_carry__2_2;
  wire result2_carry__2_3;
  wire result2_carry__2_4;
  wire result2_carry__2_5;
  wire result2_carry__2_6;
  wire result2_carry__2_7;
  wire result2_carry_i_2;
  wire result2_carry_i_5;
  wire [3:2]\NLW_current_pc_reg[31]_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_current_pc_reg[31]_i_4_O_UNCONNECTED ;
  wire [3:3]\NLW_current_pc_reg[31]_i_6_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_pc[0]_i_1 
       (.I0(Q[0]),
        .I1(\current_pc_reg[0]_0 ),
        .I2(CO),
        .I3(\d_out_reg[5]_0 ),
        .I4(\ArithmaticLogicUnit/data0 ),
        .O(PC_in));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_3 
       (.I0(PC_out[10]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[11]_i_2_0 ),
        .O(\current_pc[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_4 
       (.I0(PC_out[9]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_0),
        .O(\current_pc[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_5 
       (.I0(PC_out[8]),
        .I1(result2_carry__2),
        .I2(result2_carry__0),
        .O(\current_pc[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_7 
       (.I0(PC_out[10]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[11]_i_2_0 ),
        .O(\current_pc[11]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_8 
       (.I0(PC_out[9]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_0),
        .O(\current_pc[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[11]_i_9 
       (.I0(PC_out[8]),
        .I1(result2_carry__2),
        .I2(result2_carry__0),
        .O(\current_pc[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_10 
       (.I0(PC_out[12]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_1),
        .O(\current_pc[15]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_3 
       (.I0(Q[4]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_4),
        .O(\current_pc[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_4 
       (.I0(PC_out[14]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_3),
        .O(\current_pc[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_5 
       (.I0(Q[3]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_2),
        .O(\current_pc[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_6 
       (.I0(PC_out[12]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_1),
        .O(\current_pc[15]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[15]_i_8 
       (.I0(PC_out[14]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_3),
        .O(\current_pc[15]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_3 
       (.I0(PC_out[19]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_0),
        .O(\current_pc[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_4 
       (.I0(PC_out[18]),
        .I1(result2_carry__2),
        .I2(result2_carry__1),
        .O(\current_pc[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_5 
       (.I0(Q[6]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[19]_i_2_0 ),
        .O(\current_pc[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_6 
       (.I0(Q[5]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[19]_i_2_1 ),
        .O(\current_pc[19]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_7 
       (.I0(PC_out[19]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_0),
        .O(\current_pc[19]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[19]_i_8 
       (.I0(PC_out[18]),
        .I1(result2_carry__2),
        .I2(result2_carry__1),
        .O(\current_pc[19]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_10 
       (.I0(PC_out[20]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_1),
        .O(\current_pc[23]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_3 
       (.I0(PC_out[23]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_4),
        .O(\current_pc[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_4 
       (.I0(PC_out[22]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_3),
        .O(\current_pc[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_5 
       (.I0(PC_out[21]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_2),
        .O(\current_pc[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_6 
       (.I0(PC_out[20]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_1),
        .O(\current_pc[23]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_7 
       (.I0(PC_out[23]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_4),
        .O(\current_pc[23]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_8 
       (.I0(PC_out[22]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_3),
        .O(\current_pc[23]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[23]_i_9 
       (.I0(PC_out[21]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_2),
        .O(\current_pc[23]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_10 
       (.I0(PC_out[24]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_0),
        .O(\current_pc[27]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_3 
       (.I0(PC_out[27]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_3),
        .O(\current_pc[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_4 
       (.I0(PC_out[26]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_2),
        .O(\current_pc[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_5 
       (.I0(PC_out[25]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_1),
        .O(\current_pc[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_6 
       (.I0(PC_out[24]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_0),
        .O(\current_pc[27]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_7 
       (.I0(PC_out[27]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_3),
        .O(\current_pc[27]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_8 
       (.I0(PC_out[26]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_2),
        .O(\current_pc[27]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[27]_i_9 
       (.I0(PC_out[25]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_1),
        .O(\current_pc[27]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_10 
       (.I0(PC_out[31]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_7),
        .O(\current_pc[31]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_11 
       (.I0(PC_out[30]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_6),
        .O(\current_pc[31]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_12 
       (.I0(PC_out[29]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_5),
        .O(\current_pc[31]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_13 
       (.I0(PC_out[28]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_4),
        .O(\current_pc[31]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_7 
       (.I0(PC_out[30]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_6),
        .O(\current_pc[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_8 
       (.I0(PC_out[29]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_5),
        .O(\current_pc[31]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[31]_i_9 
       (.I0(PC_out[28]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_4),
        .O(\current_pc[31]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \current_pc[4]_i_3 
       (.I0(PC_out[2]),
        .O(\current_pc[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_10 
       (.I0(PC_out[4]),
        .I1(result2_carry__2),
        .I2(result2_carry),
        .O(\current_pc[7]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_3 
       (.I0(PC_out[7]),
        .I1(result2_carry__2),
        .I2(result2_carry_2),
        .O(\current_pc[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_4 
       (.I0(PC_out[6]),
        .I1(result2_carry__2),
        .I2(result2_carry_1),
        .O(\current_pc[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_5 
       (.I0(PC_out[5]),
        .I1(result2_carry__2),
        .I2(result2_carry_0),
        .O(\current_pc[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_6 
       (.I0(PC_out[4]),
        .I1(result2_carry__2),
        .I2(result2_carry),
        .O(\current_pc[7]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_7 
       (.I0(PC_out[7]),
        .I1(result2_carry__2),
        .I2(result2_carry_2),
        .O(\current_pc[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_8 
       (.I0(PC_out[6]),
        .I1(result2_carry__2),
        .I2(result2_carry_1),
        .O(\current_pc[7]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \current_pc[7]_i_9 
       (.I0(PC_out[5]),
        .I1(result2_carry__2),
        .I2(result2_carry_0),
        .O(\current_pc[7]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(PC_in),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[10] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [9]),
        .Q(PC_out[10]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[11] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [10]),
        .Q(Q[2]));
  CARRY4 \current_pc_reg[11]_i_2 
       (.CI(\current_pc_reg[7]_i_2_n_0 ),
        .CO({\current_pc_reg[11]_i_2_n_0 ,\current_pc_reg[11]_i_2_n_1 ,\current_pc_reg[11]_i_2_n_2 ,\current_pc_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({ALU_in1[5],\current_pc[11]_i_3_n_0 ,\current_pc[11]_i_4_n_0 ,\current_pc[11]_i_5_n_0 }),
        .O(\current_pc_reg[30]_0 [10:7]),
        .S({\r_reg[1][11] ,\current_pc[11]_i_7_n_0 ,\current_pc[11]_i_8_n_0 ,\current_pc[11]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[12] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [11]),
        .Q(PC_out[12]));
  CARRY4 \current_pc_reg[12]_i_2 
       (.CI(\current_pc_reg[8]_i_2_n_0 ),
        .CO({\current_pc_reg[12]_i_2_n_0 ,\current_pc_reg[12]_i_2_n_1 ,\current_pc_reg[12]_i_2_n_2 ,\current_pc_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[11:8]),
        .S({PC_out[12],Q[2],PC_out[10:9]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[13] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [12]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[14] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [13]),
        .Q(PC_out[14]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[15] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [14]),
        .Q(Q[4]));
  CARRY4 \current_pc_reg[15]_i_2 
       (.CI(\current_pc_reg[11]_i_2_n_0 ),
        .CO({\current_pc_reg[15]_i_2_n_0 ,\current_pc_reg[15]_i_2_n_1 ,\current_pc_reg[15]_i_2_n_2 ,\current_pc_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\current_pc[15]_i_3_n_0 ,\current_pc[15]_i_4_n_0 ,\current_pc[15]_i_5_n_0 ,\current_pc[15]_i_6_n_0 }),
        .O(\current_pc_reg[30]_0 [14:11]),
        .S({\current_pc_reg[15]_1 [1],\current_pc[15]_i_8_n_0 ,\current_pc_reg[15]_1 [0],\current_pc[15]_i_10_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[16] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [15]),
        .Q(Q[5]));
  CARRY4 \current_pc_reg[16]_i_2 
       (.CI(\current_pc_reg[12]_i_2_n_0 ),
        .CO({\current_pc_reg[16]_i_2_n_0 ,\current_pc_reg[16]_i_2_n_1 ,\current_pc_reg[16]_i_2_n_2 ,\current_pc_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[15:12]),
        .S({Q[5:4],PC_out[14],Q[3]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[17] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [16]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[18] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [17]),
        .Q(PC_out[18]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[19] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [18]),
        .Q(PC_out[19]));
  CARRY4 \current_pc_reg[19]_i_2 
       (.CI(\current_pc_reg[15]_i_2_n_0 ),
        .CO({\current_pc_reg[19]_i_2_n_0 ,\current_pc_reg[19]_i_2_n_1 ,\current_pc_reg[19]_i_2_n_2 ,\current_pc_reg[19]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\current_pc[19]_i_3_n_0 ,\current_pc[19]_i_4_n_0 ,\current_pc[19]_i_5_n_0 ,\current_pc[19]_i_6_n_0 }),
        .O(\current_pc_reg[30]_0 [18:15]),
        .S({\current_pc[19]_i_7_n_0 ,\current_pc[19]_i_8_n_0 ,\r_reg[1][19] }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [0]),
        .Q(PC_out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[20] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [19]),
        .Q(PC_out[20]));
  CARRY4 \current_pc_reg[20]_i_2 
       (.CI(\current_pc_reg[16]_i_2_n_0 ),
        .CO({\current_pc_reg[20]_i_2_n_0 ,\current_pc_reg[20]_i_2_n_1 ,\current_pc_reg[20]_i_2_n_2 ,\current_pc_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[19:16]),
        .S({PC_out[20:18],Q[6]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[21] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [20]),
        .Q(PC_out[21]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[22] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [21]),
        .Q(PC_out[22]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[23] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [22]),
        .Q(PC_out[23]));
  CARRY4 \current_pc_reg[23]_i_2 
       (.CI(\current_pc_reg[19]_i_2_n_0 ),
        .CO({\current_pc_reg[23]_i_2_n_0 ,\current_pc_reg[23]_i_2_n_1 ,\current_pc_reg[23]_i_2_n_2 ,\current_pc_reg[23]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\current_pc[23]_i_3_n_0 ,\current_pc[23]_i_4_n_0 ,\current_pc[23]_i_5_n_0 ,\current_pc[23]_i_6_n_0 }),
        .O(\current_pc_reg[30]_0 [22:19]),
        .S({\current_pc[23]_i_7_n_0 ,\current_pc[23]_i_8_n_0 ,\current_pc[23]_i_9_n_0 ,\current_pc[23]_i_10_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \current_pc_reg[24] 
       (.C(CLK),
        .CE(E),
        .D(\current_pc_reg[31]_2 [23]),
        .PRE(p_0_in),
        .Q(PC_out[24]));
  CARRY4 \current_pc_reg[24]_i_2 
       (.CI(\current_pc_reg[20]_i_2_n_0 ),
        .CO({\current_pc_reg[24]_i_2_n_0 ,\current_pc_reg[24]_i_2_n_1 ,\current_pc_reg[24]_i_2_n_2 ,\current_pc_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[23:20]),
        .S(PC_out[24:21]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[25] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [24]),
        .Q(PC_out[25]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[26] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [25]),
        .Q(PC_out[26]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[27] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [26]),
        .Q(PC_out[27]));
  CARRY4 \current_pc_reg[27]_i_2 
       (.CI(\current_pc_reg[23]_i_2_n_0 ),
        .CO({\current_pc_reg[27]_i_2_n_0 ,\current_pc_reg[27]_i_2_n_1 ,\current_pc_reg[27]_i_2_n_2 ,\current_pc_reg[27]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\current_pc[27]_i_3_n_0 ,\current_pc[27]_i_4_n_0 ,\current_pc[27]_i_5_n_0 ,\current_pc[27]_i_6_n_0 }),
        .O(\current_pc_reg[30]_0 [26:23]),
        .S({\current_pc[27]_i_7_n_0 ,\current_pc[27]_i_8_n_0 ,\current_pc[27]_i_9_n_0 ,\current_pc[27]_i_10_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[28] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [27]),
        .Q(PC_out[28]));
  CARRY4 \current_pc_reg[28]_i_2 
       (.CI(\current_pc_reg[24]_i_2_n_0 ),
        .CO({\current_pc_reg[28]_i_2_n_0 ,\current_pc_reg[28]_i_2_n_1 ,\current_pc_reg[28]_i_2_n_2 ,\current_pc_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[27:24]),
        .S(PC_out[28:25]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[29] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [28]),
        .Q(PC_out[29]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [1]),
        .Q(PC_out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[30] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [29]),
        .Q(PC_out[30]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[31] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [30]),
        .Q(PC_out[31]));
  CARRY4 \current_pc_reg[31]_i_4 
       (.CI(\current_pc_reg[28]_i_2_n_0 ),
        .CO({\NLW_current_pc_reg[31]_i_4_CO_UNCONNECTED [3:2],\current_pc_reg[31]_i_4_n_2 ,\current_pc_reg[31]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_current_pc_reg[31]_i_4_O_UNCONNECTED [3],PC_in0[30:28]}),
        .S({1'b0,PC_out[31:29]}));
  CARRY4 \current_pc_reg[31]_i_6 
       (.CI(\current_pc_reg[27]_i_2_n_0 ),
        .CO({\NLW_current_pc_reg[31]_i_6_CO_UNCONNECTED [3],\current_pc_reg[31]_i_6_n_1 ,\current_pc_reg[31]_i_6_n_2 ,\current_pc_reg[31]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\current_pc[31]_i_7_n_0 ,\current_pc[31]_i_8_n_0 ,\current_pc[31]_i_9_n_0 }),
        .O(\current_pc_reg[30]_0 [30:27]),
        .S({\current_pc[31]_i_10_n_0 ,\current_pc[31]_i_11_n_0 ,\current_pc[31]_i_12_n_0 ,\current_pc[31]_i_13_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [2]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[4] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [3]),
        .Q(PC_out[4]));
  CARRY4 \current_pc_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\current_pc_reg[4]_i_2_n_0 ,\current_pc_reg[4]_i_2_n_1 ,\current_pc_reg[4]_i_2_n_2 ,\current_pc_reg[4]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,PC_out[2],1'b0}),
        .O(PC_in0[3:0]),
        .S({PC_out[4],Q[1],\current_pc[4]_i_3_n_0 ,PC_out[1]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[5] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [4]),
        .Q(PC_out[5]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[6] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [5]),
        .Q(PC_out[6]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[7] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [6]),
        .Q(PC_out[7]));
  CARRY4 \current_pc_reg[7]_i_2 
       (.CI(out_OBUF_inst_i_3_n_0),
        .CO({\current_pc_reg[7]_i_2_n_0 ,\current_pc_reg[7]_i_2_n_1 ,\current_pc_reg[7]_i_2_n_2 ,\current_pc_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\current_pc[7]_i_3_n_0 ,\current_pc[7]_i_4_n_0 ,\current_pc[7]_i_5_n_0 ,\current_pc[7]_i_6_n_0 }),
        .O(\current_pc_reg[30]_0 [6:3]),
        .S({\current_pc[7]_i_7_n_0 ,\current_pc[7]_i_8_n_0 ,\current_pc[7]_i_9_n_0 ,\current_pc[7]_i_10_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[8] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [7]),
        .Q(PC_out[8]));
  CARRY4 \current_pc_reg[8]_i_2 
       (.CI(\current_pc_reg[4]_i_2_n_0 ),
        .CO({\current_pc_reg[8]_i_2_n_0 ,\current_pc_reg[8]_i_2_n_1 ,\current_pc_reg[8]_i_2_n_2 ,\current_pc_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(PC_in0[7:4]),
        .S(PC_out[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[9] 
       (.C(CLK),
        .CE(E),
        .CLR(p_0_in),
        .D(\current_pc_reg[31]_2 [8]),
        .Q(PC_out[9]));
  LUT5 #(
    .INIT(32'hFF2F0020)) 
    \d_out[10]_i_1 
       (.I0(\current_pc_reg[30]_0 [1]),
        .I1(\d_out_reg[5] ),
        .I2(\current_pc_reg[30]_0 [19]),
        .I3(\d_out_reg[5]_0 ),
        .I4(d_out0[1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hFF1F0010)) 
    \d_out[20]_i_1 
       (.I0(\current_pc_reg[30]_0 [1]),
        .I1(\d_out_reg[5] ),
        .I2(\current_pc_reg[30]_0 [19]),
        .I3(\d_out_reg[5]_0 ),
        .I4(d_out0[1]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hFF2F0020)) 
    \d_out[5]_i_1 
       (.I0(\current_pc_reg[30]_0 [1]),
        .I1(\d_out_reg[5] ),
        .I2(\current_pc_reg[30]_0 [19]),
        .I3(\d_out_reg[5]_0 ),
        .I4(d_out0[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \instruction[13]_i_1 
       (.I0(PC_out[4]),
        .I1(PC_out[2]),
        .I2(Q[1]),
        .O(\current_pc_reg[4]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \instruction[15]_i_1 
       (.I0(PC_out[2]),
        .I1(PC_out[4]),
        .I2(Q[1]),
        .O(\current_pc_reg[4]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \instruction[16]_i_1 
       (.I0(PC_out[2]),
        .I1(PC_out[4]),
        .O(\current_pc_reg[4]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \instruction[17]_i_2 
       (.I0(PC_out[4]),
        .I1(PC_out[2]),
        .I2(Q[1]),
        .O(\current_pc_reg[4]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \instruction[2]_i_1 
       (.I0(Q[1]),
        .I1(PC_out[2]),
        .O(\current_pc_reg[4]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \instruction[3]_i_1 
       (.I0(Q[1]),
        .I1(PC_out[2]),
        .O(\current_pc_reg[4]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \instruction[4]_i_1 
       (.I0(PC_out[4]),
        .I1(PC_out[2]),
        .I2(Q[1]),
        .O(\current_pc_reg[4]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \instruction[5]_i_1 
       (.I0(Q[1]),
        .I1(PC_out[4]),
        .I2(PC_out[2]),
        .O(\current_pc_reg[4]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \instruction[6]_i_1 
       (.I0(Q[1]),
        .I1(PC_out[2]),
        .I2(PC_out[4]),
        .O(\current_pc_reg[4]_0 [4]));
  LUT2 #(
    .INIT(4'h1)) 
    \instruction[7]_i_1 
       (.I0(PC_out[2]),
        .I1(Q[1]),
        .O(\current_pc_reg[4]_0 [5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \instruction[8]_i_1 
       (.I0(Q[1]),
        .I1(PC_out[2]),
        .I2(PC_out[4]),
        .O(\current_pc_reg[4]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \instruction[9]_i_1 
       (.I0(PC_out[4]),
        .I1(PC_out[2]),
        .I2(Q[1]),
        .O(\current_pc_reg[4]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    out_OBUF_inst_i_1
       (.I0(CO),
        .I1(\d_out_reg[5]_0 ),
        .I2(\ArithmaticLogicUnit/data0 ),
        .O(out_OBUF));
  CARRY4 out_OBUF_inst_i_3
       (.CI(1'b0),
        .CO({out_OBUF_inst_i_3_n_0,out_OBUF_inst_i_3_n_1,out_OBUF_inst_i_3_n_2,out_OBUF_inst_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({out_OBUF_inst_i_4_n_0,ALU_in1[2:0]}),
        .O({\current_pc_reg[30]_0 [2:0],\ArithmaticLogicUnit/data0 }),
        .S(\current_pc_reg[3]_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    out_OBUF_inst_i_4
       (.I0(Q[1]),
        .I1(result2_carry__2),
        .I2(out_OBUF_inst_i_3_0),
        .O(out_OBUF_inst_i_4_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    ram_reg_256_511_7_7_i_1
       (.I0(\current_pc_reg[30]_0 [10]),
        .I1(\current_pc_reg[30]_0 [9]),
        .I2(\d_out_reg[5]_0 ),
        .I3(ram_reg_512_767_7_7),
        .O(\instruction_reg[13] ));
  LUT4 #(
    .INIT(16'h0004)) 
    ram_reg_512_767_7_7_i_1
       (.I0(\current_pc_reg[30]_0 [9]),
        .I1(\current_pc_reg[30]_0 [10]),
        .I2(\d_out_reg[5]_0 ),
        .I3(ram_reg_512_767_7_7),
        .O(\instruction_reg[13]_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry__0_i_10
       (.I0(Q[2]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_i_3),
        .O(ALU_in1[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry__0_i_11
       (.I0(PC_out[10]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[11]_i_2_0 ),
        .O(ALU_in1[4]));
  LUT6 #(
    .INIT(64'h008830B800440347)) 
    result2_carry__0_i_4
       (.I0(Q[4]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_4),
        .I3(PC_out[14]),
        .I4(result2_carry__0_3),
        .I5(result2_carry__0_6),
        .O(\current_pc_reg[15]_0 [2]));
  LUT6 #(
    .INIT(64'h008830B800440347)) 
    result2_carry__0_i_5
       (.I0(Q[3]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_2),
        .I3(PC_out[12]),
        .I4(result2_carry__0_1),
        .I5(result2_carry__0_5),
        .O(\current_pc_reg[15]_0 [1]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__0_i_7
       (.I0(PC_out[9]),
        .I1(result2_carry__2),
        .I2(result2_carry__0_0),
        .I3(PC_out[8]),
        .I4(result2_carry__0),
        .O(\current_pc_reg[15]_0 [0]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__1_i_2
       (.I0(PC_out[23]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_4),
        .I3(PC_out[22]),
        .I4(result2_carry__1_3),
        .O(\current_pc_reg[23]_0 [2]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__1_i_3
       (.I0(PC_out[21]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_2),
        .I3(PC_out[20]),
        .I4(result2_carry__1_1),
        .O(\current_pc_reg[23]_0 [1]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__1_i_4
       (.I0(PC_out[19]),
        .I1(result2_carry__2),
        .I2(result2_carry__1_0),
        .I3(PC_out[18]),
        .I4(result2_carry__1),
        .O(\current_pc_reg[23]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry__1_i_7
       (.I0(Q[6]),
        .I1(result2_carry__2),
        .I2(\current_pc_reg[19]_i_2_0 ),
        .O(ALU_in1[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry__2_i_1
       (.I0(PC_out[31]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_7),
        .O(\current_pc_reg[31]_0 ));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__2_i_2
       (.I0(PC_out[31]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_7),
        .I3(PC_out[30]),
        .I4(result2_carry__2_6),
        .O(\current_pc_reg[31]_1 [3]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__2_i_3
       (.I0(PC_out[29]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_5),
        .I3(PC_out[28]),
        .I4(result2_carry__2_4),
        .O(\current_pc_reg[31]_1 [2]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__2_i_4
       (.I0(PC_out[27]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_3),
        .I3(PC_out[26]),
        .I4(result2_carry__2_2),
        .O(\current_pc_reg[31]_1 [1]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry__2_i_5
       (.I0(PC_out[25]),
        .I1(result2_carry__2),
        .I2(result2_carry__2_1),
        .I3(PC_out[24]),
        .I4(result2_carry__2_0),
        .O(\current_pc_reg[31]_1 [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry_i_11
       (.I0(Q[0]),
        .I1(result2_carry__2),
        .I2(result2_carry_i_2),
        .O(ALU_in1[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry_i_12
       (.I0(PC_out[1]),
        .I1(result2_carry__2),
        .I2(out_OBUF_inst_i_7),
        .O(ALU_in1[1]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry_i_3
       (.I0(PC_out[7]),
        .I1(result2_carry__2),
        .I2(result2_carry_2),
        .I3(PC_out[6]),
        .I4(result2_carry_1),
        .O(S[1]));
  LUT5 #(
    .INIT(32'h00440347)) 
    result2_carry_i_4
       (.I0(PC_out[5]),
        .I1(result2_carry__2),
        .I2(result2_carry_0),
        .I3(PC_out[4]),
        .I4(result2_carry),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry_i_7
       (.I0(Q[1]),
        .I1(result2_carry__2),
        .I2(out_OBUF_inst_i_3_0),
        .O(ALU_in1[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    result2_carry_i_9
       (.I0(PC_out[2]),
        .I1(result2_carry__2),
        .I2(result2_carry_i_5),
        .O(ALU_in1[2]));
endmodule

(* NotValidForBitStream *)
module Processor
   (clk,
    rstn,
    out);
  input clk;
  input rstn;
  output out;

  wire [17:0]ALU_in1;
  wire BC_out;
  wire [7:1]DM_out;
  wire DataMemory_n_10;
  wire DataMemory_n_11;
  wire DataMemory_n_12;
  wire DataMemory_n_13;
  wire DataMemory_n_14;
  wire DataMemory_n_15;
  wire DataMemory_n_2;
  wire DataMemory_n_9;
  wire [17:15]IM_out;
  wire InstructionMemory_n_0;
  wire InstructionMemory_n_1;
  wire InstructionMemory_n_10;
  wire InstructionMemory_n_111;
  wire InstructionMemory_n_112;
  wire InstructionMemory_n_113;
  wire InstructionMemory_n_114;
  wire InstructionMemory_n_115;
  wire InstructionMemory_n_116;
  wire InstructionMemory_n_117;
  wire InstructionMemory_n_118;
  wire InstructionMemory_n_119;
  wire InstructionMemory_n_120;
  wire InstructionMemory_n_121;
  wire InstructionMemory_n_123;
  wire InstructionMemory_n_124;
  wire InstructionMemory_n_125;
  wire InstructionMemory_n_126;
  wire InstructionMemory_n_127;
  wire InstructionMemory_n_14;
  wire InstructionMemory_n_15;
  wire InstructionMemory_n_16;
  wire InstructionMemory_n_2;
  wire InstructionMemory_n_3;
  wire InstructionMemory_n_4;
  wire InstructionMemory_n_49;
  wire InstructionMemory_n_5;
  wire InstructionMemory_n_6;
  wire InstructionMemory_n_60;
  wire InstructionMemory_n_61;
  wire InstructionMemory_n_62;
  wire InstructionMemory_n_63;
  wire InstructionMemory_n_64;
  wire InstructionMemory_n_65;
  wire InstructionMemory_n_66;
  wire InstructionMemory_n_67;
  wire InstructionMemory_n_68;
  wire InstructionMemory_n_69;
  wire InstructionMemory_n_7;
  wire InstructionMemory_n_70;
  wire InstructionMemory_n_71;
  wire InstructionMemory_n_72;
  wire InstructionMemory_n_73;
  wire InstructionMemory_n_74;
  wire InstructionMemory_n_75;
  wire InstructionMemory_n_76;
  wire InstructionMemory_n_77;
  wire InstructionMemory_n_78;
  wire InstructionMemory_n_79;
  wire InstructionMemory_n_8;
  wire InstructionMemory_n_9;
  wire MainController_n_0;
  wire MainController_n_5;
  wire MainController_n_6;
  wire [31:1]PC_in;
  wire [31:1]PC_in0;
  wire [17:0]PC_out;
  wire PC_we;
  wire ProgramCounter_n_0;
  wire ProgramCounter_n_1;
  wire ProgramCounter_n_100;
  wire ProgramCounter_n_101;
  wire ProgramCounter_n_102;
  wire ProgramCounter_n_103;
  wire ProgramCounter_n_104;
  wire ProgramCounter_n_105;
  wire ProgramCounter_n_106;
  wire ProgramCounter_n_2;
  wire ProgramCounter_n_34;
  wire ProgramCounter_n_35;
  wire ProgramCounter_n_82;
  wire ProgramCounter_n_83;
  wire ProgramCounter_n_84;
  wire ProgramCounter_n_85;
  wire ProgramCounter_n_86;
  wire ProgramCounter_n_87;
  wire ProgramCounter_n_88;
  wire ProgramCounter_n_89;
  wire ProgramCounter_n_90;
  wire ProgramCounter_n_91;
  wire ProgramCounter_n_92;
  wire ProgramCounter_n_93;
  wire ProgramCounter_n_94;
  wire ProgramCounter_n_95;
  wire ProgramCounter_n_96;
  wire ProgramCounter_n_97;
  wire ProgramCounter_n_98;
  wire ProgramCounter_n_99;
  wire [31:0]RF_rd_data_in;
  wire RegisterFile_n_0;
  wire RegisterFile_n_1;
  wire RegisterFile_n_10;
  wire RegisterFile_n_11;
  wire RegisterFile_n_12;
  wire RegisterFile_n_13;
  wire RegisterFile_n_14;
  wire RegisterFile_n_15;
  wire RegisterFile_n_16;
  wire RegisterFile_n_17;
  wire RegisterFile_n_18;
  wire RegisterFile_n_19;
  wire RegisterFile_n_2;
  wire RegisterFile_n_20;
  wire RegisterFile_n_21;
  wire RegisterFile_n_22;
  wire RegisterFile_n_23;
  wire RegisterFile_n_24;
  wire RegisterFile_n_25;
  wire RegisterFile_n_26;
  wire RegisterFile_n_27;
  wire RegisterFile_n_28;
  wire RegisterFile_n_29;
  wire RegisterFile_n_3;
  wire RegisterFile_n_30;
  wire RegisterFile_n_31;
  wire RegisterFile_n_32;
  wire RegisterFile_n_33;
  wire RegisterFile_n_34;
  wire RegisterFile_n_35;
  wire RegisterFile_n_36;
  wire RegisterFile_n_37;
  wire RegisterFile_n_38;
  wire RegisterFile_n_39;
  wire RegisterFile_n_4;
  wire RegisterFile_n_40;
  wire RegisterFile_n_41;
  wire RegisterFile_n_42;
  wire RegisterFile_n_5;
  wire RegisterFile_n_6;
  wire RegisterFile_n_7;
  wire RegisterFile_n_8;
  wire RegisterFile_n_9;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:7]d_out0;
  wire [31:1]data0;
  wire data3;
  wire out;
  wire out_OBUF;
  wire p_0_in;
  wire r;
  wire [11:2]result;
  wire rstn;
  wire rstn_IBUF;
  wire [0:2]state;

  ALU ArithmaticLogicUnit
       (.CO(data3),
        .DI({InstructionMemory_n_68,InstructionMemory_n_69}),
        .S({ProgramCounter_n_95,ProgramCounter_n_96,InstructionMemory_n_66,InstructionMemory_n_67}),
        .\current_pc_reg[0] (ProgramCounter_n_82),
        .\current_pc_reg[0]_0 ({ProgramCounter_n_103,ProgramCounter_n_104,ProgramCounter_n_105,ProgramCounter_n_106}),
        .result2_carry__1_0({InstructionMemory_n_63,InstructionMemory_n_64,InstructionMemory_n_65}),
        .result2_carry__1_1({ProgramCounter_n_97,ProgramCounter_n_98,InstructionMemory_n_62,ProgramCounter_n_99}),
        .result2_carry__2_0(InstructionMemory_n_119),
        .result2_carry__2_1({ProgramCounter_n_100,ProgramCounter_n_101,ProgramCounter_n_102,InstructionMemory_n_116}));
  BranComp BranchComparator
       (.BC_out(BC_out),
        .S({RegisterFile_n_0,RegisterFile_n_1,RegisterFile_n_2,RegisterFile_n_3}),
        .\current_pc[31]_i_5 (InstructionMemory_n_79),
        .result0_carry__1_0({RegisterFile_n_16,RegisterFile_n_17,RegisterFile_n_18,RegisterFile_n_19}),
        .result_reg_0({RegisterFile_n_32,RegisterFile_n_33,RegisterFile_n_34}));
  DMem DataMemory
       (.D({InstructionMemory_n_0,InstructionMemory_n_1,InstructionMemory_n_2,ProgramCounter_n_0,InstructionMemory_n_3,ProgramCounter_n_1,InstructionMemory_n_4,ProgramCounter_n_2,InstructionMemory_n_5,InstructionMemory_n_6}),
        .E(InstructionMemory_n_70),
        .O(data0[20]),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .d_out0({d_out0[31],d_out0[7]}),
        .\d_out[31]_i_7_0 (InstructionMemory_n_9),
        .\d_out[31]_i_7_1 (InstructionMemory_n_15),
        .\d_out[31]_i_7_2 (InstructionMemory_n_16),
        .\d_out[31]_i_7_3 (InstructionMemory_n_14),
        .\d_out[7]_i_2_0 (InstructionMemory_n_112),
        .\d_out[7]_i_2_1 (ProgramCounter_n_34),
        .\d_out[7]_i_2_2 (ProgramCounter_n_35),
        .\d_out[7]_i_2_3 (InstructionMemory_n_113),
        .\d_out_reg[10]_0 (DataMemory_n_15),
        .\d_out_reg[16]_0 (DataMemory_n_14),
        .\d_out_reg[20]_0 (DataMemory_n_13),
        .\d_out_reg[21]_0 (DataMemory_n_12),
        .\d_out_reg[22]_0 (DataMemory_n_11),
        .\d_out_reg[26]_0 (DataMemory_n_10),
        .\d_out_reg[28]_0 (DataMemory_n_9),
        .\d_out_reg[31]_0 (DataMemory_n_2),
        .\d_out_reg[4]_0 (InstructionMemory_n_8),
        .\d_out_reg[7]_0 ({DM_out[7:3],DM_out[1]}),
        .\r_reg[1][31] (InstructionMemory_n_71),
        .\r_reg[1][31]_0 (InstructionMemory_n_49),
        .result(result));
  IMem InstructionMemory
       (.ALU_in1({ALU_in1[17],ALU_in1[11:10],ALU_in1[3:0]}),
        .BC_out(BC_out),
        .D({InstructionMemory_n_0,InstructionMemory_n_1,InstructionMemory_n_2,InstructionMemory_n_3,InstructionMemory_n_4,InstructionMemory_n_5,InstructionMemory_n_6}),
        .DI({InstructionMemory_n_68,InstructionMemory_n_69}),
        .E(InstructionMemory_n_70),
        .\FSM_sequential_state_reg[1] (InstructionMemory_n_72),
        .PC_in0(PC_in0),
        .Q(IM_out),
        .S({InstructionMemory_n_66,InstructionMemory_n_67}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\current_pc_reg[11] (InstructionMemory_n_127),
        .\current_pc_reg[11]_i_2 (RegisterFile_n_15),
        .\current_pc_reg[15] ({InstructionMemory_n_63,InstructionMemory_n_64,InstructionMemory_n_65}),
        .\current_pc_reg[15]_0 ({InstructionMemory_n_114,InstructionMemory_n_115}),
        .\current_pc_reg[16] (InstructionMemory_n_116),
        .\current_pc_reg[16]_0 (InstructionMemory_n_119),
        .\current_pc_reg[17] ({InstructionMemory_n_117,InstructionMemory_n_118}),
        .\current_pc_reg[19]_i_2 ({PC_out[17:15],PC_out[13],PC_out[11],PC_out[3],PC_out[0]}),
        .\current_pc_reg[19]_i_2_0 (RegisterFile_n_25),
        .\current_pc_reg[31] (PC_in),
        .\current_pc_reg[3] ({InstructionMemory_n_74,InstructionMemory_n_75,InstructionMemory_n_76,InstructionMemory_n_77}),
        .d_out0({d_out0[31],d_out0[7]}),
        .\d_out_reg[31] (MainController_n_0),
        .data0(data0),
        .\instruction_reg[13]_0 (InstructionMemory_n_8),
        .\instruction_reg[13]_1 (InstructionMemory_n_9),
        .\instruction_reg[13]_2 (InstructionMemory_n_14),
        .\instruction_reg[13]_3 (InstructionMemory_n_15),
        .\instruction_reg[13]_4 (InstructionMemory_n_16),
        .\instruction_reg[13]_5 (RF_rd_data_in),
        .\instruction_reg[13]_6 (InstructionMemory_n_71),
        .\instruction_reg[13]_7 (InstructionMemory_n_79),
        .\instruction_reg[13]_8 (InstructionMemory_n_112),
        .\instruction_reg[13]_9 (InstructionMemory_n_113),
        .\instruction_reg[17]_0 ({ProgramCounter_n_83,ProgramCounter_n_84,ProgramCounter_n_85,ProgramCounter_n_86,ProgramCounter_n_87,ProgramCounter_n_88,ProgramCounter_n_89,ProgramCounter_n_90,ProgramCounter_n_91,ProgramCounter_n_92,ProgramCounter_n_93,ProgramCounter_n_94}),
        .\instruction_reg[2]_0 (InstructionMemory_n_7),
        .\instruction_reg[2]_1 (InstructionMemory_n_49),
        .\instruction_reg[2]_2 (result),
        .\instruction_reg[2]_3 (InstructionMemory_n_60),
        .\instruction_reg[2]_4 (InstructionMemory_n_61),
        .\instruction_reg[2]_5 (MainController_n_6),
        .\instruction_reg[4]_0 (InstructionMemory_n_73),
        .\instruction_reg[4]_1 (InstructionMemory_n_111),
        .\instruction_reg[6]_0 (InstructionMemory_n_10),
        .\instruction_reg[6]_1 (InstructionMemory_n_78),
        .\instruction_reg[7]_0 (InstructionMemory_n_62),
        .\instruction_reg[9]_0 (InstructionMemory_n_120),
        .\instruction_reg[9]_1 (InstructionMemory_n_121),
        .\instruction_reg[9]_2 (r),
        .\instruction_reg[9]_3 (InstructionMemory_n_123),
        .\instruction_reg[9]_4 (InstructionMemory_n_124),
        .\instruction_reg[9]_5 (InstructionMemory_n_125),
        .\instruction_reg[9]_6 (InstructionMemory_n_126),
        .out_OBUF(out_OBUF),
        .out_OBUF_inst_i_3(RegisterFile_n_4),
        .out_OBUF_inst_i_3_0(RegisterFile_n_7),
        .\r_reg[1][10] (DataMemory_n_15),
        .\r_reg[1][16] (DataMemory_n_14),
        .\r_reg[1][20] (DataMemory_n_13),
        .\r_reg[1][21] (DataMemory_n_12),
        .\r_reg[1][22] (DataMemory_n_11),
        .\r_reg[1][26] (DataMemory_n_10),
        .\r_reg[1][28] (DataMemory_n_9),
        .\r_reg[1][31] (DataMemory_n_2),
        .\r_reg[1][7] ({DM_out[7:3],DM_out[1]}),
        .\r_reg[4][31] (MainController_n_5),
        .ram_reg_512_767_7_7_i_1({state[0],state[1],state[2]}),
        .result2_carry__0(RegisterFile_n_21),
        .result2_carry__0_0(RegisterFile_n_23),
        .result2_carry__1(RegisterFile_n_24));
  ControlUnit MainController
       (.CLK(clk_IBUF_BUFG),
        .E(PC_we),
        .\FSM_sequential_state_reg[0]_0 (InstructionMemory_n_73),
        .\FSM_sequential_state_reg[1]_0 (MainController_n_0),
        .\FSM_sequential_state_reg[1]_1 (MainController_n_5),
        .\FSM_sequential_state_reg[1]_2 (InstructionMemory_n_72),
        .\FSM_sequential_state_reg[2]_0 (MainController_n_6),
        .Q({state[0],state[1],state[2]}),
        .\d_out_reg[31] (InstructionMemory_n_49),
        .p_0_in(p_0_in));
  PCnt ProgramCounter
       (.ALU_in1({ALU_in1[17],ALU_in1[11:10],ALU_in1[3:0]}),
        .CLK(clk_IBUF_BUFG),
        .CO(data3),
        .D({ProgramCounter_n_0,ProgramCounter_n_1,ProgramCounter_n_2}),
        .E(PC_we),
        .PC_in0(PC_in0),
        .Q({PC_out[17:15],PC_out[13],PC_out[11],PC_out[3],PC_out[0]}),
        .S({ProgramCounter_n_95,ProgramCounter_n_96}),
        .\current_pc_reg[0]_0 (InstructionMemory_n_111),
        .\current_pc_reg[11]_i_2_0 (RegisterFile_n_14),
        .\current_pc_reg[15]_0 ({ProgramCounter_n_97,ProgramCounter_n_98,ProgramCounter_n_99}),
        .\current_pc_reg[15]_1 ({InstructionMemory_n_114,InstructionMemory_n_115}),
        .\current_pc_reg[19]_i_2_0 (RegisterFile_n_25),
        .\current_pc_reg[19]_i_2_1 (RegisterFile_n_24),
        .\current_pc_reg[23]_0 ({ProgramCounter_n_100,ProgramCounter_n_101,ProgramCounter_n_102}),
        .\current_pc_reg[30]_0 (data0),
        .\current_pc_reg[31]_0 (ProgramCounter_n_82),
        .\current_pc_reg[31]_1 ({ProgramCounter_n_103,ProgramCounter_n_104,ProgramCounter_n_105,ProgramCounter_n_106}),
        .\current_pc_reg[31]_2 (PC_in),
        .\current_pc_reg[3]_0 ({InstructionMemory_n_74,InstructionMemory_n_75,InstructionMemory_n_76,InstructionMemory_n_77}),
        .\current_pc_reg[4]_0 ({ProgramCounter_n_83,ProgramCounter_n_84,ProgramCounter_n_85,ProgramCounter_n_86,ProgramCounter_n_87,ProgramCounter_n_88,ProgramCounter_n_89,ProgramCounter_n_90,ProgramCounter_n_91,ProgramCounter_n_92,ProgramCounter_n_93,ProgramCounter_n_94}),
        .d_out0({d_out0[31],d_out0[7]}),
        .\d_out_reg[5] (InstructionMemory_n_7),
        .\d_out_reg[5]_0 (InstructionMemory_n_8),
        .\instruction_reg[13] (ProgramCounter_n_34),
        .\instruction_reg[13]_0 (ProgramCounter_n_35),
        .out_OBUF(out_OBUF),
        .out_OBUF_inst_i_3_0(RegisterFile_n_7),
        .out_OBUF_inst_i_7(RegisterFile_n_5),
        .p_0_in(p_0_in),
        .\r_reg[1][11] (InstructionMemory_n_127),
        .\r_reg[1][19] ({InstructionMemory_n_117,InstructionMemory_n_118}),
        .ram_reg_512_767_7_7(InstructionMemory_n_10),
        .result2_carry(RegisterFile_n_8),
        .result2_carry_0(RegisterFile_n_9),
        .result2_carry_1(RegisterFile_n_10),
        .result2_carry_2(RegisterFile_n_11),
        .result2_carry__0(RegisterFile_n_12),
        .result2_carry__0_0(RegisterFile_n_13),
        .result2_carry__0_1(RegisterFile_n_20),
        .result2_carry__0_2(RegisterFile_n_21),
        .result2_carry__0_3(RegisterFile_n_22),
        .result2_carry__0_4(RegisterFile_n_23),
        .result2_carry__0_5(InstructionMemory_n_61),
        .result2_carry__0_6(InstructionMemory_n_60),
        .result2_carry__0_i_3(RegisterFile_n_15),
        .result2_carry__1(RegisterFile_n_26),
        .result2_carry__1_0(RegisterFile_n_27),
        .result2_carry__1_1(RegisterFile_n_28),
        .result2_carry__1_2(RegisterFile_n_29),
        .result2_carry__1_3(RegisterFile_n_30),
        .result2_carry__1_4(RegisterFile_n_31),
        .result2_carry__2(InstructionMemory_n_78),
        .result2_carry__2_0(RegisterFile_n_35),
        .result2_carry__2_1(RegisterFile_n_36),
        .result2_carry__2_2(RegisterFile_n_37),
        .result2_carry__2_3(RegisterFile_n_38),
        .result2_carry__2_4(RegisterFile_n_39),
        .result2_carry__2_5(RegisterFile_n_40),
        .result2_carry__2_6(RegisterFile_n_42),
        .result2_carry__2_7(RegisterFile_n_41),
        .result2_carry_i_2(RegisterFile_n_4),
        .result2_carry_i_5(RegisterFile_n_6));
  RegFile RegisterFile
       (.CLK(clk_IBUF_BUFG),
        .D(RF_rd_data_in),
        .E(r),
        .Q(IM_out),
        .S({RegisterFile_n_0,RegisterFile_n_1,RegisterFile_n_2,RegisterFile_n_3}),
        .SR(p_0_in),
        .\instruction_reg[17] (RegisterFile_n_4),
        .\instruction_reg[17]_0 (RegisterFile_n_5),
        .\instruction_reg[17]_1 (RegisterFile_n_6),
        .\instruction_reg[17]_10 (RegisterFile_n_15),
        .\instruction_reg[17]_11 ({RegisterFile_n_16,RegisterFile_n_17,RegisterFile_n_18,RegisterFile_n_19}),
        .\instruction_reg[17]_12 (RegisterFile_n_20),
        .\instruction_reg[17]_13 (RegisterFile_n_21),
        .\instruction_reg[17]_14 (RegisterFile_n_22),
        .\instruction_reg[17]_15 (RegisterFile_n_23),
        .\instruction_reg[17]_16 (RegisterFile_n_24),
        .\instruction_reg[17]_17 (RegisterFile_n_25),
        .\instruction_reg[17]_18 (RegisterFile_n_26),
        .\instruction_reg[17]_19 (RegisterFile_n_27),
        .\instruction_reg[17]_2 (RegisterFile_n_7),
        .\instruction_reg[17]_20 (RegisterFile_n_28),
        .\instruction_reg[17]_21 (RegisterFile_n_29),
        .\instruction_reg[17]_22 (RegisterFile_n_30),
        .\instruction_reg[17]_23 (RegisterFile_n_31),
        .\instruction_reg[17]_24 ({RegisterFile_n_32,RegisterFile_n_33,RegisterFile_n_34}),
        .\instruction_reg[17]_25 (RegisterFile_n_35),
        .\instruction_reg[17]_26 (RegisterFile_n_36),
        .\instruction_reg[17]_27 (RegisterFile_n_37),
        .\instruction_reg[17]_28 (RegisterFile_n_38),
        .\instruction_reg[17]_29 (RegisterFile_n_39),
        .\instruction_reg[17]_3 (RegisterFile_n_8),
        .\instruction_reg[17]_30 (RegisterFile_n_40),
        .\instruction_reg[17]_31 (RegisterFile_n_41),
        .\instruction_reg[17]_32 (RegisterFile_n_42),
        .\instruction_reg[17]_4 (RegisterFile_n_9),
        .\instruction_reg[17]_5 (RegisterFile_n_10),
        .\instruction_reg[17]_6 (RegisterFile_n_11),
        .\instruction_reg[17]_7 (RegisterFile_n_12),
        .\instruction_reg[17]_8 (RegisterFile_n_13),
        .\instruction_reg[17]_9 (RegisterFile_n_14),
        .\r_reg[2][31]_0 (InstructionMemory_n_121),
        .\r_reg[3][31]_0 (InstructionMemory_n_120),
        .\r_reg[4][31]_0 (InstructionMemory_n_126),
        .\r_reg[5][31]_0 (InstructionMemory_n_125),
        .\r_reg[6][31]_0 (InstructionMemory_n_124),
        .\r_reg[7][31]_0 (InstructionMemory_n_123),
        .rstn_IBUF(rstn_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF out_OBUF_inst
       (.I(out_OBUF),
        .O(out));
  IBUF rstn_IBUF_inst
       (.I(rstn),
        .O(rstn_IBUF));
endmodule

module RegFile
   (S,
    \instruction_reg[17] ,
    \instruction_reg[17]_0 ,
    \instruction_reg[17]_1 ,
    \instruction_reg[17]_2 ,
    \instruction_reg[17]_3 ,
    \instruction_reg[17]_4 ,
    \instruction_reg[17]_5 ,
    \instruction_reg[17]_6 ,
    \instruction_reg[17]_7 ,
    \instruction_reg[17]_8 ,
    \instruction_reg[17]_9 ,
    \instruction_reg[17]_10 ,
    \instruction_reg[17]_11 ,
    \instruction_reg[17]_12 ,
    \instruction_reg[17]_13 ,
    \instruction_reg[17]_14 ,
    \instruction_reg[17]_15 ,
    \instruction_reg[17]_16 ,
    \instruction_reg[17]_17 ,
    \instruction_reg[17]_18 ,
    \instruction_reg[17]_19 ,
    \instruction_reg[17]_20 ,
    \instruction_reg[17]_21 ,
    \instruction_reg[17]_22 ,
    \instruction_reg[17]_23 ,
    \instruction_reg[17]_24 ,
    \instruction_reg[17]_25 ,
    \instruction_reg[17]_26 ,
    \instruction_reg[17]_27 ,
    \instruction_reg[17]_28 ,
    \instruction_reg[17]_29 ,
    \instruction_reg[17]_30 ,
    \instruction_reg[17]_31 ,
    \instruction_reg[17]_32 ,
    SR,
    Q,
    rstn_IBUF,
    E,
    D,
    CLK,
    \r_reg[2][31]_0 ,
    \r_reg[3][31]_0 ,
    \r_reg[4][31]_0 ,
    \r_reg[5][31]_0 ,
    \r_reg[6][31]_0 ,
    \r_reg[7][31]_0 );
  output [3:0]S;
  output \instruction_reg[17] ;
  output \instruction_reg[17]_0 ;
  output \instruction_reg[17]_1 ;
  output \instruction_reg[17]_2 ;
  output \instruction_reg[17]_3 ;
  output \instruction_reg[17]_4 ;
  output \instruction_reg[17]_5 ;
  output \instruction_reg[17]_6 ;
  output \instruction_reg[17]_7 ;
  output \instruction_reg[17]_8 ;
  output \instruction_reg[17]_9 ;
  output \instruction_reg[17]_10 ;
  output [3:0]\instruction_reg[17]_11 ;
  output \instruction_reg[17]_12 ;
  output \instruction_reg[17]_13 ;
  output \instruction_reg[17]_14 ;
  output \instruction_reg[17]_15 ;
  output \instruction_reg[17]_16 ;
  output \instruction_reg[17]_17 ;
  output \instruction_reg[17]_18 ;
  output \instruction_reg[17]_19 ;
  output \instruction_reg[17]_20 ;
  output \instruction_reg[17]_21 ;
  output \instruction_reg[17]_22 ;
  output \instruction_reg[17]_23 ;
  output [2:0]\instruction_reg[17]_24 ;
  output \instruction_reg[17]_25 ;
  output \instruction_reg[17]_26 ;
  output \instruction_reg[17]_27 ;
  output \instruction_reg[17]_28 ;
  output \instruction_reg[17]_29 ;
  output \instruction_reg[17]_30 ;
  output \instruction_reg[17]_31 ;
  output \instruction_reg[17]_32 ;
  output [0:0]SR;
  input [2:0]Q;
  input rstn_IBUF;
  input [0:0]E;
  input [31:0]D;
  input CLK;
  input [0:0]\r_reg[2][31]_0 ;
  input [0:0]\r_reg[3][31]_0 ;
  input [0:0]\r_reg[4][31]_0 ;
  input [0:0]\r_reg[5][31]_0 ;
  input [0:0]\r_reg[6][31]_0 ;
  input [0:0]\r_reg[7][31]_0 ;

  wire CLK;
  wire [31:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire [3:0]S;
  wire [0:0]SR;
  wire \instruction_reg[17] ;
  wire \instruction_reg[17]_0 ;
  wire \instruction_reg[17]_1 ;
  wire \instruction_reg[17]_10 ;
  wire [3:0]\instruction_reg[17]_11 ;
  wire \instruction_reg[17]_12 ;
  wire \instruction_reg[17]_13 ;
  wire \instruction_reg[17]_14 ;
  wire \instruction_reg[17]_15 ;
  wire \instruction_reg[17]_16 ;
  wire \instruction_reg[17]_17 ;
  wire \instruction_reg[17]_18 ;
  wire \instruction_reg[17]_19 ;
  wire \instruction_reg[17]_2 ;
  wire \instruction_reg[17]_20 ;
  wire \instruction_reg[17]_21 ;
  wire \instruction_reg[17]_22 ;
  wire \instruction_reg[17]_23 ;
  wire [2:0]\instruction_reg[17]_24 ;
  wire \instruction_reg[17]_25 ;
  wire \instruction_reg[17]_26 ;
  wire \instruction_reg[17]_27 ;
  wire \instruction_reg[17]_28 ;
  wire \instruction_reg[17]_29 ;
  wire \instruction_reg[17]_3 ;
  wire \instruction_reg[17]_30 ;
  wire \instruction_reg[17]_31 ;
  wire \instruction_reg[17]_32 ;
  wire \instruction_reg[17]_4 ;
  wire \instruction_reg[17]_5 ;
  wire \instruction_reg[17]_6 ;
  wire \instruction_reg[17]_7 ;
  wire \instruction_reg[17]_8 ;
  wire \instruction_reg[17]_9 ;
  wire [31:0]\r_reg[1]_0 ;
  wire [0:0]\r_reg[2][31]_0 ;
  wire [31:0]\r_reg[2]_1 ;
  wire [0:0]\r_reg[3][31]_0 ;
  wire [31:0]\r_reg[3]_2 ;
  wire [0:0]\r_reg[4][31]_0 ;
  wire [31:0]\r_reg[4]_3 ;
  wire [0:0]\r_reg[5][31]_0 ;
  wire [31:0]\r_reg[5]_4 ;
  wire [0:0]\r_reg[6][31]_0 ;
  wire [31:0]\r_reg[6]_5 ;
  wire [0:0]\r_reg[7][31]_0 ;
  wire [31:0]\r_reg[7]_6 ;
  wire result0_carry__0_i_17_n_0;
  wire result0_carry__0_i_18_n_0;
  wire result0_carry__0_i_19_n_0;
  wire result0_carry__0_i_20_n_0;
  wire result0_carry__0_i_21_n_0;
  wire result0_carry__0_i_22_n_0;
  wire result0_carry__0_i_23_n_0;
  wire result0_carry__0_i_24_n_0;
  wire result0_carry__0_i_25_n_0;
  wire result0_carry__0_i_26_n_0;
  wire result0_carry__0_i_27_n_0;
  wire result0_carry__0_i_28_n_0;
  wire result0_carry__0_i_29_n_0;
  wire result0_carry__0_i_30_n_0;
  wire result0_carry__0_i_31_n_0;
  wire result0_carry__0_i_32_n_0;
  wire result0_carry__0_i_33_n_0;
  wire result0_carry__0_i_34_n_0;
  wire result0_carry__0_i_35_n_0;
  wire result0_carry__0_i_36_n_0;
  wire result0_carry__0_i_37_n_0;
  wire result0_carry__0_i_38_n_0;
  wire result0_carry__0_i_39_n_0;
  wire result0_carry__0_i_40_n_0;
  wire result0_carry__1_i_12_n_0;
  wire result0_carry__1_i_13_n_0;
  wire result0_carry__1_i_14_n_0;
  wire result0_carry__1_i_15_n_0;
  wire result0_carry__1_i_16_n_0;
  wire result0_carry__1_i_17_n_0;
  wire result0_carry__1_i_18_n_0;
  wire result0_carry__1_i_19_n_0;
  wire result0_carry__1_i_20_n_0;
  wire result0_carry__1_i_21_n_0;
  wire result0_carry__1_i_22_n_0;
  wire result0_carry__1_i_23_n_0;
  wire result0_carry__1_i_24_n_0;
  wire result0_carry__1_i_25_n_0;
  wire result0_carry__1_i_26_n_0;
  wire result0_carry__1_i_27_n_0;
  wire result0_carry_i_17_n_0;
  wire result0_carry_i_18_n_0;
  wire result0_carry_i_19_n_0;
  wire result0_carry_i_20_n_0;
  wire result0_carry_i_21_n_0;
  wire result0_carry_i_22_n_0;
  wire result0_carry_i_23_n_0;
  wire result0_carry_i_24_n_0;
  wire result0_carry_i_25_n_0;
  wire result0_carry_i_26_n_0;
  wire result0_carry_i_27_n_0;
  wire result0_carry_i_28_n_0;
  wire result0_carry_i_29_n_0;
  wire result0_carry_i_30_n_0;
  wire result0_carry_i_31_n_0;
  wire result0_carry_i_32_n_0;
  wire result0_carry_i_33_n_0;
  wire result0_carry_i_34_n_0;
  wire result0_carry_i_35_n_0;
  wire result0_carry_i_36_n_0;
  wire result0_carry_i_37_n_0;
  wire result0_carry_i_38_n_0;
  wire result0_carry_i_39_n_0;
  wire result0_carry_i_40_n_0;
  wire rstn_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    \current_pc[31]_i_3 
       (.I0(rstn_IBUF),
        .O(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\r_reg[1]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][10] 
       (.C(CLK),
        .CE(E),
        .D(D[10]),
        .Q(\r_reg[1]_0 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][11] 
       (.C(CLK),
        .CE(E),
        .D(D[11]),
        .Q(\r_reg[1]_0 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][12] 
       (.C(CLK),
        .CE(E),
        .D(D[12]),
        .Q(\r_reg[1]_0 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][13] 
       (.C(CLK),
        .CE(E),
        .D(D[13]),
        .Q(\r_reg[1]_0 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][14] 
       (.C(CLK),
        .CE(E),
        .D(D[14]),
        .Q(\r_reg[1]_0 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][15] 
       (.C(CLK),
        .CE(E),
        .D(D[15]),
        .Q(\r_reg[1]_0 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][16] 
       (.C(CLK),
        .CE(E),
        .D(D[16]),
        .Q(\r_reg[1]_0 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][17] 
       (.C(CLK),
        .CE(E),
        .D(D[17]),
        .Q(\r_reg[1]_0 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][18] 
       (.C(CLK),
        .CE(E),
        .D(D[18]),
        .Q(\r_reg[1]_0 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][19] 
       (.C(CLK),
        .CE(E),
        .D(D[19]),
        .Q(\r_reg[1]_0 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\r_reg[1]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][20] 
       (.C(CLK),
        .CE(E),
        .D(D[20]),
        .Q(\r_reg[1]_0 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][21] 
       (.C(CLK),
        .CE(E),
        .D(D[21]),
        .Q(\r_reg[1]_0 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][22] 
       (.C(CLK),
        .CE(E),
        .D(D[22]),
        .Q(\r_reg[1]_0 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][23] 
       (.C(CLK),
        .CE(E),
        .D(D[23]),
        .Q(\r_reg[1]_0 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][24] 
       (.C(CLK),
        .CE(E),
        .D(D[24]),
        .Q(\r_reg[1]_0 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][25] 
       (.C(CLK),
        .CE(E),
        .D(D[25]),
        .Q(\r_reg[1]_0 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][26] 
       (.C(CLK),
        .CE(E),
        .D(D[26]),
        .Q(\r_reg[1]_0 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][27] 
       (.C(CLK),
        .CE(E),
        .D(D[27]),
        .Q(\r_reg[1]_0 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][28] 
       (.C(CLK),
        .CE(E),
        .D(D[28]),
        .Q(\r_reg[1]_0 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][29] 
       (.C(CLK),
        .CE(E),
        .D(D[29]),
        .Q(\r_reg[1]_0 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\r_reg[1]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][30] 
       (.C(CLK),
        .CE(E),
        .D(D[30]),
        .Q(\r_reg[1]_0 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][31] 
       (.C(CLK),
        .CE(E),
        .D(D[31]),
        .Q(\r_reg[1]_0 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\r_reg[1]_0 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][4] 
       (.C(CLK),
        .CE(E),
        .D(D[4]),
        .Q(\r_reg[1]_0 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][5] 
       (.C(CLK),
        .CE(E),
        .D(D[5]),
        .Q(\r_reg[1]_0 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][6] 
       (.C(CLK),
        .CE(E),
        .D(D[6]),
        .Q(\r_reg[1]_0 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][7] 
       (.C(CLK),
        .CE(E),
        .D(D[7]),
        .Q(\r_reg[1]_0 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][8] 
       (.C(CLK),
        .CE(E),
        .D(D[8]),
        .Q(\r_reg[1]_0 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[1][9] 
       (.C(CLK),
        .CE(E),
        .D(D[9]),
        .Q(\r_reg[1]_0 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][0] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[2]_1 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][10] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[2]_1 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][11] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[2]_1 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][12] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[2]_1 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][13] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[2]_1 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][14] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[2]_1 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][15] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[2]_1 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][16] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[2]_1 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][17] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[2]_1 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][18] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[2]_1 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][19] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[2]_1 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][1] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[2]_1 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][20] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[2]_1 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][21] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[2]_1 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][22] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[2]_1 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][23] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[2]_1 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][24] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[2]_1 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][25] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[2]_1 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][26] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[2]_1 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][27] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[2]_1 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][28] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[2]_1 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][29] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[2]_1 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][2] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[2]_1 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][30] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[2]_1 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][31] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[2]_1 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][3] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[2]_1 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][4] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[2]_1 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][5] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[2]_1 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][6] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[2]_1 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][7] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[2]_1 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][8] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[2]_1 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[2][9] 
       (.C(CLK),
        .CE(\r_reg[2][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[2]_1 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][0] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[3]_2 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][10] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[3]_2 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][11] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[3]_2 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][12] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[3]_2 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][13] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[3]_2 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][14] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[3]_2 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][15] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[3]_2 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][16] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[3]_2 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][17] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[3]_2 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][18] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[3]_2 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][19] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[3]_2 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][1] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[3]_2 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][20] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[3]_2 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][21] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[3]_2 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][22] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[3]_2 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][23] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[3]_2 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][24] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[3]_2 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][25] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[3]_2 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][26] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[3]_2 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][27] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[3]_2 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][28] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[3]_2 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][29] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[3]_2 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][2] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[3]_2 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][30] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[3]_2 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][31] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[3]_2 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][3] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[3]_2 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][4] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[3]_2 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][5] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[3]_2 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][6] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[3]_2 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][7] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[3]_2 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][8] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[3]_2 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[3][9] 
       (.C(CLK),
        .CE(\r_reg[3][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[3]_2 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][0] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[4]_3 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][10] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[4]_3 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][11] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[4]_3 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][12] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[4]_3 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][13] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[4]_3 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][14] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[4]_3 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][15] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[4]_3 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][16] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[4]_3 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][17] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[4]_3 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][18] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[4]_3 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][19] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[4]_3 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][1] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[4]_3 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][20] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[4]_3 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][21] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[4]_3 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][22] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[4]_3 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][23] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[4]_3 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][24] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[4]_3 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][25] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[4]_3 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][26] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[4]_3 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][27] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[4]_3 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][28] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[4]_3 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][29] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[4]_3 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][2] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[4]_3 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][30] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[4]_3 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][31] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[4]_3 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][3] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[4]_3 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][4] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[4]_3 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][5] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[4]_3 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][6] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[4]_3 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][7] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[4]_3 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][8] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[4]_3 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[4][9] 
       (.C(CLK),
        .CE(\r_reg[4][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[4]_3 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][0] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[5]_4 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][10] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[5]_4 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][11] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[5]_4 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][12] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[5]_4 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][13] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[5]_4 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][14] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[5]_4 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][15] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[5]_4 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][16] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[5]_4 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][17] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[5]_4 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][18] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[5]_4 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][19] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[5]_4 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][1] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[5]_4 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][20] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[5]_4 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][21] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[5]_4 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][22] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[5]_4 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][23] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[5]_4 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][24] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[5]_4 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][25] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[5]_4 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][26] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[5]_4 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][27] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[5]_4 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][28] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[5]_4 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][29] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[5]_4 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][2] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[5]_4 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][30] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[5]_4 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][31] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[5]_4 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][3] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[5]_4 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][4] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[5]_4 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][5] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[5]_4 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][6] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[5]_4 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][7] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[5]_4 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][8] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[5]_4 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[5][9] 
       (.C(CLK),
        .CE(\r_reg[5][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[5]_4 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][0] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[6]_5 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][10] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[6]_5 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][11] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[6]_5 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][12] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[6]_5 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][13] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[6]_5 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][14] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[6]_5 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][15] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[6]_5 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][16] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[6]_5 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][17] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[6]_5 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][18] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[6]_5 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][19] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[6]_5 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][1] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[6]_5 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][20] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[6]_5 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][21] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[6]_5 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][22] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[6]_5 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][23] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[6]_5 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][24] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[6]_5 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][25] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[6]_5 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][26] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[6]_5 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][27] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[6]_5 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][28] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[6]_5 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][29] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[6]_5 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][2] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[6]_5 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][30] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[6]_5 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][31] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[6]_5 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][3] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[6]_5 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][4] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[6]_5 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][5] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[6]_5 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][6] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[6]_5 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][7] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[6]_5 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][8] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[6]_5 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[6][9] 
       (.C(CLK),
        .CE(\r_reg[6][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[6]_5 [9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][0] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[0]),
        .Q(\r_reg[7]_6 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][10] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[10]),
        .Q(\r_reg[7]_6 [10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][11] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[11]),
        .Q(\r_reg[7]_6 [11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][12] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[12]),
        .Q(\r_reg[7]_6 [12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][13] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[13]),
        .Q(\r_reg[7]_6 [13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][14] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[14]),
        .Q(\r_reg[7]_6 [14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][15] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[15]),
        .Q(\r_reg[7]_6 [15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][16] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[16]),
        .Q(\r_reg[7]_6 [16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][17] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[17]),
        .Q(\r_reg[7]_6 [17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][18] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[18]),
        .Q(\r_reg[7]_6 [18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][19] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[19]),
        .Q(\r_reg[7]_6 [19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][1] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[1]),
        .Q(\r_reg[7]_6 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][20] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[20]),
        .Q(\r_reg[7]_6 [20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][21] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[21]),
        .Q(\r_reg[7]_6 [21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][22] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[22]),
        .Q(\r_reg[7]_6 [22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][23] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[23]),
        .Q(\r_reg[7]_6 [23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][24] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[24]),
        .Q(\r_reg[7]_6 [24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][25] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[25]),
        .Q(\r_reg[7]_6 [25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][26] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[26]),
        .Q(\r_reg[7]_6 [26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][27] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[27]),
        .Q(\r_reg[7]_6 [27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][28] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[28]),
        .Q(\r_reg[7]_6 [28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][29] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[29]),
        .Q(\r_reg[7]_6 [29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][2] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[2]),
        .Q(\r_reg[7]_6 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][30] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[30]),
        .Q(\r_reg[7]_6 [30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][31] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[31]),
        .Q(\r_reg[7]_6 [31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][3] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[3]),
        .Q(\r_reg[7]_6 [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][4] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[4]),
        .Q(\r_reg[7]_6 [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][5] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[5]),
        .Q(\r_reg[7]_6 [5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][6] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[6]),
        .Q(\r_reg[7]_6 [6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][7] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[7]),
        .Q(\r_reg[7]_6 [7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][8] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[8]),
        .Q(\r_reg[7]_6 [8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \r_reg[7][9] 
       (.C(CLK),
        .CE(\r_reg[7][31]_0 ),
        .D(D[9]),
        .Q(\r_reg[7]_6 [9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__0_i_1
       (.I0(\instruction_reg[17]_21 ),
        .I1(\instruction_reg[17]_22 ),
        .I2(\instruction_reg[17]_23 ),
        .O(\instruction_reg[17]_11 [3]));
  MUXF7 result0_carry__0_i_10
       (.I0(result0_carry__0_i_27_n_0),
        .I1(result0_carry__0_i_28_n_0),
        .O(\instruction_reg[17]_20 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_11
       (.I0(result0_carry__0_i_29_n_0),
        .I1(result0_carry__0_i_30_n_0),
        .O(\instruction_reg[17]_15 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_12
       (.I0(result0_carry__0_i_31_n_0),
        .I1(result0_carry__0_i_32_n_0),
        .O(\instruction_reg[17]_16 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_13
       (.I0(result0_carry__0_i_33_n_0),
        .I1(result0_carry__0_i_34_n_0),
        .O(\instruction_reg[17]_17 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_14
       (.I0(result0_carry__0_i_35_n_0),
        .I1(result0_carry__0_i_36_n_0),
        .O(\instruction_reg[17]_12 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_15
       (.I0(result0_carry__0_i_37_n_0),
        .I1(result0_carry__0_i_38_n_0),
        .O(\instruction_reg[17]_13 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_16
       (.I0(result0_carry__0_i_39_n_0),
        .I1(result0_carry__0_i_40_n_0),
        .O(\instruction_reg[17]_14 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_17
       (.I0(\r_reg[3]_2 [21]),
        .I1(\r_reg[2]_1 [21]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [21]),
        .O(result0_carry__0_i_17_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_18
       (.I0(\r_reg[7]_6 [21]),
        .I1(\r_reg[6]_5 [21]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [21]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [21]),
        .O(result0_carry__0_i_18_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_19
       (.I0(\r_reg[3]_2 [22]),
        .I1(\r_reg[2]_1 [22]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [22]),
        .O(result0_carry__0_i_19_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__0_i_2
       (.I0(\instruction_reg[17]_18 ),
        .I1(\instruction_reg[17]_19 ),
        .I2(\instruction_reg[17]_20 ),
        .O(\instruction_reg[17]_11 [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_20
       (.I0(\r_reg[7]_6 [22]),
        .I1(\r_reg[6]_5 [22]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [22]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [22]),
        .O(result0_carry__0_i_20_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_21
       (.I0(\r_reg[3]_2 [23]),
        .I1(\r_reg[2]_1 [23]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [23]),
        .O(result0_carry__0_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_22
       (.I0(\r_reg[7]_6 [23]),
        .I1(\r_reg[6]_5 [23]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [23]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [23]),
        .O(result0_carry__0_i_22_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_23
       (.I0(\r_reg[3]_2 [18]),
        .I1(\r_reg[2]_1 [18]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [18]),
        .O(result0_carry__0_i_23_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_24
       (.I0(\r_reg[7]_6 [18]),
        .I1(\r_reg[6]_5 [18]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [18]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [18]),
        .O(result0_carry__0_i_24_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_25
       (.I0(\r_reg[3]_2 [19]),
        .I1(\r_reg[2]_1 [19]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [19]),
        .O(result0_carry__0_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_26
       (.I0(\r_reg[7]_6 [19]),
        .I1(\r_reg[6]_5 [19]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [19]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [19]),
        .O(result0_carry__0_i_26_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_27
       (.I0(\r_reg[3]_2 [20]),
        .I1(\r_reg[2]_1 [20]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [20]),
        .O(result0_carry__0_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_28
       (.I0(\r_reg[7]_6 [20]),
        .I1(\r_reg[6]_5 [20]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [20]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [20]),
        .O(result0_carry__0_i_28_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_29
       (.I0(\r_reg[3]_2 [15]),
        .I1(\r_reg[2]_1 [15]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [15]),
        .O(result0_carry__0_i_29_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__0_i_3
       (.I0(\instruction_reg[17]_15 ),
        .I1(\instruction_reg[17]_16 ),
        .I2(\instruction_reg[17]_17 ),
        .O(\instruction_reg[17]_11 [1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_30
       (.I0(\r_reg[7]_6 [15]),
        .I1(\r_reg[6]_5 [15]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [15]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [15]),
        .O(result0_carry__0_i_30_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_31
       (.I0(\r_reg[3]_2 [16]),
        .I1(\r_reg[2]_1 [16]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [16]),
        .O(result0_carry__0_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_32
       (.I0(\r_reg[7]_6 [16]),
        .I1(\r_reg[6]_5 [16]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [16]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [16]),
        .O(result0_carry__0_i_32_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_33
       (.I0(\r_reg[3]_2 [17]),
        .I1(\r_reg[2]_1 [17]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [17]),
        .O(result0_carry__0_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_34
       (.I0(\r_reg[7]_6 [17]),
        .I1(\r_reg[6]_5 [17]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [17]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [17]),
        .O(result0_carry__0_i_34_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_35
       (.I0(\r_reg[3]_2 [12]),
        .I1(\r_reg[2]_1 [12]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [12]),
        .O(result0_carry__0_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_36
       (.I0(\r_reg[7]_6 [12]),
        .I1(\r_reg[6]_5 [12]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [12]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [12]),
        .O(result0_carry__0_i_36_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_37
       (.I0(\r_reg[3]_2 [13]),
        .I1(\r_reg[2]_1 [13]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [13]),
        .O(result0_carry__0_i_37_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_38
       (.I0(\r_reg[7]_6 [13]),
        .I1(\r_reg[6]_5 [13]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [13]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [13]),
        .O(result0_carry__0_i_38_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__0_i_39
       (.I0(\r_reg[3]_2 [14]),
        .I1(\r_reg[2]_1 [14]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [14]),
        .O(result0_carry__0_i_39_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__0_i_4
       (.I0(\instruction_reg[17]_12 ),
        .I1(\instruction_reg[17]_13 ),
        .I2(\instruction_reg[17]_14 ),
        .O(\instruction_reg[17]_11 [0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__0_i_40
       (.I0(\r_reg[7]_6 [14]),
        .I1(\r_reg[6]_5 [14]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [14]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [14]),
        .O(result0_carry__0_i_40_n_0));
  MUXF7 result0_carry__0_i_5
       (.I0(result0_carry__0_i_17_n_0),
        .I1(result0_carry__0_i_18_n_0),
        .O(\instruction_reg[17]_21 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_6
       (.I0(result0_carry__0_i_19_n_0),
        .I1(result0_carry__0_i_20_n_0),
        .O(\instruction_reg[17]_22 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_7
       (.I0(result0_carry__0_i_21_n_0),
        .I1(result0_carry__0_i_22_n_0),
        .O(\instruction_reg[17]_23 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_8
       (.I0(result0_carry__0_i_23_n_0),
        .I1(result0_carry__0_i_24_n_0),
        .O(\instruction_reg[17]_18 ),
        .S(Q[2]));
  MUXF7 result0_carry__0_i_9
       (.I0(result0_carry__0_i_25_n_0),
        .I1(result0_carry__0_i_26_n_0),
        .O(\instruction_reg[17]_19 ),
        .S(Q[2]));
  LUT2 #(
    .INIT(4'h1)) 
    result0_carry__1_i_1
       (.I0(\instruction_reg[17]_31 ),
        .I1(\instruction_reg[17]_32 ),
        .O(\instruction_reg[17]_24 [2]));
  MUXF7 result0_carry__1_i_10
       (.I0(result0_carry__1_i_24_n_0),
        .I1(result0_carry__1_i_25_n_0),
        .O(\instruction_reg[17]_26 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_11
       (.I0(result0_carry__1_i_26_n_0),
        .I1(result0_carry__1_i_27_n_0),
        .O(\instruction_reg[17]_27 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_12
       (.I0(\r_reg[3]_2 [31]),
        .I1(\r_reg[2]_1 [31]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [31]),
        .O(result0_carry__1_i_12_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_13
       (.I0(\r_reg[7]_6 [31]),
        .I1(\r_reg[6]_5 [31]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [31]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [31]),
        .O(result0_carry__1_i_13_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_14
       (.I0(\r_reg[3]_2 [30]),
        .I1(\r_reg[2]_1 [30]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [30]),
        .O(result0_carry__1_i_14_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_15
       (.I0(\r_reg[7]_6 [30]),
        .I1(\r_reg[6]_5 [30]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [30]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [30]),
        .O(result0_carry__1_i_15_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_16
       (.I0(\r_reg[3]_2 [27]),
        .I1(\r_reg[2]_1 [27]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [27]),
        .O(result0_carry__1_i_16_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_17
       (.I0(\r_reg[7]_6 [27]),
        .I1(\r_reg[6]_5 [27]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [27]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [27]),
        .O(result0_carry__1_i_17_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_18
       (.I0(\r_reg[3]_2 [28]),
        .I1(\r_reg[2]_1 [28]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [28]),
        .O(result0_carry__1_i_18_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_19
       (.I0(\r_reg[7]_6 [28]),
        .I1(\r_reg[6]_5 [28]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [28]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [28]),
        .O(result0_carry__1_i_19_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__1_i_2
       (.I0(\instruction_reg[17]_28 ),
        .I1(\instruction_reg[17]_29 ),
        .I2(\instruction_reg[17]_30 ),
        .O(\instruction_reg[17]_24 [1]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_20
       (.I0(\r_reg[3]_2 [29]),
        .I1(\r_reg[2]_1 [29]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [29]),
        .O(result0_carry__1_i_20_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_21
       (.I0(\r_reg[7]_6 [29]),
        .I1(\r_reg[6]_5 [29]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [29]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [29]),
        .O(result0_carry__1_i_21_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_22
       (.I0(\r_reg[3]_2 [24]),
        .I1(\r_reg[2]_1 [24]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [24]),
        .O(result0_carry__1_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_23
       (.I0(\r_reg[7]_6 [24]),
        .I1(\r_reg[6]_5 [24]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [24]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [24]),
        .O(result0_carry__1_i_23_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_24
       (.I0(\r_reg[3]_2 [25]),
        .I1(\r_reg[2]_1 [25]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [25]),
        .O(result0_carry__1_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_25
       (.I0(\r_reg[7]_6 [25]),
        .I1(\r_reg[6]_5 [25]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [25]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [25]),
        .O(result0_carry__1_i_25_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry__1_i_26
       (.I0(\r_reg[3]_2 [26]),
        .I1(\r_reg[2]_1 [26]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [26]),
        .O(result0_carry__1_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry__1_i_27
       (.I0(\r_reg[7]_6 [26]),
        .I1(\r_reg[6]_5 [26]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [26]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [26]),
        .O(result0_carry__1_i_27_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry__1_i_3
       (.I0(\instruction_reg[17]_25 ),
        .I1(\instruction_reg[17]_26 ),
        .I2(\instruction_reg[17]_27 ),
        .O(\instruction_reg[17]_24 [0]));
  MUXF7 result0_carry__1_i_4
       (.I0(result0_carry__1_i_12_n_0),
        .I1(result0_carry__1_i_13_n_0),
        .O(\instruction_reg[17]_31 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_5
       (.I0(result0_carry__1_i_14_n_0),
        .I1(result0_carry__1_i_15_n_0),
        .O(\instruction_reg[17]_32 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_6
       (.I0(result0_carry__1_i_16_n_0),
        .I1(result0_carry__1_i_17_n_0),
        .O(\instruction_reg[17]_28 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_7
       (.I0(result0_carry__1_i_18_n_0),
        .I1(result0_carry__1_i_19_n_0),
        .O(\instruction_reg[17]_29 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_8
       (.I0(result0_carry__1_i_20_n_0),
        .I1(result0_carry__1_i_21_n_0),
        .O(\instruction_reg[17]_30 ),
        .S(Q[2]));
  MUXF7 result0_carry__1_i_9
       (.I0(result0_carry__1_i_22_n_0),
        .I1(result0_carry__1_i_23_n_0),
        .O(\instruction_reg[17]_25 ),
        .S(Q[2]));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry_i_1
       (.I0(\instruction_reg[17]_8 ),
        .I1(\instruction_reg[17]_9 ),
        .I2(\instruction_reg[17]_10 ),
        .O(S[3]));
  MUXF7 result0_carry_i_10
       (.I0(result0_carry_i_27_n_0),
        .I1(result0_carry_i_28_n_0),
        .O(\instruction_reg[17]_7 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_11
       (.I0(result0_carry_i_29_n_0),
        .I1(result0_carry_i_30_n_0),
        .O(\instruction_reg[17]_2 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_12
       (.I0(result0_carry_i_31_n_0),
        .I1(result0_carry_i_32_n_0),
        .O(\instruction_reg[17]_3 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_13
       (.I0(result0_carry_i_33_n_0),
        .I1(result0_carry_i_34_n_0),
        .O(\instruction_reg[17]_4 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_14
       (.I0(result0_carry_i_35_n_0),
        .I1(result0_carry_i_36_n_0),
        .O(\instruction_reg[17] ),
        .S(Q[2]));
  MUXF7 result0_carry_i_15
       (.I0(result0_carry_i_37_n_0),
        .I1(result0_carry_i_38_n_0),
        .O(\instruction_reg[17]_0 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_16
       (.I0(result0_carry_i_39_n_0),
        .I1(result0_carry_i_40_n_0),
        .O(\instruction_reg[17]_1 ),
        .S(Q[2]));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_17
       (.I0(\r_reg[3]_2 [9]),
        .I1(\r_reg[2]_1 [9]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [9]),
        .O(result0_carry_i_17_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_18
       (.I0(\r_reg[7]_6 [9]),
        .I1(\r_reg[6]_5 [9]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [9]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [9]),
        .O(result0_carry_i_18_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_19
       (.I0(\r_reg[3]_2 [10]),
        .I1(\r_reg[2]_1 [10]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [10]),
        .O(result0_carry_i_19_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry_i_2
       (.I0(\instruction_reg[17]_5 ),
        .I1(\instruction_reg[17]_6 ),
        .I2(\instruction_reg[17]_7 ),
        .O(S[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_20
       (.I0(\r_reg[7]_6 [10]),
        .I1(\r_reg[6]_5 [10]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [10]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [10]),
        .O(result0_carry_i_20_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_21
       (.I0(\r_reg[3]_2 [11]),
        .I1(\r_reg[2]_1 [11]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [11]),
        .O(result0_carry_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_22
       (.I0(\r_reg[7]_6 [11]),
        .I1(\r_reg[6]_5 [11]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [11]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [11]),
        .O(result0_carry_i_22_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_23
       (.I0(\r_reg[3]_2 [6]),
        .I1(\r_reg[2]_1 [6]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [6]),
        .O(result0_carry_i_23_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_24
       (.I0(\r_reg[7]_6 [6]),
        .I1(\r_reg[6]_5 [6]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [6]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [6]),
        .O(result0_carry_i_24_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_25
       (.I0(\r_reg[3]_2 [7]),
        .I1(\r_reg[2]_1 [7]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [7]),
        .O(result0_carry_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_26
       (.I0(\r_reg[7]_6 [7]),
        .I1(\r_reg[6]_5 [7]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [7]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [7]),
        .O(result0_carry_i_26_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_27
       (.I0(\r_reg[3]_2 [8]),
        .I1(\r_reg[2]_1 [8]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [8]),
        .O(result0_carry_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_28
       (.I0(\r_reg[7]_6 [8]),
        .I1(\r_reg[6]_5 [8]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [8]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [8]),
        .O(result0_carry_i_28_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_29
       (.I0(\r_reg[3]_2 [3]),
        .I1(\r_reg[2]_1 [3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [3]),
        .O(result0_carry_i_29_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry_i_3
       (.I0(\instruction_reg[17]_2 ),
        .I1(\instruction_reg[17]_3 ),
        .I2(\instruction_reg[17]_4 ),
        .O(S[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_30
       (.I0(\r_reg[7]_6 [3]),
        .I1(\r_reg[6]_5 [3]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [3]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [3]),
        .O(result0_carry_i_30_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_31
       (.I0(\r_reg[3]_2 [4]),
        .I1(\r_reg[2]_1 [4]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [4]),
        .O(result0_carry_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_32
       (.I0(\r_reg[7]_6 [4]),
        .I1(\r_reg[6]_5 [4]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [4]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [4]),
        .O(result0_carry_i_32_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_33
       (.I0(\r_reg[3]_2 [5]),
        .I1(\r_reg[2]_1 [5]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [5]),
        .O(result0_carry_i_33_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_34
       (.I0(\r_reg[7]_6 [5]),
        .I1(\r_reg[6]_5 [5]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [5]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [5]),
        .O(result0_carry_i_34_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_35
       (.I0(\r_reg[3]_2 [0]),
        .I1(\r_reg[2]_1 [0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [0]),
        .O(result0_carry_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_36
       (.I0(\r_reg[7]_6 [0]),
        .I1(\r_reg[6]_5 [0]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [0]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [0]),
        .O(result0_carry_i_36_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_37
       (.I0(\r_reg[3]_2 [1]),
        .I1(\r_reg[2]_1 [1]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [1]),
        .O(result0_carry_i_37_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_38
       (.I0(\r_reg[7]_6 [1]),
        .I1(\r_reg[6]_5 [1]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [1]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [1]),
        .O(result0_carry_i_38_n_0));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    result0_carry_i_39
       (.I0(\r_reg[3]_2 [2]),
        .I1(\r_reg[2]_1 [2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\r_reg[1]_0 [2]),
        .O(result0_carry_i_39_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    result0_carry_i_4
       (.I0(\instruction_reg[17] ),
        .I1(\instruction_reg[17]_0 ),
        .I2(\instruction_reg[17]_1 ),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    result0_carry_i_40
       (.I0(\r_reg[7]_6 [2]),
        .I1(\r_reg[6]_5 [2]),
        .I2(Q[1]),
        .I3(\r_reg[5]_4 [2]),
        .I4(Q[0]),
        .I5(\r_reg[4]_3 [2]),
        .O(result0_carry_i_40_n_0));
  MUXF7 result0_carry_i_5
       (.I0(result0_carry_i_17_n_0),
        .I1(result0_carry_i_18_n_0),
        .O(\instruction_reg[17]_8 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_6
       (.I0(result0_carry_i_19_n_0),
        .I1(result0_carry_i_20_n_0),
        .O(\instruction_reg[17]_9 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_7
       (.I0(result0_carry_i_21_n_0),
        .I1(result0_carry_i_22_n_0),
        .O(\instruction_reg[17]_10 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_8
       (.I0(result0_carry_i_23_n_0),
        .I1(result0_carry_i_24_n_0),
        .O(\instruction_reg[17]_5 ),
        .S(Q[2]));
  MUXF7 result0_carry_i_9
       (.I0(result0_carry_i_25_n_0),
        .I1(result0_carry_i_26_n_0),
        .O(\instruction_reg[17]_6 ),
        .S(Q[2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
