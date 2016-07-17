//-----------------------------------------------------------------------------
// File          : SampleHW.v
// Creation date : 17.07.2016
// Creation time : 16:04:21
// Description   : A hardware component containing a hardware design, which has a master component, three slaves and a bus.
//                 
//                 This component also has a component instantiation, which provides parameters for the design.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.10 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:soc:SampleHW:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/soc/SampleHW/1.0/SampleHW.1.0.xml
//-----------------------------------------------------------------------------

module SampleHW #(
    parameter                              TOTAL_MEMORY     = 128,    // How much memory there are in the slaves, summed up.
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

    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack;
    wire [ADDR_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb;
    wire [1-1:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack;
    wire [ADDR_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc;
    wire [DATA_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms;
    wire [DATA_WIDTH-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb;
    wire [1-1:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack;
    wire [ADDR_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms;
    wire [DATA_WIDTH-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb;
    wire [1-1:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_we;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_ack;
    wire [ADDR_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_adr;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_cyc;
    wire [DATA_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_ms;
    wire [DATA_WIDTH-1:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_sm;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_stb;
    wire [1-1:0] master_0_master_1_to_wb_slave_1_slave_interface_we;

    // The another slave connected to bus. This ones base address is master + half of
    // the total memory.
    // IP-XACT VLNV: tut.fi:ip.hw:hierarchical_wb_slave:1.0
    hierarchical_wb_slave #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (MASTER_BASE),
        .DATA_COUNT          (TOTAL_MEMORY/(4*4)),
        .DATA_WIDTH          (DATA_WIDTH))
    hierarchical_wb_slave_0(
        // Interface: bus_slave
        .adr_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr[ADDR_WIDTH-1:0]),
        .cyc_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc[0:0]),
        .dat_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms[DATA_WIDTH-1:0]),
        .stb_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb[0:0]),
        .we_i                (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we),
        .ack_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack),
        .dat_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst));

    // The chosen master in this design. The second interface has the same base address
    // as the direct slave.
    // IP-XACT VLNV: tut.fi:ip.hw:master:1.0
    master #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .MASTER_1_BASE_ADDRESS(DIRECT_SLAVE_BASE),
        .DATA_COUNT          (TOTAL_MEMORY/(2*4)),
        .DATA_WIDTH          (DATA_WIDTH),
        .MASTER_0_BASE_ADDRESS(MASTER_BASE),
        .VERILOG_SPECIFIC    ('hEE))
    master_0(
        // Interface: master_0
        .ack_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack),
        .dat_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm[DATA_WIDTH-1:0]),
        .adr_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr[ADDR_WIDTH-1:0]),
        .cyc_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc[0:0]),
        .dat_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms[DATA_WIDTH-1:0]),
        .stb_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb[0:0]),
        .we_o_0              (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we[0:0]),
        // Interface: master_1
        .ack_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_ack),
        .dat_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_sm[DATA_WIDTH-1:0]),
        .adr_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_adr[ADDR_WIDTH-1:0]),
        .cyc_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_cyc[0:0]),
        .dat_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_ms[DATA_WIDTH-1:0]),
        .stb_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_stb[0:0]),
        .we_o_1              (master_0_master_1_to_wb_slave_1_slave_interface_we[0:0]),
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
        .DATA_COUNT          (TOTAL_MEMORY/(4*4)))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr[ADDR_WIDTH-1:0]),
        .cyc_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc),
        .dat_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms[DATA_WIDTH-1:0]),
        .stb_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb),
        .we_i                (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we),
        .ack_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack),
        .dat_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b0100),
        .rst                 (rst));

    // The slave in the design which is directly connected to the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     ('b0100),
        .InputForConfig1     ('b1000),
        .ADDR_WIDTH          (ADDR_WIDTH),
        .BASE_ADDRESS        (DIRECT_SLAVE_BASE),
        .DATA_WIDTH          (DATA_WIDTH),
        .DATA_COUNT          (TOTAL_MEMORY/(2*4)))
    wb_slave_1(
        // Interface: slave_interface
        .adr_i               (master_0_master_1_to_wb_slave_1_slave_interface_adr[ADDR_WIDTH-1:0]),
        .cyc_i               (master_0_master_1_to_wb_slave_1_slave_interface_cyc),
        .dat_i               (master_0_master_1_to_wb_slave_1_slave_interface_dat_ms[DATA_WIDTH-1:0]),
        .stb_i               (master_0_master_1_to_wb_slave_1_slave_interface_stb),
        .we_i                (master_0_master_1_to_wb_slave_1_slave_interface_we),
        .ack_o               (master_0_master_1_to_wb_slave_1_slave_interface_ack),
        .dat_o               (master_0_master_1_to_wb_slave_1_slave_interface_dat_sm[DATA_WIDTH-1:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b1000),
        .rst                 (rst));

    // The bus used in this design to connect a master to two slaves.
    // IP-XACT VLNV: tut.fi:ip.com:wishbone_bus:1.0
    wishbone_bus #(
        .ADDR_WIDTH          (ADDR_WIDTH),
        .DATA_WIDTH          (DATA_WIDTH),
        .SLAVE_SPLIT         (TOTAL_MEMORY/4+MASTER_BASE))
    wishbone_bus_0(
        // Interface: bus_slave_0
        .ack_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack),
        .dat_sm_slave_0      (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm[DATA_WIDTH-1:0]),
        .adr_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr[ADDR_WIDTH-1:0]),
        .cyc_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc[0:0]),
        .dat_ms_slave_0      (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms[DATA_WIDTH-1:0]),
        .stb_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb[0:0]),
        .we_slave_0          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we[0:0]),
        // Interface: bus_slave_1
        .ack_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack),
        .dat_sm_slave_1      (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm[DATA_WIDTH-1:0]),
        .adr_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr[ADDR_WIDTH-1:0]),
        .cyc_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc[0:0]),
        .dat_ms_slave_1      (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms[DATA_WIDTH-1:0]),
        .stb_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb[0:0]),
        .we_slave_1          (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we[0:0]),
        // Interface: one_to_many_master
        .adr_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr[ADDR_WIDTH-1:0]),
        .cyc_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc[0:0]),
        .dat_ms_master       (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms[DATA_WIDTH-1:0]),
        .stb_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb[0:0]),
        .we_master           (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we[0:0]),
        .ack_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack),
        .dat_sm_master       (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm[DATA_WIDTH-1:0]));


endmodule
