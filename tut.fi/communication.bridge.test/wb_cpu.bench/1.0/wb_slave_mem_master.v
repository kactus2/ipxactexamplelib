//-----------------------------------------------------------------------------
// File          : wb_slave_mem_master.v
// Creation date : 16.05.2017
// Creation time : 13:49:38
// Description   : Used to test wishbone cpu wrapper from both master and slave side.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.106 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component tut.fi:communication.bridge.test:wb_cpu.bench:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication.bridge.test/wb_cpu.bench/1.0/wb_cpu.bench.1.0.xml
//-----------------------------------------------------------------------------

module wb_slave_mem_master #(
    parameter                              ADDR_WIDTH       = 16,    // The width of the address.
    parameter                              DATA_WIDTH       = 32,    // The width of the both transferred and inputted data.
    parameter                              DATA_COUNT       = 8,    // How many values there are in the register array.
    parameter                              BASE_ADDRESS     = 'h0F00    // The first referred address of the master.
) (
    // Interface: memory_interface
    input          [DATA_WIDTH-1:0]     mem_data_i,
    input                               mem_slave_rdy,
    output reg     [ADDR_WIDTH-1:0]     mem_address_o,
    output reg     [DATA_WIDTH-1:0]     mem_data_o,
    output reg                          mem_master_rdy,
    output reg                          mem_we_o,

    // Interface: wb_slave
    input          [ADDR_WIDTH-1:0]     adr_i,    // The address of the data.
    input                               cyc_i,    // Asserted by master for transfer.
    input          [DATA_WIDTH-1:0]     dat_i,    // Data from master to slave.
    input                               stb_i,    // Asserted, when this specific slave is selected.
    input                               we_i,    // Write = 1, Read = 0.
    output reg                          ack_o,    // Slave asserts acknowledge.
    output reg     [DATA_WIDTH-1:0]     dat_o,    // Data from slave to master.
    output reg                          err_o,    // Indicates abnormal cycle termination.

    // Interface: wb_system
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    localparam AUB = 8;
    localparam AU_IN_DATA = DATA_WIDTH/AUB;
    
    // The master state.
    reg [1:0] master_state;
    
    // The available states.
    parameter [1:0]
        S_MASTER_INIT_WRITE     = 2'd0, 
        S_MASTER_WAIT_WRITE     = 2'd1,
        S_MASTER_INIT_READ      = 2'd2, 
        S_MASTER_WAIT_READ      = 2'd3;
    
    reg [DATA_WIDTH-1:0] test_values [DATA_COUNT-1:0];

    // Used to index data to data io.
    reg [DATA_COUNT:0] value_iterator;
    
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            // Initialize test_values with data.
            test_values[0] = 32'h00000000;
            test_values[1] = 32'h10001111;
            test_values[2] = 32'h20002222;
            test_values[3] = 32'h30003333;
            test_values[4] = 32'h40004444;
            test_values[5] = 32'h50005555;
            test_values[6] = 32'h60006666;
            test_values[7] = 32'h70007777;
            
            // Start with testing write.
            master_state <= S_MASTER_INIT_WRITE;
            
            // Outputs are zero by default.
            mem_address_o <= 0;
            mem_data_o <= 0;
            mem_master_rdy <= 0;
            mem_we_o <= 0;
            value_iterator <= 0;
        end
        else begin
            if (master_state == S_MASTER_INIT_WRITE) begin
                mem_master_rdy <= 1;
                mem_we_o <= 1;
                mem_data_o <= test_values[value_iterator];
                master_state <= S_MASTER_WAIT_WRITE;
                mem_address_o <= ( value_iterator * AU_IN_DATA ) + BASE_ADDRESS;
            end
            else if (master_state == S_MASTER_WAIT_WRITE) begin
                mem_master_rdy <= 0;
                if ( mem_slave_rdy == 1 ) begin
                    master_state <= S_MASTER_INIT_READ;
                end
            end
            else if (master_state == S_MASTER_INIT_READ) begin
                mem_master_rdy <= 1;
                mem_we_o <= 0;
                master_state <= S_MASTER_WAIT_READ;
                mem_address_o <= ( value_iterator * AU_IN_DATA ) + BASE_ADDRESS;
            end
            else if (master_state == S_MASTER_WAIT_READ) begin
                mem_master_rdy <= 0;
                if ( mem_slave_rdy == 1 ) begin
                    master_state <= S_MASTER_INIT_WRITE;
                    
                    // It was read from the same address as was written, so it should be the same data.
                    if (test_values[value_iterator] != mem_data_i) begin
                        $display("ERROR: Wrong answer from wrapper: %X Expected: %X", mem_data_i, test_values[value_iterator]);
                        $stop;
                    end
                    
                    if (value_iterator >= DATA_COUNT) begin
                        $display("SIMULATION COMPLETE");
                        $stop;
                    end
                    
                    value_iterator <= value_iterator + 1;
                end
            end
            else
                $display("ERROR: Unkown master_state: %d", master_state);
        end
    end
    
    // Used to index AUBs to data io.
    integer memory_index;

    // The slave state.
    reg [0:0] slave_state;
    
    // The available states.
    parameter [0:0]
        S_WAIT      = 1'd0, // Waiting for cyc_i & stb_i
        S_DEASSERT  = 1'd1; // Deassert acknowledgement.
    
    localparam MEMORY_SIZE = DATA_COUNT*4;
    reg [AUB-1:0] memory [MEMORY_SIZE-1:0];
        
    always @(posedge clk_i or posedge rst_i) begin
        if(rst_i == 1'b1) begin
            ack_o <= 0; // Obviously, there is nothing to acknowledge by default.
            dat_o <= 0; // No output by default.
            err_o <= 0; // No error by default.
            slave_state <= S_WAIT; // Wait signals from the masters at reset.
        end
        else begin
            if (slave_state == S_WAIT) begin
                // Wait signal from the master.
                if (cyc_i == 1 && stb_i == 1) begin
                    // Master ok, check the address.
                    if (adr_i < BASE_ADDRESS + MEMORY_SIZE && adr_i >= BASE_ADDRESS) begin
                        // The specified address in accessible -> proceed.
                        ack_o <= 1;

                        if ( we_i == 1 ) begin
                            // Writing: Pick every byte from the input and place them to correct addresses.
                            for (memory_index = 0; memory_index < AU_IN_DATA; memory_index = memory_index + 1) begin
                                memory[adr_i - BASE_ADDRESS + memory_index] <= dat_i[(memory_index*AUB)+:AUB];
                            end
                        end
                        else begin
                            // Reading: Pick every byte from correct addresses and place them to the output.
                            for (memory_index = 0; memory_index < AU_IN_DATA; memory_index = memory_index + 1) begin
                                dat_o[(memory_index*AUB)+:AUB] <= memory[adr_i - BASE_ADDRESS + memory_index];
                            end
                        end
                    end
                    else begin
                        // The specified address out-of-scope -> error!
                        err_o <= 1;
                    end
                
                    // Next thing is to deassert.
                    slave_state <= S_DEASSERT;
                end
            end
            else if (slave_state == S_DEASSERT) begin
                // Deassert acknowlegement, get ready to receive next one.
                ack_o <= 0;
                err_o <= 0;
                slave_state <= S_WAIT;
            end
            else
                $display("ERROR: Unkown slave_state: %d", slave_state);
        end
    end
endmodule
