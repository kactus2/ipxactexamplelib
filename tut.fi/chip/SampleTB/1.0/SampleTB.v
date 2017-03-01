//-----------------------------------------------------------------------------
// File          : SampleTB.v
// Creation date : 22.02.2017
// Creation time : 14:10:26
// Description   : Contains TestInitializer connected to SampleHW.
// Created by    : TermosPullo
// Tool : Kactus2 3.3.495 32-bit
// Plugin : Verilog generator 2.0
// This file was generated based on IP-XACT component tut.fi:chip:SampleTB:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/SampleTB.1.0.xml
//-----------------------------------------------------------------------------

module SampleTB();

    // Ad-hoc wires:
    wire        SampleHW_0_rst_to_TestIntitializer_0_rst;
    wire        TestIntitializer_0_clk_to_SampleHW_0_clk;
    wire        SampleHW_0_done_to_TestIntitializer_0_done;
    wire        TestIntitializer_0_start_to_SampleHW_0_start;
    wire        SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok;

    // SampleHW_0 port wires:
    wire        SampleHW_0_clk;
    wire        SampleHW_0_done;
    wire        SampleHW_0_meta_ok;
    wire        SampleHW_0_rst;
    wire        SampleHW_0_start;
    // TestIntitializer_0 port wires:
    wire        TestIntitializer_0_clk;
    wire        TestIntitializer_0_done;
    wire        TestIntitializer_0_meta_ok;
    wire        TestIntitializer_0_rst;
    wire        TestIntitializer_0_start;

    // SampleHW_0 assignments:
    assign SampleHW_0_clk = TestIntitializer_0_clk_to_SampleHW_0_clk;
    assign SampleHW_0_done_to_TestIntitializer_0_done = SampleHW_0_done;
    assign SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok = SampleHW_0_meta_ok;
    assign SampleHW_0_rst = SampleHW_0_rst_to_TestIntitializer_0_rst;
    assign SampleHW_0_start = TestIntitializer_0_start_to_SampleHW_0_start;
    // TestIntitializer_0 assignments:
    assign TestIntitializer_0_clk_to_SampleHW_0_clk = TestIntitializer_0_clk;
    assign TestIntitializer_0_done = SampleHW_0_done_to_TestIntitializer_0_done;
    assign TestIntitializer_0_meta_ok = SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok;
    assign SampleHW_0_rst_to_TestIntitializer_0_rst = TestIntitializer_0_rst;
    assign TestIntitializer_0_start_to_SampleHW_0_start = TestIntitializer_0_start;

    // IP-XACT VLNV: tut.fi:soc:SampleHW:1.0
    SampleHW_0     SampleHW_0(
        // These ports are not in any interface
        .clk                 (SampleHW_0_clk),
        .rst                 (SampleHW_0_rst),
        .start               (SampleHW_0_start),
        .done                (SampleHW_0_done),
        .meta_ok             (SampleHW_0_meta_ok));

    // IP-XACT VLNV: tut.fi:ip.hw:TestIntitializer:1.0
    TestIntitializer #(
        .WAIT_TIME           (2100))
    TestIntitializer_0(
        // These ports are not in any interface
        .done                (TestIntitializer_0_done),
        .meta_ok             (TestIntitializer_0_meta_ok),
        .clk                 (TestIntitializer_0_clk),
        .rst                 (TestIntitializer_0_rst),
        .start               (TestIntitializer_0_start));


endmodule
