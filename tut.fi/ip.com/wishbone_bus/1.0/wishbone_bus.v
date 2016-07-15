//-----------------------------------------------------------------------------
// File          : wishbone_bus.v
// Creation date : 15.07.2016
// Creation time : 12:11:46
// Description   : Bus used to connect two slaves to one master. Used slave is determined using the address output of the master and parameter SLAVE_SPLIT.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.14 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:ip.com:wishbone_bus:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.com/wishbone_bus/1.0/wishbone_bus.1.0.xml
//-----------------------------------------------------------------------------

module wishbone_bus #(
    parameter                              ADDR_WIDTH       = 32,
    parameter                              DATA_WIDTH       = 32,
    parameter                              SLAVE_SPLIT      = 8,
    parameter                              V_SLAVE_SPLIT    = 8,    // The first address that goes to bus_slave_1
    parameter                              V_DATA_WIDTH     = 32,    // The width of the both transferred and inputted data.
    parameter                              V_ADDR_WIDTH     = 32    // The width of the address.
) (
    // Interface: bus_slave_0
    input                               ack_i_in_0,
    input          [DATA_WIDTH-1:0]     dat_i_in_0,
    output         [ADDR_WIDTH-1:0]     adr_o_out_0,
    output                              cyc_o_out_0,
    output         [DATA_WIDTH-1:0]     dat_o_out_0,
    output                              stb_o_out_0,
    output                              we_o_out_0,

    // Interface: bus_slave_1
    input                               ack_i_in_1,
    input          [DATA_WIDTH-1:0]     dat_i_in_1,
    output         [ADDR_WIDTH-1:0]     adr_o_out_1,
    output                              cyc_o_out_1,
    output         [DATA_WIDTH-1:0]     dat_o_out_1,
    output                              stb_o_out_1,
    output                              we_o_out_1,

    // Interface: one_to_many_master
    input          [ADDR_WIDTH-1:0]     adr_o_master,
    input                               cyc_o_master,
    input          [DATA_WIDTH-1:0]     dat_o_master,
    input                               stb_o_master,
    input                               we_o_master,
    output                              ack_i_master,
    output         [DATA_WIDTH-1:0]     dat_i_master
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
// Assign most of the master outputs directly to slave inputs.
    assign adr_o_out_0 = adr_o_master;
    assign cyc_o_out_0 = cyc_o_master;
    assign dat_o_out_0 = dat_o_master;
    assign we_o_out_0 = we_o_master;
    
    assign adr_o_out_1 = adr_o_master;
    assign cyc_o_out_1 = cyc_o_master;
    assign dat_o_out_1 = dat_o_master;
    assign we_o_out_1 = we_o_master;
    
    // The strobes are a wee exception: It is decided based on the address, which one is active.
    assign stb_o_out_0 = (adr_o_master >= V_SLAVE_SPLIT)  ? 0 : stb_o_master;
    assign stb_o_out_1 = (adr_o_master >= V_SLAVE_SPLIT)  ? stb_o_master : 0;
    
    // For master inputs, outputs of the selected slave is chosen. Again, based on the  address.
    assign dat_i_master = (adr_o_master >= V_SLAVE_SPLIT)  ? dat_i_in_1 : dat_i_in_0;
    assign ack_i_master = (adr_o_master >= V_SLAVE_SPLIT)  ?  ack_i_in_1 : ack_i_in_0;
endmodule
