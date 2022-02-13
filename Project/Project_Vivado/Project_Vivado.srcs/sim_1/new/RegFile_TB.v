`timescale 1ns / 1ps

module RegFile_TB(

    );

    reg clk;
    reg [4:0] rs1;                 
    reg [4:0] rs2;                 
    reg [4:0] rd;                  
    reg we;                        
    reg [31:0] rd_data_in;         
    wire [31:0] rs1_data;          
    wire [31:0] rs2_data;
    
    RegFile DUT(.clk(clk), .we(we), .rd(rd),.rs1(rs1), .rs2(rs2),
                .rd_data_in(rd_data_in),.rs1_data(rs1_data), .rs2_data(rs2_data));    
    
    initial begin: CLK_GEN
        forever begin
            clk <=1;
            #5;
            clk <=0;
            #5;
        end
    end
    
    initial begin : TEST_PROCESS
    
 //write to reg 5
       rs1 <= 5'b00001;            
       rs2 <= 5'b00010;            
       we <=1;
       rd <= 5'b00101;             
       rd_data_in <= 32'h89ABCDEF;
       #10;
       
  //write to reg 6     
       we <=1;
       rs1 <= 5'b00001;            
       rs2 <= 5'b00010;            
       rd <=5'b00110;  
       rd_data_in <= 32'h01234567;
       #10;

  //retrieve from reg 5 and 6
       we <=0;
       rs1 <= 5'b00101;            
       rs2 <= 5'b00110;            
       rd <=5'b00001;  
       rd_data_in <= 32'd0;
       #1;
       if((rs1_data!=32'h89ABCDEF)&(rs2_data!=32'h01234567)) $fatal("Read Operation failed");
       #9;
       
       
  //writing is not possible to hardwired reg 0
       we<=1;
       rs1 <= 5'b00000;            
       rs2 <= 5'b00000;            
       rd <=5'b00000;  //Reg0
       rd_data_in <= 32'h01234567;
       #1;
       if((rs1_data!=32'h00000000)&(rs2_data!=32'h00000000)) $fatal("Register 0 is special read-only register, we cannot write to it even if write enable is high");
       #9;
  
       $display("All tests passed");
       $finish;
     
    end

endmodule

