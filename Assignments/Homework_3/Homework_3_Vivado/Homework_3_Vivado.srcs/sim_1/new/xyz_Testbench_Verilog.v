`timescale 1ns / 1ps

module xyz_Testbench_Verilog();
    
    // reg t_A,t_B,t_O_E;
    // OR
    reg t_A = 0;
    reg t_B = 0;
    reg t_O_E = 0;
    wire t_X,t_Y,t_Z;
    
//     Verilog_Quiz_VHDL DUT(.A(t_A), .B(t_B), .O_E(t_O_E),
//                            .X(t_X), .Y(t_Y), .Z(t_Z)
//                            );
    
    Verilog_Quiz_Verilog DUT(.A(t_A), .B(t_B), .O_E(t_O_E),
                            .X(t_X), .Y(t_Y), .Z(t_Z)
                            );
    initial begin:xyz_Tester
    
        // 000
        t_A<=0;t_B<=0;t_O_E<=0;
        #1;
        if (t_X!=0 || t_Y!=0 || t_Z!=0) $fatal(0,"Error in Case 000");
        //OR
        //if (t_X!=0) $fatal(0,"X Error in Case 000");
        //if (t_Y!=0) $fatal(0,"Y Error in Case 000");
        //if (t_Z!=0) $fatal(0,"Z Error in Case 000");
        
        // 100
        t_A<=1;t_B<=0;t_O_E<=0;
        #1;
        if (t_X!=0 || t_Y!=0 || t_Z!=0) $fatal(1,"Error in Case 100");
        
        // 010
        t_A<=0;t_B<=1;t_O_E<=0;
        #1;
        if (t_X!=0 || t_Y!=0 || t_Z!=0) $fatal(1,"Error in Case 010");
        
        // 110
        t_A<=1;t_B<=1;t_O_E<=0;
        #1;
        if (t_X!=0 || t_Y!=0 || t_Z!=0) $fatal(1,"Error in Case 110");
        
        // 001
        t_A<=0;t_B<=0;t_O_E<=1;
        #1;
        if (t_X!=1 || t_Y!=0 || t_Z!=1) $fatal(1,"Error in Case 001");
        
        // 101
        t_A<=1;t_B<=0;t_O_E<=1;
        #1;
        if (t_X!=1 || t_Y!=1 || t_Z!=1) $fatal(1,"Error in Case 101");
        
        // 011
        t_A<=0;t_B<=1;t_O_E<=1;
        #1;
        if (t_X!=1 || t_Y!=1 || t_Z!=1) $fatal(1,"Error in Case 011");
        
        // 111
        t_A<=1;t_B<=1;t_O_E<=1;
        #1;
        if (t_X!=0 || t_Y!=0 || t_Z!=1) $fatal(1,"Error in Case 111");
        
        
        $display("All Test Passed");
        $finish;
    end                          
endmodule
