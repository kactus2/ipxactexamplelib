//-----------------------------------------------------------------------------
// File          : SPI.v
// Creation date : 10.04.2017
// Creation time : 15:51:57
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.20 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:SPI:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/SPI/1.0/SPI.1.0.xml
//-----------------------------------------------------------------------------

module SPI();

    // spi_master_0_master_if_to_spi_slave_0_slave_if wires:
    wire        spi_master_0_master_if_to_spi_slave_0_slave_ifMISO;
    wire        spi_master_0_master_if_to_spi_slave_0_slave_ifMOSI;
    wire        spi_master_0_master_if_to_spi_slave_0_slave_ifSCLK;
    wire [2:0]  spi_master_0_master_if_to_spi_slave_0_slave_ifSS;

    // Ad-hoc wires:
    wire        spi_slave_0_rst_in_to_TestClockSource_0_rst_o;
    wire        TestClockSource_0_rst_o_to_spi_master_0_rst_in;
    wire        spi_master_0_clk_in_to_TestClockSource_0_clk_o;

    // TestClockSource_0 port wires:
    wire        TestClockSource_0_clk_o;
    wire        TestClockSource_0_rst_o;
    // spi_master_0 port wires:
    wire        spi_master_0_clk_in;
    wire        spi_master_0_clk_out;
    wire        spi_master_0_data_in;
    wire        spi_master_0_data_out;
    wire        spi_master_0_rst_in;
    wire        spi_master_0_slave_select1_out;
    wire        spi_master_0_slave_select2_out;
    wire        spi_master_0_slave_select3_out;
    // spi_slave_0 port wires:
    wire        spi_slave_0_clk_in;
    wire        spi_slave_0_data_in;
    wire        spi_slave_0_data_out;
    wire        spi_slave_0_rst_in;
    wire        spi_slave_0_slave_select_in;

    // TestClockSource_0 assignments:
    assign spi_master_0_clk_in_to_TestClockSource_0_clk_o = TestClockSource_0_clk_o;
    assign TestClockSource_0_rst_o_to_spi_master_0_rst_in = TestClockSource_0_rst_o;
    assign spi_slave_0_rst_in_to_TestClockSource_0_rst_o = TestClockSource_0_rst_o;
    // spi_master_0 assignments:
    assign spi_master_0_clk_in = spi_master_0_clk_in_to_TestClockSource_0_clk_o;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifSCLK = spi_master_0_clk_out;
    assign spi_master_0_data_in = spi_master_0_master_if_to_spi_slave_0_slave_ifMISO;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifMOSI = spi_master_0_data_out;
    assign spi_master_0_rst_in = TestClockSource_0_rst_o_to_spi_master_0_rst_in;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifSS[0] = spi_master_0_slave_select1_out;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifSS[1] = spi_master_0_slave_select2_out;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifSS[2] = spi_master_0_slave_select3_out;
    // spi_slave_0 assignments:
    assign spi_slave_0_clk_in = spi_master_0_master_if_to_spi_slave_0_slave_ifSCLK;
    assign spi_slave_0_data_in = spi_master_0_master_if_to_spi_slave_0_slave_ifMOSI;
    assign spi_master_0_master_if_to_spi_slave_0_slave_ifMISO = spi_slave_0_data_out;
    assign spi_slave_0_rst_in = spi_slave_0_rst_in_to_TestClockSource_0_rst_o;
    assign spi_slave_0_slave_select_in = spi_master_0_master_if_to_spi_slave_0_slave_ifSS[0];

    // IP-XACT VLNV: tut.fi:testBench:TestClockSource:1.0
    TestClockSource #(
        .WAIT_TIME           (1500))
    TestClockSource_0(
        // Interface: wb_system
        .clk_o               (TestClockSource_0_clk_o),
        .rst_o               (TestClockSource_0_rst_o));

    // IP-XACT VLNV: tut.fi:template:spi_master:1.0
    spi_master spi_master_0(
        // Interface: master_if
        .data_in             (spi_master_0_data_in),
        .clk_out             (spi_master_0_clk_out),
        .data_out            (spi_master_0_data_out),
        .slave_select1_out   (spi_master_0_slave_select1_out),
        .slave_select2_out   (spi_master_0_slave_select2_out),
        .slave_select3_out   (spi_master_0_slave_select3_out),
        // These ports are not in any interface
        .clk_in              (spi_master_0_clk_in),
        .rst_in              (spi_master_0_rst_in));

    // IP-XACT VLNV: tut.fi:template:spi_slave:1.0
    spi_slave #(
        .SLAVE_ID            (0))
    spi_slave_0(
        // Interface: slave_if
        .clk_in              (spi_slave_0_clk_in),
        .data_in             (spi_slave_0_data_in),
        .slave_select_in     (spi_slave_0_slave_select_in),
        .data_out            (spi_slave_0_data_out),
        // These ports are not in any interface
        .rst_in              (spi_slave_0_rst_in));


endmodule
