//-----------------------------------------------------------------------------
// File          : wb_slave.v
// Creation date : 28.06.2016
// Creation time : 10:46:10
// Description   : A verilog slave that provides a read/write access to a verilog register array. Address space is assumed to be contiguous.
// Created by    : TermosPullo
// This file was generated with Kactus2 verilog generator version 1.2
// Kactus2 version : 3.1.3 32-bit
// based on IP-XACT component tut.fi:ip.hw:wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/wb_slave/1.0/wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module wb_slave #(
    parameter                              BASE_ADDRESS     = 0,    // The first referable address. Is substracted from input address.
    parameter                              DATA_WIDTH       = 8,    // The width of the both transferred and inputted data.
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_COUNT       = 16    // How many values there are in the register array.
) (
    // Interface: slave_interface
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output reg                          ack_o,    // Slave asserts acknowledge.
    output reg     [DATA_WIDTH-1:0]     dat_o,    // Data from master to slave.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input          [3:0]                configuration,    // Input for remap state selection
    input                               rst    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
localparam AUB = 8;
    localparam SIZE = 32;
    localparam DIMENSION = 16;
    localparam MEMORY_SIZE = (DIMENSION*SIZE)/AUB;
    localparam STATUS_WIDTH = 4;
    localparam STATUS_OFFSET = 3;
	
    localparam AU_IN_DATA = DATA_WIDTH/AUB;

// We have as much memory as parameterized.
    reg [AUB-1:0] dat [0:MEMORY_SIZE-1];
    // The state.
    reg [0:0] state;

	wire [STATUS_WIDTH:0] status  [0:DIMENSION-1];
	integer index;
	integer sub_index;
	
	assign status[0] = {dat[3],dat[2],dat[1],dat[0]} >> STATUS_OFFSET;
	assign status[1] = {dat[7],dat[6],dat[5],dat[4]} >> STATUS_OFFSET;
	assign status[2] = {dat[11],dat[10],dat[9],dat[8]} >> STATUS_OFFSET;
	assign status[3] = {dat[15],dat[14],dat[13],dat[12]} >> STATUS_OFFSET;

    parameter [0:0]
        S_WAIT            = 1'd0, // Waiting for cyc_i & stb_i
        S_DEASSERT    = 1'd1; // Deassert acknowledgement.

    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            ack_o <= 0; // Obviously, there is nothing to acknowledge by default.
            dat_o <= 0; // No output by default.
            state <= S_WAIT; // Wait signals from the masters at reset.
        end
        else begin
            if (state == S_WAIT) begin
                // Wait signal from the master.
                if ( cyc_i == 1 && stb_i == 1 ) begin
                    // Master ok, acknowledge.
                    ack_o <= 1;

                    if ( we_i == 1 ) begin
						// Set the bytes to memory locations corresponding the inputs and parameters.
						for (index = 0; index < AU_IN_DATA; index = index +1) begin
							// Writing means we set data to the specified address, offsetted by the base address.
							dat[adr_i - BASE_ADDRESS + index] <= dat_i;
						end
                    end
                    else begin
						// Get the bytes from memory locations corresponding the inputs and parameters.
						for (index = 0; index < AU_IN_DATA; index = index +1) begin
							// Assign each bit of the addressed units.
							for (sub_index = 0; sub_index < AUB; sub_index = sub_index +1) begin
								// Reading means we output dat from the specified address, offsetted by the base address.
								dat_o[index*AUB+sub_index] <= dat[adr_i - BASE_ADDRESS + index][sub_index];
							end
						end
                    end

                    // Next thing is to deassert.
                    state <= S_DEASSERT;
                end
            end
            else if (state == S_DEASSERT) begin
                // Deassert acknowlegement, get ready to receive next one.
                ack_o <= 0;
                state <= S_WAIT;
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
endmodule
