//-----------------------------------------------------------------------------
// File          : SampleHW_0.v
// Creation date : 01.02.2017
// Creation time : 15:49:51
// Description   : A hardware component containing a hardware design, which has a master component, three slaves and a bus component.
// Created by    : TermosPullo
// Tool : Kactus2 3.3.164 32-bit
// Plugin : Verilog generator 2.0
// This file was generated based on IP-XACT component tut.fi:soc:SampleHW:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/soc/SampleHW/1.0/SampleHW.1.0.xml
//-----------------------------------------------------------------------------

module SampleHW_0 #(
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              BUS_MASTER_BASE  = 80,    // The base addresss of the bus master in the design.
    parameter                              WORD_COUNT       = 16,    // How many words there are per master.
    parameter                              AUB              = 8,    // Addressable unit bits of the memory
    parameter                              MEMORY_AUB_SIZE  = 64    // Size of memory in AUBs, for each master.
) (
    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    input                               start,    // Input used to signal that is is ok to start the masters.
    output                              done,    // The mandatory reset, as this is synchronous logic.
    output                              meta_ok
);

    // wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interface wires:
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceack;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceadr;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacecyc;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_ms;
    wire [31:0] wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_sm;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacestb;
    wire        wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacewe;
    // hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0 wires:
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0ack;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0adr;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0cyc;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_ms;
    wire [31:0] hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_sm;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0stb;
    wire        hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0we;
    // wishbone_bus_0_one_to_many_master_to_master_0_master_0 wires:
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0ack;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0adr;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0cyc;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_ms;
    wire [31:0] wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_sm;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0stb;
    wire        wishbone_bus_0_one_to_many_master_to_master_0_master_0we;
    // master_0_master_1_to_wb_slave_1_slave_interface wires:
    wire        master_0_master_1_to_wb_slave_1_slave_interfaceack;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interfaceadr;
    wire        master_0_master_1_to_wb_slave_1_slave_interfacecyc;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interfacedat_ms;
    wire [31:0] master_0_master_1_to_wb_slave_1_slave_interfacedat_sm;
    wire        master_0_master_1_to_wb_slave_1_slave_interfacestb;
    wire        master_0_master_1_to_wb_slave_1_slave_interfacewe;

    // Ad-hoc wires:
    wire        master_0_clk_to_clk;
    wire        master_0_rst_to_rst;
    wire        master_0_done_to_done;
    wire        master_0_start_to_start;
    wire        wb_slave_1_clk_to_clk;
    wire        wb_slave_1_rst_to_rst;
    wire        wb_slave_0_clk_to_clk;
    wire        wb_slave_0_rst_to_rst;
    wire        hierarchical_wb_slave_0_clk_to_clk;
    wire        hierarchical_wb_slave_0_rst_to_rst;
    wire [3:0]  wb_slave_1_configuration_to_tiedValue;
    wire [3:0]  wb_slave_0_configuration_to_tiedValue;
    wire        metaAnalyzer_0_rst_to_rst;
    wire        metaAnalyzer_0_clk_to_clk;
    wire [15:0] wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0;
    wire [15:0] wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1;
    wire [15:0] hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2;
    wire        metaAnalyzer_0_meta_ok_to_meta_ok;

    // hierarchical_wb_slave_0 port wires:
    wire        hierarchical_wb_slave_0_ack_o;
    wire [31:0] hierarchical_wb_slave_0_adr_i;
    wire        hierarchical_wb_slave_0_clk;
    wire        hierarchical_wb_slave_0_cyc_i;
    wire [31:0] hierarchical_wb_slave_0_dat_i;
    wire [31:0] hierarchical_wb_slave_0_dat_o;
    wire [15:0] hierarchical_wb_slave_0_meta_o;
    wire        hierarchical_wb_slave_0_rst;
    wire        hierarchical_wb_slave_0_stb_i;
    wire        hierarchical_wb_slave_0_we_i;
    // master_0 port wires:
    wire        master_0_ack_i_0;
    wire        master_0_ack_i_1;
    wire [31:0] master_0_adr_o_0;
    wire [31:0] master_0_adr_o_1;
    wire        master_0_clk;
    wire        master_0_cyc_o_0;
    wire        master_0_cyc_o_1;
    wire [31:0] master_0_dat_i_0;
    wire [31:0] master_0_dat_i_1;
    wire [31:0] master_0_dat_o_0;
    wire [31:0] master_0_dat_o_1;
    wire        master_0_done;
    wire        master_0_rst;
    wire        master_0_start;
    wire        master_0_stb_o_0;
    wire        master_0_stb_o_1;
    wire        master_0_we_o_0;
    wire        master_0_we_o_1;
    // metaAnalyzer_0 port wires:
    wire        metaAnalyzer_0_clk;
    wire [15:0] metaAnalyzer_0_meta_in0;
    wire [15:0] metaAnalyzer_0_meta_in1;
    wire [15:0] metaAnalyzer_0_meta_in2;
    wire        metaAnalyzer_0_meta_ok;
    wire        metaAnalyzer_0_rst;
    // wb_slave_0 port wires:
    wire        wb_slave_0_ack_o;
    wire [31:0] wb_slave_0_adr_i;
    wire        wb_slave_0_clk;
    wire [3:0]  wb_slave_0_configuration;
    wire        wb_slave_0_cyc_i;
    wire [31:0] wb_slave_0_dat_i;
    wire [31:0] wb_slave_0_dat_o;
    wire [15:0] wb_slave_0_meta_o;
    wire        wb_slave_0_rst;
    wire        wb_slave_0_stb_i;
    wire        wb_slave_0_we_i;
    // wb_slave_1 port wires:
    wire        wb_slave_1_ack_o;
    wire [31:0] wb_slave_1_adr_i;
    wire        wb_slave_1_clk;
    wire [3:0]  wb_slave_1_configuration;
    wire        wb_slave_1_cyc_i;
    wire [31:0] wb_slave_1_dat_i;
    wire [31:0] wb_slave_1_dat_o;
    wire [15:0] wb_slave_1_meta_o;
    wire        wb_slave_1_rst;
    wire        wb_slave_1_stb_i;
    wire        wb_slave_1_we_i;
    // wishbone_bus_0 port wires:
    wire        wishbone_bus_0_ack_master;
    wire        wishbone_bus_0_ack_slave_0;
    wire        wishbone_bus_0_ack_slave_1;
    wire [31:0] wishbone_bus_0_adr_master;
    wire [31:0] wishbone_bus_0_adr_slave_0;
    wire [31:0] wishbone_bus_0_adr_slave_1;
    wire        wishbone_bus_0_cyc_master;
    wire        wishbone_bus_0_cyc_slave_0;
    wire        wishbone_bus_0_cyc_slave_1;
    wire [31:0] wishbone_bus_0_dat_ms_master;
    wire [31:0] wishbone_bus_0_dat_ms_slave_0;
    wire [31:0] wishbone_bus_0_dat_ms_slave_1;
    wire [31:0] wishbone_bus_0_dat_sm_master;
    wire [31:0] wishbone_bus_0_dat_sm_slave_0;
    wire [31:0] wishbone_bus_0_dat_sm_slave_1;
    wire        wishbone_bus_0_stb_master;
    wire        wishbone_bus_0_stb_slave_0;
    wire        wishbone_bus_0_stb_slave_1;
    wire        wishbone_bus_0_we_master;
    wire        wishbone_bus_0_we_slave_0;
    wire        wishbone_bus_0_we_slave_1;

    // Assignments for the ports of the encompassing component:
    assign hierarchical_wb_slave_0_clk_to_clk = clk;
    assign master_0_clk_to_clk = clk;
    assign metaAnalyzer_0_clk_to_clk = clk;
    assign wb_slave_0_clk_to_clk = clk;
    assign wb_slave_1_clk_to_clk = clk;
    assign done = master_0_done_to_done;
    assign meta_ok = metaAnalyzer_0_meta_ok_to_meta_ok;
    assign hierarchical_wb_slave_0_rst_to_rst = rst;
    assign master_0_rst_to_rst = rst;
    assign metaAnalyzer_0_rst_to_rst = rst;
    assign wb_slave_0_rst_to_rst = rst;
    assign wb_slave_1_rst_to_rst = rst;
    assign master_0_start_to_start = start;

    // hierarchical_wb_slave_0 assignments:
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0ack = hierarchical_wb_slave_0_ack_o;
    assign hierarchical_wb_slave_0_adr_i[31:0] = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0adr[31:0];
    assign hierarchical_wb_slave_0_clk = hierarchical_wb_slave_0_clk_to_clk;
    assign hierarchical_wb_slave_0_cyc_i = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0cyc;
    assign hierarchical_wb_slave_0_dat_i[31:0] = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_ms[31:0];
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_sm[31:0] = hierarchical_wb_slave_0_dat_o[31:0];
    assign hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2[15:0] = hierarchical_wb_slave_0_meta_o[15:0];
    assign hierarchical_wb_slave_0_rst = hierarchical_wb_slave_0_rst_to_rst;
    assign hierarchical_wb_slave_0_stb_i = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0stb;
    assign hierarchical_wb_slave_0_we_i = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0we;
    // master_0 assignments:
    assign master_0_ack_i_0 = wishbone_bus_0_one_to_many_master_to_master_0_master_0ack;
    assign master_0_ack_i_1 = master_0_master_1_to_wb_slave_1_slave_interfaceack;
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0adr[31:0] = master_0_adr_o_0[31:0];
    assign master_0_master_1_to_wb_slave_1_slave_interfaceadr[31:0] = master_0_adr_o_1[31:0];
    assign master_0_clk = master_0_clk_to_clk;
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0cyc = master_0_cyc_o_0;
    assign master_0_master_1_to_wb_slave_1_slave_interfacecyc = master_0_cyc_o_1;
    assign master_0_dat_i_0[31:0] = wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_sm[31:0];
    assign master_0_dat_i_1[31:0] = master_0_master_1_to_wb_slave_1_slave_interfacedat_sm[31:0];
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_ms[31:0] = master_0_dat_o_0[31:0];
    assign master_0_master_1_to_wb_slave_1_slave_interfacedat_ms[31:0] = master_0_dat_o_1[31:0];
    assign master_0_done_to_done = master_0_done;
    assign master_0_rst = master_0_rst_to_rst;
    assign master_0_start = master_0_start_to_start;
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0stb = master_0_stb_o_0;
    assign master_0_master_1_to_wb_slave_1_slave_interfacestb = master_0_stb_o_1;
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0we = master_0_we_o_0;
    assign master_0_master_1_to_wb_slave_1_slave_interfacewe = master_0_we_o_1;
    // metaAnalyzer_0 assignments:
    assign metaAnalyzer_0_clk = metaAnalyzer_0_clk_to_clk;
    assign metaAnalyzer_0_meta_in0[15:0] = wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0[15:0];
    assign metaAnalyzer_0_meta_in1[15:0] = wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1[15:0];
    assign metaAnalyzer_0_meta_in2[15:0] = hierarchical_wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in2[15:0];
    assign metaAnalyzer_0_meta_ok_to_meta_ok = metaAnalyzer_0_meta_ok;
    assign metaAnalyzer_0_rst = metaAnalyzer_0_rst_to_rst;
    // wb_slave_0 assignments:
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceack = wb_slave_0_ack_o;
    assign wb_slave_0_adr_i[31:0] = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceadr[31:0];
    assign wb_slave_0_clk = wb_slave_0_clk_to_clk;
    assign wb_slave_0_configuration[3:0] = wb_slave_0_configuration_to_tiedValue[3:0];
    assign wb_slave_0_cyc_i = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacecyc;
    assign wb_slave_0_dat_i[31:0] = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_ms[31:0];
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_sm[31:0] = wb_slave_0_dat_o[31:0];
    assign wb_slave_0_meta_o_to_metaAnalyzer_0_meta_in0[15:0] = wb_slave_0_meta_o[15:0];
    assign wb_slave_0_rst = wb_slave_0_rst_to_rst;
    assign wb_slave_0_stb_i = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacestb;
    assign wb_slave_0_we_i = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacewe;
    // wb_slave_1 assignments:
    assign master_0_master_1_to_wb_slave_1_slave_interfaceack = wb_slave_1_ack_o;
    assign wb_slave_1_adr_i[31:0] = master_0_master_1_to_wb_slave_1_slave_interfaceadr[31:0];
    assign wb_slave_1_clk = wb_slave_1_clk_to_clk;
    assign wb_slave_1_configuration[3:0] = wb_slave_1_configuration_to_tiedValue[3:0];
    assign wb_slave_1_cyc_i = master_0_master_1_to_wb_slave_1_slave_interfacecyc;
    assign wb_slave_1_dat_i[31:0] = master_0_master_1_to_wb_slave_1_slave_interfacedat_ms[31:0];
    assign master_0_master_1_to_wb_slave_1_slave_interfacedat_sm[31:0] = wb_slave_1_dat_o[31:0];
    assign wb_slave_1_meta_o_to_metaAnalyzer_0_meta_in1[15:0] = wb_slave_1_meta_o[15:0];
    assign wb_slave_1_rst = wb_slave_1_rst_to_rst;
    assign wb_slave_1_stb_i = master_0_master_1_to_wb_slave_1_slave_interfacestb;
    assign wb_slave_1_we_i = master_0_master_1_to_wb_slave_1_slave_interfacewe;
    // wishbone_bus_0 assignments:
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0ack = wishbone_bus_0_ack_master;
    assign wishbone_bus_0_ack_slave_0 = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0ack;
    assign wishbone_bus_0_ack_slave_1 = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceack;
    assign wishbone_bus_0_adr_master[31:0] = wishbone_bus_0_one_to_many_master_to_master_0_master_0adr[31:0];
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0adr[31:0] = wishbone_bus_0_adr_slave_0[31:0];
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfaceadr[31:0] = wishbone_bus_0_adr_slave_1[31:0];
    assign wishbone_bus_0_cyc_master = wishbone_bus_0_one_to_many_master_to_master_0_master_0cyc;
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0cyc = wishbone_bus_0_cyc_slave_0;
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacecyc = wishbone_bus_0_cyc_slave_1;
    assign wishbone_bus_0_dat_ms_master[31:0] = wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_ms[31:0];
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_ms[31:0] = wishbone_bus_0_dat_ms_slave_0[31:0];
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_ms[31:0] = wishbone_bus_0_dat_ms_slave_1[31:0];
    assign wishbone_bus_0_one_to_many_master_to_master_0_master_0dat_sm[31:0] = wishbone_bus_0_dat_sm_master[31:0];
    assign wishbone_bus_0_dat_sm_slave_0[31:0] = hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0dat_sm[31:0];
    assign wishbone_bus_0_dat_sm_slave_1[31:0] = wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacedat_sm[31:0];
    assign wishbone_bus_0_stb_master = wishbone_bus_0_one_to_many_master_to_master_0_master_0stb;
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0stb = wishbone_bus_0_stb_slave_0;
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacestb = wishbone_bus_0_stb_slave_1;
    assign wishbone_bus_0_we_master = wishbone_bus_0_one_to_many_master_to_master_0_master_0we;
    assign hierarchical_wb_slave_0_bus_slave_to_wishbone_bus_0_bus_slave_0we = wishbone_bus_0_we_slave_0;
    assign wishbone_bus_0_bus_slave_1_to_wb_slave_0_slave_interfacewe = wishbone_bus_0_we_slave_1;

    // The another slave connected to bus. This ones base address is master + half of
    // the total memory.
    // IP-XACT VLNV: tut.fi:ip.hw:hierarchical_wb_slave:1.0
    hierarchical_wb_slave_0 #(
        .ADDR_WIDTH          (32),
        .DATA_COUNT          (8),
        .DATA_WIDTH          (32))
    hierarchical_wb_slave_0(
        // Interface: bus_slave
        .adr_i               (hierarchical_wb_slave_0_adr_i),
        .cyc_i               (hierarchical_wb_slave_0_cyc_i),
        .dat_i               (hierarchical_wb_slave_0_dat_i),
        .stb_i               (hierarchical_wb_slave_0_stb_i),
        .we_i                (hierarchical_wb_slave_0_we_i),
        .ack_o               (hierarchical_wb_slave_0_ack_o),
        .dat_o               (hierarchical_wb_slave_0_dat_o),
        // These ports are not in any interface
        .clk                 (hierarchical_wb_slave_0_clk),
        .rst                 (hierarchical_wb_slave_0_rst),
        .meta_o              (hierarchical_wb_slave_0_meta_o));

    // The chosen master in this design. The second interface has the same base address
    // as the direct slave.
    // IP-XACT VLNV: tut.fi:ip.hw:master:1.0
    master #(
        .ADDR_WIDTH          (32),
        .MASTER_1_BASE_ADDRESS(0),
        .DATA_COUNT          (16),
        .DATA_WIDTH          (32),
        .MASTER_0_BASE_ADDRESS(80),
        .VERILOG_SPECIFIC    (238))
    master_0(
        // Interface: master_0
        .ack_i_0             (master_0_ack_i_0),
        .dat_i_0             (master_0_dat_i_0),
        .adr_o_0             (master_0_adr_o_0),
        .cyc_o_0             (master_0_cyc_o_0),
        .dat_o_0             (master_0_dat_o_0),
        .stb_o_0             (master_0_stb_o_0),
        .we_o_0              (master_0_we_o_0),
        // Interface: master_1
        .ack_i_1             (master_0_ack_i_1),
        .dat_i_1             (master_0_dat_i_1),
        .adr_o_1             (master_0_adr_o_1),
        .cyc_o_1             (master_0_cyc_o_1),
        .dat_o_1             (master_0_dat_o_1),
        .stb_o_1             (master_0_stb_o_1),
        .we_o_1              (master_0_we_o_1),
        // These ports are not in any interface
        .clk                 (master_0_clk),
        .rst                 (master_0_rst),
        .start               (master_0_start),
        .done                (master_0_done));

    // IP-XACT VLNV: tut.fi:ip.hw:metaAnalyzer:0.9
    metaAnalyzer #(
        .DATA_WIDTH          (16))
    metaAnalyzer_0(
        // These ports are not in any interface
        .clk                 (metaAnalyzer_0_clk),
        .meta_in0            (metaAnalyzer_0_meta_in0),
        .meta_in1            (metaAnalyzer_0_meta_in1),
        .meta_in2            (metaAnalyzer_0_meta_in2),
        .rst                 (metaAnalyzer_0_rst),
        .meta_ok             (metaAnalyzer_0_meta_ok));

    // The first slave connected to bus. Has the same base address as the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     (4),
        .InputForConfig1     (8),
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8))
    wb_slave_0(
        // Interface: slave_interface
        .adr_i               (wb_slave_0_adr_i),
        .cyc_i               (wb_slave_0_cyc_i),
        .dat_i               (wb_slave_0_dat_i),
        .stb_i               (wb_slave_0_stb_i),
        .we_i                (wb_slave_0_we_i),
        .ack_o               (wb_slave_0_ack_o),
        .dat_o               (wb_slave_0_dat_o),
        // These ports are not in any interface
        .clk                 (wb_slave_0_clk),
        .configuration       (wb_slave_0_configuration),
        .rst                 (wb_slave_0_rst),
        .meta_o              (wb_slave_0_meta_o));

    // The slave in the design which is directly connected to the master.
    // IP-XACT VLNV: tut.fi:ip.hw:wb_slave:1.0
    wb_slave #(
        .InputForConfig0     (4),
        .InputForConfig1     (8),
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (16))
    wb_slave_1(
        // Interface: slave_interface
        .adr_i               (wb_slave_1_adr_i),
        .cyc_i               (wb_slave_1_cyc_i),
        .dat_i               (wb_slave_1_dat_i),
        .stb_i               (wb_slave_1_stb_i),
        .we_i                (wb_slave_1_we_i),
        .ack_o               (wb_slave_1_ack_o),
        .dat_o               (wb_slave_1_dat_o),
        // These ports are not in any interface
        .clk                 (wb_slave_1_clk),
        .configuration       (wb_slave_1_configuration),
        .rst                 (wb_slave_1_rst),
        .meta_o              (wb_slave_1_meta_o));

    // The bus used in this design to connect a master to two slaves.
    // IP-XACT VLNV: tut.fi:ip.com:wishbone_bus:1.0
    wishbone_bus #(
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .SLAVE_1_REMAP_ADDRESS(112),
        .SLAVE_0_REMAP_ADDRESS(80),
        .SLAVE_0_RANGE       (32),
        .SLAVE_1_RANGE       (32))
    wishbone_bus_0(
        // Interface: bus_slave_0
        .ack_slave_0         (wishbone_bus_0_ack_slave_0),
        .dat_sm_slave_0      (wishbone_bus_0_dat_sm_slave_0),
        .adr_slave_0         (wishbone_bus_0_adr_slave_0),
        .cyc_slave_0         (wishbone_bus_0_cyc_slave_0),
        .dat_ms_slave_0      (wishbone_bus_0_dat_ms_slave_0),
        .stb_slave_0         (wishbone_bus_0_stb_slave_0),
        .we_slave_0          (wishbone_bus_0_we_slave_0),
        // Interface: bus_slave_1
        .ack_slave_1         (wishbone_bus_0_ack_slave_1),
        .dat_sm_slave_1      (wishbone_bus_0_dat_sm_slave_1),
        .adr_slave_1         (wishbone_bus_0_adr_slave_1),
        .cyc_slave_1         (wishbone_bus_0_cyc_slave_1),
        .dat_ms_slave_1      (wishbone_bus_0_dat_ms_slave_1),
        .stb_slave_1         (wishbone_bus_0_stb_slave_1),
        .we_slave_1          (wishbone_bus_0_we_slave_1),
        // Interface: one_to_many_master
        .adr_master          (wishbone_bus_0_adr_master),
        .cyc_master          (wishbone_bus_0_cyc_master),
        .dat_ms_master       (wishbone_bus_0_dat_ms_master),
        .stb_master          (wishbone_bus_0_stb_master),
        .we_master           (wishbone_bus_0_we_master),
        .ack_master          (wishbone_bus_0_ack_master),
        .dat_sm_master       (wishbone_bus_0_dat_sm_master));


endmodule
