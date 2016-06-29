// A verilog master that has a register array of data it uses to write to a slave.
// Each data is written to different address, and then read to verify it worked.
// Address space is assumed to be contiguous.
module wb_master #(
	parameter BASE_ADDRESS = 0, // The first referable address. Is substracted from input address.
	parameter DATA_WIDTH = 16, // The width of the both transferred and inputted data.
	parameter ADDR_WIDTH = 16, // The width of the address.
	parameter DATA_COUNT = 16, // How many values there are in the register array.
    parameter AU_IN_DATA  = 1   
	)(
    input                               				clk, // The mandatory clock, as this is synchronous logic.
    input                               				rst, // The mandatory reset, as this is synchronous logic.
    input                              				start, // Input used to signal that is is ok to start the masters.
    output reg                         			done, // Output used to signal that the masters are done sending.
    
    output reg                      				cyc_o, // Asserted by master for transfer.
    output reg                      				stb_o, // Asserted by master for transfer.
    input                               				ack_i, // Slave asserts acknowledge.
    output reg                      				we_o, // Write = 1, Read = 0.
    output reg	[DATA_WIDTH-1:0]	dat_o, // Data from master to slave.
    input			[DATA_WIDTH-1:0]	dat_i, // Data from slave to master.
    output reg	[ADDR_WIDTH-1:0]	adr_o // The address of the data.
    );
  
    // We have as data to send as parameterized.
    reg [DATA_WIDTH-1:0] dat [0:DATA_COUNT-1];
	// Used to iterate dat.
    reg [3:0] iterator;
  
    // The state.
    reg [2:0] state;
	
	// Status of start during the last cycle.
	reg start_old;
 
    parameter [2:0]
        S_WAIT_START            = 3'd0, // Waiting for start-signal
        S_WRITE_INIT           	= 3'd1, // Initiating a write to slave.
        S_WAIT_WRITE_ACK    = 3'd2, // Waiting ack for wrtite from slave.
        S_READ_INIT                = 3'd3, // Initiating a read to slave.
        S_WAIT_READ_ACK     = 3'd4; // Waiting ack for wrtite from slave.
   
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
			// Initialize dat with data.
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
			
			// Initally waiting for start signal.
            state <= S_WAIT_START;
			// Everything else is zero.
            dat_o <= 0;
            cyc_o <= 0;
            stb_o <= 0;
            we_o <= 0;
            done <= 0;
            iterator <= 0;
            adr_o <=  0;
			start_old <= 0;
        end
        else begin
			// Refresh the registers.
			start_old <= start;
		
            if (state == S_WAIT_START) begin
				// Wait for the falling edge of the start.
                if (start == 1'b0 && start_old == 1'b1) begin
					// Once it has started, initiate a write.
                    state <= S_WRITE_INIT;
					// Nothing is done yet.
                    done <= 0;
					// Reset iterator, so that we may go through the array.
					iterator <= 0;
                end
            end
            else if (state == S_WRITE_INIT) begin
				// Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
				// We are writing to slave.
                we_o <= 1;
				// Take output data from the register array.
                dat_o <= dat[iterator];
				// Offset our base address by the iterator, thus placing each iteration on separate location on slave.
				// Also, multiply with addressable units, so that the iterations wont overlap.
                adr_o <= ( iterator * AU_IN_DATA ) + BASE_ADDRESS;
				// Next we shall wait for acknowledgement.
                state <=  S_WAIT_WRITE_ACK;
            end
            else if(state ==  S_WAIT_WRITE_ACK) begin
                if (ack_i  == 1'b1) begin
					// Acknowledgement received! Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
					// Next we will read.
                    state <=  S_READ_INIT;
                end
            end
            else if(state ==  S_READ_INIT) begin
				// Assert signals indicating we are ready to transfer.
                cyc_o <= 1;
                stb_o <= 1;
				// We are reading from slave.
                we_o <= 0;
				// Next we shall wait for acknowledgement.
                state <=  S_WAIT_READ_ACK;
            end
            else if(state ==  S_WAIT_READ_ACK) begin
                if (ack_i  == 1'b1) begin
					// Acknowledgement received! Deassert initiator signals.
                    cyc_o <= 0;
                    stb_o <= 0;
                    we_o <= 0;
                    
					// It was read from the same address as was written, so it should be the same data.
                    if (dat[iterator] != dat_i) begin
                        $display("ERROR: Wrong answer from slave: %d", dat_i);
                        $stop;
                    end
                    
                    if (iterator == DATA_COUNT-1) begin
						// We have gone through the whole register array, means we are done.
                        done <= 1;
						// But we will wait for signal to start again.
                        state <= S_WAIT_START;
                    end
                    else begin
						// More data to send, means we increase iterator...
                        iterator <= iterator + 1;
						// ...and initiate next write.
                        state <= S_WRITE_INIT;
                    end
                end
            end
            else
                $display("ERROR: Unkown state: %d", state);
        end
    end
   
endmodule
