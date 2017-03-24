//-----------------------------------------------------------------------------
// File          : TestClockSource.v
// Creation date : 24.03.2017
// Creation time : 09:12:04
// Description   : A bare bones verilog test bench, which is used to assert reset, generate clock, give start signal and finally check after WAIT_TIME, if the done is asserted.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.0 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:test_bench:TestClockSource:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/test_bench/TestClockSource/1.0/TestClockSource.1.0.xml
//-----------------------------------------------------------------------------

module TestClockSource #(
    parameter                              WAIT_TIME        = 1000    // How long to wait after reset is deassereted.
) (
    // Interface: wb_system
    // The mandatory clock, as this is synchronous logic.
    output reg                          clk,    // The mandatory clock, as this is synchronous logic.
    output reg                          rst    // The mandatory reset, as this is synchronous logic.
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
        //start = 0;
        @(posedge rst); // wait for reset
        //start = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        //start =0;  // generate the falling edge
        #WAIT_TIME
        /*if ( done == 1'b0 )
            $display("not done!");
        else
            $display("done high");
        
        if ( meta_ok == 1'b0 )
            $display("meta not ok!");
        else
            $display("meta ok high");*/
        $stop;
    end
endmodule
