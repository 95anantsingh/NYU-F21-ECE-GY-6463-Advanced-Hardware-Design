`timescale 1ns / 1ps
`default_nettype none

module PRNumGen(
    input wire clk,                 // clock
    input wire rstn,                // reset
    input wire get_random,          // Random Output Request
    output wire [0:7] data_out      // Output Data port
    );
    
    reg L_en=0;                     // LFSR Module Enable bit
    wire [0:31] data;               // LFSR Output port
    // LFSR Initialization
    LFSR L(.clk(clk),.rstn(rstn),.L_en(L_en),.data(data));
    
    reg DO_en=0;                    // DOut Module Enable bit
    wire DOdone;                    // bit to denote Data Output cycle is Complete
    // DOut Initialization
    DOut DO(.clk(clk),.rstn(rstn),.DO_en(DO_en),.get_random(get_random),.data(data),.DOdone(DOdone),.data_out(data_out));

    reg s=0;                        // State variable for Next State Machine 1
    reg gr=0;                       // bit for changing states on geting output request
    
    // Next State Machine 1
    always @(posedge clk or negedge rstn) begin
        case(s)
            2'd0: begin
                if(gr&&rstn) s<=1;              // change state when get_random has been high in previous cycle
            end
            2'd1: begin
                if(rstn==0) s<=0;               // change state on reset
                else if(DOdone) s<=0;           // change state when Data Out cycle is complete
            end            
        endcase
    end
    
    // Control Block 1
    always @ (s,get_random) begin
        case(s)
            2'd0: begin                         // enable LFSR Module disable DOut Module
                L_en<=1;  
                DO_en<=0; 
                if(get_random) gr<=1;           // set gr high on get_random =1 so that in next cycle state can be changed
            end
            2'd1: begin                         // disable LFSR Module disable DOut Module
                L_en<=0;
                DO_en<=1;
                if(get_random==0) gr<=0;        // set gr low on get_random =0
            end
        endcase
    end
endmodule

module DOut(
    input wire clk,
    input wire rstn,
    input wire DO_en,
    input wire get_random,
    input wire [0:31] data,
    output reg DOdone=0,
    output reg [0:7] data_out
);
    
    reg [0:1] s=2'd0;                           // State variable for Next state Machine 2
    
    // Next State Machine 2
    always @(posedge clk or negedge rstn)begin
        if(rstn==0) s<=2'd0;                    // If low reset change state to 0 
        else if (DO_en) begin                   // If Module is enabled continue states
            case(s)
                2'd0: begin
                    s<=2'd1;
                end
                2'd1: begin
                    s<=2'd2;
                end
                2'd2: begin
                    s<=2'd3;
                end
                2'd3: begin
                    s<=2'd0;
                end
            endcase
        end
    end
    
    // Control Block 2
    always @(s,DO_en) begin  
        if(DOdone==0) begin                     // If Data Output cycle is not yet complete
        case(s)
            2'd0: begin
                data_out<=data[24:31];          // Output least significant 8 bits
            end
            2'd1: begin
                data_out<=data[16:23];          // Output next 8 bits
            end
            2'd2: begin
                data_out<=data[8:15];           // Output next 8 bits
            end
            2'd3: begin         
                data_out<=data[0:7];            // Output Most Significant 8 bits
                if(get_random==0) DOdone<=1;    // If Output request is no longer then mark Output cycle as Complete
                else DOdone<=0;                 // Else Continue the Output cycle again
            end
        endcase
        end
        if(DO_en==0)  begin                     // If DOut Module is disabled
            data_out<=2'd0;                     // set output to 0
            DOdone<=0;                          // Mark Output cycle as incomplete so that next time state machine works as expected
        end
    end
endmodule

module LFSR(
    input wire clk,
    input wire rstn,
    input wire L_en,
    output wire [0:31] data
);
    reg [0:31] data_reg = 32'h02468ACD;             // register for storing shift result, set default seed
    wire data_1;                                    // wires for xor operation
    wire data_2;
    wire data_3;
    wire data_4;
    wire data_5;
    wire data_6;
    wire [0:31] data_f;                             // wire for final value
    
    assign data_1 = data_reg[31] ^ data_reg[13];    // 31 bit xor 13 bit
    assign data_2 = data_reg[11] ^ data_1;          // 11 bit xor last xor output
    assign data_3 = data_reg[9] ^ data_2;           // 9 bit xor last xor output
    assign data_4 = data_reg[5] ^ data_3;           // 51 bit xor last xor output
    assign data_5 = data_reg[4] ^ data_4;           // 4 bit xor last xor output
    assign data_6 = data_reg[0] ^ data_5;           // 0 bit xor last xor output
    
    assign data_f = {data_6,data_reg[0:30]};        // shift
    
    always @(posedge clk or negedge rstn) begin
        if (rstn==0) data_reg <= 32'h02468ACD;      // If reset=0, reset value to default
        else if (L_en)                              
            data_reg <= data_f;                     // if Module is enabled update register value for next shift 
    end
    assign data = data_reg;                         // link data_reg and output data
endmodule

