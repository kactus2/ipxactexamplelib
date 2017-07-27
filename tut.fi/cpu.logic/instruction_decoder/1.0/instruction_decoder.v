//-----------------------------------------------------------------------------
// File          : instruction_decoder.v
// Creation date : 16.05.2017
// Creation time : 09:02:07
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.106 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:cpu.logic:instruction_decoder:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.logic/instruction_decoder/1.0/instruction_decoder.1.0.xml
//-----------------------------------------------------------------------------

module instruction_decoder #(
    parameter                              REGISTER_ID_WIDTH = 4,    // Bits reserved for identification a single register.
    parameter                              LITERAL_WIDTH    = 16,    // How long literals the instructions may have.
    parameter                              OP_CODE_WIDTH    = 4,    // Bits reserved for operation identifiers.
    parameter                              INSTRUCTION_WIDTH = OP_CODE_WIDTH+2*REGISTER_ID_WIDTH+LITERAL_WIDTH,    // Total width of an instruction
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              ALU_OP_WIDTH     = 3,    // Bits reserved for identification of alu operation
    parameter                              INSTRUCTION_ADDRESS_WIDTH = 8    // Width of an instruction address.
) (
    // Interface: cpu_clk_sink
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input          [DATA_WIDTH-1:0]     alu_status_i,
    input          [DATA_WIDTH-1:0]     load_value_i,
    input                               mem_rdy_i,
    output reg                          alu_active_o,
    output reg     [ALU_OP_WIDTH-1:0]   alu_op_o,
    output reg     [REGISTER_ID_WIDTH-1:0] choose_reg1_o,
    output reg     [REGISTER_ID_WIDTH-1:0] choose_reg2_o,
    output reg                          mem_active_o,
    output reg                          register_active_o,
    output reg     [DATA_WIDTH-1:0]     register_value_o,
    output reg                          we_o,

    // Interface: instructions
    input          [INSTRUCTION_WIDTH-1:0] instruction_feed,
    output         [INSTRUCTION_ADDRESS_WIDTH-1:0] iaddr_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    
    // The available instructions.
    parameter [OP_CODE_WIDTH-1:0]
        NOP         = 4'b0000, 
        SET         = 4'b0001, 
        LOAD        = 4'b0010, 
        STORE       = 4'b0011, 
        BRA         = 4'b0100, 
        BNE        = 4'b0101,
        PLUS        = 4'b1000, 
        MINUS       = 4'b1001, 
        MUL         = 4'b1010, 
        DIV         = 4'b1011, 
        CMP         = 4'b1100, 
        END         = 4'b1111;

    // The address of the currently decoded instruction.
    reg [INSTRUCTION_ADDRESS_WIDTH-1:0] instruction_pointer;
    
    // Sliced operands of instruction decoded in combinational logic.
    integer next_reg1;
    integer next_reg2;
    reg [OP_CODE_WIDTH-1:0] operation;
    reg [DATA_WIDTH:0] literal;
    
    // Intermediate values that are result from combinational logic.
    reg [INSTRUCTION_ADDRESS_WIDTH-1:0] next_instruction;
    reg next_mem_active;
    reg next_we;
    reg next_alu_active;
    reg [DATA_WIDTH:0] next_register_value;
    reg next_register_active;
    
    // This output comes directly from combinational logic.
    assign iaddr_o = next_instruction;
    
    // Combinational logic used for decoding, as well as for those outputs that needs to take effect within current cycle.
    always @* begin
        if (mem_active_o)begin
            // If waiting for memory operation, the CPU is stalled.
        
            if (mem_rdy_i) begin
                // If ready, no longer waiting and the next instruction is fetched.
                next_mem_active <= 0;
                next_instruction <= instruction_pointer + 1;
            end
            else begin
                // Else the stalling continues.
                next_mem_active <= 1;
                next_instruction <= instruction_pointer;
            end
            
            // These remain zero.
            next_register_value <= 0;
            next_register_active <= 0;
            next_we <= we_o;
            next_alu_active <= 0;
        end
        else begin
            // No stalling: process the next instruction.
            
            // Slice the instruction to parts:
            
            // Operation is the primary directive for what happens next.
            operation = instruction_feed[LITERAL_WIDTH+2*REGISTER_ID_WIDTH+OP_CODE_WIDTH-1:LITERAL_WIDTH+2*REGISTER_ID_WIDTH];
            // Instructions may have two registers as operands.
            next_reg1 = instruction_feed[LITERAL_WIDTH+2*REGISTER_ID_WIDTH-1:LITERAL_WIDTH+REGISTER_ID_WIDTH];
            next_reg2 = instruction_feed[LITERAL_WIDTH+REGISTER_ID_WIDTH-1:LITERAL_WIDTH];
            // Each instruction may come with a literal value.
            literal <= instruction_feed[LITERAL_WIDTH-1:0];
            
            // Activate ALU if arithmetic operation.
            if (operation == PLUS ||
                operation == MINUS ||
                operation == MUL ||
                operation == DIV)
            begin
                 next_alu_active <= 1;
            end
            else begin
                next_alu_active <= 0;
            end
            
            // Memory and instruction operations do some mutually exclusive stuff.
            if (operation == BRA ||
                (operation == BNE && !alu_status_i[alu.ZERO]))
            begin
                // Branch if branching, obviously excludes data memory operations.
                next_mem_active <= 0;
                // Moreover, the address of the next instruction comes from operation.
                next_instruction = literal;
            end
            else if (operation == LOAD || operation == STORE)
            begin
                // Activate memory controller if memory operation.
                next_mem_active <= 1;
                // Stalling the CPU: The instruction pointer stays the same.
                next_instruction = instruction_pointer;
            end
            else begin
                // Else the instruction pointer increases as normal.
                next_mem_active <= 0;
                next_instruction = instruction_pointer + 1;
            end
            
            // Activate write enable if storing to memory.
            if (operation == STORE) begin
                next_we <= 1;
            end
            else begin
                next_we <= 0;
            end
            
            if (operation == SET) begin
                // Activate register bank, pass the literal to it.
                next_register_active <= 1;
                next_register_value <= literal;
            end
            else begin
                next_register_active <= 0;
            end
        end
    end
    
    // Since the processor operates on clock cycles, most outputs take effect on the next clock cycle.
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            alu_active_o <= 0;
            alu_op_o <= 0;
            choose_reg1_o <= 0;
            choose_reg2_o <= 0;
            mem_active_o <= 0;
            we_o <= 0;
            instruction_pointer <= 0;
            register_value_o <= 0;
            register_active_o <= 0;
        end
        else begin
            // Pass the results of decoding as the operations and outputs of the next cycle.
            
            // Register bank:
            choose_reg1_o <= next_reg1;
            choose_reg2_o <= next_reg2;
            register_value_o <= next_register_value;
            register_active_o <= next_register_active;
            alu_active_o <= next_alu_active;
            
            // Memory:
            instruction_pointer <= next_instruction;
            mem_active_o <= next_mem_active;
            we_o <= next_we;
            
            // Pass ALU operation: It should be part of the instruction, if any.
            alu_op_o <= operation[ALU_OP_WIDTH-1:0];
        end
    end
endmodule
