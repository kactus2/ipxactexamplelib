//-----------------------------------------------------------------------------
// File          : alu.v
// Creation date : 13.04.2017
// Creation time : 15:10:28
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.79 32-bit
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
    input          [DATA_WIDTH-1:0]     register_value_i1,
    input          [DATA_WIDTH-1:0]     register_value_i2,
    output reg     [DATA_WIDTH-1:0]     alu_result_o,
    output reg     [DATA_WIDTH-1:0]     alu_status_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    // The available states.
    parameter [ALU_OP_WIDTH-1:0]
        OP_PLUS         = 2'd0, 
        OP_MINUS        = 2'd1, 
        OP_MUL          = 2'd2, 
        OP_DIV          = 2'd3;
        
    parameter [1:0]
        C_OUT           = 2'd3, 
        NEGATIVE        = 2'd2,
        ZERO                = 2'd1, 
        DIV_ZERO        = 2'd0;
        
    reg [DATA_WIDTH*2-1:0] operation_result;
    integer div_zero;
        
    always @* begin
        div_zero = 0;
    
        case(alu_op_i)
            OP_PLUS: operation_result <= register_value_i1 + register_value_i2;
            OP_MINUS: operation_result <= register_value_i1 - register_value_i2;
            OP_MUL: operation_result <= register_value_i1 * register_value_i2;
            OP_DIV: begin
                if (register_value_i2 == 0) begin
                    operation_result <= 0;
                    div_zero = 1;
                end
                else begin
                    operation_result <= register_value_i1 / register_value_i2;
                end
            end
            default: begin
                $display("ERROR: Unknown ALU operation: %d", alu_op_i);
                operation_result <= 0;
            end
        endcase
        
        alu_result_o <= operation_result;
        
        alu_status_o[DATA_WIDTH-1:C_OUT+1] = 0;
        alu_status_o[C_OUT] = operation_result[DATA_WIDTH];
        alu_status_o[NEGATIVE] = operation_result[DATA_WIDTH-1];
        alu_status_o[ZERO] = (operation_result == 0);
        alu_status_o[DIV_ZERO] = div_zero;
    end
endmodule
