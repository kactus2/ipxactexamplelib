//-----------------------------------------------------------------------------
// File          : wb_master.v
// Creation date : 15.05.2017
// Creation time : 14:00:41
// Description   : A verilog master that has a register array of data it uses to write to a slave. Each data is written to different address, and then read to verify it worked. Address space is assumed to be contiguous.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.104 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:communication.template:wb_master:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication.template/wb_master/1.0/wb_master.1.0.xml
//-----------------------------------------------------------------------------

module wb_master #(
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_COUNT       = 8,    // How many values there are in the register array.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              BASE_ADDRESS     = 'h0F00,    // The first referred address of the master.
    parameter                              SEND_ERR_ADDR    = 0    // If one, the initial phase will use an erroneous address.
) (
    // Interface: wb_master
    input                               ack_i,    // Slave asserts acknowledge.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from slave to master.
    input                               err_i,    // Indicates abnormal cycle termination.
    output reg     [ADDR_WIDTH-1:0]     adr_o,    // The address of the data.
    output reg                          cyc_o,    // Asserted by master for transfer.
    output reg     [DATA_WIDTH-1:0]     dat_o,    // Data from master to slave.
    output reg                          stb_o,    // Asserted by master for transfer.
    output reg                          we_o,    // Write = 1, Read = 0.

    // Interface: wb_system
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // These ports are not in any interface
    input                               start,    // Input used to signal that is is ok to start the masters.
    output reg                          done    // Output used to signal that the masters are done sending.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
  
    localparam AUB = 8; // Bits in a byte.
    localparam AU_IN_DATA = DATA_WIDTH/AUB; // Bytes in data.
    localparam MAX_WAIT = 1000; // Wait for slave only for this many iterations.
    
    // We have as data to send as parameterized.
    reg [DATA_WIDTH-1:0] register_file [DATA_COUNT-1:0];
    // Used to iterate register file.
    reg [$clog2(DATA_COUNT)-1:0] iterator;
  
    // The current state.
    reg [2:0] state;
    
    // Used in loops.
    integer index;
    
    // In simulations, we may opt to wait only so many iterations before 
    integer wait_count;
 
    // The available states.
    parameter [2:0]
        S_START             = 3'd0, // The initial state.
        S_BOGUS_INIT        = 3'd1, // Write to address that is likely wrong.
        S_WAIT_BOGUS_ACK    = 3'd2, // Waiting ack for the bogus cycle.
        S_WRITE_INIT        = 3'd3, // Initiating a write to slave.
        S_WAIT_WRITE_ACK    = 3'd4, // Waiting ack for write from slave.
        S_READ_INIT         = 3'd5, // Initiating a read to slave.
        S_WAIT_READ_ACK     = 3'd6; // Waiting ack for write from slave.
   
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Initialize register_file with data.
            for (index = 0; index < DATA_COUNT; index = index + 1) begin
                register_file[index] = {AU_IN_DATA{index[AUB-1:0]}};
            end
            
            // Initally waiting for start signal.
            state <= S_START;
                
            // Everything else is zero.
            dat_o <= 0;
            cyc_o <= 0;
            stb_o <= 0;
            we_o <= 0;
            done <= 0;
            iterator <= 0;
            adr_o <=  0;
            
            wait_count = 0;
        end
        else begin
        case(state)
            S_START: begin
                // Once it has started, initiate a write.
                if (SEND_ERR_ADDR) begin
                    state <= S_BOGUS_INIT;
                end
                else begin
                    state <= S_WRITE_INIT;
                end
                
                // Nothing is done yet.
                done <= 0;
                // Reset iterator, so that we may go through the array.
                iterator <= 0;
            end
            S_BOGUS_INIT: begin
                // Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
                // We are writing to slave.
                we_o <= 1;
                // Put in a bogus address
                adr_o <= BASE_ADDRESS - 10;
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_BOGUS_ACK;
                
                // Reset wait.
                wait_count = 0;
            end
            S_WAIT_BOGUS_ACK: begin
                if (err_i  == 1'b1) begin
                    // Error signal received! Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    // Next we will proceed to non-bogus addresses.
                    state <=  S_WRITE_INIT;
                end
                
                // Wait only for so long.
                if (wait_count > MAX_WAIT)
                    $stop;
                    
                wait_count = wait_count + 1;
            end
            S_WRITE_INIT: begin
                // Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
                // We are writing to slave.
                we_o <= 1;
                // Take output data from the register array.
                dat_o <= register_file[iterator];
                // Offset our base address by the iterator, thus placing each iteration on separate location on slave.
                // Also, multiply with addressable units, so that the iterations wont overlap.
                adr_o <= (iterator * AU_IN_DATA) + BASE_ADDRESS;
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_WRITE_ACK;
                
                // Reset wait.
                wait_count = 0;
            end
            S_WAIT_WRITE_ACK: begin
                if (ack_i  == 1'b1) begin
                    // Acknowledgement received! Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    // Next we will read.
                    state <= S_READ_INIT;
                end
                
                // Wait only for so long.
                if (wait_count > MAX_WAIT)
                    $stop;
                    
                wait_count = wait_count + 1;
            end
            S_READ_INIT: begin
                // Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
                // We are reading from slave.
                we_o <= 0;
                // Next we shall wait for acknowledgement.
                state <= S_WAIT_READ_ACK;
            end
            S_WAIT_READ_ACK: begin
                if (ack_i  == 1'b1) begin
                    // Acknowledgement received! Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    
                    // It was read from the same address as was written, so it should be the same data.
                    if (register_file[iterator] != dat_i) begin
                        $display("ERROR: Wrong answer from slave: %X", dat_i);
                        $stop;
                    end
                    
                    if (iterator == DATA_COUNT-1) begin
                        // We have gone through the whole register array, means we are done.
                        done <= 1;
                        // But we will wait for signal to start again.
                        $stop();
                    end
                    else begin
                        // More data to send, means we increase iterator...
                        iterator <= iterator + 1;
                        // ...and initiate next write.
                        state <= S_WRITE_INIT;
                        // Reset wait.
                        wait_count = 0;
                    end
                end
                
                // Wait only for so long.
                if (wait_count > MAX_WAIT)
                    $stop;
                    
                wait_count = wait_count + 1;
            end
            default: begin
                $display("ERROR: Unkown state: %d", state);
            end
        endcase
        end
    end
endmodule
