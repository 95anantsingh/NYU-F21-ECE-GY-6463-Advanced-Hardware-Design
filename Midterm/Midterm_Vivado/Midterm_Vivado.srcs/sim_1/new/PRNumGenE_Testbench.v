`timescale 1ns / 1ps
`default_nettype none

module PRNumGenE_Testbench(
    );
    reg t_clk=1;
    reg t_rstn=0;
    reg t_get_random=0;
    reg t_load_seed=0;
    reg [0:7] t_data_in=8'd0;
    wire [0:7] t_data_out;
    
    
    PRNumGenE DUT(.clk(t_clk),.rstn(t_rstn),.get_random(t_get_random),.load_seed(t_load_seed),.data_in(t_data_in),.data_out(t_data_out));
    
    integer file_pointer;
    reg [0:31] f_seed;
    reg [0:31] f_dout;
    reg [0:31] r_dout = 32'h81234566;
    
    
    initial begin: Test_Process
        file_pointer= $fopen("TestcasesE.txt","r");
        if(file_pointer==0) begin
            $display("Could'nt open file.");
            $finish;
        end
        
        $fscanf(file_pointer,"%x\n",f_seed);
        $fscanf(file_pointer,"%x\n",f_dout);

//--------- DataIn Loader Test -----------//
        
        //Test 1 - check for load_seed = 0 , rstn = 0
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 1 Failed\n");
            $finish;
        end 
        
        //Test 2 - check for load_seed = 1 , rstn = 0 
        t_load_seed<=1;
        #2;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 2 Failed\n");
            $finish;
        end
        t_load_seed<=0;
        
        //Test 3 - check if LFSR works against 1st input seed when load_seed is high for less than 4 cycles
        #1;
        t_rstn<=0;
        t_load_seed<=1;
        #0.5;
        t_rstn<=1;
        t_load_seed<=0;
        t_data_in<=f_seed[24:31];
        #1;
        t_data_in<=f_seed[16:23];
        #1;
        t_data_in<=f_seed[8:15];
        #1;
        t_data_in<=f_seed[0:7];
        #1.5;
        t_get_random<=1;
        t_data_in<=2'd0;
        #0.5;
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
        
        //Test 4 - check if LFSR works against 1st input seed when load_seed is high for more than 4 cycles
        #1;
        t_rstn<=0;
        t_load_seed<=1;
        #0.5;
        t_rstn<=1;
        #0.5;
        t_rstn<=1;
        t_data_in<=8'd01;
        #0.5;
        t_data_in<=8'd02;
        #1;
        t_data_in<=8'd03;
        #1;
        t_data_in<=8'd04;
        #1;
        t_data_in<=f_seed[24:31];
        #1;
        t_load_seed<=0;
        t_data_in<=f_seed[16:23];
        #1;
        t_data_in<=f_seed[8:15];
        #1;
        t_data_in<=f_seed[0:7];
        #1.5;
        t_get_random<=1;
        t_data_in<=2'd0;
        #0.5;
        t_get_random<=0;
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
        
        //Test 5 - Reset in mid input cycle when load_seed=1 for less than 4 cycles
        #1;
        t_rstn<=0;
        t_load_seed<=1;
        #0.5;
        t_rstn<=1;
        t_load_seed<=0;
        t_data_in<=f_seed[24:31];
        #1;
        t_data_in<=f_seed[16:23];
        #0.5;
        t_rstn<=0;
        #2.5;
        t_get_random<=1;
        t_rstn<=1;
        t_data_in<=2'd0;
        #0.5;
        t_get_random<=0;
        #1;
        //81234566
        if(t_data_out != 8'h66) begin
            $display ("\nTest 5a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != 8'h45) begin
            $display ("\nTest 5b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != 8'h23) begin
            $display ("\nTest 5c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != 8'h81) begin
            $display ("\nTest 5d Failed\n");
            $finish;
        end 
        
        //Test 6 - Reset in mid input cycle when load_seed=1 for less than 4 cycles
        #1;
        t_rstn<=0;
        t_load_seed<=1;
        #0.5;
        t_rstn<=1;
        t_data_in<=8'd01;
        #1;
        t_data_in<=8'd02;
        #1.5;
        t_rstn<=0;
        #2;
        t_rstn<=1;
        t_data_in<=f_seed[24:31];
        #1;
        t_data_in<=f_seed[16:23];
        #1;
        t_load_seed<=0;
        t_data_in<=f_seed[8:15];
        #1;
        t_data_in<=f_seed[0:7];
        #1;
        t_get_random<=1;
        t_data_in<=2'd0;
        #0.5;
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
        if(t_data_out != f_dout[8:15]) begin
            $display ("\nTest 6c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != f_dout[0:7]) begin
            $display ("\nTest 6d Failed\n");
            $finish;
        end  


//--------- DataOut Test -----------//

        t_rstn<=0;
        t_get_random<=0;
        t_load_seed<=0;
        t_data_in<=8'd0;
        
        //Test 7 - check if output is low when get_random = 0 , rstn = 0
        #1;
        if(t_data_out != 8'd0) begin
            $display ("\nTest 7 Failed\n");
            $finish;
        end 
        
        //Test 8 - check if output is low when get_random = 1 , rstn = 0
        t_get_random<=1;
        #2;
        if(t_data_out != 8'd0) begin
            $display ("\nTest 8 Failed\n");
            $finish;
        end
        t_get_random<=0;

         
        //Test 9 - check if LFSR works against 1st output when get random is low for less than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        t_get_random<=0;
        #1.5;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 9a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 9b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 9c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != r_dout[0:7]) begin
            $display ("\nTest 9d Failed\n");
            $finish;
        end 
        
        //Test 10 - test if get_random is high for more than 4 cycles
        
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        #1.5;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 10a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 10b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 10c Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != r_dout[0:7]) begin
            $display ("\nTest 10d Failed\n");
            $finish;
        end 
        t_get_random<=0;
        #1;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 10e Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 10f Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 10g Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != r_dout[0:7]) begin
            $display ("\nTest 10h Failed\n");
            $finish;
        end

        //Test 11 - Reset in mid output cycle when get_random is high for more than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        #1.5;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 11a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 11b Failed\n");
            $finish;
        end
        #1;
        t_rstn<=0;
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 11c Failed\n");
            $finish;
        end
        t_rstn<=1;
        #1;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 11d Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 11e Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 11f Failed\n");
            $finish;
        end 
        #1;
        if(t_data_out != r_dout[0:7]) begin
            $display ("\nTest 11g Failed\n");
            $finish;
        end
        t_get_random<=0;
         
        //Test 12 - Reset in mid output cycle when get_random is high for less than 4 cycle
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #0.5;
        t_rstn<=1;
        t_get_random<=0; 
        #1.5;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 12a Failed\n");
            $finish;
        end       
        #1;
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 12b Failed\n");
            $finish;
        end
        #1;
        t_rstn<=0;
        #1;
        if(t_data_out != 2'd0) begin
            $display ("\nTest 12c Failed\n");
            $finish;
        end
        t_rstn<=1;
        #1;
        if(t_data_out  != 2'd0) begin
            $display ("\nTest 12d Failed\n");
            $finish;
        end       
        #1;
         
         
        
//--------- DataOut and Dataload simultaneous Testing -----------//

        t_rstn<=0;
        t_get_random<=0;
        t_load_seed<=0;
        t_data_in<=8'd0;
         
        //Test 13 - Testing when get_random=1 after 1 cycle of load_seed=1, and get_random=1 both for less than 4 cycles
        #1;
        t_rstn<=0;
        #1;
        t_rstn<=1;
        t_load_seed<=1;
 
        #0.5;
        
        t_data_in<=f_seed[24:31];
        #0.5;
        t_load_seed<=0;
        t_get_random<=1;
        #1;
        t_data_in<=f_seed[16:23];
        t_get_random<=0;
        #1;
        t_data_in<=f_seed[8:15];
        if(t_data_out != f_seed[24:31]) begin
            $display ("\nTest 13a Failed\n");
            $finish;
        end
        #1;
        t_data_in<=f_seed[0:7];
        if(t_data_out != f_seed[16:23]) begin
            $display ("\nTest 13b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_seed[8:15]) begin
            $display ("\nTest 13b Failed\n");
            $finish;
        end
        #1;
        if(t_data_out != f_seed[0:7]) begin
            $display ("\nTest 13b Failed\n");
            $finish;
        end
        t_data_in<=8'h0;
        #1;
        
        //Test 14 - Testing when load_seed=1 after 1 cycle of and get_random=1, and get_random=1 both for less than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #1;
         t_rstn<=1;
        t_get_random<=0;
        t_load_seed<=1;
        
        #1;
        t_data_in<=f_seed[24:31];
        
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 14a Failed\n");
            $finish;
        end
        t_load_seed<=0;
        #1;
        t_data_in<=f_seed[16:23];
        
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 14b Failed\n");
            $finish;
        end
        #1;
        t_data_in<=f_seed[8:15];
        
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 14c Failed\n");
            $finish;
        end
        #1;
        t_data_in<=f_seed[0:7];
        if(t_data_out != r_dout[0:7]) begin
            $display ("\nTest 14d Failed\n");
            $finish;
        end
        
        #1;
        t_data_in<=8'h0;
        
        
        //Test 15 - Testing when rstn =0 mid cycle get_random=1 load_seed=1 both for less than 4 cycles
        #1;
        t_rstn<=0;
        t_get_random<=1;
        #1;
         t_rstn<=1;
      
        t_load_seed<=1;
        
        #1;
        t_data_in<=f_seed[24:31];
        
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 15a Failed\n");
            $finish;
        end
        t_rstn<=0;
        #2;
        t_rstn<=1;
        t_data_in<=f_seed[24:31];
        #1;
        if(t_data_out != r_dout[24:31]) begin
            $display ("\nTest 15b Failed\n");
            $finish;
        end
        
        
        t_data_in<=f_seed[16:23];
        #1;
        t_load_seed<=0; 
        if(t_data_out != r_dout[16:23]) begin
            $display ("\nTest 15c Failed\n");
            $finish;
        end
        
        t_data_in<=f_seed[8:15];
        #1;
        t_get_random<=0;
        
        if(t_data_out != r_dout[8:15]) begin
            $display ("\nTest 15d Failed\n");
            $finish;
        end
        
        t_data_in<=f_seed[0:7];
        #1;
       
        t_data_in<=8'h0;
        
        #3;
        // Last Test - Testing for remaining shifts generated from python program
        t_rstn<=0;
        #1;
        t_rstn<=1;
        t_load_seed<=1;
        #1;
        t_data_in<=f_seed[24:31];
        #1;
        t_load_seed<=0;
        t_data_in<=f_seed[16:23];
        #1;
        t_data_in<=f_seed[8:15];
        #1;
        t_data_in<=f_seed[0:7];
        #2;
        while(!$feof(file_pointer)) begin
            $fscanf(file_pointer,"%x\n",f_dout);
                   
            t_get_random<=1;
            #0.5;
            t_get_random<=0;
            #1.5;
            if(t_data_out != f_dout[24:31]) begin
                $display ("\nTest Last a Failed\n");
                $finish;
            end       
            #1;
            if(t_data_out != f_dout[16:23]) begin
                $display ("\nTest Last b Failed\n");
                $finish;
            end
            #1;
            if(t_data_out != f_dout[8:15]) begin
                $display ("\nTest Last c Failed\n");
                $finish;
            end 
            #1;
            if(t_data_out != f_dout[0:7]) begin
                $display ("\nTest Last d Failed\n");
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
