#include "header.hh"
#include "systemc.h"

SC_MODULE (wb_master)
{
    sc_in_clk                                        clk; // The mandatory clock, as this is synchronous logic.
    sc_in<bool>                                    rst; // The mandatory reset, as this is synchronous logic.
    sc_in<bool>                                    start; // Input used to signal that is is ok to start the masters.
    sc_out<bool>                                done; // Output used to signal that the masters are done sending.
    
    sc_out<bool>                                cyc_o; // Asserted by master for transfer.
    sc_out<bool>                                stb_o; // Asserted by master for transfer.
    sc_in<bool>                                    ack_i; // Slave asserts acknowledge.
    sc_out<bool>                                we_o; // Write = 1, Read = 0.
    sc_out<sc_uint<DATA_WIDTH> >    dat_o; // Data from master to slave.
    sc_in<sc_uint<DATA_WIDTH> >        dat_i; // Data from slave to master.
    sc_out<sc_uint<ADDR_WIDTH> >    adr_o; // The address of the data.
    
    void run();

    SC_CTOR(wb_master)
    {
        //Initialize process as a thread, with reset active high
        SC_CTHREAD(run, clk.pos());
        reset_signal_is(rst, false);
    }
};