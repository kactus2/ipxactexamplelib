//-----------------------------------------------------------------------------
// File          : alu.v
// Creation date : 03.04.2017
// Creation time : 14:53:12
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.23 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:alu:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/alu/1.0/alu.1.0.xml
//-----------------------------------------------------------------------------

module alu #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              ALU_OP_WIDTH     = 2    // Bits reserved for identification of alu operation
) (
    // Interface: cpu_system
    input                               alu_active_i,
    input          [ALU_OP_WIDTH-1:0]   alu_op_i,
    input          [DATA_WIDTH-1:0]     register_value1_i,
    input          [DATA_WIDTH-1:0]     register_value2_i,
    output reg     [DATA_WIDTH-1:0]     alu_result_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    // The available states.
    parameter [ALU_OP_WIDTH-1:0]
        OP_PLUS         = 2'd0, 
        OP_MINUS        = 2'd1, 
        OP_MUL          = 2'd2, 
        OP_DIV          = 2'd3;
        
    always @* begin
        case(alu_op_i)
            OP_PLUS: alu_result_o <= register_value1_i + register_value2_i;
            OP_MINUS: alu_result_o <= register_value1_i - register_value2_i;
            OP_MUL: alu_result_o <= register_value1_i * register_value2_i;
            OP_DIV: alu_result_o <= register_value1_i / register_value2_i;
            default: begin
                $display("ERROR: Unknown ALU operation: %d", alu_op_i);
                alu_result_o <= 0;
            end
        endcase
    end
endmodule
