//-----------------------------------------------------------------------------
// File          : hierarchical_wb_slave.v
// Creation date : 27.05.2016
// Creation time : 14:48:36
// Description   : 
// Created by    : virtan39
// This file was generated with Kactus2 verilog generator
// based on IP-XACT component tut.fi:ip.hw:hierarchical_wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/hierarchical_wb_slave/1.0/hierarchical_wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module hierarchical_wb_slave(
    // Interface: bus_slave
    input          [31:0]               adr_i,
    input                               cyc_i,
    input          [31:0]               dat_i,
    input                               stb_i,
    input                               we_i,
    output                              ack_o,
    output         [31:0]               dat_o,

    // These ports are not in any interface
    input                               clk,
    input                               rst
);

    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave wb_slave_0(
        // Interface: one_to_one_slave
        .adr_i               (adr_i),
        .cyc_i               (cyc_i),
        .dat_i               (dat_i),
        .stb_i               (stb_i),
        .we_i                (we_i),
        .ack_o               (ack_o),
        .dat_o               (dat_o),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));


endmodule
