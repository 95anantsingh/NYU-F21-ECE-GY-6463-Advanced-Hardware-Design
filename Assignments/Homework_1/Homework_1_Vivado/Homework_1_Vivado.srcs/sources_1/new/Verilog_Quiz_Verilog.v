
`timescale 1ns / 1ps


module Verilog_Quiz_Verilog(
    input wire A,
    input wire B,
    input wire O_E,
    output wire X,
    output wire Y,
    output wire Z
    );
    
wire T;

assign T = !A | B;
assign X = O_E & !(A & B);
assign Y = O_E & (A ^ B);
assign Z = O_E & (T | Y);

endmodule