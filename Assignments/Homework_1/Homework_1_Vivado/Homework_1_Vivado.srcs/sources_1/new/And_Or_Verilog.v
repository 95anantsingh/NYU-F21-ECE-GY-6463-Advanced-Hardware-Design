
`timescale 1ns / 1ps

module And_Or_Verilog(
    input wire A,
    input wire B,
    input wire C,
    output wire O
    );
    
wire D;

assign D = A & B;
assign O = D | C;

endmodule