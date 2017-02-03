//-----------------------------------------------------------------------------
// File          : metaAnalyzer.v
// Creation date : 03.02.2017
// Creation time : 11:49:12
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.3.168 32-bit
// Plugin : Verilog generator 2.0
// This file was generated based on IP-XACT component tut.fi:ip.hw:metaAnalyzer:0.9
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/metaAnalyzer/0.9/metaAnalyzer.0.9.xml
//-----------------------------------------------------------------------------

module metaAnalyzer #(
    parameter                              DATA_WIDTH       = 8
) (
    // These ports are not in any interface
    input                               clk,
    input          [DATA_WIDTH-1:0]     meta_in0,
    input          [DATA_WIDTH-1:0]     meta_in1,
    input          [DATA_WIDTH-1:0]     meta_in2,
    input                               rst,
    output reg                          meta_ok
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    reg [3:0] refs0;
    reg [3:0] refs1;
    reg [3:0] refs2;
    
    reg meta_ok0;
    reg meta_ok1;
    reg meta_ok2;

    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            refs0 <= 0;
            refs1 <= 0;
            refs2 <= 0;
            meta_ok <= 0;
        end
        else begin
            if (refs0[3:0] < meta_in0[DATA_WIDTH-1:DATA_WIDTH-4])
                refs0[3:0] <= meta_in0[DATA_WIDTH-1:DATA_WIDTH-4];
            if (refs1[3:0] < meta_in1[DATA_WIDTH-1:DATA_WIDTH-4])
                refs1[3:0] = meta_in1[DATA_WIDTH-1:DATA_WIDTH-4];
            if (refs2[3:0] < meta_in2[DATA_WIDTH-1:DATA_WIDTH-4])
                refs2[3:0] = meta_in2[DATA_WIDTH-1:DATA_WIDTH-4];
                
            if (refs0 == 'hf || refs0 == 'h7)
                meta_ok0 <= 1;
            if (refs1 == 'hf || refs1 == 'h7)
                meta_ok1 <= 1;
            if (refs2 == 'hf || refs2 == 'h7)
                meta_ok2 <= 1;
                
            if (meta_ok0 && meta_ok1 && meta_ok2)
                meta_ok <= 1;
        end
    end
       

endmodule
