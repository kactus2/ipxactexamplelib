//-----------------------------------------------------------------------------
// File          : clock_generator.v
// Creation date : 26.04.2017
// Creation time : 16:30:51
// Description   : A clock source for simulations. Will also assert and deassert reset and terminate the simulation after WAIT_TIME has passed since the deassertion.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.74 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:clock_generator:1.1
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/clock_generator/1.1/clock_generator.1.1.xml
//-----------------------------------------------------------------------------

module clock_generator(
    // Interface: wb_system
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
endmodule
