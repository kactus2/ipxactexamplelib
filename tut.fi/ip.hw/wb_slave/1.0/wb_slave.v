//-----------------------------------------------------------------------------
// File          : wb_slave.v
// Creation date : 25.08.2016
// Creation time : 14:38:10
// Description   : A verilog slave that provides a read/write access to a verilog register array. Address space is assumed to be contiguous.
// Created by    : TermosPullo
// Tool : Kactus2 3.1.29 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component tut.fi:ip.hw:wb_slave:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/ip.hw/wb_slave/1.0/wb_slave.1.0.xml
//-----------------------------------------------------------------------------

module wb_slave #(
    parameter                              InputForConfig0  = 'b0100,
    parameter                              InputForConfig1  = 'b1000,
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              BASE_ADDRESS     = 0,    // The first referable address. Is substracted from input address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              DATA_COUNT       = 4    // How many values there are in the register array.
) (
    // Interface: slave_interface
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from slave to master.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output reg                          ack_o,    // Slave asserts acknowledge.
    output reg     [DATA_WIDTH-1:0]     dat_o,    // Data from master to slave.

    // These ports are not in any interface
    input                               clk,    // The mandatory clock, as this is synchronous logic.
    input          [3:0]                configuration,    // Input for remap state selection
    input                               rst,    // The mandatory reset, as this is synchronous logic.
    output reg     [DATA_WIDTH/2-1:0]   meta_o    // The latest meta data.
);

    `define configuration0 (configuration == InputForConfig0)
    `define configuration1 (configuration == InputForConfig1)

    localparam MEMORY_SIZE = DATA_COUNT*4;
    localparam AUB = 8;
    reg [0:AUB-1] dat [0:MEMORY_SIZE-1];
    genvar gen_iterator1;
    genvar gen_iterator2;

    localparam slaveMap_default_registers_BASE = 'h0;
        localparam slaveMap_default_registers_reg1_DIM = DATA_COUNT;
        localparam slaveMap_default_registers_reg1_OFFSET = 'h0;
        localparam slaveMap_default_registers_reg1_WIDTH = DATA_WIDTH;
        localparam slaveMap_default_registers_reg1_AU_WIDTH = $ceil($ceil(DATA_WIDTH)/AUB);
        wire [0:slaveMap_default_registers_reg1_WIDTH-1] slaveMap_default_registers_reg1 [0:slaveMap_default_registers_reg1_DIM-1];

        generate
        for (gen_iterator1= 0; gen_iterator1 < slaveMap_default_registers_reg1_DIM; gen_iterator1 = gen_iterator1 + 1)
        begin
            for (gen_iterator2 = 0; gen_iterator2 < slaveMap_default_registers_reg1_AU_WIDTH; gen_iterator2 = gen_iterator2 + 1)
            begin
                assign slaveMap_default_registers_reg1[gen_iterator1][(gen_iterator2*AUB)+:AUB] = dat[gen_iterator1*slaveMap_default_registers_reg1_AU_WIDTH+gen_iterator2];
            end
        end
        endgenerate

        localparam slaveMap_default_registers_reg1_data_WIDTH = DATA_WIDTH;
        localparam slaveMap_default_registers_reg1_data_OFFSET = 0;


    localparam mode0_registers_BASE = 'h0;
        localparam mode0_registers_reg1_DIM = DATA_COUNT;
        localparam mode0_registers_reg1_OFFSET = 'h0;
        localparam mode0_registers_reg1_WIDTH = DATA_WIDTH;
        localparam mode0_registers_reg1_AU_WIDTH = $ceil($ceil(DATA_WIDTH)/AUB);
        wire [0:mode0_registers_reg1_WIDTH-1] mode0_registers_reg1 [0:mode0_registers_reg1_DIM-1];

        generate
        for (gen_iterator1= 0; gen_iterator1 < mode0_registers_reg1_DIM; gen_iterator1 = gen_iterator1 + 1)
        begin
            for (gen_iterator2 = 0; gen_iterator2 < mode0_registers_reg1_AU_WIDTH; gen_iterator2 = gen_iterator2 + 1)
            begin
                assign mode0_registers_reg1[gen_iterator1][(gen_iterator2*AUB)+:AUB] = dat[gen_iterator1*mode0_registers_reg1_AU_WIDTH+gen_iterator2];
            end
        end
        endgenerate

        localparam mode0_registers_reg1_payLoad_WIDTH = DATA_WIDTH/2;
        localparam mode0_registers_reg1_payLoad_OFFSET = 0;

        localparam mode0_registers_reg1_metaData_WIDTH = DATA_WIDTH/2;
        localparam mode0_registers_reg1_metaData_OFFSET = DATA_WIDTH/2;


    localparam mode1_payLoad_BASE = 'h0;
        localparam mode1_payLoad_RpayLoad_DIM = DATA_COUNT;
        localparam mode1_payLoad_RpayLoad_OFFSET = 'h0;
        localparam mode1_payLoad_RpayLoad_WIDTH = DATA_WIDTH/2;
        localparam mode1_payLoad_RpayLoad_AU_WIDTH = $ceil($ceil(DATA_WIDTH/2)/AUB);
        wire [0:mode1_payLoad_RpayLoad_WIDTH-1] mode1_payLoad_RpayLoad [0:mode1_payLoad_RpayLoad_DIM-1];

        generate
        for (gen_iterator1= 0; gen_iterator1 < mode1_payLoad_RpayLoad_DIM; gen_iterator1 = gen_iterator1 + 1)
        begin
            for (gen_iterator2 = 0; gen_iterator2 < mode1_payLoad_RpayLoad_AU_WIDTH; gen_iterator2 = gen_iterator2 + 1)
            begin
                assign mode1_payLoad_RpayLoad[gen_iterator1][(gen_iterator2*AUB)+:AUB] = dat[gen_iterator1*mode1_payLoad_RpayLoad_AU_WIDTH+gen_iterator2];
            end
        end
        endgenerate

        localparam mode1_payLoad_RpayLoad_data_WIDTH = DATA_WIDTH/2;
        localparam mode1_payLoad_RpayLoad_data_OFFSET = 0;


    localparam mode1_metaData_BASE = DATA_COUNT*2;
        localparam mode1_metaData_RmetaData_DIM = DATA_COUNT;
        localparam mode1_metaData_RmetaData_OFFSET = 'h0;
        localparam mode1_metaData_RmetaData_WIDTH = DATA_WIDTH/2;
        localparam mode1_metaData_RmetaData_AU_WIDTH = $ceil($ceil(DATA_WIDTH/2)/AUB);
        wire [0:mode1_metaData_RmetaData_WIDTH-1] mode1_metaData_RmetaData [0:mode1_metaData_RmetaData_DIM-1];

        generate
        for (gen_iterator1= 0; gen_iterator1 < mode1_metaData_RmetaData_DIM; gen_iterator1 = gen_iterator1 + 1)
        begin
            for (gen_iterator2 = 0; gen_iterator2 < mode1_metaData_RmetaData_AU_WIDTH; gen_iterator2 = gen_iterator2 + 1)
            begin
                assign mode1_metaData_RmetaData[gen_iterator1][(gen_iterator2*AUB)+:AUB] = dat[gen_iterator1*mode1_metaData_RmetaData_AU_WIDTH+gen_iterator2];
            end
        end
        endgenerate

        localparam mode1_metaData_RmetaData_data_WIDTH = DATA_WIDTH/2;
        localparam mode1_metaData_RmetaData_data_OFFSET = 0;


// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    localparam AU_IN_DATA = DATA_WIDTH/AUB;
    
    // Used to index AUBs to data io.
    integer index;

    // The state.
    reg [0:0] state;
    
    // The available states.
    parameter [0:0]
        S_WAIT            = 1'd0, // Waiting for cyc_i & stb_i
        S_DEASSERT    = 1'd1; // Deassert acknowledgement.

    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            ack_o <= 0; // Obviously, there is nothing to acknowledge by default.
            dat_o <= 0; // No output by default.
            state <= S_WAIT; // Wait signals from the masters at reset.
        end
        else begin
            if (state == S_WAIT) begin
                // Wait signal from the master.
                if ( cyc_i == 1 && stb_i == 1 ) begin
                    // Master ok, acknowledge.
                    ack_o <= 1;

                    // Next thing is to deassert.
                    state <= S_DEASSERT;

                    if  ( `configuration1 ) begin
                        if ( we_i == 1 ) begin
                            for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                                dat[(adr_i - BASE_ADDRESS)/2 + index + mode1_payLoad_BASE] <= dat_i[(index*AUB)+:AUB];
                            end
                            
                            for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                                dat[(adr_i - BASE_ADDRESS)/2 + index + mode1_metaData_BASE] <= dat_i[((index+AU_IN_DATA/2)*AUB)+:AUB];
                            end
                        end
                        else begin
                            for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                                dat_o[(index*AUB)+:AUB] <= dat[(adr_i - BASE_ADDRESS)/2 + index + mode1_payLoad_BASE];
                            end
                            
                            for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                                dat_o[((index + AU_IN_DATA/2)*AUB)+:AUB] <= dat[(adr_i - BASE_ADDRESS)/2 + index + mode1_metaData_BASE];
                            end
                        end
                    end
                    else begin
                        if ( we_i == 1 ) begin
                            // Set the bytes to memory locations corresponding the inputs and parameters.
                            for (index = 0; index < AU_IN_DATA; index = index +1) begin
                                // Writing means we set data to the specified address, offsetted by the base address and the AUB-index.
                                dat[adr_i - BASE_ADDRESS + index] <= dat_i[(index*AUB)+:AUB];
                            end
                        end
                        else begin
                            // Get the bytes from memory locations corresponding the inputs and parameters.
                            for (index = 0; index < AU_IN_DATA; index = index +1) begin
                                // Reading means we output data from the specified address, offsetted by the base address and the AUB-index.
                                dat_o[(index*AUB)+:AUB] <= dat[adr_i - BASE_ADDRESS + index];
                            end
                        end
                    end
                end
            end
            else if (state == S_DEASSERT) begin
                // Deassert acknowlegement, get ready to receive next one.
                ack_o <= 0;
                state <= S_WAIT;
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            meta_o <= 0;
        end
        else begin
            if  ( `configuration0 ) begin
                for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                    meta_o[(index*AUB)+:AUB] <= dat[adr_i - BASE_ADDRESS + index + AU_IN_DATA/2];
                end
            end
            else if  ( `configuration1 ) begin
                for (index = 0; index < AU_IN_DATA/2; index = index +1) begin
                    meta_o[(index*AUB)+:AUB] <= dat[(adr_i - BASE_ADDRESS)/2 + index + mode1_metaData_BASE];
                end
            end
            else begin
                for ( index = 0; index < AU_IN_DATA/2; index = index +1 ) begin
                    meta_o[(index*AUB)+:AUB] <= dat[adr_i - BASE_ADDRESS + index + AU_IN_DATA/2];
                end
            end
        end
    end
endmodule
