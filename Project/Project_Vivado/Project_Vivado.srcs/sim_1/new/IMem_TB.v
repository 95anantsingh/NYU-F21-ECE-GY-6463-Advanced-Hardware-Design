`timescale 1ns / 1ps

module IMem_TB(

    );
    reg  clk;
    reg  rd;
    reg  [31:0] addr_in;
    wire [31:0] instr_out;
    
    IMem DUT (.clk(clk),.rd(rd),.addr_in(addr_in), .instr_out(instr_out));
    
    initial begin: CLK_GEN
        forever begin
            clk <=1;
            #5;
            clk <=0;
            #5;
        end
    end
    
    initial begin:TEST_PROCESS
        rd=1'b0;
        #1;
        if(instr_out!=32'h00000000) $fatal("The Instruction memory or ROM is IDLE, no operation");
        #14;
        
        rd=1'b0;
        #1;
        if(addr_in!=32'h01000000) $fatal("Reset(active_low) has been invoked and the PC which is input to ROM has not reset to starting address");
        #14;
        
        rd=1'b1;
        #1;
        if(addr_in!=32'h01000000) $fatal("Reset(active_low) has been invoked and the PC which is input to ROM has not reset to starting address");
        #14;
        
        rd=1'b1;
        #1;
        addr_in=32'h01000000;
        #7
        if(instr_out!=32'h00100093) $fatal("The Instruction memory or ROM is not reading the value at desired address correctly");
        #2
         addr_in=32'h01000004;
        #7
        if(instr_out!=32'h00200113) $fatal("The Instruction memory or ROM is not reading the value at desired address correctly");
        #3
         addr_in=32'h01000008;
        #7
        if(instr_out!=32'h002080b3) $fatal("The Instruction memory or ROM is not reading the value at desired address correctly");
        #3
         addr_in=32'h0100000c;
        #7
        if(instr_out!=32'hffdff06f) $fatal("The Instruction memory or ROM is not reading the value at desired address correctly");
        #3
         addr_in=32'h01000010;
        #7
        if(instr_out!=32'h00001117) $fatal("The Instruction memory or ROM is not reading the value at desired address correctly");
        #3
        
     
        $display("All tests passed");
        $finish;
    end 
    
endmodule
