#include "systemc.h"
#include "header.hh"
#include "SampleHW.hh"
#include "TestIntitializer.hh"

// The clock
sc_clock the_clock("my_the_clock",1,SC_NS);

// Variables and signals shared with the process
sc_signal<bool>  reset; //Reset, active high

sc_signal<bool>    start; // Input used to signal that is is ok to start the masters.
sc_signal<bool>    done; // Output used to signal that the masters are done sending.

int sc_main (int argc, char* argv[])
{
    //Disable false positives
    sc_core::sc_report_handler::set_actions( "/IEEE_Std_1666/deprecated",
                                            sc_core::SC_DO_NOTHING );
    sc_core::sc_report_handler::set_actions( SC_ID_END_MODULE_NOT_CALLED_,
                                SC_DO_NOTHING);

    //Initialization of the test bench
    TestIntitializer* tb = new TestIntitializer("TestIntitializer");
        tb->clk(the_clock);
        tb->rst(reset);
        tb->start(start);
        tb->done(done);

    //Initialization of the DUT
    SampleHW* shw  = new SampleHW( "SampleHW" );
        shw->clk(the_clock);
        shw->rst(reset);
        shw->start(start);
        shw->done(done);
        
    //Start the simulation
    sc_start();

    return 0;
}
