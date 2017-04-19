//-----------------------------------------------------------------------------
// File          : spi_slave.v
// Creation date : 10.04.2017
// Creation time : 16:16:13
// Description   : A minimalistic example for SPI slave IP-XACT document.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.20 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:template:spi_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/template/spi_slave/1.0/spi_slave.1.0.xml
//-----------------------------------------------------------------------------

module spi_slave #(
    parameter                              SLAVE_ID         = 0
) (
    // Interface: slave_if
    input                               clk_in,
    input                               data_in,
    input                               slave_select_in,
    output reg                          data_out,

    // These ports are not in any interface
    input                               rst_in    // General reset, independent from master.
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
    
    reg transferring;
    reg transferred;

    always @(posedge clk_in or posedge rst_in) begin
        if(rst_in == 1'b1) begin
            data_recv <= 0;
            data_send <= 8'hAA;
            send_iterator <= 1;
            recv_iterator <= 0;
            data_out <= 1'bz;
            transferring <= 1;
            transferred <= 0;
        end
        else begin
            if (transferring == 1'b0) begin
                data_out <= data_send[send_iterator];
                
                if (!transferred) begin
                    data_recv[recv_iterator] <= data_in;
                    recv_iterator <= recv_iterator + 1;
                end
                else
                    data_send <= data_recv;
                    
                 if (send_iterator < BYTE_SIZE - 1) begin
                    send_iterator <= send_iterator + 1;
                 end
                 
                 if (recv_iterator >= BYTE_SIZE - 1) begin
                    transferred <= 1;
                 end
            end
            else begin
                if (slave_select_in == 1'b0) begin
                    data_out <= data_send[0];
                    transferred <= 0;
                    send_iterator <= 1;
                    recv_iterator <= 0;
                end
                else begin
                    data_out <= 1'bz;
                end
            end
            
            transferring <= slave_select_in;
        end
    end
endmodule
