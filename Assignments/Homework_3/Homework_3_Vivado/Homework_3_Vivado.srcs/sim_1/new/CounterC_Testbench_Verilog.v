`timescale 1ns / 1ps

module CounterC_Testbench_Verilog();
    
    reg t_clk = 1;
    reg t_reset = 0;
    reg t_enable = 0;
    wire [3:0] t_cnt;
    
//     CounterA DUT(.clk(t_clk), .reset(t_reset), .enable(t_enable),
//                 .cnt(t_cnt)
//                 );
    
    CounterC DUT(.clk(t_clk), .reset(t_reset), .enable(t_enable),
                 .cnt(t_cnt)
                 );
                 
    initial begin:CLK_GEN
        forever begin
            t_clk<=1;
            #0.5;
            t_clk<=0;
            #0.5;
        end 
    end
    
    initial begin:Counter_Tester
        
        #1;
        t_enable<=1;
        if(t_cnt!=4'b1001) $fatal(1,"Error in Case 1001");
        
        #1;
        if(t_cnt!=4'b1010) $fatal(1,"Error in Case 1010");
        
        #1;
        if(t_cnt!=4'b1011) $fatal(1,"Error in Case 1011");
        
        #1;
        if(t_cnt!=4'b1100) $fatal(1,"Error in Case 1100");
        
        #1;
        if(t_cnt!=4'b1101) $fatal(1,"Error in Case 1101");
        
        #1;
        if(t_cnt!=4'b1110) $fatal(1,"Error in Case 1110");
        
        #1;
        if(t_cnt!=4'b1111) $fatal(1,"Error in Case 1111");
        
        #1;
        if(t_cnt!=4'b1001) $fatal(1,"Error in Case 2nd 1001");
        
        #1;
        if(t_cnt!=4'b1010) $fatal(1,"Error in Case 2nd 1010");
        
        t_reset<=1;
        #0.5;
        if(t_cnt!=4'b1001) $fatal(1,"Error in Reset");
        t_reset<=0;
        
        #1;
        t_enable<=0;
        #0.5;
        if(t_cnt!=4'b1010) $fatal(1,"Error in Enable");
        
        #1;
        t_reset<=1;
        #1;
        if(t_cnt!=4'b1001) $fatal(1,"Error in 2nd Reset");
                
        $display("All Test Passed");
        $finish; 
    end
endmodule
