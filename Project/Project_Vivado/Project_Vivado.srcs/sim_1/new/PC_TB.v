`timescale 1ns / 1ps

module PC_TB(

    );
    reg clk=0;
    reg rst=0;
    reg we=1;                                 
    reg [31:0] next_pc;
    wire [31:0] pc;

    
    PCnt DUT(
    .clk(clk), .rstn(rst), .we(we), .data_in(next_pc), .data_out(pc)
    );    
    
    initial begin: CLK_GEN
        #5;
        rst <=1;
        forever begin
            clk <=0;
            #5;
            clk <=1;
            #5;
        end
    end
    
    initial begin
        #10;
        next_pc <= 32'h0100004;
        #5;
        rst <=1;
        #5;
        if(pc != 32'h0100004) $fatal("Expected output not received");
        #5;
        next_pc <= 32'h0100008;
        #10;
        if(pc != 32'h0100008) $fatal("Expected output not received");
        next_pc <= 32'h010000c;
        #10;
        if(pc != 32'h010000c) $fatal("Expected output not received");
        next_pc <= 32'h0100010;
        #10;
        if(pc != 32'h0100010) $fatal("Expected output not received");
        rst <=0;
        #10;
        if(pc != 32'h01000000) $fatal("Expected output not received");
        next_pc <= 32'h01000008;
        #5;
        if(pc != 32'h01000000) $fatal("Expected output not received");
        #5;
        rst <=1;
        next_pc <= 32'h0100000c;
        #10;
        if(pc != 32'h0100000c) $fatal("Expected output not received");
        next_pc <= 32'h01000010;
        #10;
        if(pc != 32'h01000010) $fatal("Expected output not received");
        we <=0;
        next_pc <= 32'h01000014;
        #5;
        if(pc != 32'h01000010) $fatal("Expected output not received");
        #10;
        next_pc <= 32'h01000018;
        #5;
        if(pc != 32'h01000010) $fatal("Expected output not received");
        #5;
        we <=1;
        next_pc <= 32'h0100001c;
        #10;
        if(pc != 32'h0100001c) $fatal("Expected output not received");
        next_pc <= 32'h01000020;
        #10;
        if(pc != 32'h01000020) $fatal("Expected output not received");
        #5;
        rst<=0;
        next_pc <= 32'h01000021;
        #10;
        if(pc != 32'h01000000) $fatal("Expected output not received");
        #5;
        
        $display("All test cases passed");
        $finish;
    end
    
endmodule
