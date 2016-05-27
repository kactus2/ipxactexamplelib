module wb_slave #(parameter DATA_WIDTH = 32, parameter ADDR_WIDTH = 32)(
    input                                       clk,
    input                                       rst,
    
    input                                       cyc_i,
    input                                       stb_i,
    output reg                              ack_o,
    input                                       we_i,
    output reg [DATA_WIDTH-1:0] dat_o,
    input [DATA_WIDTH-1:0]         dat_i,
    input [ADDR_WIDTH-1:0]         adr_i
    );
  
   localparam DATA_COUNT = 16;

    reg [DATA_WIDTH-1:0] dat [0:DATA_COUNT-1];
    reg [0:0] state;

    parameter [0:0]
        S_WAIT            = 1'd0,
        S_DEASSERT    = 1'd1;

    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            ack_o <= 0;
            dat_o <= 0;
            state <= S_WAIT;
        end
        else begin
            if (state == S_WAIT) begin
                if ( cyc_i == 1 && stb_i == 1 ) begin
                    ack_o <= 1;
                      
                    if ( we_i == 1 ) begin
                        dat[adr_i] <= dat_i;
                    end
                    else
                        dat_o <= dat[adr_i];
                  
                    state <= S_DEASSERT;
                end
            end
            else if(state == S_DEASSERT) begin
                ack_o <= 0;
                state <= S_WAIT;
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
endmodule
