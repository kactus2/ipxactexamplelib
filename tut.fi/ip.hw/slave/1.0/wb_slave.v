// A verilog slave that provides a write/write access to a verilog register array.
// Address space is assumed to be contiguous.
module wb_slave #(
    parameter BASE_ADDRESS = 0, // The first referable address. Is substracted from input address.
    parameter DATA_WIDTH = 32, // The width of the both transferred and inputted data.
    parameter ADDR_WIDTH = 32, // The width of the address.
    parameter DATA_COUNT = 16 // How many values there are in the register array.
    )(
    input                                       		clk, // The mandatory clock, as this is synchronous logic.
    input                                       		rst, // The mandatory reset, as this is synchronous logic.
    
    input                                       		cyc_i, // Asserted by master for transfer.
    input                                       		stb_i, // Asserted, when this specific slave is selected.
    output reg                              		ack_o, // Slave asserts acknowledge.
    input                                       		we_i, // Write = 1, Read = 0.
    output reg	[DATA_WIDTH-1:0]	dat_o, // Data from slave to master.
    input			[DATA_WIDTH-1:0]	dat_i, // Data from master to slave.
    input			[ADDR_WIDTH-1:0]	adr_i // The address of the data.
    );

    // We have as much memory as parameterized.
    reg [DATA_WIDTH-1:0] dat [0:DATA_COUNT-1];
    // The state.
    reg [0:0] state;

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
                        // Writing means we set data to the specified address, offsetted by the base address.
                        dat[adr_i - BASE_ADDRESS] <= dat_i;
                    end
                    else begin
                        // Reading means we output dat from the specified address, offsetted by the base address.
                        dat_o <= dat[adr_i - BASE_ADDRESS];
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
