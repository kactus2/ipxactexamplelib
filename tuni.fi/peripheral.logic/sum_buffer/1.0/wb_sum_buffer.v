//-----------------------------------------------------------------------------
// File          : wb_sum_buffer.v
// Creation date : 20.04.2017
// Creation time : 10:25:17
// Description   : Maintains calculated sum of input values. The output value is the latest result. When new input value is set, the oldest is discarded and deducted from the result.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.88 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:peripheral:sum_buffer:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/peripheral/sum_buffer/1.0/sum_buffer.1.0.xml
//-----------------------------------------------------------------------------

module wb_sum_buffer #(
    parameter                              BUFFER_SIZE      = 16,    // How much buffer is allocated for both directions.
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              BASE_ADDRESS     = 'h0F00,    // The first referred address of the master.
    parameter                              BUFFER_INDEX_WIDTH = $clog2(BUFFER_SIZE),    // How many bits are needed to index the buffer.
    parameter                              COLUMN_WIDTH     = 1    // Width of each column in sum.
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
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    // The contained buffer.
    reg [DATA_WIDTH-1:0] memory [BUFFER_SIZE-1:0];
    
    // The result of the operation.
    reg [DATA_WIDTH-1:0] result;
    
    // The position of the next input data.
    reg [BUFFER_INDEX_WIDTH-1:0] index;
    
    // Addressable unit bits.
    localparam AUB = 8;
    // How many AUBs come in each input and output.
    localparam AU_IN_DATA = DATA_WIDTH/AUB;

    // The state.
    reg [0:0] state;
    
    // The value that was previously in the current index.
    integer lastValue;
    // The value that will be in the current index.
    integer newValue;
    
    // Used to iterate the buffer.
    integer iterator;
    
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
            result <= 0;
            index <= 0;
            
            // The buffer is zeroed in reset.
            for (iterator = 0; iterator < BUFFER_SIZE; iterator = iterator +1) begin
                memory[iterator] <= 0;
            end
        end
        else begin
            if (state == S_WAIT) begin
                // Wait signal from the master.
                if ( cyc_i == 1 && stb_i == 1 ) begin
                    // Master ok, check the address.
                    if (adr_i == BUFFER_SIZE+BASE_ADDRESS && we_i == 1) begin
                        // Address of the new value.
                        ack_o <= 1;
                        
                        // Memorize for while what the new value will replace.
                        lastValue = memory[index];
                        
                        // The new value. Values may be scaled if so desired.
                        newValue = dat_i * COLUMN_WIDTH;
                        
                        // Place the value in the correct index.
                        memory[index] <= newValue;
                        
                        // The result of the sum: Remove the replaced value, add the new value.
                        result <= result - lastValue + newValue;
                        
                        // Step to the next index, which will be zero if the current index is the last.
                        if (index < BUFFER_SIZE-1) begin
                            index <= index + 1;
                        end
                        else begin
                            index <= 0;
                        end
                    end
                    else if (adr_i == BUFFER_SIZE+BASE_ADDRESS+AU_IN_DATA && we_i == 0) begin
                        // Address of the result was read, so output it.
                        ack_o <= 1;
                        dat_o = result;
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
