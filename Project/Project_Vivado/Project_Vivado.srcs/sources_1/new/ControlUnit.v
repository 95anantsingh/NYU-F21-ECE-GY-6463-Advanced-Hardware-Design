`timescale 1ns / 1ps
`include "defines.vh"


// Multi Cycle Controller
module ControlUnit(
    input wire clk, 
    input wire rstn, 
    input wire [31:0] instruction,
 
    // pc
    output reg pc_we,                     // PC write enable

    // IMem
    output reg imem_rd,                   // IM read enable

    // regfile
    output reg rf_we,
    
    // ImmEx
    output reg [2:0] imm_op,    

    //DataExt
    output reg [2:0] data_op,

    // BC
    input wire bc_out,
    output reg [2:0] bc_op,
    
    // ALU
    output reg [3:0] alu_op,
    
    // Dmem
    output reg [3:0] dmem_we,
    output reg dmem_rd,
    
    // Control Signals for Muxes
    output reg pc_mux,
    output reg rfile_mux,
    output reg alu_mux1,
    output reg alu_mux2,
    output reg [1:0] op_mux
    
    );
    
    // Instruction Variables
    
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;
    
    // State Machine Signals
    reg load;
    reg store;
    reg branch;
    reg fence;
    reg [3:0] dmem_we_temp;
    reg halt;
    
     //State Variables
     reg [0:2] state;
     reg [0:2] next_state;

     
    //Combinational Logic
    always@(*) begin

        // default instruction loading
        opcode <= instruction[6:0];   
        funct3 <= instruction[14:12]; 
        funct7 <= instruction[31:25];   

        // default State Machine Signals
        load <= 0;
        store <= 0;
        branch <=0;
        fence <=0;
        halt <=0;
        
        // default Select Lines
        pc_mux <= 0;
        rfile_mux <= 0;
        alu_mux1 <= 0;
        alu_mux2 <= 0;
        op_mux <= 0;
        
        // default Opcodes
        imm_op <= 0;
        data_op <= 0;
        bc_op <= 0;
        alu_op <= 0;
        dmem_we_temp <= 0;

        case(opcode)
            `LUI: begin                  // U-TYPE
                // Loads the immediate value into the upper 20 bits of the 
                // target register rd and sets the lower bits to 0
                op_mux <= 2'd2;
                imm_op <= 3'd4;        
            end
     
            `AUIPC: begin               // U-TYPE
                // Forms a 32-bit offset from the 20-bit value by filling 
                // the lower bits with zeros, adds this to pc_out, and stores
                // the result in rd
                alu_mux1 <= 1;
                imm_op <=3'd4;          
                alu_op <= `ADD;                               
            end
            
            `JAL: begin                 // J-TYPE
                // Jump to pc_out=pc_out+(sign-extended immediate value) and store
                // the current pc_out address+4 in register rd.
                pc_mux <= 1;
                rfile_mux <= 1;
                alu_mux1 <= 1;
                imm_op <= 3'd0;                 
                alu_op <= `ADD;
            end
            
            `JALR: begin                // I-TYPE
                // Jump to pc_out=rs1 register value + (sign-extended immediate value)
                // and store the current pc_out address + 4 in register rd
                pc_mux <= 1;
                rfile_mux <= 1;
                imm_op <= 3'd1;          
                alu_op <= `ADD;
            end
            
            `BRANCH: begin              // B-TYPE
                if(bc_out ==1) begin
                    pc_mux <= 1;
                end
                branch <=1;
                alu_mux1 <= 1;
                imm_op <= 3'd2;        
                alu_op <= `ADD;
                bc_op <= funct3;
            end
            
            `LOAD:begin                 // I-TYPE
                load <= 1;
                op_mux <= 2'd1;
                imm_op <= 3'd1;         
                alu_op <= `ADD;
                data_op <= funct3;
            end
            
            `STORE:begin                // S-TYPE
                store<=1;
                imm_op <= 3'd3;         
                alu_op <= `ADD;
                case (funct3)
                    `SB:
                        dmem_we_temp <= 4'b0001;
                    `SH:
                        dmem_we_temp <= 4'b0011;
                    `SW:
                        dmem_we_temp <= 4'b1111;
                endcase
            end
            
            `IMM:begin                  // I-TYPE
                imm_op <= 3'd1;             
                if (funct3 == 3'b101)
                    alu_op <= {instruction[30], funct3};
                else
                    alu_op <= {1'b0, funct3};
            end
            
            `ALU:begin
                alu_mux2 <= 1;
                alu_op <= {instruction[30], funct3};
            end
            
            `FENCE:begin
                fence <= 1;
            end
            
            `SYSTEM:begin
                halt<=1;
            end
            default: begin
                //$display("Invalid OPCODE MCU");
            end
        endcase
    end
    

    // Next State Machine
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= `IF;
        end
        else
            state <= next_state;    
    end
    
    // State machine
    always @(state,halt,load,store,branch,fence,dmem_we_temp) begin
        imem_rd <= 0;
        pc_we <= 0;
        rf_we <= 0;
        dmem_rd <= 0;
        dmem_we <= 4'd0;
        next_state <= 0;
        
        case (state)
            // Instruction Fetch
            `IF: begin                          // Move to instruction decode and execute stage for all instruction types
                imem_rd <= 1;
                next_state <= `ID_EX;
            end
            // Instruction Decode and Execution
            `ID_EX: begin
                if(halt) next_state <= `HALT;
                else if (load | store)
                    next_state <= `MEM;
                else                            // No need for Memory stage
                    next_state <= `WB;
            end
            // Memory Read Write
            `MEM: begin                         // WB and update PC after MEM
                if (load)  dmem_rd <= 1;
                if (store)  dmem_we <= dmem_we_temp;
                next_state <= `WB;
            end
            // Write Back
            `WB: begin                          // Always fetch instruction after PC is updated
                pc_we <= 1;
                if (!(store | branch | fence))  begin
                    rf_we <=1;
                end
                next_state <= `IF;
            end
            //Halt
            `HALT: begin                // Halt
                next_state <= `HALT;
            end
       endcase
    end
endmodule

// ControlUnit TCL Simulation Commands

/*
restart
add_force {/ControlUnit/clk} -radix hex {1 0ns} {0 500ps} -repeat_every 1000ps
run 1ns
add_force {/ControlUnit/instruction} -radix hex {000022b7 0ns}
add_force {/ControlUnit/rstn} -radix hex {0 0ns}
run 1ns
add_force {/ControlUnit/rstn} -radix hex {1 0ns}
run 3ns
add_force {/ControlUnit/instruction} -radix hex {0000a297 0ns}
run 5ns

000022b7 // LUI
00000073 // HALT
0000a297 // AUIPC
*/