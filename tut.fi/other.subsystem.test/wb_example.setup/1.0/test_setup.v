//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 28.11.2017
// Creation time : 16:51:22
// Description   : Test arrangement for verifying the wishbone example design.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1176 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:other.subsystem.test:wb_example.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/other.subsystem.test/wb_example.setup/1.0/wb_example.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // clock_generator_0_wb_system_to_wb_example_0_wb_system wires:
    wire        clock_generator_0_wb_system_to_wb_example_0_wb_systemclk;
    wire        clock_generator_0_wb_system_to_wb_example_0_wb_systemrst;

    // Ad-hoc wires:
    wire        wb_example_0_start_to_wb_example_bench_0_start;
    wire        wb_example_0_done_to_wb_example_bench_0_done;
    wire        wb_example_bench_0_clk_i_to_clock_generator_0_clk_o;
    wire        wb_example_bench_0_rst_i_to_clock_generator_0_rst_o;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // wb_example.bench_0 port wires:
    wire        wb_example_bench_0_clk_i;
    wire        wb_example_bench_0_done;
    wire        wb_example_bench_0_rst_i;
    wire        wb_example_bench_0_start;
    // wb_example_0 port wires:
    wire        wb_example_0_clk_i;
    wire        wb_example_0_done;
    wire        wb_example_0_rst_i;
    wire        wb_example_0_start;

    // clock_generator_0 assignments:
    assign clock_generator_0_wb_system_to_wb_example_0_wb_systemclk = clock_generator_0_clk_o;
    assign wb_example_bench_0_clk_i_to_clock_generator_0_clk_o = clock_generator_0_clk_o;
    assign clock_generator_0_wb_system_to_wb_example_0_wb_systemrst = clock_generator_0_rst_o;
    assign wb_example_bench_0_rst_i_to_clock_generator_0_rst_o = clock_generator_0_rst_o;
    // wb_example.bench_0 assignments:
    assign wb_example_bench_0_clk_i = wb_example_bench_0_clk_i_to_clock_generator_0_clk_o;
    assign wb_example_bench_0_done = wb_example_0_done_to_wb_example_bench_0_done;
    assign wb_example_bench_0_rst_i = wb_example_bench_0_rst_i_to_clock_generator_0_rst_o;
    assign wb_example_0_start_to_wb_example_bench_0_start = wb_example_bench_0_start;
    // wb_example_0 assignments:
    assign wb_example_0_clk_i = clock_generator_0_wb_system_to_wb_example_0_wb_systemclk;
    assign wb_example_0_done_to_wb_example_bench_0_done = wb_example_0_done;
    assign wb_example_0_rst_i = clock_generator_0_wb_system_to_wb_example_0_wb_systemrst;
    assign wb_example_0_start = wb_example_0_start_to_wb_example_bench_0_start;

    // IP-XACT VLNV: tut.fi:other.test:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:other.subsystem.test:wb_example.bench:1.0
    TestInitializer #(
        .WAIT_TIME           (1200))
    wb_example_bench_0(
        // These ports are not in any interface
        .clk_i               (wb_example_bench_0_clk_i),
        .done                (wb_example_bench_0_done),
        .rst_i               (wb_example_bench_0_rst_i),
        .start               (wb_example_bench_0_start));

    // IP-XACT VLNV: tut.fi:other.subsystem:wb_example:1.0
    wb_example_0 wb_example_0(
        // Interface: wb_system
        .clk_i               (wb_example_0_clk_i),
        .rst_i               (wb_example_0_rst_i),
        // These ports are not in any interface
        .start               (wb_example_0_start),
        .done                (wb_example_0_done));


endmodule
