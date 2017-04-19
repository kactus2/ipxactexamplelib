//-----------------------------------------------------------------------------
// File          : Memory_tb.v
// Creation date : 18.04.2017
// Creation time : 13:30:25
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.79 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:Memory_tb:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/Memory_tb/1.0/Memory_tb.1.0.xml
//-----------------------------------------------------------------------------

module Memory_tb #(
    parameter                              DATA_WIDTH       = 32,    // Width for data in registers and instructions.
    parameter                              INSTRUCTION_WIDTH = 28,    // Total width of an instruction
    parameter                              INSTRUCTION_ADDRESS_WIDTH = 8    // Width of an instruction address.
) (
    // Interface: wb_system
    output reg                          clk_o,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst_o,    // The mandatory reset, as this is synchronous logic.

    // These ports are not in any interface
    input          [INSTRUCTION_ADDRESS_WIDTH-1:0] iaddr_o,
    output reg     [INSTRUCTION_WIDTH-1:0] instruction_feed
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
        rst_o = 1'b1; // Assert reset.
        clk_o = 1'b0;
        repeat(4) #5 clk_o = ~clk_o; // Do some clock cycles.
        rst_o = 1'b0; // Deassert reset.
        forever #5 clk_o = ~clk_o; // Generate a clock until simulation terminates.
    end
        
    localparam MAX_CLOCKS = 10000;

    reg [INSTRUCTION_WIDTH-1:0] instruction_memory [(2**INSTRUCTION_WIDTH)-1:0];

    integer total_clk;
 
    initial begin
        $readmemh("program.hex", instruction_memory);
    end
        
    initial begin
        instruction_feed = 0;
        total_clk = 0;
        @(negedge rst_o); // wait for reset
        
        forever begin
            instruction_feed = instruction_memory[iaddr_o];
            @(posedge clk_o);
            
            total_clk = total_clk + 1;
            
            if (total_clk >= MAX_CLOCKS || instruction_feed[27:24] == MemoryExample_0.core.instruction_decoder.END)
                $stop;
        end 
 
        @(posedge clk_o);
        $stop;
    end
endmodule
