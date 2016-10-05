//-----------------------------------------------------------------------------
// File          : D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/SampleHW_0.v
// Creation date : 05.10.2016
// Creation time : 10:08:54
// Description   : A hardware component containing a hardware design, which has a master component, three slaves and a bus.
//                 
//                 This component also has a component instantiation, which provides parameters for the design.
// Created by    : TermosPullo
// Tool : Kactus2 3.2.1 32-bit
// Plugin : Verilog generator 1.5
// This file was generated based on IP-XACT component tut.fi:soc:SampleHW:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/soc/SampleHW/1.0/SampleHW.1.0.xml
//-----------------------------------------------------------------------------

module SampleHW_0 #(
    parameter                              MASTER_BASE      = 80,    // The base addresss of the master in the design.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              WORD_COUNT       = 16,    // How many words there are per master.
    parameter                              AUB              = 8,    // Addressable unit bits of the memory
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              MEMORY_AUB_SIZE  = WORD_COUNT*DATA_WIDTH/AUB,    // Size of memory in AUBs, for each master.
    parameter                              DIRECT_SLAVE_BASE = MASTER_BASE+MEMORY_AUB_SIZE    // The base addresss of the direct slave in the design.
) (
    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    input                               start,    // Input used to signal that is is ok to start the masters.
    output                              done,    // The mandatory reset, as this is synchronous logic.
    output                              meta_ok
);

    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0_we;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_ack;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interface_adr;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_cyc;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_ms;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interface_dat_sm;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_stb;
    wire        master_0_master_1_to_wb_slave_1_slave_interface_we;
    wire        wb_slave_1_configuration_to_tiedValue;
    wire        wb_slave_0_configuration_to_tiedValue;
    wire [15:0] wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0;
    wire [15:0] wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1;
    wire [15:0] hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2;

    // The another slave connected to bus. This ones base address is master + half of
    // the total memory.
    // IP-XACT VLNV: tut.fi:ip.hw:hierarchical_wb_slave:1.0
    hierarchical_wb_slave #(
        .ADDR_WIDTH          (32),
        .BASE_ADDRESS        (80),
        .DATA_COUNT          (8),
        .DATA_WIDTH          (32))
    hierarchical_wb_slave_0(
        // Interface: bus_slave
        .adr_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr[31:0]),
        .cyc_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc),
        .dat_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms[31:0]),
        .stb_i               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb),
        .we_i                (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we),
        .ack_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack),
        .dat_o               (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm[31:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst),
        .meta_o              (hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2[15:0]));

    // The chosen master in this design. The second interface has the same base address
    // as the direct slave.
    // IP-XACT VLNV: tut.fi:ip.hw:master:1.0
    master #(
        .ADDR_WIDTH          (32),
        .MASTER_1_BASE_ADDRESS(144),
        .DATA_COUNT          (16),
        .DATA_WIDTH          (32),
        .MASTER_0_BASE_ADDRESS(80),
        .VERILOG_SPECIFIC    (0))
    master_0(
        // Interface: master_0
        .ack_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack),
        .dat_i_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm[31:0]),
        .adr_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr[31:0]),
        .cyc_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc),
        .dat_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms[31:0]),
        .stb_o_0             (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb),
        .we_o_0              (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we),
        // Interface: master_1
        .ack_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_ack),
        .dat_i_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_sm[31:0]),
        .adr_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_adr[31:0]),
        .cyc_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_cyc),
        .dat_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_dat_ms[31:0]),
        .stb_o_1             (master_0_master_1_to_wb_slave_1_slave_interface_stb),
        .we_o_1              (master_0_master_1_to_wb_slave_1_slave_interface_we),
        // These ports are not in any interface
        .clk                 (clk),
        .rst                 (rst),
        .start               (start),
        .done                (done));

    // IP-XACT VLNV: tut.fi:ip.hw:metaAnalyzer:0.9
    metaAnalyzer #(
        .DATA_WIDTH          (16))
    metaAnalyzer_0(
        // These ports are not in any interface
        .clk                 (clk),
        .meta_in0            (wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0[15:0]),
        .meta_in1            (wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1[15:0]),
        .meta_in2            (hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2[15:0]),
        .rst                 (rst),
        .meta_ok             (meta_ok));

    // The first slave connected to bus. Has the same base address as the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     (4),
        .InputForConfig1     (8),
        .ADDR_WIDTH          (32),
        .BASE_ADDRESS        (112),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr[31:0]),
        .cyc_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc),
        .dat_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms[31:0]),
        .stb_i               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb),
        .we_i                (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we),
        .ack_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack),
        .dat_o               (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm[31:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b0100),
        .rst                 (rst),
        .meta_o              (wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0[15:0]));

    // The slave in the design which is directly connected to the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     (4),
        .InputForConfig1     (8),
        .ADDR_WIDTH          (32),
        .BASE_ADDRESS        (144),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (16))
    wb_slave_1(
        // Interface: slave_interface
        .adr_i               (master_0_master_1_to_wb_slave_1_slave_interface_adr[31:0]),
        .cyc_i               (master_0_master_1_to_wb_slave_1_slave_interface_cyc),
        .dat_i               (master_0_master_1_to_wb_slave_1_slave_interface_dat_ms[31:0]),
        .stb_i               (master_0_master_1_to_wb_slave_1_slave_interface_stb),
        .we_i                (master_0_master_1_to_wb_slave_1_slave_interface_we),
        .ack_o               (master_0_master_1_to_wb_slave_1_slave_interface_ack),
        .dat_o               (master_0_master_1_to_wb_slave_1_slave_interface_dat_sm[31:0]),
        // These ports are not in any interface
        .clk                 (clk),
        .configuration       (4'b1000),
        .rst                 (rst),
        .meta_o              (wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1[15:0]));

    // The bus used in this design to connect a master to two slaves.
    // IP-XACT VLNV: tut.fi:ip.com:wishbone_bus:1.0
    wishbone_bus #(
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .SLAVE_SPLIT         (112))
    wishbone_bus_0(
        // Interface: bus_slave_0
        .ack_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_ack),
        .dat_sm_slave_0      (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_sm[31:0]),
        .adr_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_adr[31:0]),
        .cyc_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_cyc),
        .dat_ms_slave_0      (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_dat_ms[31:0]),
        .stb_slave_0         (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_stb),
        .we_slave_0          (hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0_we),
        // Interface: bus_slave_1
        .ack_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_ack),
        .dat_sm_slave_1      (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_sm[31:0]),
        .adr_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_adr[31:0]),
        .cyc_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_cyc),
        .dat_ms_slave_1      (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_dat_ms[31:0]),
        .stb_slave_1         (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_stb),
        .we_slave_1          (wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface_we),
        // Interface: one_to_many_master
        .adr_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_adr[31:0]),
        .cyc_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_cyc),
        .dat_ms_master       (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_ms[31:0]),
        .stb_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_stb),
        .we_master           (wishbone_bus_0_one_to_many_master_to_master_0_master_0_we),
        .ack_master          (wishbone_bus_0_one_to_many_master_to_master_0_master_0_ack),
        .dat_sm_master       (wishbone_bus_0_one_to_many_master_to_master_0_master_0_dat_sm[31:0]));


endmodule
