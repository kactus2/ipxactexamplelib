//-----------------------------------------------------------------------------
// File          : D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/hierarchical_wb_slave_0.v
// Creation date : 28.10.2016
// Creation time : 11:58:58
// Description   : A wishbone slave containing another wishbone slave, so now you can use a wishbone slave while using a wishbone slave.
// Created by    : TermosPullo
// Tool : Kactus2 3.2.138 32-bit
// Plugin : Verilog generator 1.5b
// This file was generated based on IP-XACT component tut.fi:ip.hw:hierarchical_wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/hierarchical_wb_slave/1.0/hierarchical_wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module hierarchical_wb_slave_0 #(
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_COUNT       = 8,    // How many values there are in the register array.
    parameter                              DATA_WIDTH       = 16    // The width of the both transferred and inputted data.
) (
    // Interface: bus_slave
    // The address of the data.
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output                              ack_o,    // Slave asserts acknowledge.
    output         [DATA_WIDTH-1:0]     dat_o,    // Data from master to slave.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    output         [DATA_WIDTH/2-1:0]   meta_o    // The latest meta data.
);

    wire        sub_slave_configuration_to_tiedValue;

    // An instantiation of the same wish bone slave, as used in SampleHW design.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     (4),
        .InputForConfig1     (8),
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8))
    sub_slave(
        // Interface: slave_interface
        .adr_i               (adr_i[31:0]),
        .cyc_i               (cyc_i),
        .dat_i               (dat_i[31:0]),
        .stb_i               (stb_i),
        .we_i                (we_i),
        .ack_o               (ack_o),
        .dat_o               (dat_o[31:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b0000),
        .rst                 (rst),
        .meta_o              (meta_o[15:0]));


endmodule
