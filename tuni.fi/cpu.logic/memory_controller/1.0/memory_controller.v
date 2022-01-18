//-----------------------------------------------------------------------------
// File          : memory_controller.v
// Creation date : 27.07.2017
// Creation time : 15:08:05
// Description   : Used to control local memory as well as peripherals.
//                 
//                 Ports prefixes:
//                 -local denotes local memory access, explained in interface.local_memory
//                 -periph denotes peripheral access, explained in interface.peripheral_control
//                 -sys denotes CPU system bus, explained in interface.intra_cpu
// Created by    : TermosPullo
// Tool : Kactus2 3.4.110 32-bit
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
    // The clock and reset comes through this interface.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    // Connects the component to other CPU components.
    input                               sys_active_i,
    input          [ADDR_WIDTH-1:0]     sys_address_i,
    input          [DATA_WIDTH-1:0]     sys_data_i,
    input                               sys_we_i,
    output         [DATA_WIDTH-1:0]     sys_data_o,
    output                              sys_rdy_o,
    output                              sys_read_rdy_o,

    // Interface: local_data
    // Connects to the local data memory.
    input          [DATA_WIDTH-1:0]     local_read_data,
    output         [ADDR_WIDTH-1:0]     local_address_o,
    output         [DATA_WIDTH-1:0]     local_write_data,
    output                              local_write_o,

    // Interface: peripheral_access
    // Controller accesses peripherals through this interface.
    input          [DATA_WIDTH-1:0]     periph_data_i,
    input                               periph_slave_rdy,
    output reg     [ADDR_WIDTH-1:0]     periph_address_o,
    output reg     [DATA_WIDTH-1:0]     periph_data_o,
    output reg                          periph_master_rdy,
    output reg                          periph_we_o
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    
    // Choose the active address block, if any.
    wire local_mem_active = sys_active_i && sys_address_i < PERIPHERAL_BASE;
    wire periph_mem_active = sys_active_i && sys_address_i >= PERIPHERAL_BASE;
    reg periph_mem_rdy;
    reg local_mem_rdy;
    
    reg [DATA_WIDTH-1:0] periph_load_value;
    // 1 = Last operation was read, else zero.
    reg read_operation;
    
    assign sys_data_o = periph_mem_active ? periph_load_value : local_read_data;
    
    assign local_write_data = sys_data_i;
    assign local_write_o = sys_we_i;
    assign local_address_o = sys_address_i;
    
    assign sys_rdy_o = local_mem_rdy | periph_mem_rdy;
    assign sys_read_rdy_o = sys_rdy_o && read_operation;
    
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
            
            if (local_mem_active || sys_active_i) begin
                read_operation <= ~sys_we_i;
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
            periph_address_o <= 0;
            periph_data_o <= 0;
            periph_master_rdy <= 0;
            periph_we_o <= 0;
        end
        else begin
        case(state)
            S_WAIT: begin
                if (periph_mem_active == 1) begin
                    if (sys_we_i == 1) begin
                        periph_we_o <= 1;
                        periph_data_o <= sys_data_i;
                        state <= S_WAIT_WRITE;
                    end
                    else begin
                        state <= S_WAIT_READ;
                    end

                    periph_master_rdy <= 1;
                    periph_address_o <= sys_address_i - PERIPHERAL_BASE;
                end
            end
            S_WAIT_WRITE: begin
                periph_master_rdy <= 0;
                if (periph_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_mem_rdy <= 1;
                    
                    // Deassert write.
                    periph_we_o  <= 0;
                end
            end
            S_WAIT_READ: begin
                periph_master_rdy <= 0;
                if (periph_slave_rdy == 1) begin
                    state <= S_DEASSERT;
                    periph_load_value <= periph_data_i;
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
