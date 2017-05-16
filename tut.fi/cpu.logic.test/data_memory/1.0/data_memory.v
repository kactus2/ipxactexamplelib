//-----------------------------------------------------------------------------
// File          : data_memory.v
// Creation date : 16.05.2017
// Creation time : 10:33:36
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.106 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:cpu.logic.test:data_memory:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.logic.test/data_memory/1.0/data_memory.1.0.xml
//-----------------------------------------------------------------------------

module data_memory #(
    parameter                              DATA_WIDTH       = 32,    // Width for data.
    parameter                              ADDR_WIDTH       = 9,    // Width of the addresses.
    parameter                              MEMORY_SIZE      = 128,
    parameter                              AUB              = 8
) (
    // Interface: slave
    input          [ADDR_WIDTH-1:0]     adr_i,
    input                               write,
    input          [DATA_WIDTH-1:0]     write_data,
    output reg     [DATA_WIDTH-1:0]     read_data,

    // These ports are not in any interface
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    reg [AUB-1:0] data_memory [MEMORY_SIZE-1:0];
    
    localparam AU_IN_DATA = DATA_WIDTH/AUB;
    
    // Used to index AUBs to data io.
    integer index;
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            read_data <= 0;
        end
        else begin
            if (adr_i < MEMORY_SIZE && adr_i >= 0) begin
                if (write == 1) begin
                    // Writing: Pick every byte from the input and place them to correct addresses.
                    for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                        data_memory[adr_i + index] <= write_data[(index*AUB)+:AUB];
                    end
                end
                
                // Reading: Pick every byte from correct addresses and place them to the output.
                for (index = 0; index < AU_IN_DATA; index = index + 1) begin
                    read_data[(index*AUB)+:AUB] <= data_memory[adr_i + index];
                end
            end
        end
    end
endmodule
