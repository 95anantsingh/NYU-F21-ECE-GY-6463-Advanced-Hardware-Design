`timescale 1ns / 1ps


module ImmExt_TB(

    );

    reg [2:0] opcode;
    reg [31:0] instr;
    wire [31:0] ext_imm;
    
    ImmExt DUT(.opcode(opcode), .instr(instr), .ext_imm(ext_imm));

    initial begin
        #5;
        
        instr <= 32'hffdff0ef;      //J-type
        opcode <=3'd0;
        #10;
        
        if(ext_imm!=32'hfffffffc) $fatal("Expected output not received");
        #10;

        instr <= 32'h02830283;      //I-type
        opcode <=3'd1;
        #10;

        if(ext_imm!=32'h00000028) $fatal("Expected output not received");
        #10;

        instr <= 32'hfe9246e3;      //B-type
        opcode <=3'd2;
        #10;
        
        if(ext_imm!=32'hffffffec) $fatal("Expected output not received");
        #10;

        instr <= 32'h00129023;      //S-type
        opcode <=3'd3;
        #10;
        
        if(ext_imm!=32'h00000000) $fatal("Expected output not received");
        #10;

        instr <= 32'h00001117;      //U-type
        opcode <= 3'd4;
        #10;
        
        if(ext_imm!=32'h00001000) $fatal("Expected output not received");
        #10;

        $display("All test cases passed");
        $finish;
    end
endmodule