//-----------------------------------------------------------------------------
// File          : wishbone_bus.v
// Creation date : 03.02.2017
// Creation time : 11:49:16
// Description   : Bus used to connect two slaves to one master. Used slave is determined using the address output of the master and parameter SLAVE_SPLIT.
// Created by    : TermosPullo
// Tool : Kactus2 3.3.168 32-bit
// Plugin : Verilog generator 2.0
// This file was generated based on IP-XACT component tut.fi:ip.com:wishbone_bus:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.com/wishbone_bus/1.0/wishbone_bus.1.0.xml
//-----------------------------------------------------------------------------

module wishbone_bus #(
    parameter                              ADDR_WIDTH       = 32,
    parameter                              DATA_WIDTH       = 32,
    parameter                              SLAVE_1_REMAP_ADDRESS = 8,
    parameter                              SLAVE_0_REMAP_ADDRESS = 0,
    parameter                              SLAVE_0_RANGE    = 4,
    parameter                              SLAVE_1_RANGE    = 4
) (
    // Interface: bus_slave_0
    input                               ack_slave_0,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_0,
    output         [ADDR_WIDTH-1:0]     adr_slave_0,
    output                              cyc_slave_0,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_0,
    output                              stb_slave_0,
    output                              we_slave_0,

    // Interface: bus_slave_1
    input                               ack_slave_1,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_1,
    output         [ADDR_WIDTH-1:0]     adr_slave_1,
    output                              cyc_slave_1,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_1,
    output                              stb_slave_1,
    output                              we_slave_1,

    // Interface: one_to_many_master
    input          [ADDR_WIDTH-1:0]     adr_master,
    input                               cyc_master,
    input          [DATA_WIDTH-1:0]     dat_ms_master,
    input                               stb_master,
    input                               we_master,
    output                              ack_master,
    output         [DATA_WIDTH-1:0]     dat_sm_master
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!


    // Assign most of the master outputs directly to slave inputs.
    assign adr_slave_0 = adr_master -  SLAVE_0_REMAP_ADDRESS;
    assign cyc_slave_0 = cyc_master;
    assign dat_ms_slave_0 = dat_ms_master;
    assign we_slave_0 = we_master;
    
    assign adr_slave_1 = adr_master - SLAVE_1_REMAP_ADDRESS;
    assign cyc_slave_1 = cyc_master;
    assign dat_ms_slave_1 = dat_ms_master;
    assign we_slave_1 = we_master;
    
    wire slave_0_sel = (adr_master >= SLAVE_0_REMAP_ADDRESS && adr_master < SLAVE_0_REMAP_ADDRESS + SLAVE_0_RANGE) ? 1 : 0;
    wire slave_1_sel = (adr_master >= SLAVE_1_REMAP_ADDRESS && adr_master < SLAVE_1_REMAP_ADDRESS + SLAVE_1_RANGE) ? 1 : 0;
    
    // The strobes are a wee exception: It is decided based on the address, which one is active.
    assign stb_slave_0 = slave_0_sel ? stb_master : 0;
    assign stb_slave_1 = slave_1_sel ? stb_master : 0;
    
    // For master inputs, outputs of the selected slave is chosen. Again, based on the  address.
    assign dat_sm_master = slave_1_sel ? dat_sm_slave_1 : dat_sm_slave_0;
    assign ack_master = slave_1_sel  ?  ack_slave_1 : ack_slave_0;
endmodule
