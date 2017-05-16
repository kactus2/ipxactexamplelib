//-----------------------------------------------------------------------------
// File          : memory_controller.v
// Creation date : 16.05.2017
// Creation time : 11:39:33
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.106 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:cpu.logic:memory_controller:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.logic/memory_controller/1.0/memory_controller.1.0.xml
//-----------------------------------------------------------------------------

module memory_controller #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              AUB              = 8,    // Addressable unit bits, size of byte.
    parameter                              ADDR_WIDTH       = 16,    // Width of the addresses.
    parameter                              MEMORY_SIZE      = 256,    // How many bytes are in memory at total.
    parameter                              PERIPHERAL_BASE  = 128,    // The first address for peripherals.
    parameter                              REGISTER_COUNT   = 8,    // How many registers are supported in the core.
    parameter                              DATA_BYTES       = DATA_WIDTH/AUB,    // How many bytes in data width.
    parameter                              CONTROL_RANGE    = 'h40    // How many AUBs are reserved for control data.
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
    output                              mem_read_rdy_o,

    // Interface: local_data
    input          [DATA_WIDTH-1:0]     local_read_data,
    output         [ADDR_WIDTH-1:0]     local_address_o,
    output         [DATA_WIDTH-1:0]     local_write_data,
    output                              local_write_o,

    // Interface: peripheral_access
    input          [DATA_WIDTH-1:0]     mem_data_i,
    input                               mem_slave_rdy,
    output reg     [ADDR_WIDTH-1:0]     mem_address_o,
    output reg     [DATA_WIDTH-1:0]     mem_data_o,
    output reg                          mem_master_rdy,
    output reg                          mem_we_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    
    // Choose the active address block, if any.
    wire local_mem_active = mem_active_i && address_i < PERIPHERAL_BASE;
    wire periph_mem_active = mem_active_i && address_i >= PERIPHERAL_BASE;
    reg periph_mem_rdy;
    reg local_mem_rdy;
    
    reg [DATA_WIDTH-1:0] periph_load_value;
    // 1 = Last operation was read, else zero.
    reg read_operation;
    
    assign load_value_o = periph_mem_active ? periph_load_value : local_read_data;
    
    assign local_write_data = register_value_i;
    assign local_write_o = we_i;
    assign local_address_o = address_i;
    
    assign mem_rdy_o = local_mem_rdy | periph_mem_rdy;
    assign mem_read_rdy_o = mem_rdy_o && read_operation;
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            local_mem_rdy <= 0;
            read_operation <= 0;
        end
        else begin
            if (local_mem_active) begin
                local_mem_rdy <= 1;
            end
            else begin
                local_mem_rdy <= 0;
            end
            
            if (local_mem_active || mem_active_i) begin
                read_operation <= ~we_i;
            end
            else begin
                read_operation <= 0;
            end
        end
    end
    
    // The state of peripheral access.
    reg [1:0] state;
    
    // The available states for peripheral access.
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
        case(state)
            S_WAIT: begin
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
            S_WAIT_WRITE: begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_mem_rdy <= 1;
                    
                    // Deassert write.
                    mem_we_o  <= 0;
                end
            end
            S_WAIT_READ: begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_load_value <= mem_data_i;
                    periph_mem_rdy <= 1;
                end
            end
            S_DEASSERT: begin
                state <= S_WAIT;
                periph_mem_rdy <= 0;
            end
            default: begin
                $display("ERROR: Unkown state: %d", state);
            end
        endcase
        end
    end
endmodule
