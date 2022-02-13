`timescale 1ns / 1ps
`default_nettype none

// Instruction Memory Size (4KB or 1024 Words)
`define RAM_LENGTH_WORDS 1024

// Relevant Address bits for 2KB Memory (0 - FFC -> 12 Bits)
`define RAM_ADDR_BITS 12

//Special ROM Values
`define STARTING_ADDR_BIT 21

`define TANISHA 13391993
`define ANANT 13643732
`define EESHA 17456399


// Data Memory
module DMem(
    input wire clk,
    input wire rd,
    input wire [3:0] we,
    input wire [31:0] addr_in,
    input wire [31:0] data_in,
    output wire [31:0] data_out
);

    // Define Data Memory
    reg [31:0] ram [0:`RAM_LENGTH_WORDS-1];

    // Address Translation divide by 4
    wire [11:0] addr = (addr_in[`RAM_ADDR_BITS-1:0]>>2);

    reg [31:0] d_out;

    always @(posedge clk) begin  
        if (addr < 12'd1024) begin
            if (addr_in[`STARTING_ADDR_BIT-1]) begin
                if (rd) begin
                    if(addr=='d0)
                        d_out <= 32'h`TANISHA;
                    else if(addr=='d1)
                        d_out <= 32'h`ANANT;
                    else if(addr=='d2)
                        d_out <= 32'h`EESHA;
                end
            end  
            else begin      
                if (we[0])
                    ram[addr][7:0] <= data_in[7:0];
                if (we[1])
                    ram[addr][15:8] <= data_in[15:8];                    
                if (we[2])
                    ram[addr][23:16] <= data_in[23:16];
                if (we[3])
                    ram[addr][31:24] <= data_in[31:24];
                if (rd)
                    d_out <= ram[addr];
            end
        end
    end
    
    assign data_out = d_out;
    
endmodule

// DMem TCL Simulation Commands

/*

restart
add_force {/DMem/clk} -radix hex {1 0ns} {0 500ps} -repeat_every 1000ps
add_force {/DMem/rd} -radix hex {1 0ns}
run 1ns
add_force {/DMem/addr_in} -radix hex {00100000 0ns}
run 2ns
add_force {/DMem/addr_in} -radix hex {00100004 0ns}
run 2ns
add_force {/DMem/addr_in} -radix hex {00100008 0ns}
run 2ns
add_force {/DMem/we} -radix bin {0001 0ns}
add_force {/DMem/addr_in} -radix hex {80000000 0ns}
add_force {/DMem/data_in} -radix hex {ffffffff 0ns}
run 1ns
add_force {/DMem/we} -radix bin {0010 0ns}
add_force {/DMem/addr_in} -radix hex {80000000 0ns}
add_force {/DMem/data_in} -radix hex {eeeeeeee 0ns}
run 1ns
add_force {/DMem/we} -radix bin {0100 0ns}
add_force {/DMem/addr_in} -radix hex {80000000 0ns}
add_force {/DMem/data_in} -radix hex {dddddddd 0ns}
run 1ns
add_force {/DMem/we} -radix bin {1000 0ns}
add_force {/DMem/addr_in} -radix hex {80000000 0ns}
add_force {/DMem/data_in} -radix hex {cccccccc 0ns}
run 1ns
add_force {/DMem/we} -radix bin {1010 0ns}
add_force {/DMem/addr_in} -radix hex {80000000 0ns}
add_force {/DMem/data_in} -radix hex {aaaaaaaa 0ns}
run 1ns
add_force {/DMem/we} -radix bin {1010 0ns}
add_force {/DMem/addr_in} -radix hex {00100010 0ns}
add_force {/DMem/data_in} -radix hex {aaaaaaaa 0ns}
run 1ns
*/
