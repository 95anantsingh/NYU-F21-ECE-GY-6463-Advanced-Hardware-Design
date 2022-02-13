`timescale 1ns / 1ps
`include "defines.vh"
`default_nettype none

module ALU_TB(

    );
    
    reg [31:0] operand1;                 // First operand
    reg [31:0] operand2;                 // Second operand
    reg [3:0] operation;                 // The operation to be performed on the operands
    wire [31:0] ALUresult;
    
    ALU dut(
        .operand1(operand1), .operand2(operand2), .operation(operation), .ALUresult(ALUresult)
    );
    
   initial begin
        #5;
        operand1 <= 32'd10; 
        operand2 <= 32'd12;       
        operation <= `ADD;
        #5;
        if (ALUresult != 32'h00000016) $fatal("The expected output was not received");
        #5;
        operation <= `SUB;
        #5;
        if (ALUresult != 32'hfffffffe) $fatal("The expected output was not received");
        #5;
        operation <= `SLL;
        #5;
        if (ALUresult != 32'h0000a000) $fatal("The expected output was not received");
        #5;
        operation <= `SLT;
        #5;
        if (ALUresult != 32'h00000001) $fatal("The expected output was not received");
        #5;
        operation <= `SLTU;
        #5;
        if (ALUresult != 32'h00000001) $fatal("The expected output was not received");
        #5;
        operation <= `XOR;
        #5;
        if (ALUresult != 32'h00000006) $fatal("The expected output was not received");
        #5;
        operation <= `SRL;
        #5;
        if (ALUresult != 32'h00000000) $fatal("The expected output was not received");
        #5;
        operation <= 4'd11;                                                                             //None
        #5;
        if (ALUresult != 32'h00000000) $fatal("The expected output was not received");
        #5;
        operation <= `SRA;
        #5;
        if (ALUresult != 32'h00000000) $fatal("The expected output was not received");
        #5;
        operation <= `OR;
        #5;
        if (ALUresult != 32'h0000000e) $fatal("The expected output was not received");
        #5;
        operation <= `AND;
        #5;
        if (ALUresult != 32'h00000008) $fatal("The expected output was not received");
        #5;
        operand1 <= 32'b10011011100110101100101011110011;               //Decimal 2610612979
        operand2 <= 32'b00101110010101101001111001010110;               //Decimal 777428566
        operation <= `ADD;
        #5;
        if (ALUresult != 32'hc9f16949) $fatal("The expected output was not received");
        #5;
        operation <= `SUB;
        #5;
        if (ALUresult != 32'h6d442c9d) $fatal("The expected output was not received");
        #5;
        operation <= `SLL;
        #5;
        if (ALUresult != 32'hbcc00000) $fatal("The expected output was not received");
        #5;
        operation <= `SLT;
        #5;
        if (ALUresult != 32'h00000001) $fatal("The expected output was not received");
        #5;
        operation <= `SLTU;
        #5;
        if (ALUresult != 32'h00000000) $fatal("The expected output was not received");
        #5;
        operation <= `XOR;
        #5;
        if (ALUresult != 32'hb5cc54a5) $fatal("The expected output was not received");
        #5;
        operation <= `SRL;
        #5;
        if (ALUresult != 32'h0000026e) $fatal("The expected output was not received");
        #5;
        operation <= 4'd11;
        #5;
        if (ALUresult != 32'h0000026e) $fatal("The expected output was not received");
        #5;
        operation <= `SRA;
        #5;
        if (ALUresult != 32'hfffffe6e) $fatal("The expected output was not received");
        #5;
        operation <= `OR;
        #5;
        if (ALUresult != 32'hbfdedef7) $fatal("The expected output was not received");
        #5;
        operation <= `AND;
        #5;
        if (ALUresult != 32'h0a128a52) $fatal("The expected output was not received");
        #10;
        $display ("All test cases passed");
        $finish;
   end 
    
endmodule
