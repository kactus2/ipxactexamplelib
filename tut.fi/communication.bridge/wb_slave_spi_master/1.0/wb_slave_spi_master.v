//-----------------------------------------------------------------------------
// File          : wb_slave_spi_master.v
// Creation date : 18.04.2017
// Creation time : 13:45:46
// Description   : Template component for wishbone slave. Address space is assumed to be contiguous.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.79 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:communication:wb_slave_spi_master:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication/wb_slave_spi_master/1.0/wb_slave_spi_master.1.0.xml
//-----------------------------------------------------------------------------

module wb_slave_spi_master #(
    parameter                              BUFFER_SIZE      = 16,    // How many bytes is allocated for a buffer.
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              BASE_ADDRESS     = 'h0F00,    // The first referred address of the master.
    parameter                              BUFFER_INDEX_WIDTH = $clog2(BUFFER_SIZE),    // How many bits are needed to index the buffer.
    parameter                              CONTROL_SIZE     = 1,    // How many bytes asre reserved for the control data.
    parameter                              STATUS_SIZE      = 1    // How many bytes asre reserved for the status data.
) (
    // Interface: master_if
    input                               data_in,
    output                              clk_out,
    output reg                          data_out,
    output reg                          slave_select_out,

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

    localparam BYTE_SIZE = 8; // How many bits are transferred per transaction
    localparam BYTE_INDEX_SIZE = $clog2(BYTE_SIZE); // How many bits are needed to index a byte.
    localparam BUFFER_INDEX_SIZE = $clog2(BUFFER_SIZE); // How many bits are needed to index a buffer.
    
    // Input and output bytes.
    reg [BYTE_SIZE-1:0] buffer_recv [STATUS_SIZE+BUFFER_SIZE-1:0];
    reg [BYTE_SIZE-1:0] buffer_send [CONTROL_SIZE+BUFFER_SIZE-1:0];

    // The state.
    reg [0:0] wb_state;
    
    // The available states.
    parameter [0:0]
        S_WB_WAIT      = 1'd0, // Waiting for cyc_i & stb_i
        S_WB_DEASSERT  = 1'd1; // Deassert acknowledgement.
        
    // The address is ok = 1, else not ok.
    integer addr_ok;
    
    wire start_transfer = buffer_send[BUFFER_SIZE][0];
    reg transfer_complete;

    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            ack_o <= 0; // Obviously, there is nothing to acknowledge by default.
            dat_o <= 0; // No output by default.
            err_o <= 0; // No error by default.
            wb_state <= S_WB_WAIT; // Wait signals from the masters at reset.
            buffer_send[BUFFER_SIZE] = 0;
        end
        else begin
            buffer_recv[BUFFER_SIZE][BYTE_SIZE-1:0] = {7'b0000000,transfer_complete};
        
            if (wb_state == S_WB_WAIT) begin
                if (we_i == 1) begin
                    if (adr_i < BASE_ADDRESS + BUFFER_SIZE*2 + CONTROL_SIZE + STATUS_SIZE && adr_i >= BASE_ADDRESS + BUFFER_SIZE + STATUS_SIZE) begin
                        addr_ok = 1;
                    end
                    else begin
                        addr_ok = 0;
                    end
                end
                else begin
                    if (adr_i < BASE_ADDRESS + BUFFER_SIZE + STATUS_SIZE && adr_i >= BASE_ADDRESS) begin
                        addr_ok = 1;
                    end
                    else begin
                        addr_ok = 0;
                    end
                end
            
                // Wait signal from the master.
                if ( cyc_i == 1 && stb_i == 1 ) begin
                    if (addr_ok) begin
                        // The specified address in accessible -> proceed.
                        ack_o <= 1;

                        if ( we_i == 1 ) begin
                            buffer_send[adr_i - BASE_ADDRESS - BUFFER_SIZE - STATUS_SIZE] <= dat_i[BYTE_SIZE-1:0];
                        end
                        else begin
                            dat_o[DATA_WIDTH-1:0] <= {{DATA_WIDTH-BYTE_SIZE{1'b0}},buffer_recv[adr_i - BASE_ADDRESS]};
                        end
                    end
                    else begin
                        // The specified address out-of-scope -> error!
                        err_o <= 1;
                    end
                
                    // Next thing is to deassert.
                    wb_state <= S_WB_DEASSERT;
                end
            end
            else if (wb_state == S_WB_DEASSERT) begin
                // Deassert acknowlegement, get ready to receive next one.
                ack_o <= 0;
                err_o <= 0;
                wb_state <= S_WB_WAIT;
                
                // Must deassert transfer start as well.
                buffer_send[BUFFER_SIZE][0] <= 0;
            end
            else
                $display("ERROR: Unkown wb_state: %d", wb_state);
        end
    end
    
    // Used to iterate through the buffers.
    reg [BUFFER_INDEX_SIZE-1:0] buffer_index;
    
    // Used to iterate through the bytes.
    reg [BYTE_INDEX_SIZE-1:0] send_iterator;
    reg [BYTE_INDEX_SIZE-1:0] recv_iterator;

    reg [BYTE_SIZE-2:0] data_recv;
    reg [BYTE_SIZE-1:0] data_send;
    
    // The state.
    reg [1:0] spi_state;
    
    // The available states.
    parameter [1:0]
        S_SPI_WAIT      = 2'd0,
        S_SPI_INIT_NEXT      = 2'd1,
        S_SPI_TRANSFER  = 2'd2,
        S_SPI_DEASSERT  = 2'd3;
        
    assign clk_out = clk_i;

    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            spi_state <= S_SPI_WAIT; // Wait signals from the masters at reset.
            data_recv <= 0;
            data_send <= 8'h55;
            data_out <= 1'bz;
            send_iterator <= 0;
            recv_iterator <= 0;
            
            buffer_index <= 0;
            
            data_recv <= 0;
            data_send <= 0;
            
            // These are active low -> Initiallty high.
            slave_select_out <= 1;
            
            transfer_complete <= 1;
        end
        else begin
            if (spi_state == S_SPI_WAIT) begin
                if (start_transfer && transfer_complete) begin
                    spi_state <= S_SPI_INIT_NEXT;
                    transfer_complete <= 0;
                end
            end
            else if (spi_state == S_SPI_INIT_NEXT) begin
                data_send <= buffer_send[buffer_index];
                slave_select_out <= 0;
                spi_state <= S_SPI_TRANSFER;
            end
            else if (spi_state == S_SPI_TRANSFER) begin
                data_out <= data_send[send_iterator];
                    
                 if (send_iterator > 0 && recv_iterator < BYTE_SIZE-1) begin
                    data_recv[recv_iterator] <= data_in;
                    recv_iterator = recv_iterator +1;
                 end
                 
                 if (recv_iterator >= BYTE_SIZE-1) begin
                    spi_state <= S_SPI_DEASSERT;
                 end
                 else
                    send_iterator <= send_iterator + 1;
            end
            else if (spi_state == S_SPI_DEASSERT) begin
                slave_select_out <= 1;
                data_out <= 1'bz;
                
                buffer_recv[buffer_index] <= {data_in,data_recv[6:0]};
                
                send_iterator <= 0;
                recv_iterator <= 0;
                
                data_recv <= 0;
                data_send <= 0;
                
                if (buffer_index < BUFFER_SIZE-1) begin
                    buffer_index = buffer_index + 1;
                    spi_state <= S_SPI_INIT_NEXT;
                end
                else begin
                    spi_state <= S_SPI_WAIT;
                    transfer_complete <= 1;
                    buffer_index <= 0;
                 end
            end
            else
                $display("ERROR: Unkown spi_state: %d", spi_state);
        end
    end
endmodule
