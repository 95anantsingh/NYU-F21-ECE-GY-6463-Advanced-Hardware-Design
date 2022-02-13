`timescale 1ns / 1ps
`default_nettype none

module PRNumGen_Testbench(

    );
    reg t_clk=1;
    reg t_rstn=0;
    reg t_get_random=0;
    wire [0:7] t_data_out;
    
    PRNumGen DUT(.clk(t_clk),.rstn(t_rstn),.get_random(t_get_random),.data_out(t_data_out));
    
    integer file_pointer;
    reg [0:31] f_seed;
    reg [0:31] f_dout;
    
    
    initial begin: Test_Process
        file_pointer= $fopen("Testcases.txt","r");
        if(file_pointer==0) begin
            $display("Could'nt open file.");
            $finish;
        end
        
        $fscanf(file_pointer,"%x\n",f_seed);
        $fscanf(file_pointer,"%x\n",f_dout);

        //Test 1 - check if output is low when get_random = 0 , rstn = 0
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 1 Failed\n");
            $finish;
        end 
        
        //Test 2 - check if output is low when get_random = 1 , rstn = 0
        t_get_random<=1;
        #2;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 2 Failed\n");
            $finish;
        end
        t_get_random<=0;


        //Test 3 - check if LFSR works against 1st output when get random is low for less than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        t_get_random<=0;
        #1.5;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 3a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 3b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_dout[8:15]) begin
            $display ("\nTest 3c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != f_dout[0:7]) begin
            $display ("\nTest 3d Failed\n");
            $finish;
        end 
        
        //Test 4 - test if get_random is high for more than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        #1.5;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 4a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 4b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_dout[8:15]) begin
            $display ("\nTest 4c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != f_dout[0:7]) begin
            $display ("\nTest 4d Failed\n");
            $finish;
        end 
        t_get_random<=0;
        #1;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 4e Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 4f Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_dout[8:15]) begin
            $display ("\nTest 4g Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != f_dout[0:7]) begin
            $display ("\nTest 4h Failed\n");
            $finish;
        end

        //Test 5 - Reset in mid output cycle when get_random is high for more than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        #1.5;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 5a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 5b Failed\n");
            $finish;
        end
        #1;
        t_rstn<=0;
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 5c Failed\n");
            $finish;
        end
        t_rstn<=1;
        #1;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 5d Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 5e Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_dout[8:15]) begin
            $display ("\nTest 5f Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != f_dout[0:7]) begin
            $display ("\nTest 5g Failed\n");
            $finish;
        end
        t_get_random<=0;
         
         
        //Test 6 - Reset in mid output cycle when get_random is high for less than 4 cycle
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        t_get_random<=0; 
        #1.5;
        if(t_data_out != f_dout[24:31]) begin
            $display ("\nTest 6a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != f_dout[16:23]) begin
            $display ("\nTest 6b Failed\n");
            $finish;
        end
        #1;
        t_rstn<=0;
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 6c Failed\n");
            $finish;
        end
        t_rstn<=1;
        #1;
        if(t_data_out  != 2'd0) begin
            $display ("\nTest 6d Failed\n");
            $finish;
        end       
        #1;
         
        // Test 7 - Testing for remaining shifts generated from python program
        t_rstn<=0;
        #1;
        t_rstn<=1;
              
        while(!$feof(file_pointer)) begin
            $fscanf(file_pointer,"%x\n",f_dout);
                   
            t_get_random<=1;
            #0.5;
            t_get_random<=0;
            #1.5;
            if(t_data_out != f_dout[24:31]) begin
                $display ("\nTest 7a Failed\n");
                $finish;
            end       
            #1;
            if(t_data_out != f_dout[16:23]) begin
                $display ("\nTest 7b Failed\n");
                $finish;
            end
            #1;
            if(t_data_out != f_dout[8:15]) begin
                $display ("\nTest 7c Failed\n");
                $finish;
            end 
            #1;
            if(t_data_out != f_dout[0:7]) begin
                $display ("\nTest 7d Failed\n");
                $finish;
            end 
        end
        
        
        $display("\nAll test Passed\n");
        $finish;
    end
    
    initial begin:CLK_GEN
        forever begin
            t_clk<=1;
            #0.5;
            t_clk<=0;
            #0.5;
        end
    end
endmodule
