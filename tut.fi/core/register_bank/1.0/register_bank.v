//-----------------------------------------------------------------------------
// File          : register_bank.v
// Creation date : 05.04.2017
// Creation time : 11:06:13
// Description   : Stores registers and the logic needed to access them. In case of multiple simultaenous writes, the one with most priority is done.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.27 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:register_bank:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/register_bank/1.0/register_bank.1.0.xml
//-----------------------------------------------------------------------------

module register_bank #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              REGISTER_ID_WIDTH = 4,    // Bits reserved for identification a single register.
    parameter                              REGISTER_COUNT   = 8,    // How many registers are supported in the core.
    parameter                              LITERAL_WIDTH    = 16    // How long literals the instructions may have.
) (
    // Interface: cpu_clk_sink
    // The mandatory clock, as this is synchronous logic.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input                               alu_active_i,
    input          [DATA_WIDTH-1:0]     alu_result_i,
    input          [REGISTER_ID_WIDTH-1:0] choose_register_i1,
    input          [REGISTER_ID_WIDTH-1:0] choose_register_i2,
    input          [LITERAL_WIDTH:0]    literal_i,
    input          [DATA_WIDTH-1:0]     load_value_i,
    input                               mem_active_i,
    input                               mem_rdy_i,
    input                               we_i,
    output reg     [DATA_WIDTH-1:0]     register_value1,
    output reg     [DATA_WIDTH-1:0]     register_value2,

    // These ports are not in any interface
    output reg     [DATA_WIDTH-1:0]     new_value    // Signifies that new value has been written to the bank.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    // The registers.
    reg [DATA_WIDTH-1:0] registers [REGISTER_COUNT-1:0];
    
    always @* begin
        // Select new output when ever registers are activated.
        register_value1 <= registers[choose_register_i1];
        register_value2 <= registers[choose_register_i2];
    end
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Zero by default.
            new_value <= 0;
        end
        else begin
            if (mem_active_i && we_i == 1'b0) begin
                // Memory has read a value: Save to the register.
                registers[choose_register_i1] <= load_value_i;
                // Inform the new value to the debugging unit.
                new_value <= load_value_i;
            end
            else if (alu_active_i) begin
                // Alu is expected to yield a value: Save to the register.
                registers[choose_register_i1] <= alu_result_i;
                // Inform the new value to the debugging unit.
                new_value <= alu_result_i;
            end
            else if (literal_i[LITERAL_WIDTH] == 1'b1) begin
                // Alu is expected to yield a value: Save to the register.
                registers[choose_register_i1] <= literal_i[LITERAL_WIDTH-1:0];
                // Inform the new value to the debugging unit.
                new_value <= literal_i[LITERAL_WIDTH-1:0];
            end
        end
    end
endmodule
