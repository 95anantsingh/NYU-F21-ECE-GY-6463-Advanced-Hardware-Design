`timescale 1ns / 1ns

module Verilog_Quiz_Testbench;
reg A,B,O_E;
wire X,Y,Z;

Verilog_Quiz_VHDL DUT(
    .A(A),
    .B(B),
    .O_E(O_E),
    .X(X),
    .Y(Y),
    .Z(Z)
    );
    
initial
    begin: TEST_BLOCK
        //1
        A <= 0;
        B <= 0;
        O_E <= 0;
        #1;
        
        //2
        A <= 1;
        B <= 0;
        O_E <= 0;
        #1;
        
        //3
        A <= 0;
        B <= 1;
        O_E <= 0;
        #1;
        
        //4
        A <= 1;
        B <= 1;
        O_E <= 0;
        #1;
        
        //5
        A <= 0;
        B <= 0;
        O_E <= 1;
        #1;
        
        //6
        A <= 1;
        B <= 0;
        O_E <= 1;
        #1;
        
        //7
        A <= 0;
        B <= 1;
        O_E <= 1;
        #1;
        
        //8
        A <= 1;
        B <= 1;
        O_E <= 1;
        #1;  
    
        A <= 0;
        B <= 0;
        O_E <= 0;
    
    end  
endmodule
