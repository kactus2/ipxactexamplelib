//-----------------------------------------------------------------------------
// File          : wb_example_0.v
// Creation date : 28.11.2017
// Creation time : 16:51:22
// Description   : A hardware component containing a hardware design, which has a master component, three slaves and a bus component.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1176 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:other.subsystem:wb_example:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/other.subsystem/wb_example/1.0/wb_example.1.0.xml
//-----------------------------------------------------------------------------

module wb_example_0 #(
    parameter                              ADDR_WIDTH       = 32,    // The width of the address.
    parameter                              AUB              = 8,    // Addressable unit bits of the memory
    parameter                              BUS_SLAVE_RANGE  = 32,    // How much address space is allotted to each bus slave in the design.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              MEMORY_AUB_SIZE  = 64,    // Size of memory in AUBs, for each master.
    parameter                              SLAVE_BASE       = 128,    // The base address of the first slave in the design.
    parameter                              WORD_COUNT       = 16    // How many words there are per master.
) (
    // Interface: wb_system
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.

    // These ports are not in any interface
    input                               start,    // Input used to signal that is is ok to start the masters.
    output                              done    // The mandatory reset, as this is synchronous logic.
);

    // hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0 wires:
    wire        hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0ack;
    wire [31:0] hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0adr;
    wire        hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0cyc;
    wire [31:0] hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_ms;
    wire [31:0] hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_sm;
    wire        hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0err;
    wire        hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0stb;
    wire        hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0we;
    // hierarchical_wb_slave_0_wb_system_to_wb_system wires:
    wire        hierarchical_wb_slave_0_wb_system_to_wb_systemclk;
    wire        hierarchical_wb_slave_0_wb_system_to_wb_systemrst;
    // wishbone_0_slave_1_to_wb_slave_0_wb_slave wires:
    wire        wishbone_0_slave_1_to_wb_slave_0_wb_slaveack;
    wire [31:0] wishbone_0_slave_1_to_wb_slave_0_wb_slaveadr;
    wire        wishbone_0_slave_1_to_wb_slave_0_wb_slavecyc;
    wire [31:0] wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_ms;
    wire [31:0] wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_sm;
    wire        wishbone_0_slave_1_to_wb_slave_0_wb_slaveerr;
    wire        wishbone_0_slave_1_to_wb_slave_0_wb_slavestb;
    wire        wishbone_0_slave_1_to_wb_slave_0_wb_slavewe;
    // wb_slave_1_wb_slave_to_wb_dual_master_0_master_1 wires:
    wire        wb_slave_1_wb_slave_to_wb_dual_master_0_master_1ack;
    wire [31:0] wb_slave_1_wb_slave_to_wb_dual_master_0_master_1adr;
    wire        wb_slave_1_wb_slave_to_wb_dual_master_0_master_1cyc;
    wire [31:0] wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_ms;
    wire [31:0] wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_sm;
    wire        wb_slave_1_wb_slave_to_wb_dual_master_0_master_1err;
    wire        wb_slave_1_wb_slave_to_wb_dual_master_0_master_1stb;
    wire        wb_slave_1_wb_slave_to_wb_dual_master_0_master_1we;
    // wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0 wires:
    wire        wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0ack;
    wire [31:0] wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0adr;
    wire        wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0cyc;
    wire [31:0] wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_ms;
    wire [31:0] wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_sm;
    wire        wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0err;
    wire        wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0stb;
    wire        wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0we;

    // Ad-hoc wires:
    wire        wb_dual_master_0_start_to_start;
    wire        wb_dual_master_0_done_to_done;

    // hierarchical_wb_slave_0 port wires:
    wire        hierarchical_wb_slave_0_ack_o;
    wire [31:0] hierarchical_wb_slave_0_adr_i;
    wire        hierarchical_wb_slave_0_clk_i;
    wire        hierarchical_wb_slave_0_cyc_i;
    wire [31:0] hierarchical_wb_slave_0_dat_i;
    wire [31:0] hierarchical_wb_slave_0_dat_o;
    wire        hierarchical_wb_slave_0_rst_i;
    wire        hierarchical_wb_slave_0_stb_i;
    wire        hierarchical_wb_slave_0_we_i;
    // wb_dual_master_0 port wires:
    wire        wb_dual_master_0_ack_i_0;
    wire        wb_dual_master_0_ack_i_1;
    wire [31:0] wb_dual_master_0_adr_o_0;
    wire [31:0] wb_dual_master_0_adr_o_1;
    wire        wb_dual_master_0_clk_i;
    wire        wb_dual_master_0_cyc_o_0;
    wire        wb_dual_master_0_cyc_o_1;
    wire [31:0] wb_dual_master_0_dat_i_0;
    wire [31:0] wb_dual_master_0_dat_i_1;
    wire [31:0] wb_dual_master_0_dat_o_0;
    wire [31:0] wb_dual_master_0_dat_o_1;
    wire        wb_dual_master_0_done;
    wire        wb_dual_master_0_err_i_0;
    wire        wb_dual_master_0_err_i_1;
    wire        wb_dual_master_0_rst_i;
    wire        wb_dual_master_0_start;
    wire        wb_dual_master_0_stb_o_0;
    wire        wb_dual_master_0_stb_o_1;
    wire        wb_dual_master_0_we_o_0;
    wire        wb_dual_master_0_we_o_1;
    // wb_slave_0 port wires:
    wire        wb_slave_0_ack_o;
    wire [31:0] wb_slave_0_adr_i;
    wire        wb_slave_0_clk_i;
    wire        wb_slave_0_cyc_i;
    wire [31:0] wb_slave_0_dat_i;
    wire [31:0] wb_slave_0_dat_o;
    wire        wb_slave_0_err_o;
    wire        wb_slave_0_rst_i;
    wire        wb_slave_0_stb_i;
    wire        wb_slave_0_we_i;
    // wb_slave_1 port wires:
    wire        wb_slave_1_ack_o;
    wire [15:0] wb_slave_1_adr_i;
    wire        wb_slave_1_clk_i;
    wire        wb_slave_1_cyc_i;
    wire [31:0] wb_slave_1_dat_i;
    wire [31:0] wb_slave_1_dat_o;
    wire        wb_slave_1_err_o;
    wire        wb_slave_1_rst_i;
    wire        wb_slave_1_stb_i;
    wire        wb_slave_1_we_i;
    // wishbone_0 port wires:
    wire        wishbone_0_ack_master;
    wire        wishbone_0_ack_slave_0;
    wire        wishbone_0_ack_slave_1;
    wire [31:0] wishbone_0_adr_master;
    wire [31:0] wishbone_0_adr_slave_0;
    wire [31:0] wishbone_0_adr_slave_1;
    wire        wishbone_0_cyc_master;
    wire        wishbone_0_cyc_slave_0;
    wire        wishbone_0_cyc_slave_1;
    wire [31:0] wishbone_0_dat_ms_master;
    wire [31:0] wishbone_0_dat_ms_slave_0;
    wire [31:0] wishbone_0_dat_ms_slave_1;
    wire [31:0] wishbone_0_dat_sm_master;
    wire [31:0] wishbone_0_dat_sm_slave_0;
    wire [31:0] wishbone_0_dat_sm_slave_1;
    wire        wishbone_0_err_master;
    wire        wishbone_0_err_slave_0;
    wire        wishbone_0_err_slave_1;
    wire        wishbone_0_stb_master;
    wire        wishbone_0_stb_slave_0;
    wire        wishbone_0_stb_slave_1;
    wire        wishbone_0_we_master;
    wire        wishbone_0_we_slave_0;
    wire        wishbone_0_we_slave_1;

    // Assignments for the ports of the encompassing component:
    assign hierarchical_wb_slave_0_wb_system_to_wb_systemclk = clk_i;
    assign done = wb_dual_master_0_done_to_done;
    assign hierarchical_wb_slave_0_wb_system_to_wb_systemrst = rst_i;
    assign wb_dual_master_0_start_to_start = start;

    // hierarchical_wb_slave_0 assignments:
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0ack = hierarchical_wb_slave_0_ack_o;
    assign hierarchical_wb_slave_0_adr_i[31:0] = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0adr[31:0];
    assign hierarchical_wb_slave_0_clk_i = hierarchical_wb_slave_0_wb_system_to_wb_systemclk;
    assign hierarchical_wb_slave_0_cyc_i = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0cyc;
    assign hierarchical_wb_slave_0_dat_i[31:0] = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_ms[31:0];
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_sm[31:0] = hierarchical_wb_slave_0_dat_o[31:0];
    assign hierarchical_wb_slave_0_rst_i = hierarchical_wb_slave_0_wb_system_to_wb_systemrst;
    assign hierarchical_wb_slave_0_stb_i = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0stb;
    assign hierarchical_wb_slave_0_we_i = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0we;
    // wb_dual_master_0 assignments:
    assign wb_dual_master_0_ack_i_0 = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0ack;
    assign wb_dual_master_0_ack_i_1 = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1ack;
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0adr[31:0] = wb_dual_master_0_adr_o_0[31:0];
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1adr[31:0] = wb_dual_master_0_adr_o_1[31:0];
    assign wb_dual_master_0_clk_i = hierarchical_wb_slave_0_wb_system_to_wb_systemclk;
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0cyc = wb_dual_master_0_cyc_o_0;
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1cyc = wb_dual_master_0_cyc_o_1;
    assign wb_dual_master_0_dat_i_0[31:0] = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_sm[31:0];
    assign wb_dual_master_0_dat_i_1[31:0] = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_sm[31:0];
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_ms[31:0] = wb_dual_master_0_dat_o_0[31:0];
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_ms[31:0] = wb_dual_master_0_dat_o_1[31:0];
    assign wb_dual_master_0_done_to_done = wb_dual_master_0_done;
    assign wb_dual_master_0_err_i_0 = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0err;
    assign wb_dual_master_0_err_i_1 = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1err;
    assign wb_dual_master_0_rst_i = hierarchical_wb_slave_0_wb_system_to_wb_systemrst;
    assign wb_dual_master_0_start = wb_dual_master_0_start_to_start;
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0stb = wb_dual_master_0_stb_o_0;
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1stb = wb_dual_master_0_stb_o_1;
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0we = wb_dual_master_0_we_o_0;
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1we = wb_dual_master_0_we_o_1;
    // wb_slave_0 assignments:
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slaveack = wb_slave_0_ack_o;
    assign wb_slave_0_adr_i[31:0] = wishbone_0_slave_1_to_wb_slave_0_wb_slaveadr[31:0];
    assign wb_slave_0_clk_i = hierarchical_wb_slave_0_wb_system_to_wb_systemclk;
    assign wb_slave_0_cyc_i = wishbone_0_slave_1_to_wb_slave_0_wb_slavecyc;
    assign wb_slave_0_dat_i[31:0] = wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_ms[31:0];
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_sm[31:0] = wb_slave_0_dat_o[31:0];
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slaveerr = wb_slave_0_err_o;
    assign wb_slave_0_rst_i = hierarchical_wb_slave_0_wb_system_to_wb_systemrst;
    assign wb_slave_0_stb_i = wishbone_0_slave_1_to_wb_slave_0_wb_slavestb;
    assign wb_slave_0_we_i = wishbone_0_slave_1_to_wb_slave_0_wb_slavewe;
    // wb_slave_1 assignments:
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1ack = wb_slave_1_ack_o;
    assign wb_slave_1_adr_i[15:0] = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1adr[15:0];
    assign wb_slave_1_clk_i = hierarchical_wb_slave_0_wb_system_to_wb_systemclk;
    assign wb_slave_1_cyc_i = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1cyc;
    assign wb_slave_1_dat_i[31:0] = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_ms[31:0];
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1dat_sm[31:0] = wb_slave_1_dat_o[31:0];
    assign wb_slave_1_wb_slave_to_wb_dual_master_0_master_1err = wb_slave_1_err_o;
    assign wb_slave_1_rst_i = hierarchical_wb_slave_0_wb_system_to_wb_systemrst;
    assign wb_slave_1_stb_i = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1stb;
    assign wb_slave_1_we_i = wb_slave_1_wb_slave_to_wb_dual_master_0_master_1we;
    // wishbone_0 assignments:
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0ack = wishbone_0_ack_master;
    assign wishbone_0_ack_slave_0 = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0ack;
    assign wishbone_0_ack_slave_1 = wishbone_0_slave_1_to_wb_slave_0_wb_slaveack;
    assign wishbone_0_adr_master[31:0] = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0adr[31:0];
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0adr[31:0] = wishbone_0_adr_slave_0[31:0];
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slaveadr[31:0] = wishbone_0_adr_slave_1[31:0];
    assign wishbone_0_cyc_master = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0cyc;
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0cyc = wishbone_0_cyc_slave_0;
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slavecyc = wishbone_0_cyc_slave_1;
    assign wishbone_0_dat_ms_master[31:0] = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_ms[31:0];
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_ms[31:0] = wishbone_0_dat_ms_slave_0[31:0];
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_ms[31:0] = wishbone_0_dat_ms_slave_1[31:0];
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0dat_sm[31:0] = wishbone_0_dat_sm_master[31:0];
    assign wishbone_0_dat_sm_slave_0[31:0] = hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0dat_sm[31:0];
    assign wishbone_0_dat_sm_slave_1[31:0] = wishbone_0_slave_1_to_wb_slave_0_wb_slavedat_sm[31:0];
    assign wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0err = wishbone_0_err_master;
    assign wishbone_0_err_slave_0 = 0;
    assign wishbone_0_err_slave_1 = wishbone_0_slave_1_to_wb_slave_0_wb_slaveerr;
    assign wishbone_0_stb_master = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0stb;
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0stb = wishbone_0_stb_slave_0;
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slavestb = wishbone_0_stb_slave_1;
    assign wishbone_0_we_master = wishbone_0_one_to_many_master_to_wb_dual_master_0_master_0we;
    assign hierarchical_wb_slave_0_wb_slave_to_wishbone_0_slave_0we = wishbone_0_we_slave_0;
    assign wishbone_0_slave_1_to_wb_slave_0_wb_slavewe = wishbone_0_we_slave_1;

    // The first slave connected to bus. Has the same base address as the master.
    // IP-XACT VLNV: tut.fi:peripheral.subsystem:hierarchical_wb_slave:1.0
    hierarchical_wb_slave_0 #(
        .ADDR_WIDTH          (32),
        .DATA_COUNT          (8),
        .DATA_WIDTH          (32),
        .BASE_ADDRESS        (128))
    hierarchical_wb_slave_0(
        // Interface: wb_slave
        .adr_i               (hierarchical_wb_slave_0_adr_i),
        .cyc_i               (hierarchical_wb_slave_0_cyc_i),
        .dat_i               (hierarchical_wb_slave_0_dat_i),
        .stb_i               (hierarchical_wb_slave_0_stb_i),
        .we_i                (hierarchical_wb_slave_0_we_i),
        .ack_o               (hierarchical_wb_slave_0_ack_o),
        .dat_o               (hierarchical_wb_slave_0_dat_o),
        // Interface: wb_system
        .clk_i               (hierarchical_wb_slave_0_clk_i),
        .rst_i               (hierarchical_wb_slave_0_rst_i));

    // The chosen master in this design. The second interface has the same base address
    // as the direct slave.
    // IP-XACT VLNV: tut.fi:peripheral.logic:wb_dual_master:1.0
    master #(
        .ADDR_WIDTH          (32),
        .MASTER_1_BASE_ADDRESS(136),
        .DATA_COUNT          (16),
        .DATA_WIDTH          (32),
        .MASTER_0_BASE_ADDRESS(128))
    wb_dual_master_0(
        // Interface: master_0
        .ack_i_0             (wb_dual_master_0_ack_i_0),
        .dat_i_0             (wb_dual_master_0_dat_i_0),
        .err_i_0             (wb_dual_master_0_err_i_0),
        .adr_o_0             (wb_dual_master_0_adr_o_0),
        .cyc_o_0             (wb_dual_master_0_cyc_o_0),
        .dat_o_0             (wb_dual_master_0_dat_o_0),
        .stb_o_0             (wb_dual_master_0_stb_o_0),
        .we_o_0              (wb_dual_master_0_we_o_0),
        // Interface: master_1
        .ack_i_1             (wb_dual_master_0_ack_i_1),
        .dat_i_1             (wb_dual_master_0_dat_i_1),
        .err_i_1             (wb_dual_master_0_err_i_1),
        .adr_o_1             (wb_dual_master_0_adr_o_1),
        .cyc_o_1             (wb_dual_master_0_cyc_o_1),
        .dat_o_1             (wb_dual_master_0_dat_o_1),
        .stb_o_1             (wb_dual_master_0_stb_o_1),
        .we_o_1              (wb_dual_master_0_we_o_1),
        // Interface: wb_system
        .clk_i               (wb_dual_master_0_clk_i),
        .rst_i               (wb_dual_master_0_rst_i),
        // These ports are not in any interface
        .start               (wb_dual_master_0_start),
        .done                (wb_dual_master_0_done));

    // The another slave connected to bus. This ones base address is master + half of
    // the total memory.
    // IP-XACT VLNV: tut.fi:communication.template:wb_slave:1.0
    wb_slave #(
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8),
        .BASE_ADDRESS        (160))
    wb_slave_0(
        // Interface: wb_slave
        .adr_i               (wb_slave_0_adr_i),
        .cyc_i               (wb_slave_0_cyc_i),
        .dat_i               (wb_slave_0_dat_i),
        .stb_i               (wb_slave_0_stb_i),
        .we_i                (wb_slave_0_we_i),
        .ack_o               (wb_slave_0_ack_o),
        .dat_o               (wb_slave_0_dat_o),
        .err_o               (wb_slave_0_err_o),
        // Interface: wb_system
        .clk_i               (wb_slave_0_clk_i),
        .rst_i               (wb_slave_0_rst_i));

    // The slave in the design which is directly connected to the master.
    // IP-XACT VLNV: tut.fi:communication.template:wb_slave:1.0
    wb_slave #(
        .ADDR_WIDTH          (16),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (16),
        .BASE_ADDRESS        (128))
    wb_slave_1(
        // Interface: wb_slave
        .adr_i               (wb_slave_1_adr_i),
        .cyc_i               (wb_slave_1_cyc_i),
        .dat_i               (wb_slave_1_dat_i),
        .stb_i               (wb_slave_1_stb_i),
        .we_i                (wb_slave_1_we_i),
        .ack_o               (wb_slave_1_ack_o),
        .dat_o               (wb_slave_1_dat_o),
        .err_o               (wb_slave_1_err_o),
        // Interface: wb_system
        .clk_i               (wb_slave_1_clk_i),
        .rst_i               (wb_slave_1_rst_i));

    // The bus used in this design to connect a master to two slaves.
    // IP-XACT VLNV: tut.fi:communication.bus:wishbone:1.0
    wishbone_bus #(
        .ADDR_WIDTH          (32),
        .DATA_WIDTH          (32),
        .SLAVE_0_BASE        (128),
        .SLAVE_1_BASE        (160),
        .SLAVE_2_BASE        (768),
        .SLAVE_3_BASE        (1024),
        .SLAVE_RANGE         (32))
    wishbone_0(
        // Interface: one_to_many_master
        .adr_master          (wishbone_0_adr_master),
        .cyc_master          (wishbone_0_cyc_master),
        .dat_ms_master       (wishbone_0_dat_ms_master),
        .stb_master          (wishbone_0_stb_master),
        .we_master           (wishbone_0_we_master),
        .ack_master          (wishbone_0_ack_master),
        .dat_sm_master       (wishbone_0_dat_sm_master),
        .err_master          (wishbone_0_err_master),
        // Interface: slave_0
        .ack_slave_0         (wishbone_0_ack_slave_0),
        .dat_sm_slave_0      (wishbone_0_dat_sm_slave_0),
        .err_slave_0         (wishbone_0_err_slave_0),
        .adr_slave_0         (wishbone_0_adr_slave_0),
        .cyc_slave_0         (wishbone_0_cyc_slave_0),
        .dat_ms_slave_0      (wishbone_0_dat_ms_slave_0),
        .stb_slave_0         (wishbone_0_stb_slave_0),
        .we_slave_0          (wishbone_0_we_slave_0),
        // Interface: slave_1
        .ack_slave_1         (wishbone_0_ack_slave_1),
        .dat_sm_slave_1      (wishbone_0_dat_sm_slave_1),
        .err_slave_1         (wishbone_0_err_slave_1),
        .adr_slave_1         (wishbone_0_adr_slave_1),
        .cyc_slave_1         (wishbone_0_cyc_slave_1),
        .dat_ms_slave_1      (wishbone_0_dat_ms_slave_1),
        .stb_slave_1         (wishbone_0_stb_slave_1),
        .we_slave_1          (wishbone_0_we_slave_1),
        // Interface: slave_2
        .ack_slave_2         (0),
        .dat_sm_slave_2      (0),
        .err_slave_2         (0),
        .adr_slave_2         (),
        .cyc_slave_2         (),
        .dat_ms_slave_2      (),
        .stb_slave_2         (),
        .we_slave_2          (),
        // Interface: slave_3
        .ack_slave_3         (0),
        .dat_sm_slave_3      (0),
        .err_slave_3         (0),
        .adr_slave_3         (),
        .cyc_slave_3         (),
        .dat_ms_slave_3      (),
        .stb_slave_3         (),
        .we_slave_3          ());


endmodule
