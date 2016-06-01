//-----------------------------------------------------------------------------
// File          : SampleHW.v
// Creation date : 31.05.2016
// Creation time : 15:32:11
// Description   : 
// Created by    : virtan39
// This file was generated with Kactus2 verilog generator
// based on IP-XACT component tut.fi:soc:SampleHW:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/soc/SampleHW/1.0/SampleHW.1.0.xml
//-----------------------------------------------------------------------------

module SampleHW #(
    parameter                              MasterBase       = 0,
    parameter                              BusSlaveBase     = 0,
    parameter                              TOTAL_MEMORY     = 16,
    parameter                              DirectSlaveBase  = TOTAL_MEMORY,
    parameter                              HierSlaveBase    = TOTAL_MEMORY/2,
    parameter                              DATA_WIDTH       = 32,
    parameter                              ADDR_WIDTH       = 32
) (
    // These ports are not in any interface
    input                               clk,
    input                               rst,
    input                               start,
    output                              done
);

    wire        master_0_one_to_one_master_to_wb_slave_1_slave_interface_ack_i;
    wire [31:0] master_0_one_to_one_master_to_wb_slave_1_slave_interface_adr_o;
    wire        master_0_one_to_one_master_to_wb_slave_1_slave_interface_cyc_o;
    wire [31:0] master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_i;
    wire [31:0] master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_o;
    wire        master_0_one_to_one_master_to_wb_slave_1_slave_interface_stb_o;
    wire        master_0_one_to_one_master_to_wb_slave_1_slave_interface_we_o;
    wire        master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_ack_i;
    wire [31:0] master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_adr_o;
    wire        master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_cyc_o;
    wire [31:0] master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_i;
    wire [31:0] master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_o;
    wire        master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_stb_o;
    wire        master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_we_o;
    wire        wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_ack_i;
    wire [31:0] wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_adr_o;
    wire [31:0] wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_i;
    wire        wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_cyc_o;
    wire [31:0] wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_o;
    wire        wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_stb_o;
    wire        wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_we_o;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_ack_i;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_i;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_adr_o;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_cyc_o;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_o;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_stb_o;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_we_o;

    // IP-XACT VLNV: tut.fi:ip.hw:hierarchical_wb_slave:1.0
    hierarchical_wb_slave #(
        .DATA_COUNT          (TOTAL_MEMORY / 2),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (HierSlaveBase))
    hierarchical_wb_slave_0(
        // Interface: bus_slave
        .adr_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_adr_o),
        .cyc_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_cyc_o),
        .dat_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_o),
        .stb_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_stb_o),
        .we_i                (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_we_o),
        .ack_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_ack_i),
        .dat_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_i),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));

    // IP-XACT VLNV: tut.fi:ip.hw:master:1.0
    master #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .DATA_COUNT          (TOTAL_MEMORY),
        .DATA_WIDTH          (DATA_WIDTH),
        .BASE_ADDRESS        (MasterBase),
        .MASTER_1_BASE_ADDRESS(DirectSlaveBase))
    master_0(
        // Interface: one_to_many_master
        .ack_i_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_ack_i),
        .dat_i_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_i),
        .adr_o_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_adr_o),
        .cyc_o_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_cyc_o),
        .dat_o_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_o),
        .stb_o_0             (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_stb_o),
        .we_o_0              (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_we_o),
        // Interface: one_to_one_master
        .ack_i_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_ack_i),
        .dat_i_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_i),
        .adr_o_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_adr_o),
        .cyc_o_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_cyc_o),
        .dat_o_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_o),
        .stb_o_1             (master_0_one_to_one_master_to_wb_slave_1_slave_interface_stb_o),
        .we_o_1              (master_0_one_to_one_master_to_wb_slave_1_slave_interface_we_o),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst),
        .start               (start),
        .done                (done));

    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .DATA_COUNT          (TOTAL_MEMORY / 2),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (BusSlaveBase))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_adr_o),
        .cyc_i               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_cyc_o),
        .dat_i               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_o),
        .stb_i               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_stb_o),
        .we_i                (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_we_o),
        .ack_o               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_ack_i),
        .dat_o               (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_i),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));

    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .ADDR_WIDTH          (ADDR_WIDTH ),
        .DATA_COUNT          (TOTAL_MEMORY),
        .BASE_ADDRESS        (DirectSlaveBase))
    wb_slave_1(
        // Interface: slave_interface
        .adr_i               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_adr_o),
        .cyc_i               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_cyc_o),
        .dat_i               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_o),
        .stb_i               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_stb_o),
        .we_i                (master_0_one_to_one_master_to_wb_slave_1_slave_interface_we_o),
        .ack_o               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_ack_i),
        .dat_o               (master_0_one_to_one_master_to_wb_slave_1_slave_interface_dat_i),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));

    // IP-XACT VLNV: tut.fi:ip.com:wishbone_bus:1.0
    wishbone_bus #(
        .SLAVE_SPLIT         (TOTAL_MEMORY / 2),
        .DATA_WIDTH          (DATA_WIDTH),
        .ADDR_WIDTH          (ADDR_WIDTH))
    wishbone_bus_0(
        // Interface: bus_slave_0
        .ack_i_in_0          (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_ack_i),
        .dat_i_in_0          (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_i),
        .adr_o_out_0         (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_adr_o),
        .cyc_o_out_0         (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_cyc_o),
        .dat_o_out_0         (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_dat_o),
        .stb_o_out_0         (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_stb_o),
        .we_o_out_0          (wishbone_bus_0_bus_slave_0_to_wb_slave_0_slave_interface_we_o),
        // Interface: bus_slave_1
        .ack_i_in_1          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_ack_i),
        .dat_i_in_1          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_i),
        .adr_o_out_1         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_adr_o),
        .cyc_o_out_1         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_cyc_o),
        .dat_o_out_1         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_dat_o),
        .stb_o_out_1         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_stb_o),
        .we_o_out_1          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_1_we_o),
        // Interface: one_to_many_master
        .adr_o_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_adr_o),
        .cyc_o_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_cyc_o),
        .dat_o_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_o),
        .stb_o_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_stb_o),
        .we_o_master         (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_we_o),
        .ack_i_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_ack_i),
        .dat_i_master        (master_0_one_to_many_master_to_wishbone_bus_0_one_to_many_master_dat_i));


endmodule
