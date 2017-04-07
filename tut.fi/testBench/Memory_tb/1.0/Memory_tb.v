//-----------------------------------------------------------------------------
// File          : Memory_tb.v
// Creation date : 07.04.2017
// Creation time : 13:50:23
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.19 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:Memory_tb:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/Memory_tb/1.0/Memory_tb.1.0.xml
//-----------------------------------------------------------------------------

module Memory_tb #(
    parameter                              DATA_WIDTH       = 32,    // Width for data in registers and instructions.
    parameter                              INSTRUCTION_WIDTH = 28    // Total width of an instruction
) (
    // Interface: wb_system
    output reg                          clk_o,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst_o,    // The mandatory reset, as this is synchronous logic.

    // These ports are not in any interface
    input                               stall_i,
    output reg     [INSTRUCTION_WIDTH-1:0] instruction_feed
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
        clk_o = 1'b0;
        rst_o = 1'b1; // assert reset
        repeat(4) #5 clk_o = ~clk_o;
        rst_o = 1'b0; // deassert reset
        forever #5 clk_o = ~clk_o; // generate a clock
        end
        
    localparam INSTRUCTION_COUNT = 30;

    reg [INSTRUCTION_WIDTH-1:0] instruction_memory [INSTRUCTION_COUNT-1:0];
    
    integer index;
    integer total_clk;
 
    initial begin
        $readmemh("program.hex", instruction_memory);
    end
        
    initial begin
        instruction_feed = 0;
        total_clk = 0;
        @(negedge rst_o); // wait for reset
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        
        for (index = 0; index < INSTRUCTION_COUNT; index = index + 1) begin
            if (stall_i) begin
                index = index - 1;
            end
            else begin
                instruction_feed = instruction_memory[index];
            end
            @(posedge clk_o);
            
            total_clk = total_clk + 1;
            
            if (total_clk > 100)
                $stop;
        end 
 
        @(posedge clk_o);
        $stop;
    end
endmodule
