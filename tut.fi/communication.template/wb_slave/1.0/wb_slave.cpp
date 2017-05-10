#include "wb_slave.hh"

#define S_WAIT        0 // Waiting for cyc_i & stb_i
#define S_DEASSERT    1 // Deassert acknowledgement.
        
void wb_slave::run()
{
    // We have as much memory as parameterized.
    sc_uint<DATA_WIDTH> dat[DATA_COUNT];

    ack_o = 0; // Obviously, there is nothing to acknowledge by default.
    dat_o = 0; // No output by default.
    int state = S_WAIT; // Wait signals from the masters at reset.

    while( true )
    {
        if (state == S_WAIT)
        {
            // Wait signal from the master.
            if ( cyc_i == 1 && stb_i == 1 )
            {
                // Master ok, acknowledge.
                ack_o = 1;

                if ( we_i == 1 )
                {
                    // Writing means we set data to the specified address, offsetted by the base address.
                    dat[adr_i.read() - BASE_ADDRESS] = dat_i.read();
                }
                else
                {
                    // Reading means we output dat from the specified address, offsetted by the base address.
                    dat_o = dat[adr_i.read() - BASE_ADDRESS];
                }

                // Next thing is to deassert.
                state = S_DEASSERT;
            }
        }
        else if (state == S_DEASSERT)
        {
            // Deassert acknowlegement, get ready to receive next one.
            ack_o = 0;
            state = S_WAIT;
        }
        else
            printf("ERROR: Unkown state: %d\n", state);
        
        // Proceed to the next cycle.
        wait();
    }
}
