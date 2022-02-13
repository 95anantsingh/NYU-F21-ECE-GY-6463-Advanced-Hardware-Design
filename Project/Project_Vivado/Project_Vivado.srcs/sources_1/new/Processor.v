`timescale 1ns / 1ps
`include "defines.vh"


// Processor Top Module
module Processor(
    input wire clk,
    input wire rstn,
    output wire out
    );
    
    
    // Program Counter
    wire PC_we;
    wire [31:0] PC_in;
    wire [31:0] PC_out;
    PCnt ProgramCounter(.clk(clk),.rstn(rstn),.we(PC_we),.data_in(PC_in),.data_out(PC_out));
    
    
    // Instruction Memory
    wire IM_rd;                        
    wire [31:0] IM_addr_in;   
    wire [31:0] IM_out;   
    IMem InstructionMemory(.clk(clk), .rd(IM_rd), .addr_in(IM_addr_in), .instr_out(IM_out));
    assign IM_addr_in = PC_out;
    
    
    // Register File
    wire RF_we;               
    wire [4:0] RF_rd;          
    wire [4:0] RF_rs1;         
    wire [4:0] RF_rs2;         
    wire [31:0] RF_rd_data_in; 
    wire [31:0] RF_rs1_data;
    wire [31:0] RF_rs2_data;
    RegFile RegisterFile(.clk(clk), .rstn(rstn), .we(RF_we), .rd(RF_rd), .rs1(RF_rs1), .rs2(RF_rs2),          
                         .rd_data_in(RF_rd_data_in), .rs1_data(RF_rs1_data), .rs2_data(RF_rs2_data));  
    assign RF_rd = IM_out[11:7];
    assign RF_rs1 = IM_out[19:15];
    assign RF_rs2 = IM_out[24:20];
    
    
    // Immediate Extender
    wire [2:0] IE_opc;   
    wire [31:0] IE_instr;
    wire [31:0] IE_out; 
    ImmExt ImmediateExtender(.opcode(IE_opc),.instr(IE_instr),.ext_imm(IE_out));
    assign IE_instr = IM_out;
    
    
    // Branch Comparator
    wire [2:0] BC_opc;
    wire [31:0] BC_in1;
    wire [31:0] BC_in2;
    wire BC_out;
    BranComp BranchComparator(.bc_op(BC_opc), .data_in1(BC_in1), .data_in2(BC_in2), .bc_out(BC_out));
    assign BC_in1 = RF_rs1_data;
    assign BC_in2 = RF_rs2_data;
    
    
    // ALU
    wire [31:0] ALU_in1;
    wire [31:0] ALU_in2;
    wire [3:0]  ALU_opc;
    wire [31:0] ALU_out;
    ALU ArithmaticLogicUnit(.operand1(ALU_in1), .operand2(ALU_in2), .operation(ALU_opc) ,.ALUresult(ALU_out));  
    
    
    // Data Memory              
    wire DM_rd;               
    wire [3:0] DM_we;         
    wire [31:0] DM_addr_in;   
    wire [31:0] DM_in;   
    wire [31:0] DM_out;   
    DMem DataMemory(.clk(clk), .rd(DM_rd), .we(DM_we), .addr_in(DM_addr_in), .data_in(DM_in), 
                    .data_out(DM_out)); 
    assign DM_addr_in = ALU_out;
    assign DM_in = RF_rs2_data;  
    
    
    // Data Extender
    wire [2:0] DE_opc;
    wire [31:0] DE_in; 
    wire [31:0] DE_out; 
    DataExt DataExtender(.opcode(DE_opc), .data(DE_in), .dout(DE_out));
    assign DE_in = DM_out;
    
   
    // Control Unit
    wire MCU_pc_mux;
    wire MCU_rfile_mux;
    wire MCU_alu_mux1; 
    wire MCU_alu_mux2; 
    wire [1:0] MCU_op_mux;
    ControlUnit MainController(.clk(clk), .rstn(rstn), .instruction(IM_out),.pc_we(PC_we), .imem_rd(IM_rd), .rf_we(RF_we),
                               .imm_op(IE_opc), .data_op(DE_opc), .bc_out(BC_out), .bc_op(BC_opc), .alu_op(ALU_opc),
                               .dmem_we(DM_we), .dmem_rd(DM_rd), .pc_mux(MCU_pc_mux), .rfile_mux(MCU_rfile_mux),
                               .alu_mux1(MCU_alu_mux1), .alu_mux2(MCU_alu_mux2), .op_mux(MCU_op_mux));
    
    
    // Final Output of a Cycle
    wire [31:0] F_out;
    
    assign PC_in = (MCU_pc_mux) ? ALU_out : PC_out + 32'd4 ;

    assign RF_rd_data_in = (MCU_rfile_mux) ? PC_out + 32'd4 : F_out;

    assign ALU_in1 = (MCU_alu_mux1) ? PC_out : RF_rs1_data;

    assign ALU_in2 = (MCU_alu_mux2) ? RF_rs2_data : IE_out;

    assign F_out = (MCU_op_mux == 2'b1) ? DE_out:  
                   (MCU_op_mux == 2'd2) ? IE_out: 
                   ALU_out;
    
    // Output Mandate to Synthesize               
    assign out = ALU_out[0];

endmodule


// Processor TCL Simulation Commands

/*

restart
add_force {/Processor/clk} -radix hex {1 0ns} {0 500ps} -repeat_every 1000ps
add_force {/Processor/rstn} -radix hex {0 0ns}
run 1ns
add_force {/Processor/rstn} -radix hex {1 0ns}
run 100ns

*/