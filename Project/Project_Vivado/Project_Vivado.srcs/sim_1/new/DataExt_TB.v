`timescale 1ns / 1ps
`include "defines.vh"
`default_nettype none

module DataExt_TB(

    );
    
    reg [2:0] opcode;
    reg [31:0] data;
    wire [31:0] dout;
    
    DataExt dut (
    .opcode(opcode), .data(data), .dout(dout)
    );
    
    initial begin
        #5;
        data <= 32'h98A48DB7;
        opcode <= `LB;
        #10;
        if(dout!=32'hffffffb7) $fatal("Expected output not received");
        #10;
        opcode <= `LH;
        #10;
        if(dout!=32'hffff8db7) $fatal("Expected output not received");
        #10;
        opcode <= `LW;
        #10;
        if(dout!=32'h98a48db7) $fatal("Expected output not received");
        #10;
        opcode <= `LBU;
        #10;
        if(dout !=32'h000000b7) $fatal("Expected output not received");
        #10;
        opcode <= `LHU;
        #10;
        if(dout!=32'h00008db7) $fatal("Expected output not received");
        #10;
        $display ("All tests passed");
        $finish;
    end
    
endmodule
