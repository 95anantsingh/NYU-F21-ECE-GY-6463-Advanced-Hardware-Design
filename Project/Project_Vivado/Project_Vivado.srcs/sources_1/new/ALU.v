`timescale 1ns / 1ps
`include "defines.vh"


// Arithmatic Logic Unit
module ALU(
    input wire [31:0] operand1,                 // First operand
    input wire [31:0] operand2,                 // Second operand
    input wire [3:0] operation,                 // The operation to be performed on the operands
    output wire [31:0] ALUresult
    );
    
    reg [31:0] result = 0;
    
    always @(*) begin
        case (operation)
            `ADD: 
                result <= operand1 + operand2;
            `SUB:
                result <= operand1 - operand2;
            `SLL:
                result <= operand1 << operand2[4:0];
            `SLT:
                result <= ($signed(operand1) < $signed(operand2)) ? 1 : 0;
            `SLTU:
                result <= (operand1 < operand2) ? 1 : 0;
            `XOR:
                result <= operand1 ^ operand2;
            `SRL:
                result <= operand1 >> operand2[4:0];
            `SRA:
                result <= $signed(operand1) >>> operand2[4:0];
            `OR:
                result <= operand1 | operand2;
            `AND:
                result <= operand1 & operand2;
            default:    
                result <= result;
        endcase        
    end
    
    assign ALUresult = result;
    
endmodule
