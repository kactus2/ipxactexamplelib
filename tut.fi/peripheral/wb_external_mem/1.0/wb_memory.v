//-----------------------------------------------------------------------------
// File          : wb_memory.v
// Creation date : 06.04.2017
// Creation time : 11:31:51
// Description   : A basic wishbone controlled memory, which as an alternative operating mode can create hashes of the written values.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.27 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:peripheral:wb_external_mem:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/peripheral/wb_external_mem/1.0/wb_external_mem.1.0.xml
//-----------------------------------------------------------------------------

module wb_memory #(
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              MEMORY_SIZE      = 128,    // How many data slots in AUB there is in the memory.
    parameter                              BASE_ADDRESS     = 'h0F00,    // The first referred address of the master.
    parameter                              HASH_KEY         = 'hDEADF00D    // The key used to create the hashes.
) (
    // Interface: wb_slave
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from master to slave.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output reg                          ack_o,    // Slave asserts acknowledge.
    output reg     [DATA_WIDTH-1:0]     dat_o,    // Data from slave to master.
    output reg                          err_o,    // Indicates abnormal cycle termination.

    // Interface: wb_system
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // These ports are not in any interface
    input                               store_hash_i    // 1 = store hash, 0 = do not store
);

    // Remap states:
    `define store_hash (store_hash_i == 1)

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    localparam AUB = 8;
    localparam AU_IN_DATA = DATA_WIDTH/AUB;
    reg [AUB-1:0] memory [MEMORY_SIZE-1:0];
    
    // Used to index AUBs to data io.
    integer index;
    // The address is ok = 1, else not ok.
    integer addr_ok;

    // The state.
    reg [0:0] state;
    
    // The hash key, saved to register for run-time.
    reg [DATA_WIDTH-1:0] key;
    
    // The available states.
    parameter [0:0]
        S_WAIT      = 1'd0, // Waiting for cyc_i & stb_i
        S_DEASSERT  = 1'd1; // Deassert acknowledgement.

    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            ack_o <= 0; // Obviously, there is nothing to acknowledge by default.
            dat_o <= 0; // No output by default.
            err_o <= 0; // No error by default.
            state <= S_WAIT; // Wait signals from the masters at reset.
            key <= HASH_KEY;
        end
        else begin
            if (state == S_WAIT) begin
                if (`store_hash && we_i == 1) begin
                    if (adr_i < BASE_ADDRESS + MEMORY_SIZE/2 && adr_i >= BASE_ADDRESS) begin
                        addr_ok = 1;
                    end
                    else begin
                        addr_ok = 0;
                    end
                end
                else begin
                    if (adr_i < BASE_ADDRESS + MEMORY_SIZE && adr_i >= BASE_ADDRESS) begin
                        addr_ok = 1;
                    end
                    else begin
                        addr_ok = 0;
                    end
                end
                     
                // Wait signal from the master.
                if (cyc_i == 1 && stb_i == 1) begin
                    if (addr_ok == 1) begin
                        // The specified address in accessible -> proceed.
                        ack_o <= 1;

                        if ( we_i == 1 ) begin
                            // Writing: Pick every byte from the input and place them to correct addresses.
                            for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                                memory[adr_i - BASE_ADDRESS + index] <= dat_i[(index*AUB)+:AUB];
                            end
                            
                            // HASHED MODE: Write the hash value to the corresponding location in HASHED addres block.
                            if (`store_hash) begin
                                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                                    memory[adr_i - BASE_ADDRESS + MEMORY_SIZE/2 + index] <= (dat_i[(index*AUB)+:AUB] ^ key[(index*AUB)+:AUB]);
                                end
                            end
                        end
                        else begin
                            // Reading: Pick every byte from correct addresses and place them to the output.
                            for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                                dat_o[(index*AUB)+:AUB] <= memory[adr_i - BASE_ADDRESS + index];
                            end
                        end
                    end
                    else begin
                        // The specified address out-of-scope -> error!
                        err_o <= 1;
                    end

                    // Next thing is to deassert.
                    state <= S_DEASSERT;
                end
            end
            else if (state == S_DEASSERT) begin
                // Deassert acknowlegement, get ready to receive next one.
                ack_o <= 0;
                err_o <= 0;
                state <= S_WAIT;
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
endmodule
