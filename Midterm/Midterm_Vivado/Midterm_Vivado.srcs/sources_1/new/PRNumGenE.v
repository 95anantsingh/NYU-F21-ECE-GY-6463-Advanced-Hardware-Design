`timescale 1ns / 1ps
`default_nettype none

module PRNumGenE(
    input wire clk,                 // clock           
    input wire rstn,                // reset           
    input wire get_random,          // Random Output Request
    input wire load_seed,           // Seed Loading Request 
    input wire [0:7] data_in,       // Input Data port   
    output wire [0:7] data_out      // Output Data port
    );                              
                                    
    reg SI_en=0;                    // SeedIn Module Enable bit
    wire SIdone;                    // bit to denote Data Input cycle is Complete
    wire [0:31] seed;               // SeedIn Output port
    // SeedIn Initialization    
    SeedIn SI(.clk(clk),.rstn(rstn),.SI_en(SI_en),.load_seed(load_seed),.data(data),.data_in(data_in),.SIdone(SIdone),.seed(seed));
    
    reg L_en=0;                     // LFSReg Module Enable bit
    wire [0:31] data;               // LFSReg Output port
    // LFSReg Initialization    
    LFSReg L(.clk(clk),.rstn(rstn),.L_en(L_en),.SI_en(SI_en),.seed(seed),.data(data));
    
    reg DO_en=0;                   // DataOut Module Enable bit                     
    wire DOdone;                   // bit to denote Data Output cycle is Complete
    // DataOut Initialization
    DataOut DO(.clk(clk),.rstn(rstn),.DO_en(DO_en),.get_random(get_random),.data(data),.DOdone(DOdone),.data_out(data_out));

    reg [0:1] s=2'd0;              // State variable for Next State Machine 1
    reg gr=0;                      // bit for changing states on geting output request
    reg ls=0;                      // bit for changing states on geting input request
    
    // Next State Machine 1
    always @(posedge clk or negedge rstn) begin
        case(s)
            2'd0: begin
                if(rstn) begin                      // If reset is high
                    if(gr&&ls) s<=2'd3;             // change to state3 when get_random and load_seed has been high in previous cycle
                    else begin
                        if(gr) s<=2'd1;             // change to state1 when get_random has been high in previous cycle
                        if(ls) s<=2'd2;             // change to state2 when load_seed has been high in previous cycle
                    end
                end
            end
            2'd1: begin
                if(rstn==0) s<=2'd0;                // change to state0 on reset      
                else if (DOdone) begin              // If Data Output Cycle is Complete
                    if(ls) s<=2'd2;                 // change to state2 when load_seed has been high in previous cycle
                    else s<=2'd0;                   // change to state0 to resume shift
                end
                else if (ls) s<=2'd3;               // change to state 3 If Data Output Cycle is not complete and when load_seed has been high in previous cycle
            end
            2'd2: begin
                if(rstn==0) s<=2'd0;                // change to state0 on reset
                else if(SIdone) begin               // If Data Input Cycle is Complete
                    if(gr) s<=2'd1;                 // change to state1 when get_random has been high in previous cycle
                    else s<=2'd0;                   // change to state0 to resume shift
                end
                else if (gr) s<=2'd3;               // change to state 3 If Data Input Cycle is not complete and when get_random has been high in previous cycle
            end 
            2'd3: begin
                if(rstn==0) s<=2'd0;                // change to state0 on reset
                else if (DOdone && SIdone) s<=2'd0; // change to state0 if both Data Input and Output cycles are complete
                else if (DOdone) s<=2'd2;           // change to state1 if Data Output cycle is complete
                else if (SIdone) s<=2'd1;           // change to state1 if Data Input cycle is complete
            end            
        endcase
    end
    
    // Control Block 1
    always @ (s,get_random,load_seed) begin
        L_en<=0;                                    // disable LFSReg Module
        DO_en<=0;                                   // disable DataOut Module
        SI_en<=0;                                   // disable SeedIn Module
        case(s)
            2'd0: begin
                L_en<=1;                            // enable LFSReg Module
                if(get_random) gr<=1;               // set gr high on get_random =1 so that in next cycle state can be changed
                if(load_seed) ls<=1;                // set ls high on load_seed =1 so that in next cycle state can be changed
            end
            2'd1: begin
                if(get_random==0) gr<=0;            // set gr high on get_random =0
                DO_en<=1;                           // enable DataOut Module
                if(load_seed) ls<=1;                // set ls high on load_seed =1 so that in next cycle state can be changed
            end
            2'd2: begin
                if(load_seed==0) ls<=0;             // set ls high on load_seed =0 
                SI_en<=1;                           // enable SeedIn Module
                if(get_random) gr<=1;               // set gr high on get_random =1 so that in next cycle state can be changed
            end
            2'd3: begin
                if(get_random==0) gr<=0;            // set gr high on get_random =0
                if(load_seed==0) ls<=0;             // set ls high on load_seed =0
                DO_en<=1;                           // enable DataOut Module
                SI_en<=1;                           // enable SeedIn Module
            end
        endcase
    end
endmodule

