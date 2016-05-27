//-----------------------------------------------------------------------------
// File          : SampleTB.v
// Creation date : 27.05.2016
// Creation time : 11:18:19
// Description   : 
// Created by    : virtan39
// This file was generated with Kactus2 verilog generator
// based on IP-XACT component tut.fi:chip:SampleTB:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/chip/SampleTB/1.0/SampleTB.1.0.xml
//-----------------------------------------------------------------------------

module SampleTB();

    wire        SampleHW_0_rst_to_TestIntitializer_0_rst;
    wire        TestIntitializer_0_clk_to_SampleHW_0_clk;
    wire        SampleHW_0_done_to_TestIntitializer_0_done;
    wire        TestIntitializer_0_start_to_SampleHW_0_start;

    // IP-XACT VLNV: tut.fi:soc:SampleHW:1.0
    SampleHW SampleHW_0(
        // These ports are not in any interface
        .clk                 (TestIntitializer_0_clk_to_SampleHW_0_clk),
        .rst                 (SampleHW_0_rst_to_TestIntitializer_0_rst),
        .start               (TestIntitializer_0_start_to_SampleHW_0_start),
        .done                (SampleHW_0_done_to_TestIntitializer_0_done));

    // IP-XACT VLNV: tut.fi:ip.hw:TestIntitializer:1.0
    TestIntitializer TestIntitializer_0(
        // These ports are not in any interface
        .done                (SampleHW_0_done_to_TestIntitializer_0_done),
        .clk                 (TestIntitializer_0_clk_to_SampleHW_0_clk),
        .rst                 (SampleHW_0_rst_to_TestIntitializer_0_rst),
        .start               (TestIntitializer_0_start_to_SampleHW_0_start));


endmodule
