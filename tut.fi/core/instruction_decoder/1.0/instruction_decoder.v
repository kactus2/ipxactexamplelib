//-----------------------------------------------------------------------------
// File          : instruction_decoder.v
// Creation date : 03.04.2017
// Creation time : 16:07:26
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.24 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:instruction_decoder:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/instruction_decoder/1.0/instruction_decoder.1.0.xml
//-----------------------------------------------------------------------------

module instruction_decoder #(
    parameter                              REGISTER_ID_WIDTH = 4,    // Bits reserved for identification a single register.
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              INSTRUCTION_WIDTH = DATA_WIDTH,    // Total width of an instruction
    parameter                              OP_CODE_WIDTH    = 4,    // Bits reserved for operation identifiers.
    parameter                              ALU_OP_WIDTH     = 2    // Bits reserved for identification of alu operation
) (
    // Interface: cpu_clk_sink
    // The mandatory clock, as this is synchronous logic.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input                               mem_rdy_i,
    output reg                          alu_active_o,
    output reg     [ALU_OP_WIDTH-1:0]   alu_op_o,
    output reg     [REGISTER_ID_WIDTH-1:0] choose_reg1_o,
    output reg     [REGISTER_ID_WIDTH-1:0] choose_reg2_o,
    output reg     [DATA_WIDTH:0]       literal_o,
    output reg                          mem_active_o,
    output reg                          we_o,

    // These ports are not in any interface
    input          [INSTRUCTION_WIDTH-1:0] instruction_feed
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    
    // The available instructions.
    parameter [OP_CODE_WIDTH-1:0]
        OP_PLUS         = 4'd0, 
        OP_MINUS        = 4'd1, 
        OP_MUL          = 4'd2, 
        OP_DIV          = 4'd3,
        LOAD            = 4'd4,
        STORE           = 4'd5, 
        SET_LITERAL     = 4'd6; 

    integer instruction;
    integer reg1;
    integer reg2;
    integer literal;
            
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            alu_active_o <= 0;
            alu_op_o <= 0;
            choose_reg1_o <= 0;
            choose_reg2_o <= 0;
            mem_active_o <= 0;
            we_o <= 0;
        end
        else begin
            instruction = instruction_feed[OP_CODE_WIDTH-1:0];
            reg1 = instruction_feed[REGISTER_ID_WIDTH-1+OP_CODE_WIDTH:OP_CODE_WIDTH];
            reg2 = instruction_feed[2*REGISTER_ID_WIDTH+OP_CODE_WIDTH-1:REGISTER_ID_WIDTH+OP_CODE_WIDTH];
            literal = instruction_feed[31:16];
            
            choose_reg1_o <= reg1;
            choose_reg2_o <= reg2;

            case (instruction)
                OP_PLUS :   begin
                                alu_op_o <= alu.OP_PLUS;
                                alu_active_o <= 1;
                                mem_active_o <= 0;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                OP_MINUS :      begin
                                alu_op_o <= alu.OP_MINUS;
                                alu_active_o <= 1;
                                mem_active_o <= 0;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                OP_MUL :        begin
                                alu_op_o <= alu.OP_MUL;
                                alu_active_o <= 1;
                                mem_active_o <= 0;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                OP_DIV :        begin
                                alu_op_o <= alu.OP_DIV;
                                alu_active_o <= 1;
                                mem_active_o <= 0;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                LOAD :          begin
                                alu_active_o <= 0;
                                mem_active_o <= 1;
                                we_o <= 0;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                STORE :         begin
                                alu_active_o <= 0;
                                mem_active_o <= 1;
                                we_o <= 1;
                                literal_o[DATA_WIDTH] <= 0;
                                end
                SET_LITERAL :   begin
                                alu_active_o <= 0;
                                mem_active_o <= 0;
                                literal_o[DATA_WIDTH] <= 1;
                                literal_o[DATA_WIDTH-1:0] <= literal;
                                end
                default :       $display("ERROR: Unkown instruction: %d", instruction_feed);
            endcase
        end
    end
endmodule
