`timescale 1ns / 1ps
`default_nettype none

module RC5_Encoder(
    input wire clr, 
    input wire clk,
    input wire key_rdy,
    input wire di_vld,
    input wire [63:0] din,
    input wire [1:832] skeyin,
    output wire [63:0] dout,
    output reg do_rdy
    );
    
    // up counter
    reg [3:0] i_cnt;
    
    // wires register to store value A
    wire [31:0] a_pre;
    reg [31:0] a_reg;
    wire [31:0] ab_xor;
    wire [31:0] a_rot;
    wire [31:0] a;
    
    // wires, register to store value B
    wire [31:0] b_pre;
    reg [31:0] b_reg;
    wire [31:0] ba_xor;
    wire [31:0] b_rot;
    wire [31:0] b;
    
    // skey declaration
    wire [31:0] rom [0:25];
    assign rom[0] = skeyin[1:32];
    assign rom[1] = skeyin[33:64];
    assign rom[2] = skeyin[65:96];
    assign rom[3] = skeyin[97:128];
    assign rom[4] = skeyin[129:160];
    assign rom[5] = skeyin[161:192];
    assign rom[6] = skeyin[193:224];
    assign rom[7] = skeyin[225:256];
    assign rom[8] = skeyin[257:288];
    assign rom[9] = skeyin[289:320];
    assign rom[10] =skeyin[321:352];
    assign rom[11] =skeyin[353:384];
    assign rom[12] =skeyin[385:416];
    assign rom[13] =skeyin[417:448];
    assign rom[14] =skeyin[449:480];
    assign rom[15] =skeyin[481:512];
    assign rom[16] =skeyin[513:544];
    assign rom[17] =skeyin[545:576];
    assign rom[18] =skeyin[577:608];
    assign rom[19] =skeyin[609:640];
    assign rom[20] =skeyin[641:672];
    assign rom[21] =skeyin[673:704];
    assign rom[22] =skeyin[705:736];
    assign rom[23] =skeyin[737:768];
    assign rom[24] =skeyin[769:800];
    assign rom[25] =skeyin[801:832];
    
    // State Variable
    reg [0:1] s;
    
    // State Machine
    always @(posedge clk or negedge clr) begin
        if (clr==0) s <= 2'd0;
        else if (clk) begin
            case(s) 
                // Idle STATE
                2'd0: begin
                    if(di_vld) s <= 2'd1;
                end
                // First-Encryption STATE
                2'd1: begin
                    do_rdy<=0;
                    s <= 2'd2;
                end
                // Encryption STATE
                2'd2: begin
                    if(i_cnt == 4'd12) s <= 2'd3;
                end
                // Encrypted STATE
                2'd3: begin
                    do_rdy<=1;
                    s <= 2'd0;
                end
            endcase
        end
    end
        
    assign a_pre = din[63:32] + rom[0];    // A = A + S[0] 
    
    // Operation for A=((A XOR B)<<<B) + S[2×i];
    assign ab_xor = a_reg ^ b_reg;
    assign a_rot = (b_reg[4:0] == 5'b00001) ? {ab_xor[30:0], ab_xor[31]} :
                   (b_reg[4:0] == 5'b00010) ? {ab_xor[29:0], ab_xor[31:30]} :
                   (b_reg[4:0] == 5'b00011) ? {ab_xor[28:0], ab_xor[31:29]} :
                   (b_reg[4:0] == 5'b00100) ? {ab_xor[27:0], ab_xor[31:28]} :
                   (b_reg[4:0] == 5'b00101) ? {ab_xor[26:0], ab_xor[31:27]} :
                   (b_reg[4:0] == 5'b00110) ? {ab_xor[25:0], ab_xor[31:26]} :
                   (b_reg[4:0] == 5'b00111) ? {ab_xor[24:0], ab_xor[31:25]} :
                   (b_reg[4:0] == 5'b01000) ? {ab_xor[23:0], ab_xor[31:24]} :
                   (b_reg[4:0] == 5'b01001) ? {ab_xor[22:0], ab_xor[31:23]} :
                   (b_reg[4:0] == 5'b01010) ? {ab_xor[21:0], ab_xor[31:22]} :
                   (b_reg[4:0] == 5'b01011) ? {ab_xor[20:0], ab_xor[31:21]} :
                   (b_reg[4:0] == 5'b01100) ? {ab_xor[19:0], ab_xor[31:20]} :
                   (b_reg[4:0] == 5'b01101) ? {ab_xor[18:0], ab_xor[31:19]} :
                   (b_reg[4:0] == 5'b01110) ? {ab_xor[17:0], ab_xor[31:18]} :
                   (b_reg[4:0] == 5'b01111) ? {ab_xor[16:0], ab_xor[31:17]} :
                   (b_reg[4:0] == 5'b10000) ? {ab_xor[15:0], ab_xor[31:16]} :
                   (b_reg[4:0] == 5'b10001) ? {ab_xor[14:0], ab_xor[31:15]} :
                   (b_reg[4:0] == 5'b10010) ? {ab_xor[13:0], ab_xor[31:14]} :
                   (b_reg[4:0] == 5'b10011) ? {ab_xor[12:0], ab_xor[31:13]} :
                   (b_reg[4:0] == 5'b10100) ? {ab_xor[11:0], ab_xor[31:12]} :
                   (b_reg[4:0] == 5'b10101) ? {ab_xor[10:0], ab_xor[31:11]} :
                   (b_reg[4:0] == 5'b10110) ? {ab_xor[9:0], ab_xor[31:10]} :
                   (b_reg[4:0] == 5'b10111) ? {ab_xor[8:0], ab_xor[31:9]} :
                   (b_reg[4:0] == 5'b11000) ? {ab_xor[7:0], ab_xor[31:8]} :
                   (b_reg[4:0] == 5'b11001) ? {ab_xor[6:0], ab_xor[31:7]} :
                   (b_reg[4:0] == 5'b11010) ? {ab_xor[5:0], ab_xor[31:6]} :
                   (b_reg[4:0] == 5'b11011) ? {ab_xor[4:0], ab_xor[31:5]} :
                   (b_reg[4:0] == 5'b11100) ? {ab_xor[3:0], ab_xor[31:4]} :
                   (b_reg[4:0] == 5'b11101) ? {ab_xor[2:0], ab_xor[31:3]} :
                   (b_reg[4:0] == 5'b11110) ? {ab_xor[1:0], ab_xor[31:2]} :
                   (b_reg[4:0] == 5'b11111) ? {ab_xor[0], ab_xor[31:1]} :
                   ab_xor;
               
    assign a = a_rot + rom[{i_cnt, 1'b0}]; // S[2×i]
    
    
    assign b_pre = din[31:0] + rom[1];     // B = B + S[1]
    
    // Operation for B=((B XOR A)<<<A) + S[2×i+1];
    assign ba_xor = b_reg ^ a;
    assign b_rot = (a[4:0] == 5'b00001) ? {ba_xor[30:0], ba_xor[31]} :
                   (a[4:0] == 5'b00010) ? {ba_xor[29:0], ba_xor[31:30]} :
                   (a[4:0] == 5'b00011) ? {ba_xor[28:0], ba_xor[31:29]} :
                   (a[4:0] == 5'b00100) ? {ba_xor[27:0], ba_xor[31:28]} :
                   (a[4:0] == 5'b00101) ? {ba_xor[26:0], ba_xor[31:27]} :
                   (a[4:0] == 5'b00110) ? {ba_xor[25:0], ba_xor[31:26]} :
                   (a[4:0] == 5'b00111) ? {ba_xor[24:0], ba_xor[31:25]} :
                   (a[4:0] == 5'b01000) ? {ba_xor[23:0], ba_xor[31:24]} :
                   (a[4:0] == 5'b01001) ? {ba_xor[22:0], ba_xor[31:23]} :
                   (a[4:0] == 5'b01010) ? {ba_xor[21:0], ba_xor[31:22]} :
                   (a[4:0] == 5'b01011) ? {ba_xor[20:0], ba_xor[31:21]} :
                   (a[4:0] == 5'b01100) ? {ba_xor[19:0], ba_xor[31:20]} :
                   (a[4:0] == 5'b01101) ? {ba_xor[18:0], ba_xor[31:19]} :
                   (a[4:0] == 5'b01110) ? {ba_xor[17:0], ba_xor[31:18]} :
                   (a[4:0] == 5'b01111) ? {ba_xor[16:0], ba_xor[31:17]} :
                   (a[4:0] == 5'b10000) ? {ba_xor[15:0], ba_xor[31:16]} :
                   (a[4:0] == 5'b10001) ? {ba_xor[14:0], ba_xor[31:15]} :
                   (a[4:0] == 5'b10010) ? {ba_xor[13:0], ba_xor[31:14]} :
                   (a[4:0] == 5'b10011) ? {ba_xor[12:0], ba_xor[31:13]} :
                   (a[4:0] == 5'b10100) ? {ba_xor[11:0], ba_xor[31:12]} :
                   (a[4:0] == 5'b10101) ? {ba_xor[10:0], ba_xor[31:11]} :
                   (a[4:0] == 5'b10110) ? {ba_xor[9:0], ba_xor[31:10]} : 
                   (a[4:0] == 5'b10111) ? {ba_xor[8:0], ba_xor[31:9]} :  
                   (a[4:0] == 5'b11000) ? {ba_xor[7:0], ba_xor[31:8]} :  
                   (a[4:0] == 5'b11001) ? {ba_xor[6:0], ba_xor[31:7]} :  
                   (a[4:0] == 5'b11010) ? {ba_xor[5:0], ba_xor[31:6]} :  
                   (a[4:0] == 5'b11011) ? {ba_xor[4:0], ba_xor[31:5]} :  
                   (a[4:0] == 5'b11100) ? {ba_xor[3:0], ba_xor[31:4]} :  
                   (a[4:0] == 5'b11101) ? {ba_xor[2:0], ba_xor[31:3]} :  
                   (a[4:0] == 5'b11110) ? {ba_xor[1:0], ba_xor[31:2]} :  
                   (a[4:0] == 5'b11111) ? {ba_xor[0], ba_xor[31:1]} :                                   
                   ba_xor;

    assign b = b_rot + rom[{i_cnt, 1'b1}]; //S[2×i+1]
    
  
    // Update funtion for a_reg
    always @(posedge clk or negedge clr) begin
        if(clr==0) a_reg <= 32'd0;
        else if(clk) begin
            if(s==2'd1) a_reg <= a_pre;
            else if(s==2'd2) a_reg <= a;
        end
    end
    
    // Update funtion for b_reg
    always @(posedge clk or negedge clr) begin
        if(clr==0) b_reg <= 32'd0;
        else if(clk) begin
            if(s==2'd1) b_reg <= b_pre;
            else if(s==2'd2) b_reg <= b;
        end
    end
    
    // Update funtion for i_cnt counter
    always @(posedge clk or negedge clr) begin
        if (clr==0) begin 
            i_cnt <= 4'd1;
        end 
        else if (clk) begin
            if(s==2'd2) begin
                if(i_cnt==4'd12) i_cnt <= 4'd1;
                else i_cnt <= i_cnt + 4'd1;
            end
        end 
    end
    
    // Assign encrypted output
    assign dout={a_reg,b_reg};

endmodule
