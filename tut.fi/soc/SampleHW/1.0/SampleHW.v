//-----------------------------------------------------------------------------
// File          : SampleHW.v
// Creation date : 15.07.2016
// Creation time : 14:10:07
// Description   : A hardware component containing a hardware design, which has a master component, three slaves and a bus.
//                 
//                 This component also has a component instantiation, which provides parameters for the design.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.17 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:soc:SampleHW:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/soc/SampleHW/1.0/SampleHW.1.0.xml
//-----------------------------------------------------------------------------

module SampleHW #(
    parameter                              TOTAL_MEMORY     = 32,    // How much memory there are in the slaves, summed up.
    parameter                              MASTER_BASE      = 80,    // The base addresss of the master in the design.
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              DIRECT_SLAVE_BASE = MASTER_BASE+TOTAL_MEMORY/2,    // The base addresss of the direct slave in the design.
    parameter                              VERILOG_SPECIFIC = 'hEE    // A verilog specific parameter
) (
    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    input                               start,    // Input used to signal that is is ok to start the masters.
    output                              done    // The mandatory reset, as this is synchronous logic.
);

    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack_i;
    wire [ADDR_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr_o;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc_o;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_i;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_o;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb_o;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we_o;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack_i;
    wire [ADDR_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr_o;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc_o;
    wire [DATA_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_i;
    wire [DATA_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_o;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb_o;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we_o;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack_i;
    wire [ADDR_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr_o;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc_o;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_i;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_o;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb_o;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_we_o;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_ack_i;
    wire [ADDR_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_adr_o;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_cyc_o;
    wire [DATA_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_i;
    wire [DATA_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_o;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_stb_o;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_we_o;

    // The another slave connected to bus. This ones base address is master + half of
    // the total memory.
    // IP-XACT VLNV: tut.fi:ip.hw:hierarchical_wb_slave:1.0
    hierarchical_wb_slave #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (MASTER_BASE),
        .DATA_COUNT          (TOTAL_MEMORY/4),
        .DATA_WIDTH          (DATA_WIDTH))
    hierarchical_wb_slave_0(
        // Interface: bus_slave
        .adr_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr_o[ADDR_WIDTH-1:0]),
        .cyc_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc_o[0:0]),
        .dat_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_o[DATA_WIDTH-1:0]),
        .stb_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb_o[0:0]),
        .we_i                (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we_o[0:0]),
        .ack_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack_i),
        .dat_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_i[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));

    // The chosen master in this design. The second interface has the same base address
    // as the direct slave.
    // IP-XACT VLNV: tut.fi:ip.hw:master:1.0
    master #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .MASTER_1_BASE_ADDRESS(DIRECT_SLAVE_BASE),
        .DATA_COUNT          (TOTAL_MEMORY/2),
        .DATA_WIDTH          (DATA_WIDTH),
        .MASTER_0_BASE_ADDRESS(MASTER_BASE),
        .VERILOG_SPECIFIC    ('hEE))
    master_0(
        // Interface: master_0
        .ack_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack_i),
        .dat_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_i[DATA_WIDTH-1:0]),
        .adr_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr_o[ADDR_WIDTH-1:0]),
        .cyc_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc_o[0:0]),
        .dat_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_o[DATA_WIDTH-1:0]),
        .stb_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb_o[0:0]),
        .we_o_0              (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we_o[0:0]),
        // Interface: master_1
        .ack_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_ack_i),
        .dat_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_i[DATA_WIDTH-1:0]),
        .adr_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_adr_o[ADDR_WIDTH-1:0]),
        .cyc_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_cyc_o[0:0]),
        .dat_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_o[DATA_WIDTH-1:0]),
        .stb_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_stb_o[0:0]),
        .we_o_1              (master_0_master_1_to_wb_slave_1_slave_interface_we_o[0:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst),
        .start               (start),
        .done                (done));

    // The first slave connected to bus. Has the same base address as the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     ('b0100),
        .InputForConfig1     ('b1000),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (MASTER_BASE+TOTAL_MEMORY/4),
        .DATA_WIDTH          (DATA_WIDTH),
        .DATA_COUNT          (TOTAL_MEMORY/4))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr_o[ADDR_WIDTH-1:0]),
        .cyc_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc_o),
        .dat_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_o[DATA_WIDTH-1:0]),
        .stb_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb_o),
        .we_i                (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we_o),
        .ack_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack_i),
        .dat_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_i[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4),
        .rst                 (rst));

    // The slave in the design which is directly connected to the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     ('b0100),
        .InputForConfig1     ('b1000),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (DIRECT_SLAVE_BASE),
        .DATA_WIDTH          (DATA_WIDTH),
        .DATA_COUNT          (TOTAL_MEMORY/2))
    wb_slave_1(
        // Interface: slave_interface
        .adr_i               (master_0_master_1_to_wb_slave_1_slave_interface_adr_o[ADDR_WIDTH-1:0]),
        .cyc_i               (master_0_master_1_to_wb_slave_1_slave_interface_cyc_o),
        .dat_i               (master_0_master_1_to_wb_slave_1_slave_interface_dat_o[DATA_WIDTH-1:0]),
        .stb_i               (master_0_master_1_to_wb_slave_1_slave_interface_stb_o),
        .we_i                (master_0_master_1_to_wb_slave_1_slave_interface_we_o),
        .ack_o               (master_0_master_1_to_wb_slave_1_slave_interface_ack_i),
        .dat_o               (master_0_master_1_to_wb_slave_1_slave_interface_dat_i[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (8),
        .rst                 (rst));

    // The bus used in this design to connect a master to two slaves.
    // IP-XACT VLNV: tut.fi:ip.com:wishbone_bus:1.0
    wishbone_bus #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .DATA_WIDTH          (DATA_WIDTH),
        .SLAVE_SPLIT         (TOTAL_MEMORY/4+MASTER_BASE))
    wishbone_bus_0(
        // Interface: bus_slave_0
        .ack_i_in_0          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack_i),
        .dat_i_in_0          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_i[DATA_WIDTH-1:0]),
        .adr_o_out_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr_o[ADDR_WIDTH-1:0]),
        .cyc_o_out_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc_o[0:0]),
        .dat_o_out_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_o[DATA_WIDTH-1:0]),
        .stb_o_out_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb_o[0:0]),
        .we_o_out_0          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we_o[0:0]),
        // Interface: bus_slave_1
        .ack_i_in_1          (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack_i),
        .dat_i_in_1          (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_i[DATA_WIDTH-1:0]),
        .adr_o_out_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr_o[ADDR_WIDTH-1:0]),
        .cyc_o_out_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc_o[0:0]),
        .dat_o_out_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_o[DATA_WIDTH-1:0]),
        .stb_o_out_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb_o[0:0]),
        .we_o_out_1          (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we_o[0:0]),
        // Interface: one_to_many_master
        .adr_o_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr_o[ADDR_WIDTH-1:0]),
        .cyc_o_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc_o[0:0]),
        .dat_o_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_o[DATA_WIDTH-1:0]),
        .stb_o_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb_o[0:0]),
        .we_o_master         (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we_o[0:0]),
        .ack_i_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack_i),
        .dat_i_master        (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_i[DATA_WIDTH-1:0]));


endmodule
