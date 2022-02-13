`timescale 1ns / 1ps
`include "defines.vh"
`default_nettype none

module BranComp_TB(

    );
    
    reg [31:0] data1;
    reg [31:0] data2;
    reg [2:0] branch_op;
    wire branch;
    
    BranComp dut(
    .data_in1(data1), .data_in2(data2), .bc_op(branch_op), .bc_out(branch)
    );
    
    initial begin
        data1 <= 32'hff786510;
        data2 <= 32'h1096bc81;
        #10;
        branch_op <= `BEQ;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BNE;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BLT;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BGE;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BLTU;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BGEU;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        data1 <= 32'h12345678;
        data2 <= 32'h12345678;
        #10;
        branch_op <= `BEQ;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BNE;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BLT;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BGE;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BLTU;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BGEU;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        data1 <= 32'h497bdc52;
        data2 <= 32'he6ba817f;
        #10;
        branch_op <= `BEQ;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BNE;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BLT;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        branch_op <= `BGE;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BLTU;
        #10;
        if(branch !=1) $fatal("Expected output not received");
        #10;
        branch_op <= `BGEU;
        #10;
        if(branch !=0) $fatal("Expected output not received");
        #10;
        $display("All test cases passed");
        $finish;
    end
    
endmodule
