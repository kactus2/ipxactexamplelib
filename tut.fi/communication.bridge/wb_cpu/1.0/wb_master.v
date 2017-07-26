//-----------------------------------------------------------------------------
// File          : wb_master.v
// Creation date : 25.07.2017
// Creation time : 15:41:44
// Description   : A bridge between a CPU and wishbone bus.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.110 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:communication.bridge:wb_cpu:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication.bridge/wb_cpu/1.0/wb_cpu.1.0.xml
//-----------------------------------------------------------------------------

module wb_master #(
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              BASE_ADDRESS     = 'h0F00,    // The location of the bus in the system memory.
    parameter                              RANGE            = 'h0200    // Number of addresses accesible by the component.
) (
    // Interface: contoller
    // Is used by a controller to initiate transfers through the bridge.
    input          [ADDR_WIDTH-1:0]     mem_address_in,    // Target address of a peripheral operation
    input          [DATA_WIDTH-1:0]     mem_data_in,    // Data from controller.
    input                               mem_master_rdy,    // Data is provided and transfer can be executed.
    input                               mem_we_in,    // Controllers writes = 1, Controller reads = 0.
    output reg     [DATA_WIDTH-1:0]     mem_data_out,    // Data to controller.
    output reg                          mem_slave_rdy,    // Slave has executed the transfer.

    // Interface: wb_master
    // Connects to wishbone slave or mirrored master accessible through this bride.
    input                               wb_ack_i,    // Slave asserts acknowledge.
    input          [DATA_WIDTH-1:0]     wb_dat_i,    // Data from slave to master.
    input                               wb_err_i,    // Indicates abnormal cycle termination.
    output reg     [ADDR_WIDTH-1:0]     wb_adr_o,    // The address of the data.
    output reg                          wb_cyc_o,    // Asserted by master for transfer.
    output reg     [DATA_WIDTH-1:0]     wb_dat_o,    // Data from master to slave.
    output reg                          wb_stb_o,    // Asserted by master for transfer.
    output reg                          wb_we_o,    // Write = 1, Read = 0.

    // Interface: wb_system
    // Grouping for wishbone system signals. The clock and reset are used for all logic
    // in this module.
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    // The current state.
    reg [2:0] state;
 
    // The available states.
    parameter [2:0]
        S_CMD               = 3'd0, // Waiting command from the master
        S_WRITE_INIT        = 3'd1, // Initiating a write to slave.
        S_WAIT_WRITE_ACK    = 3'd2, // Waiting ack for write from slave.
        S_READ_INIT         = 3'd3, // Initiating a read to slave.
        S_WAIT_READ_ACK     = 3'd4, // Waiting ack for write from slave. 
        S_DEASSERT     = 3'd5;
   
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Initally waiting for start signal.
            state <= S_CMD;
            // Everything else is zero.
            dat_o <= 0;
            cyc_o <= 0;
            stb_o <= 0;
            we_o <= 0;
            adr_o <=  0;
            mem_data_out <= 0;
            mem_slave_rdy <= 0;
        end
        else begin
        case(state)
            S_CMD: begin
                // Wait for the master.
                if (mem_master_rdy == 1'b1) begin
                    // Branch based on if it is read or write.
                    if (mem_we_in == 1'b1) begin
                        state <=  S_WRITE_INIT;
                    end
                    else begin
                        state <=  S_READ_INIT;
                    end
                end
            end
            S_WRITE_INIT: begin
                // Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
                // We are writing to slave.
                we_o <= 1;
                
                // Take data directly from the master.
                dat_o <= mem_data_in;
                adr_o <= mem_address_in;
                
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_WRITE_ACK;
            end
            S_WAIT_WRITE_ACK: begin
                if (err_i == 1'b1 || ack_i == 1'b1) begin
                    // Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    
                    // Pass the result to the master.
                    mem_slave_rdy <= 1;
                    
                    // Look for the next operation.
                    state <=  S_DEASSERT;
                end
            end
            S_READ_INIT: begin
                // Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
                // We are reading from slave.
                we_o <= 0;
                
                // Take address directly from the master.
                adr_o <= mem_address_in;
                
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_READ_ACK;
            end
            S_WAIT_READ_ACK: begin
                if (err_i == 1'b1 || ack_i == 1'b1) begin
                    // Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    
                    // Pass the result to the master.
                    mem_slave_rdy <= 1;
                    
                    if (err_i == 1'b1) begin
                        mem_data_out <= 0;
                    end
                    else begin
                        mem_data_out <= dat_i;
                    end
                    
                    // Look for the next operation.
                    state <=  S_DEASSERT;
                end
            end
            S_DEASSERT: begin
                state <= S_CMD;
                mem_slave_rdy <= 0;
            end
            default: begin
                $display("ERROR: Unkown state: %d", state);
            end
        endcase
        end
    end
   
endmodule
