//-----------------------------------------------------------------------------
// File          : memory_controller.v
// Creation date : 03.04.2017
// Creation time : 15:18:50
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.23 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:memory_controller:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/memory_controller/1.0/memory_controller.1.0.xml
//-----------------------------------------------------------------------------

module memory_controller #(
    parameter                              DATA_WIDTH       = 16,    // Width for data in registers and instructions.
    parameter                              ADDR_WIDTH       = 16,    // Width of the addresses.
    parameter                              MEMORY_SIZE      = 256,    // How many bytes are in memory at total.
    parameter                              PERIPHERAL_BASE  = 128,    // The first address for peripherals.
    parameter                              AUB              = 8    // Addressable unit bits
) (
    // Interface: cpu_clk_sink
    // The mandatory clock, as this is synchronous logic.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // Interface: cpu_system
    input          [ADDR_WIDTH-1:0]     address_i,
    input                               mem_active_i,
    input          [DATA_WIDTH-1:0]     register_value_i,
    input                               we_i,
    output reg     [DATA_WIDTH-1:0]     load_value_o,
    output reg                          mem_rdy_o,

    // Interface: memory_interface
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
    
    // Used to index AUBs to data io.
    integer index;
    always @(posedge mem_active_i) begin
        if (address_i < PERIPHERAL_BASE) begin
            if (we_i == 1) begin
                // Writing: Pick every byte from the input and place them to correct addresses.
                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                    local_memory[address_i + index] <= register_value_i[(index*AUB)+:AUB];
                end
            end
            else begin
                // Reading: Pick every byte from correct addresses and place them to the output.
                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                    load_value_o[(index*AUB)+:AUB] <= local_memory[address_i + index];
                end
            end
            
            // Signal that instantly ready.
            mem_rdy_o <= 1;
        end
        else begin
            // JOTAIN :DDD
            $display("ERROR: Peripheral access unsupported for now. Address: %d", address_i);
        end
    end
    
    // The state.
    reg [1:0] state;
    
    // The available states.
    parameter [1:0]
        S_WAIT          = 2'd0, 
        S_WAIT_WRITE     = 2'd1, 
        S_WAIT_READ     = 2'd2;
    
    /*always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Start with wait
            state <= S_WAIT;
            
            // Outputs are zero by default.
            load_value_o <= 0;
            mem_rdy_o <= 0;
    
            mem_address_o <= 0;
            mem_data_o <= 0;
            mem_master_rdy <= 0;
            mem_we_o <= 0;
        end
        else begin
            if (state == S_WAIT) begin
                if (mem_active_n == 1) begin
                    if (address_i < PERIPHERAL_BASE) begin
                        if (we_i == 1) begin
                            // Writing: Pick every byte from the input and place them to correct addresses.
                            for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                                local_memory[address_i + index] <= register_value_i[(index*AUB)+:AUB];
                            end
                        end
                        else begin
                            // Reading: Pick every byte from correct addresses and place them to the output.
                            for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                                load_value_o[(index*AUB)+:AUB] <= local_memory[address_i + index];
                            end
                        end
                        
                        // Stay on the same state, signal that instantly ready.
                        mem_rdy_o <= 1;
                    end
                    else
                        if (we_i == 1) begin
                            mem_master_rdy <= 1;
                            mem_we_o <= 1;
                            mem_data_o <= register_value_i;
                            state <= S_WAIT_WRITE;
                            mem_address_o <= address_i - PERIPHERAL_BASE;
                        end
                        else
                            mem_master_rdy <= 1;
                            mem_we_o <= 0;
                            state <= S_WAIT_READ;
                            mem_address_o <= (value_iterator * AU_IN_DATA) - PERIPHERAL_BASE;
                        end
                        
                        // Most certainly not ready at the next cycle.
                        mem_rdy_o <= 0;
                    end
                end
                else
                    // No activity means no operation can be ready.
                    mem_rdy_o <= 0;
                end
            end
            else if (state == S_WAIT_WRITE) begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_WAIT;
                    
                    // Deassert write.
                    mem_we_o  <= 0;
                end
            end
            else if (state == S_WAIT_READ) begin
                mem_master_rdy <= 0;
                if (mem_slave_rdy == 1) begin
                    state <= S_WAIT;
                    load_value <= mem_data_i;
                    mem_rdy_o <= 1;
                end
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end*/
endmodule
