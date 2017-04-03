//-----------------------------------------------------------------------------
// File          : TestClockSource.v
// Creation date : 03.04.2017
// Creation time : 15:32:46
// Description   : A clock source for simulations. Will also assert and deassert reset and terminate the simulation after WAIT_TIME has passed since the deassertion.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.24 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:TestClockSource:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/TestClockSource/1.0/TestClockSource.1.0.xml
//-----------------------------------------------------------------------------

module TestClockSource #(
    parameter                              WAIT_TIME        = 1500    // How long to wait after reset is deassereted.
) (
    // Interface: wb_system
    // The mandatory clock, as this is synchronous logic.
    output reg                          clk_o,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst_o    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
      clk_o = 1'b0;
      rst_o = 1'b1; // assert reset
      repeat(4) #5 clk_o = ~clk_o;
      rst_o = 1'b0; // deassert reset
      forever #5 clk_o = ~clk_o; // generate a clock
   end

    initial begin
        @(negedge rst_o); // wait for reset
        #WAIT_TIME
        $stop;
    end
endmodule
