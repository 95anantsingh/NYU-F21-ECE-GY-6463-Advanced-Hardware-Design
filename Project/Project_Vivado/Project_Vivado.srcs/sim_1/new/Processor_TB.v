`timescale 1ns / 1ps
`default_nettype none

module Processor_TB(

    );
    reg t_clk = 1;
    reg t_rstn = 0;
    reg [31:0] t_pc;
    
    Processor DUT(.clk(t_clk), .rstn(t_rstn));
    
    initial begin : CLK_GEN
        forever begin
            t_clk <=1;
            #0.5;
            t_clk <=0;
            #0.5;
        end
    end
    
    initial begin : TEST_PROCESS
           
    
//---// Test 1 - Testing for LUI, AUIPC, JAL, JALR, ECALL
    
        #2;
        t_rstn <= 1;
        $readmemh("P_TB_test1.mem", IMem.rom); 
        // lui x5, 32
        // auipc x6, 10
        // jal x2, loop
        // ecall
        // loop:lui x5, 2
        // jalr x0, 0(x2)
        
        //  lui x5, 32      # x5 = {20'd32, 12'b0}
        #3;
        if(RegFile.r[5] != ({20'd32, 12'b0})) $fatal(1,"Error in LUI instruction");
        
        //  auipc x6, 10    # x6 = PC + {imm[31:12], 12'b0}
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(RegFile.r[6] != (t_pc + {20'd10, 12'b0})) $fatal(1,"Error in AUIPC instruction");
        
        //  jal x2, loop    # x2 = PC + 4; PC = PC + sign_ext(8), Jump 1 instruction
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(RegFile.r[2] != (t_pc + 32'd4)) $fatal(1,"Error in JAL instruction");
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in JAL instruction");
        
        //  loop: lui x5, 2 # x5 = {20'd2, 12'b0}, Load Extended(2) in x5
        #3;
        
        //  jalr x0, 0(x2)  # x0 = PC + 4; PC = x2 + sign_ext(0), Jump to Address stored in x2
        #1;
        t_pc <= PCnt.data_out;
        #2;
        //if(RegFile.r[0] != 32'd0) $fatal(1,"Error in JALR instruction");
        if(PCnt.data_out != (RegFile.r[2])) $fatal(1,"Error in JALR instruction");
                       
        //  ecall       # Halt
        #1;                   
        t_pc <= PCnt.data_out;
        #10;
        if(PCnt.data_out != t_pc) $fatal(1,"Error in ECALL instruction");
        

//---// Test 2 - Testing for Branch Ins BEQ, BNE, BLT, BGE, BLTU, BGEU
        t_rstn <= 0;
        #2;
        t_rstn <= 1;
        $readmemh("P_TB_test2.mem", Processor.InstructionMemory.rom);
         
        // lui x1, 0xF2F2F
        // lui x2, 0x11111
        // lui x3, 0x11111
        // 
        // beq x1, x2, BNE
        // beq x2, x3, BNE
        // ecall
        // 
        // BNE:
        // bne x1, x1, BLT
        // bne x1, x2, BLT
        // ecall
        // 
        // BLT:
        // blt x2, x1, BLTU
        // blt x1, x2, BLTU
        // ecall
        // 
        // BLTU:
        // bltu x1, x2, BGE
        // bltu x2, x1, BGE
        // ecall
        // 
        // BGE:
        // bge x1, x2, BGEU
        // bge x2, x1, BGEU
        // ecall
        // 
        // BGEU:
        // bgeu x2, x1, END
        // bgeu x1, x2, END
        // ecall
        // 
        // END:
        // lui x20, 40
        // ecall

        // lui x1, 0xF2F2F
        #3;
        // lui x2, 0x11111
        #3;
        // lui x3, 0x11111
        #3;
        
        // beq x1, x2, BNE  # PC = (x1 == x2) ? PC + sign_ext(12) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BEQ instruction");
        
        // beq x2, x3, BNE  # PC = (x2 == x3) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BEQ instruction");
        
        // bne x1, x1, BLT  # PC = (x1 != x1) ? PC + sign_ext(12) : PC + 4
 
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BNE instruction");
        
        // bne x1, x2, BLT  # PC = (x1 != x2) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BNE instruction");
         
        // blt x2, x1, BLTU # PC = (signed(x2) < signed(x1)) ? PC + sign_ext(12) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BLT instruction");
        
        // blt x1, x2, BLTU # PC = (signed(x1) < signed(x2)) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BLT instruction");
        
        // bltu x1, x2, BGE # PC = (unsigned(x1) < unsigned(x2)) ? PC + sign_ext(12) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BLTU instruction");
        
        // bltu x2, x1, BGE # PC = (unsigned(x2) < unsigned(x1)) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BLTU instruction");
        
        // bge x1, x2, BGEU # PC = (signed(x1) >= signed(x2)) ? PC + sign_ext(12) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BGE instruction");
        
        // bge x2, x1, BGEU # PC = (signed(x2) >= signed(x1)) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BGE instruction");
       
        // bgeu x2, x1, END # PC = (unsigned(x2) >= unsigned(x1)) ? PC + sign_ext(12) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in BGEU instruction");
        
        // bgeu x1, x2, END # PC = (unsigned(x1) >= unsigned(x2)) ? PC + sign_ext(8) : PC + 4
        #1;
        t_pc <= PCnt.data_out;
        #2;
        if(PCnt.data_out != (t_pc + 32'd8)) $fatal(1,"Error in BGEU instruction");
        
        // lui x20, 40
        #3;
        
        // ecall
        #1;                   
        t_pc <= PCnt.data_out;
        #10;
        if(PCnt.data_out != t_pc) $fatal(1,"Error in HALT instruction");       
        
        
//---// Test 3 - Testing for Load Store Ins LB, LH, LW, LBU, LHU, SB, SH, SW
        t_rstn <= 0;
        #2;
        t_rstn <= 1;
        $readmemh("P_TB_test3.mem", Processor.InstructionMemory.rom);
        // lui x2, 0x80000
        // lui x3, 0xF53F3
        // addi x4, x3, 0xFA
        // 
        // sb x4, 8(x2)
        // sh x4, 12(x2)
        // sw x4, 4(x2)
        // 
        // lb x6, 8(x2)
        // lh x7, 12(x2) 
        // lbu x9, 8(x2)
        // lhu x10, 12(x2)
        // lw x8, 0(x2)
        // 
        // ecall
        
        // lui x2, 0x80000
        #3;
        // lui x3, 0xFB39F
        #3;
        // addi x4, x3, 0xFA
        #3;
         
        // sb x4, 8(x2)     # DMem[x2 + sign_ext(8)][7:0] = x4[7:0] 
        #4;
        if(DMem.ram[2][7:0] != 8'hFA) $fatal(1,"Error in SB instruction");
        
        // sh x4, 12(x2)    # DMem[x2 + sign_ext(12)][15:0] = x4[15:0]
        #4;
        if(DMem.ram[3][15:0] != 16'hF0FA) $fatal(1,"Error in SH instruction");
        
        // sw x4, 4(x2)     # DMem[x2 + sign_ext(4)][31:0] = x4
        #4;
        if(DMem.ram[1] != 32'hFB39F0FA) $fatal(1,"Error in SW instruction");

        // lb x6, 8(x2)     # x6 = sign_ext( DMem[x2 + sign_ext(8)][7:0])
        #4;
        if(RegFile.r[6] != 32'hFFFFFFFA) $fatal(1,"Error in LB instruction");
        
        // lh x7, 12(x2)    # x7 = sign_ext( DMem[x2 + sign_ext(12)][15:0])
        #4;
        if(RegFile.r[7] != 32'hFFFFF0FA) $fatal(1,"Error in LH instruction");
        
        // lbu x9, 8(x2)    # x9 = zero_ext( DMem[x2 + sign_ext(8)][7:0])
        #4;
        if(RegFile.r[9] != 32'h000000FA) $fatal(1,"Error in LBU instruction");
        
        // lhu x10, 12(x2)  # x10 = zero_ext( DMem[x2 + sign_ext(12)][15:0])
        #4;
        if(RegFile.r[10] != 32'h0000F0FA) $fatal(1,"Error in LHU instruction");
        
        // lw x8, 0(x2)     # x8 = DMem[x2 + sign_ext(0)][31:0]
        #4;
        if(RegFile.r[8] != 32'hF53F30FA) $fatal(1,"Error in LW instruction");
        
        // 
        // ecall       
        
        
//---// Test 4 - Testing for Ins ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
        //                       ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
        //                       FENCE, EBREAK                                              
        t_rstn <= 0;
        #2;
        t_rstn <= 1;
        $readmemh("P_TB_test4.mem", Processor.InstructionMemory.rom);  
        // addi x1, x0, 0b10111011
        // addi x2, x0, 0b10100110  # 166
        // 
        // addi x3, x0, 5
        // slti x5, x0, 5
        // sltiu x6, x1, 2
        // xori x4, x1, 0b10110011
        // ori x5, x1,  0b10110001
        // andi x6, x1, 0b10110010
        // slli x4, x1, 7
        // srli x5, x1, 3
        // srai x6, x1, 4
        //
        // add x4, x2, x3
        // sub x5, x2, x3 
        // sll x6, x2, x3 
        // slt x7, x2, x3 
        // sltu x8, x2, x3
        // xor x4, x1, x2
        // srl x5, x2, x3 
        // sra x6, x2, x3 
        // or x7, x1, x2
        // and x8, x1, x2
        // 
        // fence
        // add x1, x2, x3
        // ebreak
        
        // addi x1, x0, 0b10111011
        #3;
        if(RegFile.r[1] != 32'b10111011) $fatal(1,"Error in ADDI instruction");
        
        // addi x2, x0, 0b10100110
        #3;
        
        // addi x3, x0, 5   # x3 = x0 + sign_ext(5)
        #3;
        if(RegFile.r[3] != 32'd5) $fatal(1,"Error in ADDI instruction");
        
        // slti x5, x0, 5   # x5 = (signed(x0) < sign_ext(5)) ? 1 : 0
        #3;
        if(RegFile.r[5] != 32'd1) $fatal(1,"Error in SLTI instruction");

        // sltiu x6, x1, 2  # x6 = (unsigned(x1) < unsigned(sign_ext(2))) ? 1 : 0
        #3;
        if(RegFile.r[6] != 32'd0) $fatal(1,"Error in SLTIU instruction");
        
        // xori x4, x1, 0b10110011  # x4 = x1 ^ sign_ext(0b10110011)
        #3;
        if(RegFile.r[4] != 32'b00001000) $fatal(1,"Error in XORI instruction");
        
        // ori x5, x1, 0b10110001   # x5 = x1 | sign_ext(0b10110001)
        #3;
        if(RegFile.r[5] != 32'b10111011) $fatal(1,"Error in ORI instruction");
        
        // andi x6, x1, 0b10110010  # x6 = x1 & sign_ext(0b10110010)
        #3;
        if(RegFile.r[6] != 32'b10110010) $fatal(1,"Error in ANDI instruction");
                
        // slli x4, x1, 7   # x4 = x1 << 7
        #3;
        if(RegFile.r[4] != 32'b101110110000000) $fatal(1,"Error in SLLI instruction");
        
        // srli x5, x1, 3   # x5 = unsigned(x1) >> 3
        #3;
        if(RegFile.r[5] != 32'b10111) $fatal(1,"Error in SRLI instruction");
        
        // srai x6, x1, 4   # x6 = signed(x1) >> 4
        #3;
        if(RegFile.r[6] != 32'b1011) $fatal(1,"Error in SRAI instruction");
        
        // add x4, x2, x3   # x4 = x2 + x3
        #3;
        if(RegFile.r[4] != 32'd171) $fatal(1,"Error in ADD instruction");
        
        // sub x5, x2, x3   # x5 = x2 - x3
        #3;
        if(RegFile.r[5] != 32'd161) $fatal(1,"Error in SUB instruction");
        
        // sll x6, x2, x3   # x6 =  x2 << x3[4:0]
        #3;
        if(RegFile.r[6] != 32'b1010011000000) $fatal(1,"Error in SLL instruction");
        
        // slt x7, x2, x3   # x7 = (signed(x2) < signed(x3)) ? 1 : 0
        #3;                                                                      
        if(RegFile.r[7] != 32'd0) $fatal(1,"Error in SLT instruction");
        
        // sltu x8, x2, x3  # x8 = (unsigned(x2) < unsigned(x3)) ? 1 : 0
        #3;                                                                      
        if(RegFile.r[8] != 32'd0) $fatal(1,"Error in SLTU instruction");
        
        // xor x4, x1, x2   # x4 = x1 ^ x2
        #3;
        if(RegFile.r[4] != 32'b00011101) $fatal(1,"Error in XOR instruction");
        
        // srl x5, x2, x3   # x5 = x2 >> x3[5:0]
        #3;                                                                      
        if(RegFile.r[5] != 32'b101) $fatal(1,"Error in SRL instruction");
        
        // sra x6, x2, x3   # x6 = signed(x2) >> x3[5:0]
        #3;                                                                      
        if(RegFile.r[6] != 32'b101) $fatal(1,"Error in SRA instruction");
        
        // or x7, x1, x2    # x7 = x1 | x2
        #3;
        if(RegFile.r[7] != 32'b10111111) $fatal(1,"Error in OR instruction");
        
        // and x8, x1, x2   # x8 = x1 & x2
         #3;
        if(RegFile.r[8] != 32'b10100010) $fatal(1,"Error in AND instruction");
        
        // fence            # PC = PC + 4
        #1
        t_pc <= PCnt.data_out;
        #2
        if(PCnt.data_out != (t_pc + 32'd4)) $fatal(1,"Error in FENCE instruction");
        
        // add x1, x2, x3   #
        #3
        // ebreak           # Halt
        #1;                   
        t_pc <= PCnt.data_out;
        #10;
        if(PCnt.data_out != t_pc) $fatal(1,"Error in HALT instruction");
        
        
        $display("\nAll test Passed\n");
        $finish;
    end
endmodule