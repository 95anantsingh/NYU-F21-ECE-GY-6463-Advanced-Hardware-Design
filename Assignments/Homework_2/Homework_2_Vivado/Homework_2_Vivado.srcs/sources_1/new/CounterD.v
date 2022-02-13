
// Down Counter Resets to 4 counts 4-0

`timescale 1ns / 1ps

module CounterD(
    input wire clk, reset, enable,
    output wire [3:0] cnt
    );
    
    reg [3:0] i_cnt = 4'b0100;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset == 1)
            i_cnt <= 4'b0100;
        else if(enable == 1) 
        begin
            if(clk == 1) 
            begin
                if(i_cnt == 4'b0000)
                    i_cnt <= 4'b0100;
                else 
                    i_cnt <= i_cnt - 1;
            end
        end
    end
    assign cnt = i_cnt;
endmodule
