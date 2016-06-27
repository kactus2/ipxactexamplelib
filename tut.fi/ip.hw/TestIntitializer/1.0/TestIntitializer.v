//-----------------------------------------------------------------------------
// File          : TestIntitializer.v
// Creation date : 27.06.2016
// Creation time : 13:39:08
// Description   : A bare bones verilog test bench, which is used to assert reset, generate clock, give start signal and finally check after WAIT_TIME, if the done is asserted.
// Created by    : TermosPullo
// This file was generated with Kactus2 verilog generator version 1.2
// Kactus2 version : 3.1.7 32-bit
// based on IP-XACT component tut.fi:ip.hw:TestIntitializer:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/TestIntitializer/1.0/TestIntitializer.1.0.xml
//-----------------------------------------------------------------------------

module TestIntitializer #(
    parameter                              WAIT_TIME        = 100    // How long to wait after reset is deassereted.
) (
    // These ports are not in any interface
    input                               done,    // Output used to signal that the masters are done sending.
    output reg                          clk,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst,    // The mandatory reset, as this is synchronous logic.
    output reg                          start    // Input used to signal that is is ok to start the masters.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
initial begin
      clk = 1'b0;
      rst = 1'b0; // assert reset
      repeat(4) #10 clk = ~clk;
      rst = 1'b1; // deassert reset
      forever #10 clk = ~clk; // generate a clock
   end

   initial begin
      start = 0;
      @(posedge rst); // wait for reset
      start = 1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      start =0;  // generate the falling edge
      #WAIT_TIME
      if ( done == 1'b0 )
        $display("not done!");
      else
        $display("done high");
      $stop;
   end
endmodule
