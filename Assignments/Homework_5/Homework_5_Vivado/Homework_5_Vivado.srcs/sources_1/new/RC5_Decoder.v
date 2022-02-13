`timescale 1ns / 1ps
`default_nettype none

module RC5_Decoder(
    input wire clr, 
    input wire clk,
    input wire key_rdy,
    input wire di_vld,
    input wire [63:0] din,
    input wire [1:832] skeyin,
    output wire [63:0] dout,
    output reg do_rdy
    );

    // down counter
    reg [3:0] i_cnt;
    
    // wires, register to store value A 
    reg [31:0] a_reg;
    wire [31:0] as_sub;
    wire [31:0] a_rot;
    wire [31:0] a;
    wire [31:0] a_post;
    
    // wires, register to store value B 
    reg [31:0] b_reg;
    wire [31:0] bs_sub;
    wire [31:0] b_rot;
    wire [31:0] b;
    wire [31:0] b_post;
    
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
        if (!clr) begin 
            do_rdy<=0;
            s <= 2'd0;
        end
        else if (clk) begin
            case(s) 
                // Idle STATE
                2'd0: begin
                    if(di_vld) begin
                        s <= 2'd1;
                        a_reg <= din[63:32];
                        b_reg <= din[31:0];
                        do_rdy<=0;
                    end
                end
                // Decryption STATE
                2'd1: begin
                    
                    if(i_cnt == 4'd2) s <= 2'd2;
                end
                // Last-Decryption STATE
                2'd2: begin
                   s <= 2'd3;
                end
                // Decrypted STATE
                2'd3: begin
                    do_rdy<=1;
                    s <= 2'd0;
                end
            endcase
        end
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
    assign b_post = b - rom[1];
    
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
    assign a_post = a - rom[0];


    // Update funtion for a_reg
    always @(negedge clr or posedge clk) begin
        if(!clr) a_reg <= 32'd0;
        else if (clk)begin                       
            if(s==2'd1) a_reg <= a;
            if(s==2'd2) a_reg <= a_post;
        end
    end

    // Update funtion for b_reg
    always @(negedge clr or posedge clk) begin
        if(!clr) b_reg<= 32'd0;
        else if(clk) begin
            if(s==2'd1) b_reg <= b;
            if(s==2'd2) b_reg <= b_post;
        end
    end
    
    // Update funtion for i_cnt counter
    always @(negedge clr or posedge clk) begin
        if (!clr) begin 
            i_cnt <= 4'd12;
        end 
        else if(clk) begin
            if(s==2'd1||s==2'd2) begin
                if(i_cnt==4'd1) i_cnt <= 4'd12;
                else i_cnt<=i_cnt-4'd1;
            end
        end 
    end    
    
    // Assign decrypted output
    assign dout={a_reg,b_reg};

endmodule
