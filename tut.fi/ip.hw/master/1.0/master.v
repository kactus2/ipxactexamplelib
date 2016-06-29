//-----------------------------------------------------------------------------
// File          : master.v
// Creation date : 28.06.2016
// Creation time : 10:40:31
// Description   : A component containing two wishbone master interfaces and thus two wishbone master module instantiations. Its operation is governed by external start signal, and will send a done signal after both master modules have sent and received everything.
// Created by    : TermosPullo
// This file was generated with Kactus2 verilog generator version 1.2
// Kactus2 version : 3.1.3 32-bit
// based on IP-XACT component tut.fi:ip.hw:master:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/master/1.0/master.1.0.xml
//-----------------------------------------------------------------------------

module master #(
    parameter                              DATA_WIDTH       = 8,    // The width of the both transferred and inputted data.
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_COUNT       = 16,    // How many values there are in the register array.
    parameter                              MASTER_0_BASE_ADDRESS = 0,    // The first referable address of master0. Is substracted from input address.
    parameter                              MASTER_1_BASE_ADDRESS = 64    // The first referable address of master1. Is substracted from input address.
) (
    // Interface: master_0
    input                               ack_i_0,    // Slave asserts acknowledge.
    input          [DATA_WIDTH-1:0]     dat_i_0,    // Data from slave to master.
    output         [ADDR_WIDTH-1:0]     adr_o_0,    // The address of the data.
    output                              cyc_o_0,    // Asserted by master for transfer.
    output         [DATA_WIDTH-1:0]     dat_o_0,    // Data from master to slave.
    output                              stb_o_0,    // Asserted by master for transfer.
    output                              we_o_0,    // Write = 1, Read = 0.

    // Interface: master_1
    input                               ack_i_1,    // Slave asserts acknowledge.
    input          [DATA_WIDTH-1:0]     dat_i_1,    // Data from slave to master.
    output         [ADDR_WIDTH-1:0]     adr_o_1,    // The address of the data.
    output                              cyc_o_1,    // Asserted by master for transfer.
    output         [DATA_WIDTH-1:0]     dat_o_1,    // Data from master to slave.
    output                              stb_o_1,    // Asserted by master for transfer.
    output                              we_o_1,    // Write = 1, Read = 0.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    input                               start,    // Input used to signal that is is ok to start the masters.
    output                              done    // Output used to signal that the masters are done sending.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
// Needs "done" from both masters.
    wire done_0;
    wire done_1;
    assign done = done_0 & done_1;
	
    localparam AUB = 8;
    localparam SIZE = 32;
    localparam DIMENSION = 16;
    localparam MEMORY_SIZE = (DIMENSION*SIZE)/AUB;
	
    localparam AU_IN_DATA = DATA_WIDTH/AUB;

    wb_master #(
        .DATA_COUNT          (DATA_COUNT),
        .BASE_ADDRESS        (MASTER_0_BASE_ADDRESS),
        .DATA_WIDTH          (DATA_WIDTH),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .AU_IN_DATA          (AU_IN_DATA))
    wb_master_0(
      .clk(clk),
      .rst(rst),
      .cyc_o(cyc_o_0),
      .stb_o(stb_o_0),
      .ack_i(ack_i_0),
      .we_o(we_o_0),
      .dat_o(dat_o_0),
      .dat_i(dat_i_0),
      .adr_o(adr_o_0),
      
      .start(start),
      .done(done_0)
   );

    wb_master #(
        .DATA_COUNT          (DATA_COUNT),
        .BASE_ADDRESS        (MASTER_1_BASE_ADDRESS),
        .DATA_WIDTH          (DATA_WIDTH),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .AU_IN_DATA          (AU_IN_DATA))
    wb_master_1(
      .clk(clk),
      .rst(rst),
      .cyc_o(cyc_o_1),
      .stb_o(stb_o_1),
      .ack_i(ack_i_1),
      .we_o(we_o_1),
      .dat_o(dat_o_1),
      .dat_i(dat_i_1),
      .adr_o(adr_o_1),
      
      .start(start),
      .done(done_1)
   );
endmodule
