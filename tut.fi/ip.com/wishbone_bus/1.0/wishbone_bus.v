//-----------------------------------------------------------------------------
// File          : wishbone_bus.v
// Creation date : 17.07.2016
// Creation time : 15:48:52
// Description   : Bus used to connect two slaves to one master. Used slave is determined using the address output of the master and parameter SLAVE_SPLIT.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.10 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:ip.com:wishbone_bus:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.com/wishbone_bus/1.0/wishbone_bus.1.0.xml
//-----------------------------------------------------------------------------

module wishbone_bus #(
    parameter                              SLAVE_SPLIT      = 8,
    parameter                              DATA_WIDTH       = 32,
    parameter                              ADDR_WIDTH       = 32,
    parameter                              V_SLAVE_SPLIT    = SLAVE_SPLIT,    // The first address that goes to bus_slave_1
    parameter                              V_DATA_WIDTH     = DATA_WIDTH,    // The width of the both transferred and inputted data.
    parameter                              V_ADDR_WIDTH     = ADDR_WIDTH    // The width of the address.
) (
    // Interface: one_to_many_master
    input          [ADDR_WIDTH-1:0]     adr_master,
    input                               cyc_master,
    input          [DATA_WIDTH-1:0]     dat_ms_master,
    input                               stb_master,
    input                               we_master,
    output                              ack_master,
    output         [DATA_WIDTH-1:0]     dat_sm_master,

    // There ports are contained in many interfaces
    input                               ack_slave_0,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_0,
    output         [ADDR_WIDTH-1:0]     adr_slave_0,
    output                              cyc_slave_0,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_0,
    output                              stb_slave_0,
    output                              we_slave_0,

    // These ports are not in any interface
    input                               ack_slave_1,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_1,
    output         [ADDR_WIDTH-1:0]     adr_slave_1,
    output                              cyc_slave_1,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_1,
    output                              stb_slave_1,
    output                              we_slave_1
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
// Assign most of the master outputs directly to slave inputs.
    assign adr_slave_0 = adr_master;
    assign cyc_slave_0 = cyc_master;
    assign dat_ms_slave_0 = dat_ms_master;
    assign we_slave_0 = we_master;
    
    assign adr_slave_1 = adr_master;
    assign cyc_slave_1 = cyc_master;
    assign dat_ms_slave_1 = dat_ms_master;
    assign we_slave_1 = we_master;
    
    // The strobes are a wee exception: It is decided based on the address, which one is active.
    assign stb_slave_0 = (adr_master >= V_SLAVE_SPLIT)  ? 0 : stb_master;
    assign stb_slave_1 = (adr_master >= V_SLAVE_SPLIT)  ? stb_master : 0;
    
    // For master inputs, outputs of the selected slave is chosen. Again, based on the  address.
    assign dat_sm_master = (adr_master >= V_SLAVE_SPLIT)  ? dat_sm_slave_1 : dat_sm_slave_0;
    assign ack_master = (adr_master >= V_SLAVE_SPLIT)  ?  ack_slave_1 : ack_slave_0;
endmodule
