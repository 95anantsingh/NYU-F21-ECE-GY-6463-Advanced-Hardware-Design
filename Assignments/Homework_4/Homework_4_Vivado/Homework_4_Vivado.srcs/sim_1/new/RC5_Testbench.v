`timescale 1ns / 1ps

module RC5_Testbench(
    );
    reg t_clr=0; 
    reg t_clk=1;
    wire [63:0] t_din;
    wire [63:0] t_dout;
    
//    RC5_Decoder_VHDL DUT(
//    RC5_Encoder_VHDL DUT(
    RC5_Decoder DUT(
//    RC5_Encoder DUT(
                    .clr(t_clr),
                    .clk(t_clk),
                    .din(t_din),
                    .dout(t_dout)
                    );
    
    integer file_pointer;
    reg[63:0] f_din;
    reg[63:0] f_dout;
    
    assign t_din = f_din;
    reg [6:0] i=1;
    
    initial begin:TEST_PROCESS
        file_pointer = $fopen("Testcases.txt","r");
        if(file_pointer==0) begin
            $display("Couldn't open the file.");
            $finish;
        end
        
        // Test for Values
        while(!$feof(file_pointer)) begin
            // Uncomment for Decoder Testing
            $fscanf(file_pointer,"%x %x\n",f_dout,f_din);
            
            // Uncomment for Encoder Testing            
//            $fscanf(file_pointer,"%x %x\n",f_din,f_dout);
            
            t_clr<=0;
            #1;
            t_clr<=1;
            #12;
            
            if(t_dout != f_dout) begin
                $display("\nTest %d Failed.\nIn: %x\tOut: %x\tCorrect Out: %x\n",i,t_din,t_dout,f_dout);
                $finish;
            end
            else $display("Test %d Passed",i); 
            i=i+1;     
                
        end
        
        // Test for holding output value
        #5;
        if(t_dout != f_dout) begin
                $display("\nTest Failed for Holding value.\n");
                $finish;
            end
            else $display("Test Passed for Holding value");
        
        // Test for Clear in between of a Cycle
        t_clr<=0;
        #1;
        t_clr<=1;
        #5;
        t_clr<=0;
        #1
        if(t_din != f_din || f_din != t_dout) begin
            $display("\nTest Failed for Clear in between\n");
            $finish;
        end
        else $display("Test Passed for Clear in between");
        #1
        
        // Test for Continuous Clear during a Cycle
        t_clr<=1;
        #2;
        t_clr<=0;
        #3
        if(t_din != f_din || f_din != t_dout) begin
            $display("\nTest Failed for Continuous Clear\n");
            $finish;
        end
        else $display("Test Passed for Continuous Clear");
        
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
