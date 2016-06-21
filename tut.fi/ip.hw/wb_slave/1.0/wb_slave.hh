#include "header.hh"
#include "systemc.h"

SC_MODULE (wb_slave)
{
	sc_in_clk										clk; // The mandatory clock, as this is synchronous logic.
	sc_in<bool>									rst; // The mandatory reset, as this is synchronous logic.
	
    sc_in<bool>									cyc_i; // Asserted by master for transfer.
    sc_in<bool>									stb_i; // Asserted, when this specific slave is selected.
    sc_out<bool>								ack_o; // Slave asserts acknowledge.
    sc_in<bool>									we_i; // Write = 1, Read = 0.
	sc_out<sc_uint<DATA_WIDTH> >	dat_o; // Data from slave to master.
	sc_in<sc_uint<DATA_WIDTH> >		dat_i; //Data from master to slave.
	sc_in<sc_uint<ADDR_WIDTH> >	adr_i; // The address of the data.

	void run();

	SC_CTOR(wb_slave)
	{
		//Initialize process as a thread, with reset active high
		SC_CTHREAD(run, clk.pos());
		reset_signal_is(rst, false);
	}
};