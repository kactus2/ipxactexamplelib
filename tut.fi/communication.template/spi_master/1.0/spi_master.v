//-----------------------------------------------------------------------------
// File          : spi_master.v
// Creation date : 10.04.2017
// Creation time : 15:38:03
// Description   : A minimalistic example for SPI master IP-XACT document.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.20 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:template:spi_master:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/template/spi_master/1.0/spi_master.1.0.xml
//-----------------------------------------------------------------------------

module spi_master(
    // Interface: master_if
    input                               data_in,
    output                              clk_out,
    output reg                          data_out,
    output reg                          slave_select1_out,
    output reg                          slave_select2_out,
    output reg                          slave_select3_out,

    // These ports are not in any interface
    input                               clk_in,    // The mandatory clock, as this is synchronous logic.
    input                               rst_in    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    localparam BYTE_SIZE = 8; // How many bits are transferred per transaction
    localparam BYTE_INDEX_SIZE = $clog2(BYTE_SIZE); // How many bits are needed to index a byte.
    
    // Input and output bytes.
    reg [BYTE_SIZE-1:0] data_recv;
    reg [BYTE_SIZE-1:0] data_send;
    
    // Used to iterate through the bytes.
    reg [BYTE_INDEX_SIZE-1:0] send_iterator;
    reg [BYTE_INDEX_SIZE-1:0] recv_iterator;

    // The state.
    reg [1:0] state;
    
    // The available states.
    parameter [1:0]
        S_WAIT      = 2'd0,
        S_TRANSFER  = 2'd1,
        S_DEASSERT  = 2'd2;
        
    assign clk_out = clk_in;

    always @(posedge clk_in or posedge rst_in) begin
        if(rst_in == 1'b1) begin
            state <= S_WAIT; // Wait signals from the masters at reset.
            data_recv <= 0;
            data_send <= 8'h55;
            data_out <= 1'bz;
            send_iterator <= 0;
            recv_iterator <= 0;
            
            // These are active low -> Initiallty high.
            slave_select1_out <= 1;
            slave_select2_out <= 1;
            slave_select3_out <= 1;
        end
        else begin
            if (state == S_WAIT) begin
                slave_select1_out <= 0;
                state <= S_TRANSFER;
            end
            else if (state == S_TRANSFER) begin
                data_out <= data_send[send_iterator];
                    
                 if (send_iterator > 0 && recv_iterator < BYTE_SIZE-1) begin
                    data_recv[recv_iterator] <= data_in;
                    recv_iterator = recv_iterator +1;
                 end
                 
                 if (recv_iterator >= BYTE_SIZE-1) begin
                    state <= S_DEASSERT;
                 end
                 else
                    send_iterator <= send_iterator + 1;
            end
            else if (state == S_DEASSERT) begin
                data_recv[BYTE_SIZE-1] <= data_in;
                state <= S_WAIT;
                slave_select1_out <= 1;
                data_out <= 1'bz;
                send_iterator <= 0;
                recv_iterator <= 0;
                @(posedge clk_in);
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
endmodule
