//-----------------------------------------------------------------------------
// File          : TestInitializer.v
// Creation date : 10.05.2017
// Creation time : 16:20:32
// Description   : A bare bones verilog test bench, which is used to assert reset, generate clock, give start signal and finally check after WAIT_TIME, if the done is asserted.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.107 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:other.subsystem.test:wb_example.bench:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/other.subsystem.test/wb_example.bench/1.0/wb_example.bench.1.0.xml
//-----------------------------------------------------------------------------

module TestInitializer #(
    parameter                              WAIT_TIME        = 100,    // How long to wait after reset is deassereted.
    parameter                              V_WAIT_TIME      = WAIT_TIME    // How long to wait after reset is deassereted.
) (
    // These ports are not in any interface
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               done,    // Output used to signal that the masters are done sending.
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.
    output reg                          start    // Input used to signal that is is ok to start the masters.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    initial begin
        start = 0;
        @(posedge rst_i); // wait for reset
        start = 1;
        @(posedge clk_i);
        @(posedge clk_i);
        @(posedge clk_i);
        start =0;  // generate the falling edge
        #V_WAIT_TIME
        if ( done == 1'b0 )
            $display("not done!");
        else
            $display("done high");
        
        $stop;
    end
endmodule
