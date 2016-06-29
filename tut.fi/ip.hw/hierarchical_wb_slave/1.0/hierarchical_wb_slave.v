//-----------------------------------------------------------------------------
// File          : hierarchical_wb_slave.v
// Creation date : 28.06.2016
// Creation time : 12:18:24
// Description   : A wishbone slave containing another wishbone slave, so now you can use a wishbone slave while using a wishbone slave.
// Created by    : TermosPullo
// This file was generated with Kactus2 verilog generator version 1.2
// Kactus2 version : 3.1.5 32-bit
// based on IP-XACT component tut.fi:ip.hw:hierarchical_wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/hierarchical_wb_slave/1.0/hierarchical_wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module hierarchical_wb_slave #(
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              BASE_ADDRESS     = 5,    // The first referable address. Is substracted from input address.
    parameter                              DATA_COUNT       = 16,    // How many values there are in the register array.
    parameter                              DATA_WIDTH       = 16    // The width of the both transferred and inputted data.
) (
    // Interface: bus_slave
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output                              ack_o,    // Slave asserts acknowledge.
    output         [DATA_WIDTH-1:0]     dat_o,    // Data from master to slave.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst    // The mandatory reset, as this is synchronous logic.
);

    // An instantiation of the same wish bone slave, as used in SampleHW design.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .DATA_COUNT          (DATA_COUNT),
        .BASE_ADDRESS        (BASE_ADDRESS),
        .DATA_WIDTH          (DATA_WIDTH),
        .ADDR_WIDTH          (ADDR_WIDTH))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (adr_i[15:0]),
        .cyc_i               (cyc_i),
        .dat_i               (dat_i[7:0]),
        .stb_i               (stb_i),
        .we_i                (we_i),
        .ack_o               (ack_o),
        .dat_o               (dat_o[7:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b0000),
        .rst                 (rst));


endmodule
