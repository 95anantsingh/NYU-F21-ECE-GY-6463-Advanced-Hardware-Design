`timescale 1ns / 1ps


module ControlUnit_TB(

    );
    //Inputs
    reg clk=0;
    reg rstn=0;
    reg [31:0] instruction;
    reg bc_out=0;
    
    //Outputs
    wire pc_we;
    wire imem_rd;
    wire rf_we;
    wire [2:0] imm_op;
    wire [2:0] data_op;
    wire [2:0] bc_op;
    wire [3:0] alu_op;
    wire [3:0] dmem_we;
    wire dmem_rd;
    wire pc_mux;
    wire rfile_mux;
    wire alu_mux1;
    wire alu_mux2;
    wire [1:0] op_mux;
    
    ControlUnit dut(
    .clk(clk), .rstn(rstn), .instruction(instruction), .bc_out(bc_out), 
    .pc_we(pc_we), .imem_rd(imem_rd), .rf_we(rf_we), .imm_op(imm_op), .data_op(data_op), 
    .bc_op(bc_op), .alu_op(alu_op), .dmem_we(dmem_we), .dmem_rd(dmem_rd), .pc_mux(pc_mux),
    .rfile_mux(rfile_mux), .alu_mux1(alu_mux1), .alu_mux2(alu_mux2), .op_mux(op_mux)
    );
    
    initial begin: CLK_GEN
        #5;
        rstn <=1;
        forever begin
            clk <=0;
            #5;
            clk <=1;
            #5;
        end
    end
    
    initial begin 
    
        instruction <= 32'h000012b7;        //LUI x5, 0x00001                                                    
        #10;
        if(op_mux !=2'd2) $fatal("Expected output mux select line not received for LUI");
        if(imm_op !=3'd4) $fatal("Expected immediate extension opcode not received for LUI");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for LUI");
        #20;
        instruction <= 32'h00110297;        //auipc x5, 0x00110
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for AUIPC");
        if(imm_op !=3'd4) $fatal("Expected immediate extension opcode not received for AUIPC");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for AUIPC");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for AUIPC");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for AUIPC");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for AUIPC");
        #20;
        instruction <= 32'h0100016f;        //jal x2, 0(x8)
        #10;
        if(imm_op !=3'd0) $fatal("Expected immediate extension opcode not received for JAL");
        if(pc_mux !=1) $fatal("Expected PC update select line not received for JAL");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for JAL");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for JAL");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for JAL");
        if(rfile_mux != 1) $fatal("Expected RF destination select line not received for JAL");
        #20;
        instruction <= 32'h00008067;        //jalr x0, 0(x1)
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for JALR");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for JALR");
        if(pc_mux !=1) $fatal("Expected PC update select line not received for JALR");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for JALR");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for JALR");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for JALR");
        if(rfile_mux != 1) $fatal("Expected RF destination select line not received for JALR");
        #20;
        
        //imm[12|10:5] rs2 rs1 000 imm[4:1|11] 1100011
        
        //Branch instructions
        instruction <= 32'b00000000000100010000011101100011;        //beq
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd0) $fatal ("Expected branch comparator opcode not received for BEQ");
        #20; 
        instruction <= 32'b00000000000100010001011101100011;        //bne
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd1) $fatal ("Expected branch comparator opcode not received for BNE");
        #20; 
        instruction <= 32'b00000000000100010100011101100011;        //blt
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd4) $fatal ("Expected branch comparator opcode not received for BLT");
        #20; 
        instruction <= 32'b00000000000100010101011101100011;        //bge
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd5) $fatal ("Expected branch comparator opcode not received for BEQ");
        #20; 
        instruction <= 32'b00000000000100010110011101100011;        //bltu
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd6) $fatal ("Expected branch comparator opcode not received for BEQ");
        #20; 
        instruction <= 32'b00000000000100010111011101100011;        //bgeu
        #10;
        if(imm_op !=3'd2) $fatal("Expected immediate extension opcode not received for Branch");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Branch");
        if(alu_mux1 != 1) $fatal("Expected ALU input data1 not received for Branch");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Branch");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Branch");
        if(bc_op != 3'd7) $fatal ("Expected branch comparator opcode not received for BEQ");
        #20; 
        
         //Load instructions
        instruction <= 32'h02830283;        //lb x5, 40(x6)
        #10;
        if(op_mux !=2'd1) $fatal("Expected output mux select line not received for Load");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for Load");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Load");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Load");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Load");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Load");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Load");
        if(data_op != 3'd0) $fatal("Expected data extension select line not received for LB");
        #30;
        instruction <= 32'h00031283;        //lh x5, 0(x6) 
        #10;
        if(op_mux !=2'd1) $fatal("Expected output mux select line not received for Load");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for Load");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Load");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Load");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Load");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Load");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Load");
        if(data_op != 3'd1) $fatal("Expected data extension select line not received for LH");
        #30;
        instruction <= 32'h02832283;        //lw x5, 40(x6)
        #10;
        if(op_mux !=2'd1) $fatal("Expected output mux select line not received for Load");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for Load");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Load");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Load");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Load");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Load");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Load");
        if(data_op != 3'd2) $fatal("Expected data extension select line not received for LW");
        #30;
        instruction <= 32'h02834283;        //lbu x5, 40(x6)
        #10;
        if(op_mux !=2'd1) $fatal("Expected output mux select line not received for Load");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for Load");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Load");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Load");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Load");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Load");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Load");
        if(data_op != 3'd4) $fatal("Expected data extension select line not received for LBU");
        #30;
        instruction <= 32'h00035283;        //lhu x5, 0(x6) 
        #10;
        if(op_mux !=2'd1) $fatal("Expected output mux select line not received for Load");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for Load");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Load");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Load");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Load");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Load");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Load");
        if(data_op != 3'd5) $fatal("Expected data extension select line not received for LHU");
        #30;
        
        //Store instructions
        instruction <= 32'h00128023;        //sb x1, 0(x5)
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for Store");
        if(imm_op !=3'd3) $fatal("Expected immediate extension opcode not received for Store");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Store");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Store");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Store");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Store");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Store");
        #15;
        if(dmem_we != 4'd1) $fatal("Expected DMem write enable not received for SB");
        #15;
         instruction <= 32'h00129023;        //sh x1, 0(x5) 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for Store");
        if(imm_op !=3'd3) $fatal("Expected immediate extension opcode not received for Store");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Store");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Store");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Store");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Store");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Store");
        #15;
        if(dmem_we != 4'd3) $fatal("Expected DMem write enable not received for SH");
        #15;
         instruction <= 32'h0012a023;        //sw x1, 0(x5) 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for Store");
        if(imm_op !=3'd3) $fatal("Expected immediate extension opcode not received for Store");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for Store");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for Store");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for Store");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for Store");
        if(rfile_mux != 0) $fatal("Expected RF destination select line not received for Store");
        #15;
        if(dmem_we != 4'b1111) $fatal("Expected DMem write enable not received for SW");
        #15;
        
        // I-type arithmetic
        instruction <= 32'h00108293;        //addi x5, x1, 1
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for ADDI");
        #20;
        instruction <= 32'h0020a293;        //slti x5, x1, 2
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd2) $fatal("Expected ALU opcode not received for SLTI");
        #20;
        instruction <= 32'h0020b293;        //sltiu x5, x1, 2
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd3) $fatal("Expected ALU opcode not received for SLTIU");
        #20;
        instruction <= 32'h0202c293;        //xori x5, x5, 0b100000
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd4) $fatal("Expected ALU opcode not received for XORI");
        #20;
        instruction <= 32'h0102e093;        //ori x1, x5, 0x0010
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd6) $fatal("Expected ALU opcode not received for ORI");
        #20;
        instruction <= 32'h0042f293;        //andi x5, x5, 4
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd7) $fatal("Expected ALU opcode not received for ANDI");
        #20;
         instruction <= 32'h00109093;        //slli x1, x1, 1
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd1) $fatal("Expected ALU opcode not received for SLLI");
        #20;
         instruction <= 32'h0010d093;        //srli x1, x1, 1
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'd5) $fatal("Expected ALU opcode not received for SRLI");
        #20;
         instruction <= 32'h4010d093;        //srai x1, x1, 1
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for I-type Arithmetic");
        if(imm_op !=3'd1) $fatal("Expected immediate extension opcode not received for I-type Arithmetic");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for I-type Arithmetic");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for I-type Arithmetic");
        if(alu_mux2 != 0) $fatal("Expected ALU input data2 not received for I-type Arithmetic");
        if(alu_op != 4'b1101) $fatal("Expected ALU opcode not received for SRAI");
        #20;
        
        //R-type
        instruction <= 32'h003100b3;        //add x1, x2, x3
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd0) $fatal("Expected ALU opcode not received for ADD");
        #20;
        instruction <= 32'h403100b3;        //sub x1, x2, x3 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd8) $fatal("Expected ALU opcode not received for SUB");
        #20;
        instruction <= 32'h003290b3;        //sll x1, x5, x3 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd1) $fatal("Expected ALU opcode not received for SLL");
        #20;
        instruction <= 32'h0032a0b3;        //slt x1, x5, x3 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd2) $fatal("Expected ALU opcode not received for SLT");
        #20;
        instruction <= 32'h0032b0b3;        //sltu x1, x5, x3
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd3) $fatal("Expected ALU opcode not received for SLTU");
        #20;
        instruction <= 32'h0032c0b3;        //xor x1, x5, x3
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd4) $fatal("Expected ALU opcode not received for XOR");
        #20;
        instruction <= 32'h0032d0b3;        //srl x1, x5, x3 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd5) $fatal("Expected ALU opcode not received for SRL");
        #20;
        instruction <= 32'h4032d0b3;        //sra x1, x5, x3 
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'b1101) $fatal("Expected ALU opcode not received for SRA");
        #20;
        instruction <= 32'h0032e0b3;        //or x1, x5, x3
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd6) $fatal("Expected ALU opcode not received for OR");
        #20;
        instruction <= 32'h0032f0b3;        //and x1, x5, x3
        #10;
        if(op_mux !=2'd0) $fatal("Expected output mux select line not received for R-type");
        if(pc_mux !=0) $fatal("Expected PC update select line not received for R-type");
        if(alu_mux1 != 0) $fatal("Expected ALU input data1 not received for R-type");
        if(alu_mux2 != 1) $fatal("Expected ALU input data2 not received for R-type");
        if(alu_op != 4'd7) $fatal("Expected ALU opcode not received for AND");
        #20;
        
        instruction <= 32'h00000073;        //ECALL
        #20;
        if(imem_rd !=0) $fatal("Expected IMem read enable not received for Halt instruction");
        if(pc_we !=0) $fatal("Expected PC write enable not received for Halt instruction");
        if(rf_we != 0) $fatal("Expected RF write enable not received for Halt instruction");
        if(dmem_rd != 0) $fatal("Expected DMem read enable not received for Halt instruction");
        if(dmem_we != 4'd0) $fatal("Expected DMem write enable not received for Halt instruction");
        #20;
        instruction <= 32'h00100073;        //EBREAK
        #20;
        if(imem_rd !=0) $fatal("Expected IMem read enable not received for Halt instruction");
        if(pc_we !=0) $fatal("Expected PC write enable not received for Halt instruction");
        if(rf_we != 0) $fatal("Expected RF write enable not received for Halt instruction");
        if(dmem_rd != 0) $fatal("Expected DMem read enable not received for Halt instruction");
        if(dmem_we != 4'd0) $fatal("Expected DMem write enable not received for Halt instruction");
        #20;
        
        $display("All test cases passed");
        $finish;
    end
    
endmodule
