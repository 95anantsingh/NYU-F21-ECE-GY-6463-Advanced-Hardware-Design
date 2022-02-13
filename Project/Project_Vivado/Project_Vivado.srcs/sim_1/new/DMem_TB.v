`timescale 1ns / 1ps

module DMem_TB(

    );
    
    reg [31:0] addr;
    reg [31:0] data_in;
    reg [3:0]we;
    reg clk;
    reg rd;
    reg rst;
    wire  [31:0] data;
    
    DMem DUT(.addr_in(addr), .data_in(data_in), .we(we), .clk(clk), .rd(rd), .data_out(data));
    
    initial begin : CLK_GEN
        forever begin
            clk = 1; 
            #5; 
            clk = 0; 
            #5; // 10ns period 
        end
    end

    initial begin
       data_in=32'h01010101;

        rd=1'b0;
        rst=1'b1;
        we=4'b0001;
        addr=32'h80000000;
        #10;

        
        rd=1'b1;
        rst=1'b1;
        we=4'b0000;
        addr=32'h80000000;
        //data_in=32'h01000000;
        #1;
        if(data!=32'h00000001) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        
        
        rd=1'b0;
        rst=1'b1;
        we=4'b0010;
         addr=32'h80000004;
        #10;
        
        rd=1'b1;
        rst=1'b1;
        we=4'b0000;
        addr=32'h80000004;
        //data_in=32'h01000000;
        #1;
        if(data!=32'h00000100) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        
        rd=1'b0;
        rst=1'b1;
        we=4'b0100;
        addr=32'h80000008;
        #10;

        rd=1'b1;
        rst=1'b1;
        we=4'b0000;
        addr=32'h80000008;
        //data_in=32'h01000000;
        #1;
        if(data!=32'h00010000) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        rd=1'b0;
        rst=1'b1;
        we=4'b1000;
         addr=32'h8000000c;
        #10;


        rd=1'b1;
        rst=1'b1;
        we=4'b0000;
        addr=32'h8000000c;
        //data_in=32'h01000000;
        #1;
        if(data!=32'h01000000) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        rd=1'b0;
        rst=1'b1;
        we=4'b1111;
        addr=32'h80000010;
        #10;
       
        
        rd=1'b1;
        rst=1'b1;
        we=4'b0000;
        addr=32'h80000010;
        //data_in=32'h01000000;
        #1;
        if(data!=32'h01010101) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        
        addr=32'h00100000;
        we=4'b0000;
        rd=1'b1;
        #1;
        if(data!=32'h13391993) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        
        addr=32'h00100004;
        we=4'b0000;
        rd=1'b1;
        #1;
        if(data!=32'h13643732) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
        addr=32'h00100008;
        we=4'b0000;
        rd=1'b1;
        #1;
        if(data!=32'h17456399) $fatal("The Data memory or RAM is not reading properly");
        #9;
        
//        addr=32'h00100010;
//        we=4'b0000;
//        rd=1'b1;
//        #1;
//        if(data!=32'h13391993) $fatal("The Data memory or RAM is not reading properly");
//        #9;
        
//        addr=32'h00100014;
//        we=4'b0000;
//        rd=1'b1;
//        #1;
//        if(data!=32'h13391993) $fatal("The Data memory or RAM is not reading properly");
//        #9;
        
        $display("All tests passed");
        $finish;
    end
endmodule
