//-----------------------------------------------------------------------------
// File          : wishbone_bus.v
// Creation date : 24.03.2017
// Creation time : 15:58:43
// Description   : Bus used to connect one wishbone master to multiple slaves. Used slave is determined using the address output of the master and parameters of each slave interface.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.3 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:communication:wishbone_bus:master_to_4
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication/wishbone_bus/master_to_4/wishbone_bus.master_to_4.xml
//-----------------------------------------------------------------------------

module wishbone_bus #(
    parameter                              SLAVE_RANGE      = 'h0100,
    parameter                              SLAVE_0_BASE     = 'h0100,
    parameter                              SLAVE_1_BASE     = SLAVE_0_BASE+SLAVE_RANGE,
    parameter                              SLAVE_2_BASE     = SLAVE_1_BASE+SLAVE_RANGE,
    parameter                              ADDR_WIDTH       = 32,
    parameter                              DATA_WIDTH       = 32,
    parameter                              SLAVE_3_BASE     = SLAVE_2_BASE+SLAVE_RANGE
) (
    // Interface: bus_slave_0
    input                               ack_slave_0,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_0,
    input                               err_slave_0,
    output         [ADDR_WIDTH-1:0]     adr_slave_0,
    output                              cyc_slave_0,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_0,
    output                              stb_slave_0,
    output                              we_slave_0,

    // Interface: bus_slave_1
    input                               ack_slave_1,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_1,
    input                               err_slave_1,
    output         [ADDR_WIDTH-1:0]     adr_slave_1,
    output                              cyc_slave_1,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_1,
    output                              stb_slave_1,
    output                              we_slave_1,

    // Interface: bus_slave_2
    input                               ack_slave_2,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_2,
    input                               err_slave_2,
    output         [ADDR_WIDTH-1:0]     adr_slave_2,
    output                              cyc_slave_2,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_2,
    output                              stb_slave_2,
    output                              we_slave_2,

    // Interface: bus_slave_3
    input                               ack_slave_3,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_3,
    input                               err_slave_3,
    output         [ADDR_WIDTH-1:0]     adr_slave_3,
    output                              cyc_slave_3,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_3,
    output                              stb_slave_3,
    output                              we_slave_3,

    // Interface: one_to_many_master
    input          [ADDR_WIDTH-1:0]     adr_master,
    input                               cyc_master,
    input          [DATA_WIDTH-1:0]     dat_ms_master,
    input                               stb_master,
    input                               we_master,
    output                              ack_master,
    output         [DATA_WIDTH-1:0]     dat_sm_master,
    output                              err_master
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
    
    always @( * ) begin
        if (slave_0_sel)
            
        end
        
    end
    
    
    // The strobes are a wee exception: It is decided based on the address, which one is active.
    assign stb_slave_0 = slave_0_sel ? stb_master : 0;
    assign stb_slave_1 = slave_1_sel ? stb_master : 0;
    
    // For master inputs, outputs of the selected slave is chosen. Again, based on the  address.
    assign dat_sm_master = slave_1_sel ? dat_sm_slave_1 : dat_sm_slave_0;
    assign ack_master = slave_1_sel  ?  ack_slave_1 : ack_slave_0;
endmodule
