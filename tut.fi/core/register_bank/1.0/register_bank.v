//-----------------------------------------------------------------------------
// File          : register_bank.v
// Creation date : 13.04.2017
// Creation time : 13:47:17
// Description   : Stores registers and the logic needed to access them. In case of multiple simultaenous writes, the one with most priority is done.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.79 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:register_bank:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/register_bank/1.0/register_bank.1.0.xml
//-----------------------------------------------------------------------------

module register_bank #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              REGISTER_ID_WIDTH = 4,    // Bits reserved for identification a single register.
    parameter                              REGISTER_COUNT   = 8    // How many registers are supported in the core.
) (
    // Interface: cpu_clk_sink
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input                               alu_active_i,
    input          [DATA_WIDTH-1:0]     alu_result_i,
    input          [REGISTER_ID_WIDTH-1:0] choose_register_i1,
    input          [REGISTER_ID_WIDTH-1:0] choose_register_i2,
    input                               mem_active_i,
    input                               mem_rdy_i,
    input          [DATA_WIDTH:0]       register_input,
    input                               we_i,
    output reg     [DATA_WIDTH-1:0]     register_output1,
    output reg     [DATA_WIDTH-1:0]     register_output2
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    // The registers.
    reg [DATA_WIDTH-1:0] registers [REGISTER_COUNT-1:0];
    // Iterator for the reset
    integer index;
    
    always @* begin
        // Select new output when ever registers are activated.
        register_output1 <= registers[choose_register_i1];
        register_output2 <= registers[choose_register_i2];
    end
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            for (index = 0; index < REGISTER_COUNT; index = index + 1) begin
                registers[index] <= 0;
            end
        end
        else begin
            if (alu_active_i) begin
                // Alu is expected to yield a value: Save to the register.
                registers[choose_register_i1] <= alu_result_i;
            end
            else if (register_input[DATA_WIDTH] == 1'b1) begin
                // Alu is expected to yield a value: Save to the register.
                registers[choose_register_i1] <= register_input[DATA_WIDTH-1:0];
            end
        end
    end
endmodule
