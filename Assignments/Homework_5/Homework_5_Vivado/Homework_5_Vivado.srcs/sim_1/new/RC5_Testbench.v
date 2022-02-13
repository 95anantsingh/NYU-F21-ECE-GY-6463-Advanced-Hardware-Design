`timescale 1ns / 1ps
`default_nettype none

module RC5_Testbench(
    );
    
    reg t_clk;                  
    reg t_rst;      
                      
    reg t_start_generating_skey;
    reg [127:0] t_user_key;
    wire t_key_done;
                   
    reg t_start_encryption;     
    reg t_start_decryption;     
    reg [63:0] t_din;                 
    wire [63:0] t_dout;                
    wire t_done;      
    
    RC5_Complete DUT(.clk(t_clk),.rst(t_rst),.start_generating_skey(t_start_generating_skey), 
                     .user_key(t_user_key),.key_done(t_key_done),.start_encryption(t_start_encryption),
                     .start_decryption(t_start_decryption),.d_in(t_din),.d_out(t_dout),.done(t_done)
    );
    
    integer file_pointer;
    reg [127:0] f_skey;
    reg [63:0] f_din;
    reg [63:0] f_dout;
   
    integer i;
   
    initial begin:TEST_PROCESS
        file_pointer = $fopen("Testcases.txt","r");
        if(file_pointer==0) begin
            $display("Couldn't open the file.");
            $finish;
        end
        
        $fscanf(file_pointer,"%x",f_skey);
        $fscanf(file_pointer,"%x %x\n",f_din,f_dout);
  
        
     // Test 1 - Encryption only
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 1 Failed.\n");
            $finish;
        end
        t_start_encryption<=1;
        t_din <= f_din;
        #1;
        t_start_encryption<=0;
        #14;
        if(t_done != 1) begin
            $display("\nTest 1 Failed.\n");
            $finish;
        end
        if(t_dout != f_dout) begin
            $display("\nTest 1 Failed.\n");
            $finish;
        end
     
        
     // Test 2 - Decryption Only
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 2 Failed.\n");
            $finish;
        end
        t_start_decryption<=1;
        t_din <= f_dout;
        #1;
        t_start_decryption<=0;
        #13;
        if(t_done != 1) begin
            $display("\nTest 2 Failed.\n");
            $finish;
        end
        
        if(t_dout != f_din) begin
            $display("\nTest 2 Failed.\n");
            $finish;
        end
       
        
     // Test 3 - Both Encryption and Decryption
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 3 Failed.\n");
            $finish;
        end
        t_start_encryption<=1;
        t_din <= f_din;
        #1;
        t_start_encryption<=0;
        #1;
        if(t_done != 0) begin
            $display("\nTest 3 Failed.\n");
            $finish;
        end
        #12;
        
        if(t_dout != f_dout) begin
            $display("\nTest 3 Failed.\n");
            $finish;
        end
        
        t_start_decryption<=1;
        t_din <= f_dout;
        #1;
        t_start_decryption<=0;
        #14;
        if(t_done != 1) begin
            $display("\nTest 3 Failed.\n");
            $finish;
        end
        
        if(t_dout != f_din) begin
            $display("\nTest 3 Failed.\n");
            $finish;
        end
        
        
     // Test 4 - Reset Testing
        #2;
        t_rst<=0;
        #1;
        t_rst<=1;
        #1;
        if(t_done != 0) begin
            $display("\nTest 4 Failed.\n");
            $finish;
        end
        if(t_done != 0) begin
            $display("\nTest 4 Failed.\n");
            $finish;
        end
        if(t_dout != 64'd0) begin
            $display("\nTest 4 Failed.\n");
            $finish;
        end
        
        
     // Test 5 - Reset in between of Key Generation cycle
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #40;
        t_rst<=0;
        #1;
        t_rst<=1;
        #1;
        if(t_done != 0) begin
            $display("\nTest 5 Failed.\n");
            $finish;
        end
        if(t_done != 0) begin
            $display("\nTest 5 Failed.\n");
            $finish;
        end
        if(t_dout != 64'd0) begin
            $display("\nTest 5 Failed.\n");
            $finish;
        end
        
        
     // Test 6 - Reset in between of Encryption
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 6 Failed.\n");
            $finish;
        end
        t_start_encryption<=1;
        t_din <= f_din;
        #1;
        t_start_encryption<=0;
        #7;
        t_rst<=0;
        #1;
        t_rst<=1;
        #1;
        if(t_done != 0) begin
            $display("\nTest 6 Failed.\n");
            $finish;
        end
        if(t_done != 0) begin
            $display("\nTest 6 Failed.\n");
            $finish;
        end
        if(t_dout != 64'd0) begin
            $display("\nTest 6 Failed.\n");
            $finish;
        end
        
        
     // Test 7 - Reset in between of Decryption
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 7 Failed.\n");
            $finish;
        end
        t_start_decryption<=1;
        t_din <= f_dout;
        #1;
        t_start_decryption<=0;
        #6;
        t_rst<=0;
        #1;
        t_rst<=1;
        #1;
        if(t_done != 0) begin
            $display("\nTest 7 Failed.\n");
            $finish;
        end
        if(t_done != 0) begin
            $display("\nTest 7 Failed.\n");
            $finish;
        end
        if(t_dout != 64'd0) begin
            $display("\nTest 7 Failed.\n");
            $finish;
        end
             
             
     // Test 8 - Encryption in between of Decryption cycle
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 8 Failed.\n");
            $finish;
        end
        t_start_decryption<=1;
        t_din <= f_dout;
        #1;
        t_start_decryption<=0;
        #6;
        t_start_encryption<=1;
        t_din <= f_din;
        #1;
        t_start_encryption<=0;
        #14;
        if(t_done != 1) begin
            $display("\nTest 8 Failed.\n");
            $finish;
        end
        if(t_dout != f_dout) begin
            $display("\nTest 8 Failed.\n");
            $finish;
        end
        
        
     // Test 9 - Decryption in between of Encryption cycle
        t_rst<=0;
        #1;
        t_rst<=1;
        t_start_generating_skey<=1;
        #1;
        t_user_key<=f_skey;
        #1;
        t_start_generating_skey<=0;
        t_user_key<=0;
        #78;
        if(t_key_done != 1) begin
            $display("\nTest 9 Failed.\n");
            $finish;
        end
        t_start_encryption<=1;
        t_din <= f_din;
        #1;
        t_start_encryption<=0;
        #7;
        t_start_decryption<=1;
        t_din <= f_dout;
        #1;
        t_start_decryption<=0;
        #13;
        if(t_done != 1) begin
            $display("\nTest 9 Failed.\n");
            $finish;
        end
        
        if(t_dout != f_din) begin
            $display("\nTest 9 Failed.\n");
            $finish;
        end
                
        
     // Test 10 - Extensive Both Encryption and Decryption with different userkeys  
        while(!$feof(file_pointer)) begin
            
            $fscanf(file_pointer,"%x",f_skey);
            t_rst<=0;
            #1;
            t_rst<=1;
            t_start_generating_skey<=1;
            #1;
            t_user_key<=f_skey;
            #1;
            t_start_generating_skey<=0;
            t_user_key<=0;
            #78;
            if(t_key_done != 1) begin
                $display("\nExtensive Test Failed.\n");
                $finish;
            end
            
            for (i=0;i<25;i=i+1) begin
            
                $fscanf(file_pointer,"%x %x\n",f_din,f_dout);
    
                t_start_encryption<=1;
                t_din <= f_din;
                #1;
                t_start_encryption<=0;
                #14;
                if(t_done != 1) begin
                    $display("\nExtensive Test Failed.\n");
                    $finish;
                end
                
                t_start_decryption<=1;
                t_din <= f_dout;
                #1;
                if(t_done != 0) begin
                    $display("\nExtensive Test Failed.\n");
                    $finish;
                end
                t_start_decryption<=0;
                #12;
                if(t_dout != f_din) begin
                    $display("\nExtensive Test Failed.\n");
                    $finish;
                end
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
