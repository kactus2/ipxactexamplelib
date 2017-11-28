//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 28.11.2017
// Creation time : 15:57:44
// Description   : Test arrangement for verifying the SPI examples.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1184 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:communication.template.test:spi.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication.template.test/spi.setup/1.0/spi.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // spi_slave_0_slave_if_to_spi_master_0_master_if wires:
    wire        spi_slave_0_slave_if_to_spi_master_0_master_ifMISO;
    wire        spi_slave_0_slave_if_to_spi_master_0_master_ifMOSI;
    wire        spi_slave_0_slave_if_to_spi_master_0_master_ifSCLK;
    wire [2:0]  spi_slave_0_slave_if_to_spi_master_0_master_ifSS;

    // Ad-hoc wires:
    wire        spi_master_0_clk_in_to_clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o_to_spi_slave_0_rst_in;
    wire        clock_generator_0_rst_o_to_spi_master_0_rst_in;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
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

    // clock_generator_0 assignments:
    assign spi_master_0_clk_in_to_clock_generator_0_clk_o = clock_generator_0_clk_o;
    assign clock_generator_0_rst_o_to_spi_master_0_rst_in = clock_generator_0_rst_o;
    assign clock_generator_0_rst_o_to_spi_slave_0_rst_in = clock_generator_0_rst_o;
    // spi_master_0 assignments:
    assign spi_master_0_clk_in = spi_master_0_clk_in_to_clock_generator_0_clk_o;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifSCLK = spi_master_0_clk_out;
    assign spi_master_0_data_in = spi_slave_0_slave_if_to_spi_master_0_master_ifMISO;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifMOSI = spi_master_0_data_out;
    assign spi_master_0_rst_in = clock_generator_0_rst_o_to_spi_master_0_rst_in;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifSS[0] = spi_master_0_slave_select1_out;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifSS[1] = spi_master_0_slave_select2_out;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifSS[2] = spi_master_0_slave_select3_out;
    // spi_slave_0 assignments:
    assign spi_slave_0_clk_in = spi_slave_0_slave_if_to_spi_master_0_master_ifSCLK;
    assign spi_slave_0_data_in = spi_slave_0_slave_if_to_spi_master_0_master_ifMOSI;
    assign spi_slave_0_slave_if_to_spi_master_0_master_ifMISO = spi_slave_0_data_out;
    assign spi_slave_0_rst_in = clock_generator_0_rst_o_to_spi_slave_0_rst_in;
    assign spi_slave_0_slave_select_in = spi_slave_0_slave_if_to_spi_master_0_master_ifSS[0];

    // IP-XACT VLNV: tut.fi:other.test:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:communication.template:spi_master:1.0
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

    // IP-XACT VLNV: tut.fi:communication.template:spi_slave:1.0
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
