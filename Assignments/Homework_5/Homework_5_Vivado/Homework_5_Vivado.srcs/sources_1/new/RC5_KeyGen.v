`timescale 1ns / 1ps
`default_nettype none

module RC5_KeyGen(
    input wire clk,
    input wire clr,
    input wire key_in,
    input wire [127:0] ukey,
    output wire key_rdy,
    output wire [1:832] skeyout
    );
    
    reg [31:0] a_reg;
    wire [31:0] a_tmp1;
    wire [31:0] a_tmp2;
    reg [31:0] b_reg;
    wire [31:0] b_tmp1;
    wire [31:0] b_tmp2;
    wire [31:0] ab_tmp;
    
    reg [31:0] l_arr [0:3];
    reg [31:0] s_arr_tmp [0:25];
    
    reg [0:4] i_cnt;      // 0-25
    reg [0:1] j_cnt;      // 0-3
    reg [0:6] k_cnt;      // 0-77
    
    assign a_tmp1 = s_arr_tmp[i_cnt] + a_reg + b_reg;
    assign a_tmp2 = {a_tmp1[28:0],a_tmp1[31:29]};   
    
    assign ab_tmp = a_tmp2 + b_reg;
    assign b_tmp1 = l_arr[j_cnt] + ab_tmp;
    assign b_tmp2 = (ab_tmp[4:0] == 5'b00001) ? {b_tmp1[30:0], b_tmp1[31]} :
                    (ab_tmp[4:0] == 5'b00010) ? {b_tmp1[29:0], b_tmp1[31:30]} :
                    (ab_tmp[4:0] == 5'b00011) ? {b_tmp1[28:0], b_tmp1[31:29]} :
                    (ab_tmp[4:0] == 5'b00100) ? {b_tmp1[27:0], b_tmp1[31:28]} :
                    (ab_tmp[4:0] == 5'b00101) ? {b_tmp1[26:0], b_tmp1[31:27]} :
                    (ab_tmp[4:0] == 5'b00110) ? {b_tmp1[25:0], b_tmp1[31:26]} :
                    (ab_tmp[4:0] == 5'b00111) ? {b_tmp1[24:0], b_tmp1[31:25]} :
                    (ab_tmp[4:0] == 5'b01000) ? {b_tmp1[23:0], b_tmp1[31:24]} :
                    (ab_tmp[4:0] == 5'b01001) ? {b_tmp1[22:0], b_tmp1[31:23]} :
                    (ab_tmp[4:0] == 5'b01010) ? {b_tmp1[21:0], b_tmp1[31:22]} :
                    (ab_tmp[4:0] == 5'b01011) ? {b_tmp1[20:0], b_tmp1[31:21]} :
                    (ab_tmp[4:0] == 5'b01100) ? {b_tmp1[19:0], b_tmp1[31:20]} :
                    (ab_tmp[4:0] == 5'b01101) ? {b_tmp1[18:0], b_tmp1[31:19]} :
                    (ab_tmp[4:0] == 5'b01110) ? {b_tmp1[17:0], b_tmp1[31:18]} :
                    (ab_tmp[4:0] == 5'b01111) ? {b_tmp1[16:0], b_tmp1[31:17]} :
                    (ab_tmp[4:0] == 5'b10000) ? {b_tmp1[15:0], b_tmp1[31:16]} :
                    (ab_tmp[4:0] == 5'b10001) ? {b_tmp1[14:0], b_tmp1[31:15]} :
                    (ab_tmp[4:0] == 5'b10010) ? {b_tmp1[13:0], b_tmp1[31:14]} :
                    (ab_tmp[4:0] == 5'b10011) ? {b_tmp1[12:0], b_tmp1[31:13]} :
                    (ab_tmp[4:0] == 5'b10100) ? {b_tmp1[11:0], b_tmp1[31:12]} :
                    (ab_tmp[4:0] == 5'b10101) ? {b_tmp1[10:0], b_tmp1[31:11]} :
                    (ab_tmp[4:0] == 5'b10110) ? {b_tmp1[9:0], b_tmp1[31:10]} :
                    (ab_tmp[4:0] == 5'b10111) ? {b_tmp1[8:0], b_tmp1[31:9]} :
                    (ab_tmp[4:0] == 5'b11000) ? {b_tmp1[7:0], b_tmp1[31:8]} :
                    (ab_tmp[4:0] == 5'b11001) ? {b_tmp1[6:0], b_tmp1[31:7]} :
                    (ab_tmp[4:0] == 5'b11010) ? {b_tmp1[5:0], b_tmp1[31:6]} :
                    (ab_tmp[4:0] == 5'b11011) ? {b_tmp1[4:0], b_tmp1[31:5]} :
                    (ab_tmp[4:0] == 5'b11100) ? {b_tmp1[3:0], b_tmp1[31:4]} :
                    (ab_tmp[4:0] == 5'b11101) ? {b_tmp1[2:0], b_tmp1[31:3]} :
                    (ab_tmp[4:0] == 5'b11110) ? {b_tmp1[1:0], b_tmp1[31:2]} :
                    (ab_tmp[4:0] == 5'b11111) ? {b_tmp1[0], b_tmp1[31:1]} :
                    b_tmp1;
    
    // State Variable
    reg [0:1] s;
    
    // State Machine
    always @(posedge clk or negedge clr) begin
        if(clr==0) s <= 2'd0;
        else if(clk) begin 
            case(s)
                // Idle State
                2'd0:begin
                    if(key_in) s <= 2'd1;
                end
                // Key Initiation State
                2'd1:begin
                    s <= 2'd2;
                    j_cnt<=0;
                end
                // Key Expansion State
                2'd2:begin
                    if(k_cnt==7'd77) s <= 2'd3;
                end
                // Ready State
                2'd3:begin
                    if(key_in) s <= 2'd1;
                end
            endcase
        end
    end
    
    // A Register
    always @(posedge clk or negedge clr) begin
        if(clr==0) a_reg<=32'd0;
        else if (clk)begin
            if(s==2'd0) a_reg<= 32'd0;
            if(s==2'd2) a_reg<= a_tmp2;
        end 
    end
    
    // B Register
    always @(posedge clk or negedge clr) begin
        if(clr==0) b_reg<=32'd0;
        else if (clk) begin
            if(s==2'd0) b_reg<=32'd0;
            if(s==2'd2) b_reg<= b_tmp2;
        end
    end
    
    // s_array
    always @(posedge clk or negedge clr) begin
        if(clr==0 || s==2'd1) begin
            s_arr_tmp[0]<= 32'hB7E15163;
            s_arr_tmp[1]<= 32'h5618CB1C;
            s_arr_tmp[2]<= 32'hF45044D5;
            s_arr_tmp[3]<= 32'h9287BE8E;
            s_arr_tmp[4]<= 32'h30BF3847;
            s_arr_tmp[5]<= 32'hCEF6B200;
            s_arr_tmp[6]<= 32'h6D2E2BB9;
            s_arr_tmp[7]<= 32'h0B65A572;
            s_arr_tmp[8]<= 32'hA99D1F2B;
            s_arr_tmp[9]<= 32'h47D498E4;
            s_arr_tmp[10]<= 32'hE60C129D;
            s_arr_tmp[11]<= 32'h84438C56;
            s_arr_tmp[12]<= 32'h227B060F;
            s_arr_tmp[13]<= 32'hC0B27FC8;
            s_arr_tmp[14]<= 32'h5EE9F981;
            s_arr_tmp[15]<= 32'hFD21733A;
            s_arr_tmp[16]<= 32'h9B58ECF3;
            s_arr_tmp[17]<= 32'h399066AC;
            s_arr_tmp[18]<= 32'hD7C7E065;
            s_arr_tmp[19]<= 32'h75FF5A1E;
            s_arr_tmp[20]<= 32'h1436D3D7;
            s_arr_tmp[21]<= 32'hB26E4D90;
            s_arr_tmp[22]<= 32'h50A5C749;
            s_arr_tmp[23]<= 32'hEEDD4102;
            s_arr_tmp[24]<= 32'h8D14BABB;
            s_arr_tmp[25]<= 32'h2B4C3474;
        end
        else if(clk) begin
            if(s==2'd2) s_arr_tmp[i_cnt]<=a_tmp2;
        end
    end 
    
    // l_array
    always @(posedge clk or negedge clr) begin
        if(clr==0) begin
            l_arr[0]<=32'd0;
            l_arr[1]<=32'd0;
            l_arr[2]<=32'd0;
            l_arr[3]<=32'd0;
        end
        else if(clk)begin
            if(s==2'd1) begin
                l_arr[0]<={ukey[103:96],ukey[111:104],ukey[119:112],ukey[127:120]};
                l_arr[1]<={ukey[71:64],ukey[79:72],ukey[87:80],ukey[95:88]};
                l_arr[2]<={ukey[39:32],ukey[47:40],ukey[55:48],ukey[63:56]};
                l_arr[3]<={ukey[7:0],ukey[15:8],ukey[23:16],ukey[31:24]};
            end
            if(s==2'd2) l_arr[j_cnt]<=b_tmp2;
        end   
    end
    
    // i counter
    always @(posedge clk or negedge clr) begin
        if(clr==0) i_cnt<=5'd0;
        else if (clk)begin
            if(s==2'd2) begin
                if(i_cnt==5'd25) i_cnt<=5'd0;
                else i_cnt <= i_cnt + 5'd1;
            end
        end
    end
    
    // j counter
    always @(posedge clk or negedge clr) begin
        if(clr==0) j_cnt<=2'd0;
        else if (clk)begin
            if(s==2'd2) begin
                if(j_cnt==2'd3) j_cnt<=2'd0;
                else j_cnt <= j_cnt + 2'd1;
            end
        end
    end
    
    // k counter
    always @(posedge clk or negedge clr) begin
        if(clr==0) k_cnt<=7'd0;
        else if (clk)begin
            if(s==2'd2) begin
                if(k_cnt==7'd77) k_cnt<=7'd0;
                else k_cnt <= k_cnt + 7'd1;
            end
        end
    end
    
    // skey assignment
    assign skeyout[1:32] = s_arr_tmp[0];
    assign skeyout[33:64] = s_arr_tmp[1];
    assign skeyout[65:96] = s_arr_tmp[2];
    assign skeyout[97:128] = s_arr_tmp[3];
    assign skeyout[129:160] = s_arr_tmp[4];
    assign skeyout[161:192] = s_arr_tmp[5];
    assign skeyout[193:224] = s_arr_tmp[6];
    assign skeyout[225:256] = s_arr_tmp[7];
    assign skeyout[257:288] = s_arr_tmp[8];
    assign skeyout[289:320] = s_arr_tmp[9];
    assign skeyout[321:352] = s_arr_tmp[10];
    assign skeyout[353:384] = s_arr_tmp[11];
    assign skeyout[385:416] = s_arr_tmp[12];
    assign skeyout[417:448] = s_arr_tmp[13];
    assign skeyout[449:480] = s_arr_tmp[14];
    assign skeyout[481:512] = s_arr_tmp[15];
    assign skeyout[513:544] = s_arr_tmp[16];
    assign skeyout[545:576] = s_arr_tmp[17];
    assign skeyout[577:608] = s_arr_tmp[18];
    assign skeyout[609:640] = s_arr_tmp[19];
    assign skeyout[641:672] = s_arr_tmp[20];
    assign skeyout[673:704] = s_arr_tmp[21];
    assign skeyout[705:736] = s_arr_tmp[22];
    assign skeyout[737:768] = s_arr_tmp[23];
    assign skeyout[769:800] = s_arr_tmp[24];
    assign skeyout[801:832] = s_arr_tmp[25];
    
    
    // Ready signal
    assign key_rdy = (s == 2'd3) ? 1 : 0;
      
endmodule