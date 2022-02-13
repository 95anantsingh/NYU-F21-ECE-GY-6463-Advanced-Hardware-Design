`timescale 1ns / 1ps


module RC5_Encoder(
    input wire clr, 
    input wire clk,
    input wire [63:0] din,
    output wire [63:0] dout
    );
    
    //encoded
    reg encoded = 0;
    
    //up counter
    reg [3:0] i_cnt;
    
    // wires register to store value A
    reg [31:0] a_reg;
    wire [31:0] ab_xor;
    wire [31:0] a_rot;
    wire [31:0] a;
    
    //register to store value B
    reg [31:0] b_reg;
    wire [31:0] ba_xor;
    wire [31:0] b_rot;
    wire [31:0] b;
    
    //skey declaration
    reg [31:0] rom [2:25];
    
    //skey initiation
    initial begin
        rom[2] = 32'h46F8E8C5;
        rom[3] = 32'h460C6085;
        rom[4] = 32'h70F83B8A;
        rom[5] = 32'h284B8303;
        rom[6] = 32'h513E1454;
        rom[7] = 32'hF621ED22;
        rom[8] = 32'h3125065D;
        rom[9] = 32'h11A83A5D;
        rom[10] = 32'hD427686B;
        rom[11] = 32'h713AD82D;
        rom[12] = 32'h4B792F99;
        rom[13] = 32'h2799A4DD;
        rom[14] = 32'hA7901C49;
        rom[15] = 32'hDEDE871A;
        rom[16] = 32'h36C03196;
        rom[17] = 32'hA7EFC249;
        rom[18] = 32'h61A78BB8;
        rom[19] = 32'h3B0A1D2B;
        rom[20] = 32'h4DBFCA76;
        rom[21] = 32'hAE162167;
        rom[22] = 32'h30D76B0A;
        rom[23] = 32'h43192304;
        rom[24] = 32'hF6CC1431;
        rom[25] = 32'h65046380;
    end
    
 
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
    assign a = a_rot + rom[{i_cnt, 1'b0}]; //S[2×i]
    
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
    always @(negedge clr or posedge clk) begin
        if(clr==0) a_reg <= din[63:32];
        else if (encoded==0) a_reg <= a;
    end
    
    // Update funtion for b_reg
    always @(negedge clr or posedge clk) begin
        if(clr==0) b_reg<=din[31:0];
        else if(encoded==0) b_reg <= b;
    end
    
    // Update funtion for i_cnt counter
    always @(negedge clr or posedge clk) begin
        if (clr==0) begin 
            i_cnt <= 4'b0001;
            encoded =0;
        end 
        else begin
            if(i_cnt==4'b1100) 
                encoded=1;
            else
                i_cnt<=i_cnt+4'b0001;
        end 
    end
    
    // Assign encrypted output
    assign dout={a_reg,b_reg};
endmodule
