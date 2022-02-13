`timescale 1ns / 1ps
`include "defines.vh"


// Branch Comparator
module BranComp(
    input wire [2:0] bc_op,
    input wire [31:0] data_in1,
    input wire [31:0] data_in2,
    output wire bc_out
    );
    
    reg result = 0;
    
    always@(*) begin
        case(bc_op)
            `BEQ:
                result <= (data_in1==data_in2) ? 1:0;
            `BNE:
                result <= (data_in1==data_in2) ? 0:1;
            `BLT:
                result <= ($signed(data_in1) < $signed(data_in2)) ? 1 :0;
            `BGE:
                result <= ($signed(data_in1) < $signed(data_in2)) ? 0 :1;
            `BLTU:
                result <= (data_in1 < data_in2)? 1:0;
            `BGEU:
                result <= (data_in1 < data_in2)? 0:1;
             default:
                result <= result;
        endcase
    end
    
    assign bc_out = result;
    
endmodule
