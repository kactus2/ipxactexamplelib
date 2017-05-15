#include "systemc.h"

SC_MODULE (TestIntitializer)
{
    sc_in_clk                                    clk; // The mandatory clock, as this is synchronous logic.
    sc_out<bool>                            rst; // The mandatory reset, as this is synchronous logic.
    sc_out<bool>                            start; // Input used to signal that is is ok to start the masters.
    sc_in<bool>                                done; // Output used to signal that the masters are done sending.

    void init();

    SC_CTOR(TestIntitializer)
    { 
        //Initialize processes as threads, with reset active high
        SC_CTHREAD(init,clk.pos());
    }
}; 
