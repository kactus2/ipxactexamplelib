//-----------------------------------------------------------------------------
// File          : instruction_memory.v
// Creation date : 16.05.2017
// Creation time : 09:01:54
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.106 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:cpu.logic.test:instruction_memory:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.logic.test/instruction_memory/1.0/instruction_memory.1.0.xml
//-----------------------------------------------------------------------------

module instruction_memory #(
    parameter                              INSTRUCTION_WIDTH = 28,    // Total width of an instruction
    parameter                              INSTRUCTION_ADDRESS_WIDTH = 8    // Width of an instruction address.
) (
    // Interface: slave
    input          [INSTRUCTION_ADDRESS_WIDTH-1:0] iaddr_o,
    output reg     [INSTRUCTION_WIDTH-1:0] instruction_feed,

    // These ports are not in any interface
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    localparam MAX_CLOCKS = 10000;

    reg [INSTRUCTION_WIDTH-1:0] instruction_memory [(2**INSTRUCTION_ADDRESS_WIDTH)-1:0];

    integer total_clk;
 
    initial begin
        $readmemh("program.hex", instruction_memory);
    end
        
    initial begin
        instruction_feed = 0;
        total_clk = 0;
        @(negedge rst_i); // wait for reset
        
        forever begin
            instruction_feed = instruction_memory[iaddr_o];
            @(posedge clk_i);
            
            total_clk = total_clk + 1;
            
            if (total_clk >= MAX_CLOCKS || instruction_feed[27:24] == 'hF)
                $stop;
        end 
 
        @(posedge clk_i);
        $stop;
    end
endmodule
