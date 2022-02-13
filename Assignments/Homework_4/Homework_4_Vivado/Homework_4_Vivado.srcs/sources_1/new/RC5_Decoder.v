`timescale 1ns / 1ps

module RC5_Decoder(
    input wire clr, 
    input wire clk,
    input wire [63:0] din,
    output wire [63:0] dout
    );
    
    //decoded
    reg decoded = 0;
    
    //down counter
    reg [3:0] i_cnt;
    
    //wires, register to store value A 
    reg [31:0] a_reg;
    wire [31:0] as_sub;
    wire [31:0] a_rot;
    wire [31:0] a;
    
    //wires, register to store value B 
    reg [31:0] b_reg;
    wire [31:0] bs_sub;
    wire [31:0] b_rot;
    wire [31:0] b;
    
    //skey declaration
    reg [31:0] rom [2:25];
    integer i =0;
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
    
    // Operation for B=((B - S[2i+1])>>>A) xor A
    assign bs_sub = b_reg - rom[{i_cnt,1'b1}];
    assign b_rot = (a_reg[4:0] == 5'b00001) ? {bs_sub[0], bs_sub[31:1]}:
                   (a_reg[4:0] == 5'b00010) ? {bs_sub[1:0], bs_sub[31:2]}:
                   (a_reg[4:0] == 5'b00011) ? {bs_sub[2:0], bs_sub[31:3]}:
                   (a_reg[4:0] == 5'b00100) ? {bs_sub[3:0], bs_sub[31:4]}:
                   (a_reg[4:0] == 5'b00101) ? {bs_sub[4:0], bs_sub[31:5]}:
                   (a_reg[4:0] == 5'b00110) ? {bs_sub[5:0], bs_sub[31:6]}:
                   (a_reg[4:0] == 5'b00111) ? {bs_sub[6:0], bs_sub[31:7]}:
                   (a_reg[4:0] == 5'b01000) ? {bs_sub[7:0], bs_sub[31:8]}:
                   (a_reg[4:0] == 5'b01001) ? {bs_sub[8:0], bs_sub[31:9]}:
                   (a_reg[4:0] == 5'b01010) ? {bs_sub[9:0], bs_sub[31:10]}:
                   (a_reg[4:0] == 5'b01011) ? {bs_sub[10:0], bs_sub[31:11]}:
                   (a_reg[4:0] == 5'b01100) ? {bs_sub[11:0], bs_sub[31:12]}:
                   (a_reg[4:0] == 5'b01101) ? {bs_sub[12:0], bs_sub[31:13]}:
                   (a_reg[4:0] == 5'b01110) ? {bs_sub[13:0], bs_sub[31:14]}:
                   (a_reg[4:0] == 5'b01111) ? {bs_sub[14:0], bs_sub[31:15]}:
                   (a_reg[4:0] == 5'b10000) ? {bs_sub[15:0], bs_sub[31:16]}:
                   (a_reg[4:0] == 5'b10001) ? {bs_sub[16:0], bs_sub[31:17]}:
                   (a_reg[4:0] == 5'b10010) ? {bs_sub[17:0], bs_sub[31:18]}:
                   (a_reg[4:0] == 5'b10011) ? {bs_sub[18:0], bs_sub[31:19]}:
                   (a_reg[4:0] == 5'b10100) ? {bs_sub[19:0], bs_sub[31:20]}:
                   (a_reg[4:0] == 5'b10101) ? {bs_sub[20:0], bs_sub[31:21]}:
                   (a_reg[4:0] == 5'b10110) ? {bs_sub[21:0], bs_sub[31:22]}:
                   (a_reg[4:0] == 5'b10111) ? {bs_sub[22:0], bs_sub[31:23]}:
                   (a_reg[4:0] == 5'b11000) ? {bs_sub[23:0], bs_sub[31:24]}:
                   (a_reg[4:0] == 5'b11001) ? {bs_sub[24:0], bs_sub[31:25]}:
                   (a_reg[4:0] == 5'b11010) ? {bs_sub[25:0], bs_sub[31:26]}:
                   (a_reg[4:0] == 5'b11011) ? {bs_sub[26:0], bs_sub[31:27]}:
                   (a_reg[4:0] == 5'b11100) ? {bs_sub[27:0], bs_sub[31:28]}:
                   (a_reg[4:0] == 5'b11101) ? {bs_sub[28:0], bs_sub[31:29]}:
                   (a_reg[4:0] == 5'b11110) ? {bs_sub[29:0], bs_sub[31:30]}:
                   (a_reg[4:0] == 5'b11111) ? {bs_sub[30:0], bs_sub[31]}:
                   bs_sub;
    assign b = b_rot ^ a_reg;
    
    // Operation for A=((A - S[2i])>>>B) xor B
    assign as_sub = a_reg - rom[{i_cnt,1'b0}];
    assign a_rot = (b[4:0] == 5'b00001) ? {as_sub[0], as_sub[31:1]}:
                   (b[4:0] == 5'b00010) ? {as_sub[1:0], as_sub[31:2]}:
                   (b[4:0] == 5'b00011) ? {as_sub[2:0], as_sub[31:3]}:
                   (b[4:0] == 5'b00100) ? {as_sub[3:0], as_sub[31:4]}:
                   (b[4:0] == 5'b00101) ? {as_sub[4:0], as_sub[31:5]}:
                   (b[4:0] == 5'b00110) ? {as_sub[5:0], as_sub[31:6]}:
                   (b[4:0] == 5'b00111) ? {as_sub[6:0], as_sub[31:7]}:
                   (b[4:0] == 5'b01000) ? {as_sub[7:0], as_sub[31:8]}:
                   (b[4:0] == 5'b01001) ? {as_sub[8:0], as_sub[31:9]}:
                   (b[4:0] == 5'b01010) ? {as_sub[9:0], as_sub[31:10]}:
                   (b[4:0] == 5'b01011) ? {as_sub[10:0], as_sub[31:11]}:
                   (b[4:0] == 5'b01100) ? {as_sub[11:0], as_sub[31:12]}:
                   (b[4:0] == 5'b01101) ? {as_sub[12:0], as_sub[31:13]}:
                   (b[4:0] == 5'b01110) ? {as_sub[13:0], as_sub[31:14]}:
                   (b[4:0] == 5'b01111) ? {as_sub[14:0], as_sub[31:15]}:
                   (b[4:0] == 5'b10000) ? {as_sub[15:0], as_sub[31:16]}:
                   (b[4:0] == 5'b10001) ? {as_sub[16:0], as_sub[31:17]}:
                   (b[4:0] == 5'b10010) ? {as_sub[17:0], as_sub[31:18]}:
                   (b[4:0] == 5'b10011) ? {as_sub[18:0], as_sub[31:19]}:
                   (b[4:0] == 5'b10100) ? {as_sub[19:0], as_sub[31:20]}:
                   (b[4:0] == 5'b10101) ? {as_sub[20:0], as_sub[31:21]}:
                   (b[4:0] == 5'b10110) ? {as_sub[21:0], as_sub[31:22]}:
                   (b[4:0] == 5'b10111) ? {as_sub[22:0], as_sub[31:23]}:
                   (b[4:0] == 5'b11000) ? {as_sub[23:0], as_sub[31:24]}:
                   (b[4:0] == 5'b11001) ? {as_sub[24:0], as_sub[31:25]}:
                   (b[4:0] == 5'b11010) ? {as_sub[25:0], as_sub[31:26]}:
                   (b[4:0] == 5'b11011) ? {as_sub[26:0], as_sub[31:27]}:
                   (b[4:0] == 5'b11100) ? {as_sub[27:0], as_sub[31:28]}:
                   (b[4:0] == 5'b11101) ? {as_sub[28:0], as_sub[31:29]}:
                   (b[4:0] == 5'b11110) ? {as_sub[29:0], as_sub[31:30]}:
                   (b[4:0] == 5'b11111) ? {as_sub[30:0], as_sub[31]}:
                   as_sub;
    assign a = a_rot ^ b;
    

    // Update funtion for a_reg
    always @(negedge clr or posedge clk) begin
        if(clr==0) a_reg <= din[63:32];
        else if (decoded==0) a_reg <= a;
    end

    // Update funtion for b_reg
    always @(negedge clr or posedge clk) begin
        if(clr==0) b_reg<=din[31:0];
        else if(decoded==0) b_reg <= b;
    end
    
    // Update funtion for i_cnt counter
    always @(negedge clr or posedge clk) begin
        if (clr==0) begin 
            i_cnt <= 4'b1100;
            decoded=0;
        end 
        else begin
            if(i_cnt==4'b0001) 
                decoded=1;
            else
                i_cnt<=i_cnt-4'b0001;
        end 
    end    
    
    // Assign decrypted output
    assign dout={a_reg,b_reg};
    
endmodule
