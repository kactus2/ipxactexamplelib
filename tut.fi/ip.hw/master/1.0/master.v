module wb_master #(parameter DATA_WIDTH = 32, parameter ADDR_WIDTH = 32)(
    input                               clk,
    input                               rst,
    
    output reg                      cyc_o,
    output reg                      stb_o,
    input                               ack_i,
    output reg                      we_o,
    output reg [DATA_WIDTH-1:0]  dat_o,
    input [DATA_WIDTH-1:0]           dat_i,
    output reg [ADDR_WIDTH-1:0]  adr_o,
   
    input                               start,
    output reg                      done
    );
  
   localparam DATA_COUNT = 16;
  
    reg [DATA_WIDTH-1:0] dat [0:DATA_COUNT-1];
    reg [3:0] iterator;
  
    reg [2:0] state;
 
    parameter [2:0]
        S_WAIT_START            = 3'd0,
        S_WRITE                     = 3'd1,
        S_WAIT_WRITE_ACK    = 3'd2,
        S_READ                      = 3'd3,
        S_WAIT_READ_ACK     = 3'd4;
   
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            dat_o <= 0;
            cyc_o <= 0;
            stb_o <= 0;
            we_o <= 0;
            state <= S_WAIT_START;
            done <= 0;
            iterator <= 0;
            adr_o <= iterator % 2;
            
            dat[0] = 32'h00000000;
            dat[1] = 32'h11111111;
            dat[2] = 32'h22222222;
            dat[3] = 32'h33333333;
            dat[4] = 32'h44444444;
            dat[5] = 32'h55555555;
            dat[6] = 32'h66666666;
            dat[7] = 32'h77777777;
            dat[8] = 32'h88888888;
            dat[9] = 32'h99999999;
            dat[10] = 32'hAAAAAAAA;
            dat[11] = 32'hBBBBBBBB;
            dat[12] = 32'hCCCCCCCC;
            dat[13] = 32'hDDDDDDDD;
            dat[14] = 32'hEEEEEEEE;
            dat[15] = 32'hFFFFFFFF;
        end
        else begin
            if (state == S_WAIT_START) begin
                if (start) begin
                    state <= S_WRITE;
                    done <= 0;
                end
            end
            else if (state == S_WRITE) begin
                cyc_o <= 1;
                stb_o <= 1;
                state <=  S_WAIT_WRITE_ACK;
                we_o <= 1;
                dat_o <= dat[iterator];
            end
            else if(state ==  S_WAIT_WRITE_ACK) begin
                if (ack_i  == 1'b1) begin
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    state <=  S_READ;
                end
            end
            else if(state ==  S_READ) begin
                cyc_o <= 1;
                stb_o <= 1;
                we_o <= 0;
                state <=  S_WAIT_READ_ACK;
            end
            else if(state ==  S_WAIT_READ_ACK) begin
                if (ack_i  == 1'b1) begin
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    
                    if (dat[iterator] != dat_i) begin
                        $display("ERROR: Wrong answer from slave: %d", dat_i);
                        $stop;
                    end
                    
                    if (iterator == DATA_COUNT-1) begin
                        done <= 1;
                        adr_o <= 0;
                        iterator <= 0;
                        state <= S_WAIT_START;
                    end
                    else begin
                        adr_o <= iterator + 1;
                        iterator <= iterator + 1;
                        state <= S_WRITE;
                    end
                end
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
   
endmodule

module master #(parameter DATA_WIDTH = 32, parameter ADDR_WIDTH = 32)(
    input                               clk,
    input                                 rst,
    input                               start,
    output                             done,

    // Interface: one_to_one_master
    input                               ack_i_0,
    input          [31:0]               dat_i_0,
    output         [31:0]               adr_o_0,
    output                              cyc_o_0,
    output         [31:0]               dat_o_0,
    output                              stb_o_0,
    output                              we_o_0,
    
    // Interface: one_to_many_master
    input                               ack_i_1,
    input          [31:0]               dat_i_1,
    output         [31:0]               adr_o_1,
    output                              cyc_o_1,
    output         [31:0]               dat_o_1,
    output                              stb_o_1,
    output                              we_o_1
    );
    
    wire done_0;
    wire done_1;
    assign done = done_0 & done_1;

   wb_master #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) master_0 (
      .clk(clk),
      .rst(rst),
      .cyc_o(cyc_o_0),
      .stb_o(stb_o_0),
      .ack_i(ack_i_0),
      .we_o(we_o_0),
      .dat_o(dat_o_0),
      .dat_i(dat_i_0),
      .adr_o(adr_o_0),
      
      .start(start),
      .done(done_0)
   );

   wb_master #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) master_1 (
      .clk(clk),
      .rst(rst),
      .cyc_o(cyc_o_1),
      .stb_o(stb_o_1),
      .ack_i(ack_i_1),
      .we_o(we_o_1),
      .dat_o(dat_o_1),
      .dat_i(dat_i_1),
      .adr_o(adr_o_1),
      
      .start(start),
      .done(done_1)
   );

endmodule
