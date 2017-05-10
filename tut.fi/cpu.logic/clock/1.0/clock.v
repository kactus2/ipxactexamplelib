//-----------------------------------------------------------------------------
// File          : clock.v
// Creation date : 03.04.2017
// Creation time : 11:15:26
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.18 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:clock:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/clock/1.0/clock.1.0.xml
//-----------------------------------------------------------------------------

module clock #(
    parameter                              SCALE            = 2    // Divides the input clock by this value.
) (
    // Interface: cpu_clk_source
    // The clock that is divided to other components.
    output                              clk_o,    // The clock that is divided to other components.
    output                              rst_o,    // The reset that is divided to other components.

    // These ports are not in any interface
    input                               clk_i,    // The reference clock for this component.
    input                               rst_i    // The reference reset for this component.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
assign clk_o = clk_i;
assign rst_o = rst_i;

endmodule
