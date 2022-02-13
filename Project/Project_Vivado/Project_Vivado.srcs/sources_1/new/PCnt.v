`timescale 1ns/1ps
`default_nettype none

// Program Counter
module PCnt(
    input wire clk,
    input wire rstn,
    input wire we,
    input wire [31:0] data_in,
    output wire [31:0] data_out
    );

    reg [31:0] current_pc;

    always@(posedge clk or negedge rstn)
    begin
        if (!rstn) begin 
            current_pc <= 32'h01000000;
        end 
        else if(we) begin
            current_pc <= data_in;
        end
    end
    
    assign data_out = current_pc;
    
endmodule