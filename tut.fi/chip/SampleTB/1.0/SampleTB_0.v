//-----------------------------------------------------------------------------
// File          : D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/SampleTB_0.v
// Creation date : 05.10.2016
// Creation time : 10:08:54
// Description   : Contains TestInitializer connected to SampleHW.
// Created by    : TermosPullo
// Tool : Kactus2 3.2.1 32-bit
// Plugin : Verilog generator 1.5
// This file was generated based on IP-XACT component tut.fi:chip:SampleTB:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/SampleTB.1.0.xml
//-----------------------------------------------------------------------------

module SampleTB_0();

    wire        SampleHW_0_rst_to_TestIntitializer_0_rst;
    wire        TestIntitializer_0_clk_to_SampleHW_0_clk;
    wire        SampleHW_0_done_to_TestIntitializer_0_done;
    wire        TestIntitializer_0_start_to_SampleHW_0_start;
    wire        SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok;

    // IP-XACT VLNV: tut.fi:soc:SampleHW:1.0
    SampleHW #(
)
SampleHW_0(
        // These ports are not in any interface
        .clk                 (TestIntitializer_0_clk_to_SampleHW_0_clk),
        .rst                 (SampleHW_0_rst_to_TestIntitializer_0_rst),
        .start               (TestIntitializer_0_start_to_SampleHW_0_start),
        .done                (SampleHW_0_done_to_TestIntitializer_0_done),
        .meta_ok             (SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok));

    // IP-XACT VLNV: tut.fi:ip.hw:TestIntitializer:1.0
    TestIntitializer #(
        .WAIT_TIME           (2100))
    TestIntitializer_0(
        // These ports are not in any interface
        .done                (SampleHW_0_done_to_TestIntitializer_0_done),
        .meta_ok             (SampleHW_0_meta_ok_to_TestIntitializer_0_meta_ok),
        .clk                 (TestIntitializer_0_clk_to_SampleHW_0_clk),
        .rst                 (SampleHW_0_rst_to_TestIntitializer_0_rst),
        .start               (TestIntitializer_0_start_to_SampleHW_0_start));


endmodule