module SeedIn(
    input wire clk,
    input wire rstn,
    input wire SI_en,
    input wire load_seed,
    input wire [0:31] data,
    input wire [0:7] data_in,
    output reg SIdone=0,
    output reg [0:31] seed=32'd0
);

  reg [0:1] s=2'd0;                                 // State variable for Next state Machine 2 
  
  // Next State Machine 2
  always @(posedge clk or negedge rstn)begin
        if(rstn==0) s<=2'd0;                        // If low reset change state to 0          
        else if (SI_en) begin                       // If Module is enabled continue states    
            case(s)                                 
                2'd0: begin                         
                    s<=2'd1;                        
                end                                 
                2'd1: begin                         
                    s<=2'd2;                        
                end                                 
                2'd2: begin                         
                    s<=2'd3;                        
                end                                 
                2'd3: begin                         
                    s<=2'd0;
                end
            endcase
        end
    end
    
        // Control Block 2
    always @(s,SI_en) begin  
        if(SIdone==0) begin                         // If Data Input cycle is not yet complete                                                
        case(s)
            2'd0: begin
                if(SI_en) seed<=data;               // If Seed_In Module is enabled then put seed=data                     
                seed[24:31]<=data_in;               // Input least significant 8 bits                                   
            end                                                                                         
            2'd1: begin                                                                                                                  
                seed[16:23]<=data_in;               // Input next 8 bits                                                                 
            end
            2'd2: begin                                                                                                                  
                seed[8:15]<=data_in;                // Input next 8 bits                                                                 
            end
            2'd3: begin                                                                                                                  
                seed[0:7]<=data_in;                 // Input Most Significant 8 bits                                                     
                if(load_seed==0) SIdone<=1;         // If Input request is no longer then mark Output cycle as Complete                  
                else SIdone<=0;                     // Else Continue the Input cycle again                                               
            end
        endcase
        end                                                                                                                              
        if(SI_en==0)  begin                         // If SeedIn Module is disabled                                                      
            seed<=data;                             // set seed to data                                                                  
            SIdone<=0;                              // Mark Input cycle as incomplete so that next time state machine works as expected  
        end 
    end
endmodule

module DataOut(
    input wire clk,
    input wire rstn,
    input wire DO_en,
    input wire get_random,
    input wire [0:31] data,
    output reg DOdone=0,
    output reg [0:7] data_out
);
    
    reg [0:1] s=2'd0;                               // State variable for Next state Machine 3
    
    // Next State Machine 3
    always @(posedge clk or negedge rstn)begin
        if(rstn==0) s<=2'd0;                        // If low reset change state to 0          
        else if (DO_en) begin                       // If Module is enabled continue states    
            case(s)
                2'd0: begin
                    s<=2'd1;
                end
                2'd1: begin
                    s<=2'd2;
                end
                2'd2: begin
                    s<=2'd3;
                end
                2'd3: begin
                    s<=2'd0;
                end
            endcase
        end
    end
    
    // Control Block 3
    always @(s,DO_en) begin  
        if(DOdone==0) begin                         // If Data Output cycle is not yet complete                                                
        case(s)
            2'd0: begin
                data_out<=data[24:31];              // Output least significant 8 bits                                                         
            end
            2'd1: begin
                data_out<=data[16:23];              // Output next 8 bits                                                                      
            end
            2'd2: begin
                data_out<=data[8:15];               // Output next 8 bits                                                                      
            end
            2'd3: begin
                data_out<=data[0:7];                // Output Most Significant 8 bits                                                          
                if(get_random==0) DOdone<=1;        // If Output request is no longer then mark Output cycle as Complete                       
                else DOdone<=0;                     // Else Continue the Output cycle again                                                    
            end
        endcase
        end
        if(DO_en==0)  begin                         // If DataOut Module is disabled                                                              
            data_out<=2'd0;                         // set output to 0                                                                         
            DOdone<=0;                              // Mark Output cycle as incomplete so that next time state machine works as expected       
        end       
    end       
endmodule

module LFSReg(
    input wire clk,
    input wire rstn,
    input wire L_en,
    input wire SI_en,
    input wire [0:31] seed,
    output wire [0:31] data
);
    reg [0:31] data_reg = 32'h02468ACD;                 // register for storing shift result, set default seed                 
    wire data_1;                                        // wires for xor operation                                             
    wire data_2;
    wire data_3;
    wire data_4;
    wire data_5;
    wire data_6;
    wire [0:31] data_f;                                 // wire for final value                                                
    
    assign data_1 = data_reg[31] ^ data_reg[13];        // 31 bit xor 13 bit                                                   
    assign data_2 = data_reg[11] ^ data_1;              // 11 bit xor last xor output                                          
    assign data_3 = data_reg[9] ^ data_2;               // 9 bit xor last xor output                                           
    assign data_4 = data_reg[5] ^ data_3;               // 51 bit xor last xor output                                          
    assign data_5 = data_reg[4] ^ data_4;               // 4 bit xor last xor output                                           
    assign data_6 = data_reg[0] ^ data_5;               // 0 bit xor last xor output                                           
    
    assign data_f = {data_6,data_reg[0:30]};            // shift                                                               
    
    always @(posedge clk or negedge rstn) begin
        if (rstn==0) data_reg <= 32'h02468ACD;          // If reset=0, reset value to default                                  
        else if (L_en&&SI_en==0) data_reg <= data_f;    // Else if Module is enabled and SeedIn Module is disabled update register value for next shift
        if (SI_en&&rstn) data_reg <= seed;              // If SeedIn Module is enabled and Reset is high, updtae Data_reg to seed value from SeedIn Module          
    end
    assign data = data_reg;                             // link data_reg and output data                                       
endmodule                                                                                    
                                                                                             
                                                                                             