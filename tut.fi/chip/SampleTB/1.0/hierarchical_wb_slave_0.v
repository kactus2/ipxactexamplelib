//-----------------------------------------------------------------------------
// File          : hierarchical_wb_slave_0.v
// Creation date : 15.02.2017
// Creation time : 14:13:32
// Description   : A wishbone slave containing another wishbone slave, so now you can use a wishbone slave while using a wishbone slave.
// Created by    : TermosPullo
// Tool : Kactus2 3.3.384 32-bit
// Plugin : Verilog generator 2.0
// This file was generated based on IP-XACT component tut.fi:ip.hw:hierarchical_wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/hierarchical_wb_slave/1.0/hierarchical_wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module hierarchical_wb_slave_0 #(
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              DATA_COUNT       = 8,    // How many values there are in the register array.
    parameter                              DATA_WIDTH       = 32    // The width of the both transferred and inputted data.
) (
    // Interface: bus_slave
    // The address of the data.
    input          [31:0]               adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [31:0]               dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output                              ack_o,    // Slave asserts acknowledge.
    output         [31:0]               .dat_o(sub_slave_slave_interface_to_bus_slavedat_sm[31:0]),    // Data from master to slave.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    output         [15:0]               meta_o    // The latest meta data.
);

    // sub_slave_slave_interface_to_bus_slave wires:
    wire        sub_slave_slave_interface_to_bus_slaveack;
    wire [31:0] sub_slave_slave_interface_to_bus_slaveadr;
    wire        sub_slave_slave_interface_to_bus_slavecyc;
    wire [31:0] sub_slave_slave_interface_to_bus_slavedat_ms;
    wire [31:0] sub_slave_slave_interface_to_bus_slavedat_sm;
    wire        sub_slave_slave_interface_to_bus_slavestb;
    wire        sub_slave_slave_interface_to_bus_slavewe;

    // Ad-hoc wires:
    wire        sub_slave_rst_to_rst;
    wire        sub_slave_clk_to_clk;
    wire [15:0] sub_slave_meta_o_to_meta_o;

    // sub_slave port wires:
    wire        sub_slave_ack_o;
    wire [31:0] sub_slave_adr_i;
    wire        sub_slave_clk;
    wire [3:0]  sub_slave_configuration;
    wire        sub_slave_cyc_i;
    wire [31:0] sub_slave_dat_i;
    wire [31:0] sub_slave_dat_o;
    wire [15:0] sub_slave_meta_o;
    wire        sub_slave_rst;
    wire        sub_slave_stb_i;
    wire        sub_slave_we_i;

    // Assignments for the ports of the encompassing component:
    assign ack_o = sub_slave_slave_interface_to_bus_slaveack;
    assign sub_slave_slave_interface_to_bus_slaveadr[31:0] = adr_i[31:0];
    assign sub_slave_clk_to_clk = clk;
    assign sub_slave_slave_interface_to_bus_slavecyc = cyc_i;
    assign sub_slave_slave_interface_to_bus_slavedat_ms[31:0] = dat_i[31:0];
    assign meta_o[15:0] = sub_slave_meta_o_to_meta_o[15:0];
    assign sub_slave_rst_to_rst = rst;
    assign sub_slave_slave_interface_to_bus_slavestb = stb_i;
    assign sub_slave_slave_interface_to_bus_slavewe = we_i;

    // sub_slave assignments:
    assign sub_slave_slave_interface_to_bus_slaveack = sub_slave_ack_o;
    assign sub_slave_adr_i[31:0] = sub_slave_slave_interface_to_bus_slaveadr[31:0];
    assign sub_slave_clk = sub_slave_clk_to_clk;
    assign sub_slave_configuration[3:0] = 4'b0000;
    assign sub_slave_cyc_i = sub_slave_slave_interface_to_bus_slavecyc;
    assign sub_slave_dat_i[31:0] = sub_slave_slave_interface_to_bus_slavedat_ms[31:0];
    assign sub_slave_slave_interface_to_bus_slavedat_sm[31:0] = sub_slave_dat_o[31:0];
    assign sub_slave_meta_o_to_meta_o[15:0] = sub_slave_meta_o[15:0];
    assign sub_slave_rst = sub_slave_rst_to_rst;
    assign sub_slave_stb_i = sub_slave_slave_interface_to_bus_slavestb;
    assign sub_slave_we_i = sub_slave_slave_interface_to_bus_slavewe;

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
        .adr_i               (sub_slave_adr_i),
        .cyc_i               (sub_slave_cyc_i),
        .dat_i               (sub_slave_dat_i),
        .stb_i               (sub_slave_stb_i),
        .we_i                (sub_slave_we_i),
        .ack_o               (sub_slave_ack_o),
        .dat_o               (sub_slave_dat_o),
        // These ports are not in any interface
        .clk                 (sub_slave_clk),
        .configuration       (sub_slave_configuration),
        .rst                 (sub_slave_rst),
        .meta_o              (sub_slave_meta_o));


endmodule
