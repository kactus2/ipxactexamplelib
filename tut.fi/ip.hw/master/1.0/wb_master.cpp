#include "wb_master.hh"

#define S_WAIT_START            0 // Waiting for start-signal
#define S_WRITE_INIT            1 // Initiating a write to slave.
#define S_WAIT_WRITE_ACK    2 // Waiting ack for wrtite from slave.
#define S_READ_INIT            3 // Initiating a read to slave.
#define S_WAIT_READ_ACK   4 // Waiting ack for wrtite from slave.

#define DATA_COUNT 16

void wb_master::run()
{
    sc_uint<DATA_WIDTH> dat[DATA_COUNT];
    
    // Initialize dat with data.
    dat[0] = 0x00000000;
    dat[1] = 0x11111111;
    dat[2] = 0x22222222;
    dat[3] = 0x33333333;
    dat[4] = 0x44444444;
    dat[5] = 0x55555555;
    dat[6] = 0x66666666;
    dat[7] = 0x77777777;
    dat[8] = 0x88888888;
    dat[9] = 0x99999999;
    dat[10] = 0xAAAAAAAA;
    dat[11] = 0xBBBBBBBB;
    dat[12] = 0xCCCCCCCC;
    dat[13] = 0xDDDDDDDD;
    dat[14] = 0xEEEEEEEE;
    dat[15] = 0xFFFFFFFF;
    
    // Initally waiting for start signal.
    int state =  S_WAIT_START;
    // Everything else is zero.
    dat_o = 0;
    cyc_o = 0;
    stb_o = 0;
    we_o = 0;
    done = 0;
    unsigned int iterator = 0;
    adr_o =  0;
    bool start_old = 0;
    
    while( true )
    {
        switch( state )
        {
            case S_WAIT_START:
                // Wait for the falling edge of the start.
                if (start == 0 && start_old == 1)
                {
                    // Once it has started, initiate a write.
                    state = S_WRITE_INIT;
                    // Nothing is done yet.
                    done = 0;
                    // Reset iterator, so that we may go through the array.
                    iterator = 0;
                }
                break;
            case S_WRITE_INIT:
                // Assert signals indicating we are ready to transfer.
                cyc_o = 1;
                stb_o = 1;
                // We are writing to slave.
                we_o = 1;
                // Take output data from the register array.
                dat_o = dat[iterator];
                // Offset our base address by the iterator, thus placing each iteration on separate location on slave.
                adr_o = iterator + BASE_ADDRESS;
                // Next we shall wait for acknowledgement.
                state =  S_WAIT_WRITE_ACK;
                break;
            case S_WAIT_WRITE_ACK:
                if (ack_i  == 1)
                {
                    // Acknowledgement received! Deassert initiator signals.
                    cyc_o = 0;
                    stb_o = 0;
                    we_o = 0;
                    // Next we will read.
                    state =  S_READ_INIT;
                }
                break;
            case S_READ_INIT:
                // Assert signals indicating we are ready to transfer.
                cyc_o = 1;
                stb_o = 1;
                // We are reading from slave.
                we_o = 0;
                // Next we shall wait for acknowledgement.
                state =  S_WAIT_READ_ACK;
                break;
            case S_WAIT_READ_ACK:
                if (ack_i  == 1)
                {
                    // Acknowledgement received! Deassert initiator signals.
                    cyc_o = 0;
                    stb_o = 0;
                    we_o = 0;
                
                    uint32_t value1 = dat_i.read();
                    uint32_t value2 = dat[iterator];
                    
                    // It was read from the same address as was written, so it should be the same data.
                    if (value1 != value2)
                    {
                        printf("ERROR: Wrong answer from slave: %X Expected: %X Iterator: %u\n",
                        value1, value2, iterator);
                        sc_stop();
                    }
                    
                    if (iterator == DATA_COUNT-1)
                    {
                        // We have gone through the whole register array, means we are done.
                        done = 1;
                        // But we will wait for signal to start again.
                        state = S_WAIT_START;
                    }
                    else 
                    {
                        // More data to send, means we increase iterator...
                        iterator = iterator + 1;
                        // ...and initiate next write.
                        state = S_WRITE_INIT;
                    }
                }
                break;
            default:
                printf("ERROR: Unkown state: %d\n", state);
        }
        
        // "New" old is the current value.
        start_old = start;

        // Proceed to the next cycle.
        wait();
    }
}
