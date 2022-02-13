`timescale 1ns / 1ps
`default_nettype none

module RC5_Complete(
    input wire clk,  
    input wire rst,  
    
    input wire start_generating_skey,  
    input wire [127:0] user_key,  
    output wire key_done,
    
    input wire start_encryption,
    input wire start_decryption,  
    input wire [63:0] d_in,       
    output wire [63:0] d_out,
    output wire done
    );
    
        
    wire [1:832] sk;   
 
    RC5_KeyGen KeyGen(.clk(clk),.clr(rst),.key_in(start_generating_skey),.ukey(user_key),
                      .key_rdy(key_done),.skeyout(sk));
    
    wire [63:0] en_do;
    wire en_done;
    RC5_Encoder Encoder(.clk(clk),.clr(rst),.key_rdy(key_done),.di_vld(start_encryption),
                        .din(d_in),.skeyin(sk),.dout(en_do),.do_rdy(en_done));
    
    wire [63:0] de_do;
    wire de_done;
    RC5_Decoder Decoder(.clk(clk),.clr(rst),.key_rdy(key_done),.di_vld(start_decryption),
                        .din(d_in),.skeyin(sk),.dout(de_do),.do_rdy(de_done));
    
    reg mode;
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            mode<=0;
        end
        else begin
            if(start_encryption) mode<=1;
            if(start_decryption) mode<=0;
        end        
    end    
    
    assign done= (mode==1) ? en_done : de_done;
    assign d_out= (mode==1) ? en_do : de_do;
    
endmodule
