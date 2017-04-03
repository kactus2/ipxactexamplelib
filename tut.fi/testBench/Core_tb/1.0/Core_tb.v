//-----------------------------------------------------------------------------
// File          : Core_tb.v
// Creation date : 03.04.2017
// Creation time : 15:50:35
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.24 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:Core_tb:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/Core_tb/1.0/Core_tb.1.0.xml
//-----------------------------------------------------------------------------

module Core_tb #(
    parameter                              DATA_WIDTH       = 32,    // Width for data in registers and instructions.
    parameter                              INSTRUCTION_WIDTH = DATA_WIDTH    // Total width of an instruction
) (
    // These ports are not in any interface
    input          [DATA_WIDTH-1:0]     new_value,
    output reg                          clk_o,    // The mandatory clock, as this is synchronous logic.
    output reg     [INSTRUCTION_WIDTH-1:0] instruction_feed,
    output reg                          rst_o    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
        clk_o = 1'b0;
        rst_o = 1'b1; // assert reset
        repeat(4) #5 clk_o = ~clk_o;
        rst_o = 1'b0; // deassert reset
        forever #5 clk_o = ~clk_o; // generate a clock
        end

    initial begin
        @(negedge rst_o); // wait for reset
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        instruction_feed = 32'h13370236;
        @(posedge clk_o);
        instruction_feed = 32'hDEAD0246;
        @(posedge clk_o);
        instruction_feed = 32'hBEEF0256;
        @(posedge clk_o);
        instruction_feed = 32'hB1050266;
        @(posedge clk_o);
        instruction_feed = 32'hF00D0276;
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        @(posedge clk_o);
        $stop;
    end
endmodule
