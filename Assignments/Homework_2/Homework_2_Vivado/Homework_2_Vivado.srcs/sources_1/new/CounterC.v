
// Up Counter Resets to 9 counts 9-15

`timescale 1ns / 1ps

module CounterC(
    input wire clk, reset, enable,
    output wire [3:0] cnt
    );
    
    reg [3:0] i_cnt = 4'b1001;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1)
            i_cnt <= 4'b1001;
        else if(enable == 1) 
        begin
            if(clk == 1) 
            begin
                if(i_cnt == 4'b1111)
                    i_cnt <= 4'b1001;
                else 
                    i_cnt <= i_cnt + 1;
            end
        end
    end
    assign cnt = i_cnt;
endmodule
