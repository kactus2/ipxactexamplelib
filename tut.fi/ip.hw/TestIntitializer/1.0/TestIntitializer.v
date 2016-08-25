//-----------------------------------------------------------------------------
// File          : TestIntitializer.v
// Creation date : 22.08.2016
// Creation time : 12:58:19
// Description   : A bare bones verilog test bench, which is used to assert reset, generate clock, give start signal and finally check after WAIT_TIME, if the done is asserted.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.17 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:ip.hw:TestIntitializer:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/TestIntitializer/1.0/TestIntitializer.1.0.xml
//-----------------------------------------------------------------------------

module TestIntitializer #(
    parameter                              WAIT_TIME        = 100,    // How long to wait after reset is deassereted.
    parameter                              V_WAIT_TIME      = WAIT_TIME    // How long to wait after reset is deassereted.
) (
    // These ports are not in any interface
    input                               done,    // Output used to signal that the masters are done sending.
    input                               meta_ok,    // The latest meta data.
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
      #V_WAIT_TIME
      if ( done == 1'b0 )
        $display("not done!");
      else
        $display("done high");
        
      if ( meta_ok == 1'b0 )
        $display("meta not ok!");
      else
        $display("meta ok high");
      $stop;
   end
endmodule
