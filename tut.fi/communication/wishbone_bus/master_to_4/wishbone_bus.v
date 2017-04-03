//-----------------------------------------------------------------------------
// File          : wishbone_bus.v
// Creation date : 31.03.2017
// Creation time : 15:04:05
// Description   : Bus used to connect one wishbone master to multiple slaves. Used slave is determined using the address output of the master and parameters of each slave interface.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.6 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:communication:wishbone_bus:master_to_4
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication/wishbone_bus/master_to_4/wishbone_bus.master_to_4.xml
//-----------------------------------------------------------------------------

module wishbone_bus #(
    parameter                              ADDR_WIDTH       = 32,
    parameter                              DATA_WIDTH       = 32,
    parameter                              SLAVE_0_BASE     = 'h0100,
    parameter                              SLAVE_1_BASE     = 'h0200,
    parameter                              SLAVE_2_BASE     = 'h0300,
    parameter                              SLAVE_3_BASE     = 'h0400,
    parameter                              SLAVE_RANGE      = 'h0040
) (
    // Interface: one_to_many_master
    input          [ADDR_WIDTH-1:0]     adr_master,
    input                               cyc_master,
    input          [DATA_WIDTH-1:0]     dat_ms_master,
    input                               stb_master,
    input                               we_master,
    output                              ack_master,
    output         [DATA_WIDTH-1:0]     dat_sm_master,
    output                              err_master,

    // Interface: slave_0
    input                               ack_slave_0,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_0,
    input                               err_slave_0,
    output         [ADDR_WIDTH-1:0]     adr_slave_0,
    output                              cyc_slave_0,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_0,
    output                              stb_slave_0,
    output                              we_slave_0,

    // Interface: slave_1
    input                               ack_slave_1,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_1,
    input                               err_slave_1,
    output         [ADDR_WIDTH-1:0]     adr_slave_1,
    output                              cyc_slave_1,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_1,
    output                              stb_slave_1,
    output                              we_slave_1,

    // Interface: slave_2
    input                               ack_slave_2,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_2,
    input                               err_slave_2,
    output         [ADDR_WIDTH-1:0]     adr_slave_2,
    output                              cyc_slave_2,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_2,
    output                              stb_slave_2,
    output                              we_slave_2,

    // Interface: slave_3
    input                               ack_slave_3,
    input          [DATA_WIDTH-1:0]     dat_sm_slave_3,
    input                               err_slave_3,
    output         [ADDR_WIDTH-1:0]     adr_slave_3,
    output                              cyc_slave_3,
    output         [DATA_WIDTH-1:0]     dat_ms_slave_3,
    output                              stb_slave_3,
    output                              we_slave_3
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
    
    assign adr_slave_2 = adr_master;
    assign cyc_slave_2 = cyc_master;
    assign dat_ms_slave_2 = dat_ms_master;
    assign we_slave_2 = we_master;
    
    assign adr_slave_3 = adr_master;
    assign cyc_slave_3 = cyc_master;
    assign dat_ms_slave_3 = dat_ms_master;
    assign we_slave_3 = we_master;
    
    // Choose selected slave based on the address.
    wire slave_0_sel = (adr_master >= SLAVE_0_BASE && adr_master < SLAVE_1_BASE) ? 1 : 0;
    wire slave_1_sel = (adr_master >= SLAVE_1_BASE && adr_master < SLAVE_2_BASE) ? 1 : 0;
    wire slave_2_sel = (adr_master >= SLAVE_2_BASE && adr_master < SLAVE_3_BASE) ? 1 : 0;
    wire slave_3_sel = (adr_master >= SLAVE_3_BASE && adr_master < SLAVE_3_BASE+SLAVE_RANGE) ? 1 : 0;
    
    // Choose master inputs based on the selected slave.
    always @( * ) begin
        if (slave_0_sel) begin
            dat_sm_master <= dat_sm_slave_0;
            ack_master <= ack_slave_0;
            err_master <= err_slave_0;
        end
        else if (slave_1_sel) begin
            dat_sm_master <= dat_sm_slave_1;
            ack_master <= ack_slave_1;
            err_master <= err_slave_1;
        end
        else if (slave_2_sel) begin
            dat_sm_master <= dat_sm_slave_2;
            ack_master <= ack_slave_2;
            err_master <= err_slave_2;
        end
        else if (slave_3_sel) begin
            dat_sm_master <= dat_sm_slave_3;
            ack_master <= ack_slave_3;
            err_master <= err_slave_3;
        end
    end
    
    // Choose strobe based on the selected slave.
    assign stb_slave_0 = slave_0_sel ? stb_master : 0;
    assign stb_slave_1 = slave_1_sel ? stb_master : 0;
    assign stb_slave_2 = slave_2_sel ? stb_master : 0;
    assign stb_slave_3 = slave_3_sel ? stb_master : 0;
endmodule
