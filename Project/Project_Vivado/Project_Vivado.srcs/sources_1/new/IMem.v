`timescale 1ns / 1ps
`default_nettype none

// Instruction Memory Size (2KB or 512 Words)
`define ROM_LENGTH_WORDS 512

// Relevant Address bits for 2KB Memory (0 - 7FC -> 11 Bits)
`define ROM_ADDR_BITS 11


// Instruction Memory
module IMem(
    input wire clk,
    input wire rd,
    input wire [31:0] addr_in,
    output wire [31:0] instr_out 
    );
   
    // Define Instruction Memory
    reg [31:0] rom [0:`ROM_LENGTH_WORDS-1]; 
    
    // Register to hold instruction
    reg [31:0] instruction;
    
    // Load Program into Memory from Memory File
    initial begin
        $readmemh("imem.mem", rom); 
    end

    // Address Translation divide by 4 
    wire [10:0] addr = (addr_in[`ROM_ADDR_BITS-1:0] >> 2);

    always @(posedge clk) begin
        if(rd)
            instruction <= rom[addr];
    end
    
    assign instr_out = instruction;
    
endmodule 



// IMem TCL Simulation Commands

/*
restart
add_force {/IMem/clk} -radix hex {1 0ns} {0 500ps} -repeat_every 1000ps
add_force {/IMem/rd} -radix hex {1 0ns}
run 1ns
add_force {/IMem/addr_in} -radix hex {01000004 0ns}
run 2ns
add_force {/IMem/addr_in} -radix hex {010007fc 0ns}
run 2ns
add_force {/IMem/addr_in} -radix hex {010007fb 0ns}
run 2ns

*/