`timescale 1ns / 1ps
`include "defines.vh"


// Data Extender
module DataExt(
    input wire [2:0] opcode,
    input wire [31:0] data,
    output wire [31:0] dout
    );
    
    reg [31:0] d_out;
    
    always@(*) begin
        case(opcode)
            `LB: begin
                if (data[7]==1)
                    //d_out <= {24'b111111111111111111111111, data[7:0]};
                    d_out <= {{24 {1'b1}}, data[7:0]};
                else
                    //d_out <= {24'b000000000000000000000000, data[7:0]};
                    d_out <= {{24 {1'b0}}, data[7:0]};
            end
            `LH: begin 
                if (data[15]==1)
//                    d_out <= {16'b1111111111111111, data[15:0]};
                    d_out <= {{16 {1'b1}}, data[15:0]};
                else
//                    d_out <= {16'b0000000000000000, data[15:0]};
                    d_out <= {{16 {1'b0}}, data[15:0]};    
            end
            `LW: begin       
                d_out <= data;
            end
            `LBU: begin
//                    d_out <= {24'b000000000000000000000000, data[7:0]};
                    d_out <= {{24 {1'b0}}, data[7:0]};
            end
            `LHU: begin  
//                d_out <= {16'b0000000000000000, data[15:0]};
                d_out <= {{16 {1'b0}}, data[15:0]}; 
            end
            default:
                d_out <= 0;
        endcase
    end
    
    assign dout = d_out;
    
endmodule

