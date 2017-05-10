//-----------------------------------------------------------------------------
// File          : memory_controller.v
// Creation date : 11.04.2017
// Creation time : 11:03:15
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.21 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:memory_controller:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/memory_controller/1.0/memory_controller.1.0.xml
//-----------------------------------------------------------------------------

module memory_controller #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              AUB              = 8,    // Addressable unit bits, size of byte.
    parameter                              ADDR_WIDTH       = 16,    // Width of the addresses.
    parameter                              MEMORY_SIZE      = 256,    // How many bytes are in memory at total.
    parameter                              PERIPHERAL_BASE  = 128,    // The first address for peripherals.
    parameter                              REGISTER_COUNT   = 8,    // How many registers are supported in the core.
    parameter                              DATA_BYTES       = DATA_WIDTH/AUB,    // How many bytes in data width.
    parameter                              CONTROL_RANGE    = 'h40,    // How many AUBs are reserved for control data.
    parameter                              ADDR_BYTES       = ADDR_WIDTH/AUB    // How many bytes in address width.
) (
    // Interface: cpu_clk_sink
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input          [ADDR_WIDTH-1:0]     address_i,
    input                               mem_active_i,
    input          [DATA_WIDTH-1:0]     register_value_i,
    input                               we_i,
    output         [DATA_WIDTH-1:0]     load_value_o,
    output                              mem_rdy_o,

    // Interface: peripheral_access
    input          [DATA_WIDTH-1:0]     mem_data_i,
    input                               mem_slave_rdy,
    output reg     [ADDR_WIDTH-1:0]     mem_address_o,
    output reg     [DATA_WIDTH-1:0]     mem_data_o,
    output reg                          mem_master_rdy,
    output reg                          mem_we_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    // Effectively this is how many bytes in fits a word.
    localparam AU_IN_DATA = DATA_WIDTH/AUB;

    // The local memory is assumed to extend until peripheral base begins.
    reg [AUB-1:0] local_memory [PERIPHERAL_BASE-1:0];
    
    // Choose the active address block, if any.
    wire local_mem_active = mem_active_i && address_i < PERIPHERAL_BASE;
    wire periph_mem_active = mem_active_i && address_i >= PERIPHERAL_BASE;
    reg periph_mem_rdy;
    
    reg [DATA_WIDTH-1:0] local_load_value;
    reg [DATA_WIDTH-1:0] periph_load_value;
    
    assign load_value_o = periph_mem_active ? periph_load_value: local_load_value;
    
    assign mem_rdy_o = local_mem_active | periph_mem_rdy;
    
    // Used to index AUBs to data io.
    integer index;
    always @* begin
        if (local_mem_active) begin
            if (we_i == 1) begin
                // Writing: Pick every byte from the input and place them to correct addresses.
                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                    local_memory[address_i + index] <= register_value_i[(index*AUB)+:AUB];
                    local_load_value <= 'z;
                end
            end
            else begin
                // Reading: Pick every byte from correct addresses and place them to the output.
                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                    local_load_value[(index*AUB)+:AUB] <= local_memory[address_i + index];
                end
            end
        end
        else
            local_load_value <= 'z;
    end
    
    // The state.
    reg [1:0] state;
    
    // The available states.
    parameter [1:0]
        S_WAIT          = 2'd0, 
        S_WAIT_WRITE     = 2'd1, 
        S_WAIT_READ     = 2'd2, 
        S_DEASSERT     = 2'd3;
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Start with wait
            state <= S_WAIT;
            periph_mem_rdy <= 0;
            periph_load_value <= 0;
            
            // Outputs are zero by default.
            mem_address_o <= 0;
            mem_data_o <= 0;
            mem_master_rdy <= 0;
            mem_we_o <= 0;
        end
        else begin
            if (state == S_WAIT) begin
                if (periph_mem_active == 1) begin
                    if (we_i == 1) begin
                        mem_we_o <= 1;
                        mem_data_o <= register_value_i;
                        state <= S_WAIT_WRITE;
                    end
                    else begin
                        state <= S_WAIT_READ;
                    end

                    mem_master_rdy <= 1;
                    mem_address_o <= address_i - PERIPHERAL_BASE;
                end
            end
            else if (state == S_WAIT_WRITE) begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_mem_rdy <= 1;
                    
                    // Deassert write.
                    mem_we_o  <= 0;
                end
            end
            else if (state == S_WAIT_READ) begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_load_value <= mem_data_i;
                    periph_mem_rdy <= 1;
                end
            end
            else if (state == S_DEASSERT) begin
                state <= S_WAIT;
                periph_mem_rdy <= 0;
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
endmodule
