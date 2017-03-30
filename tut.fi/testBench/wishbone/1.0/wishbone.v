//-----------------------------------------------------------------------------
// File          : wishbone.v
// Creation date : 30.03.2017
// Creation time : 12:25:54
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.6 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:wishbone:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/wishbone/1.0/wishbone.1.0.xml
//-----------------------------------------------------------------------------

module wishbone();

    // TestClockSource_0_wb_system_to_wb_slave_template_0_wb_system wires:
    wire        TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemclk;
    wire        TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemrst;
    // wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_master wires:
    wire        wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterack;
    wire [15:0] wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masteradr;
    wire        wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastercyc;
    wire [31:0] wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_ms;
    wire [31:0] wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_sm;
    wire        wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastererr;
    wire        wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterstb;
    wire        wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterwe;

    // TestClockSource_0 port wires:
    wire        TestClockSource_0_clk_o;
    wire        TestClockSource_0_rst_o;
    // wb_slave_template_0 port wires:
    wire        wb_slave_template_0_ack_o;
    wire [15:0] wb_slave_template_0_adr_i;
    wire        wb_slave_template_0_clk_i;
    wire        wb_slave_template_0_cyc_i;
    wire [31:0] wb_slave_template_0_dat_i;
    wire [31:0] wb_slave_template_0_dat_o;
    wire        wb_slave_template_0_err_o;
    wire        wb_slave_template_0_rst_i;
    wire        wb_slave_template_0_stb_i;
    wire        wb_slave_template_0_we_i;
    // wb_test_master_0 port wires:
    wire        wb_test_master_0_ack_i;
    wire [15:0] wb_test_master_0_adr_o;
    wire        wb_test_master_0_clk_i;
    wire        wb_test_master_0_cyc_o;
    wire [31:0] wb_test_master_0_dat_i;
    wire [31:0] wb_test_master_0_dat_o;
    wire        wb_test_master_0_err_i;
    wire        wb_test_master_0_rst_i;
    wire        wb_test_master_0_stb_o;
    wire        wb_test_master_0_we_o;

    // TestClockSource_0 assignments:
    assign TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemclk = TestClockSource_0_clk_o;
    assign TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemrst = TestClockSource_0_rst_o;
    // wb_slave_template_0 assignments:
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterack = wb_slave_template_0_ack_o;
    assign wb_slave_template_0_adr_i[15:0] = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masteradr[15:0];
    assign wb_slave_template_0_clk_i = TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemclk;
    assign wb_slave_template_0_cyc_i = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastercyc;
    assign wb_slave_template_0_dat_i[31:0] = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_ms[31:0];
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_sm[31:0] = wb_slave_template_0_dat_o[31:0];
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastererr = wb_slave_template_0_err_o;
    assign wb_slave_template_0_rst_i = TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemrst;
    assign wb_slave_template_0_stb_i = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterstb;
    assign wb_slave_template_0_we_i = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterwe;
    // wb_test_master_0 assignments:
    assign wb_test_master_0_ack_i = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterack;
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masteradr[15:0] = wb_test_master_0_adr_o[15:0];
    assign wb_test_master_0_clk_i = TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemclk;
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastercyc = wb_test_master_0_cyc_o;
    assign wb_test_master_0_dat_i[31:0] = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_sm[31:0];
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterdat_ms[31:0] = wb_test_master_0_dat_o[31:0];
    assign wb_test_master_0_err_i = wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_mastererr;
    assign wb_test_master_0_rst_i = TestClockSource_0_wb_system_to_wb_slave_template_0_wb_systemrst;
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterstb = wb_test_master_0_stb_o;
    assign wb_slave_template_0_wb_slave_to_wb_test_master_0_wb_masterwe = wb_test_master_0_we_o;

    // IP-XACT VLNV: tut.fi:testBench:TestClockSource:1.0
    TestClockSource #(
        .WAIT_TIME           (1500))
    TestClockSource_0(
        // Interface: wb_system
        .clk_o               (TestClockSource_0_clk_o),
        .rst_o               (TestClockSource_0_rst_o));

    // IP-XACT VLNV: tut.fi:template:wb_slave_template:1.0
    wb_slave #(
        .ADDR_WIDTH          (16),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8),
        .BASE_ADDRESS        (3840))
    wb_slave_template_0(
        // Interface: wb_slave
        .adr_i               (wb_slave_template_0_adr_i),
        .cyc_i               (wb_slave_template_0_cyc_i),
        .dat_i               (wb_slave_template_0_dat_i),
        .stb_i               (wb_slave_template_0_stb_i),
        .we_i                (wb_slave_template_0_we_i),
        .ack_o               (wb_slave_template_0_ack_o),
        .dat_o               (wb_slave_template_0_dat_o),
        .err_o               (wb_slave_template_0_err_o),
        // Interface: wb_system
        .clk_i               (wb_slave_template_0_clk_i),
        .rst_i               (wb_slave_template_0_rst_i));

    // IP-XACT VLNV: tut.fi:testBench:wb_test_master:1.0
    wb_master #(
        .ADDR_WIDTH          (16),
        .DATA_COUNT          (8),
        .DATA_WIDTH          (32),
        .BASE_ADDRESS        (3840))
    wb_test_master_0(
        // Interface: wb_master
        .ack_i               (wb_test_master_0_ack_i),
        .dat_i               (wb_test_master_0_dat_i),
        .err_i               (wb_test_master_0_err_i),
        .adr_o               (wb_test_master_0_adr_o),
        .cyc_o               (wb_test_master_0_cyc_o),
        .dat_o               (wb_test_master_0_dat_o),
        .stb_o               (wb_test_master_0_stb_o),
        .we_o                (wb_test_master_0_we_o),
        // Interface: wb_system
        .clk_i               (wb_test_master_0_clk_i),
        .rst_i               (wb_test_master_0_rst_i));


endmodule
