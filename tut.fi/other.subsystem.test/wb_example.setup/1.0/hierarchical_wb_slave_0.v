//-----------------------------------------------------------------------------
// File          : hierarchical_wb_slave_0.v
// Creation date : 28.11.2017
// Creation time : 16:51:22
// Description   : A wishbone slave containing another wishbone slave, so now you can use a wishbone slave while using a wishbone slave.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1176 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:peripheral.subsystem:hierarchical_wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/peripheral.subsystem/hierarchical_wb_slave/1.0/hierarchical_wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module hierarchical_wb_slave_0 #(
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              BASE_ADDRESS     = 128,    // The first referred address of the master.
    parameter                              DATA_COUNT       = 8,    // How many values there are in the register array.
    parameter                              DATA_WIDTH       = 32    // The width of the both transferred and inputted data.
) (
    // Interface: wb_slave
    input          [31:0]               adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [31:0]               dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output                              ack_o,    // Slave asserts acknowledge.
    output         [31:0]               dat_o,    // Data from master to slave.

    // Interface: wb_system
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

    // sub_slave_wb_system_to_wb_system wires:
    wire        sub_slave_wb_system_to_wb_systemclk;
    wire        sub_slave_wb_system_to_wb_systemrst;
    // sub_slave_wb_slave_to_wb_slave wires:
    wire        sub_slave_wb_slave_to_wb_slaveack;
    wire [31:0] sub_slave_wb_slave_to_wb_slaveadr;
    wire        sub_slave_wb_slave_to_wb_slavecyc;
    wire [31:0] sub_slave_wb_slave_to_wb_slavedat_ms;
    wire [31:0] sub_slave_wb_slave_to_wb_slavedat_sm;
    wire        sub_slave_wb_slave_to_wb_slaveerr;
    wire        sub_slave_wb_slave_to_wb_slavestb;
    wire        sub_slave_wb_slave_to_wb_slavewe;

    // sub_slave port wires:
    wire        sub_slave_ack_o;
    wire [31:0] sub_slave_adr_i;
    wire        sub_slave_clk_i;
    wire        sub_slave_cyc_i;
    wire [31:0] sub_slave_dat_i;
    wire [31:0] sub_slave_dat_o;
    wire        sub_slave_err_o;
    wire        sub_slave_rst_i;
    wire        sub_slave_stb_i;
    wire        sub_slave_we_i;

    // Assignments for the ports of the encompassing component:
    assign ack_o = sub_slave_wb_slave_to_wb_slaveack;
    assign sub_slave_wb_slave_to_wb_slaveadr[31:0] = adr_i[31:0];
    assign sub_slave_wb_system_to_wb_systemclk = clk_i;
    assign sub_slave_wb_slave_to_wb_slavecyc = cyc_i;
    assign sub_slave_wb_slave_to_wb_slavedat_ms[31:0] = dat_i[31:0];
    assign dat_o[31:0] = sub_slave_wb_slave_to_wb_slavedat_sm[31:0];
    assign sub_slave_wb_system_to_wb_systemrst = rst_i;
    assign sub_slave_wb_slave_to_wb_slavestb = stb_i;
    assign sub_slave_wb_slave_to_wb_slavewe = we_i;

    // sub_slave assignments:
    assign sub_slave_wb_slave_to_wb_slaveack = sub_slave_ack_o;
    assign sub_slave_adr_i[31:0] = sub_slave_wb_slave_to_wb_slaveadr[31:0];
    assign sub_slave_clk_i = sub_slave_wb_system_to_wb_systemclk;
    assign sub_slave_cyc_i = sub_slave_wb_slave_to_wb_slavecyc;
    assign sub_slave_dat_i[31:0] = sub_slave_wb_slave_to_wb_slavedat_ms[31:0];
    assign sub_slave_wb_slave_to_wb_slavedat_sm[31:0] = sub_slave_dat_o[31:0];
    assign sub_slave_rst_i = sub_slave_wb_system_to_wb_systemrst;
    assign sub_slave_stb_i = sub_slave_wb_slave_to_wb_slavestb;
    assign sub_slave_we_i = sub_slave_wb_slave_to_wb_slavewe;

    // An instantiation of the same wishbone slave as used in wb_example design.
    // IP-XACT VLNV: tut.fi:communication.template:wb_slave:1.0
    wb_slave #(
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8),
        .BASE_ADDRESS        (128))
    sub_slave(
        // Interface: wb_slave
        .adr_i               (sub_slave_adr_i),
        .cyc_i               (sub_slave_cyc_i),
        .dat_i               (sub_slave_dat_i),
        .stb_i               (sub_slave_stb_i),
        .we_i                (sub_slave_we_i),
        .ack_o               (sub_slave_ack_o),
        .dat_o               (sub_slave_dat_o),
        .err_o               (sub_slave_err_o),
        // Interface: wb_system
        .clk_i               (sub_slave_clk_i),
        .rst_i               (sub_slave_rst_i));


endmodule
