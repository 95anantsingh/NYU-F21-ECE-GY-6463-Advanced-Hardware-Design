`timescale 1ns / 1ps


// Immediate Extender
module ImmExt(
    input wire [2:0] opcode,
    input wire [31:0] instr,
    output wire [31:0] ext_imm
    );
    
    reg [31:0] imm;
    wire [11:0] immi;
    wire [11:0] imms; 
    wire [12:1] immb;
    wire [20:1] immj;
    wire [31:12] immu;

    assign immi = instr[31:20];
    assign immj = {instr[31],instr[19:12], instr[20], instr[30:21]};
    assign immb = {instr[31], instr[7], instr[30:25], instr[11:8]};
    assign imms = {instr[31:25], instr[11:7]};
    assign immu = instr[31:12];
    
    always@(*) begin
   
        case (opcode)
            3'd0: begin     // J-TYPE 
                if (immj[20] ==1)
                    imm<= {11'b11111111111, immj[20:1], 1'b0};
                else
                    imm <= {11'd0 , immj[20:1], 1'b0};
            end
            3'd1: begin     // I-TYPE    
                if(immi[11]==1)
                    imm <= {20'b11111111111111111111,immi[11:0]};
                else
                    imm <= {20'd0,immi[11:0]};
            end
            3'd2: begin     // B-TYPE     
                if (immb[12]==1)
                    imm <= {19'b1111111111111111111,immb[12:1], 1'b0};
                else
                    imm <= {19'd0,immb[12:1], 1'b0};
            end
            3'd3: begin     //S-TYPE
                if(imms[11]==1)
                    imm <= {20'b11111111111111111111,imms[11:0]};
                else
                    imm <= {20'd0,imms[11:0]};
            end
            3'd4: begin     //U-TYPE
                imm <= {immu[31:12], 12'd0};
            end
            default:
                imm <= 0;
        endcase
    end

    assign ext_imm = imm;

endmodule