#include "header.hh"
#include "systemc.h"
#include "wb_master.hh"

SC_MODULE (master)
{
	sc_in_clk										clk; // The mandatory clock, as this is synchronous logic.
	sc_in<bool>									rst; // The mandatory reset, as this is synchronous logic.
	sc_in<bool>									start; // Input used to signal that is is ok to start the masters.
	sc_out<bool>								done; // Output used to signal that the masters are done sending.
	
    sc_out<bool>								cyc_o0; // Asserted by master for transfer.
    sc_out<bool>								stb_o0; // Asserted by master for transfer.
    sc_in<bool>									ack_i0; // Slave asserts acknowledge.
    sc_out<bool>								we_o0; // Write = 1, Read = 0.
	sc_out<sc_uint<DATA_WIDTH> >	dat_o0; // Data from master to slave.
	sc_in<sc_uint<DATA_WIDTH> >		dat_i0; // Data from slave to master.
	sc_out<sc_uint<ADDR_WIDTH> >	adr_o0; // The address of the data
	
    sc_out<bool>								cyc_o1; // Asserted by master for transfer.
    sc_out<bool>								stb_o1; // Asserted by master for transfer.
    sc_in<bool>									ack_i1; // Slave asserts acknowledge.
    sc_out<bool>								we_o1; // Write = 1, Read = 0.
	sc_out<sc_uint<DATA_WIDTH> >	dat_o1; // Data from master to slave.
	sc_in<sc_uint<DATA_WIDTH> >		dat_i1; // Data from slave to master.
	sc_out<sc_uint<ADDR_WIDTH> >	adr_o1; // The address of the data.
	
	sc_signal<bool>							done0;
	sc_signal<bool>							done1;
	
	wb_master* master0;
	wb_master* master1;

	void run()
	{
		while( true )
		{
			done = done0 & done1;
			wait();
		}
	}

	SC_CTOR(master)
	{
		master0 = new wb_master("master0");
			master0->clk(clk);
			master0->rst(rst);
			master0->start(start);
			master0->done(done0);
			
			master0->cyc_o(cyc_o0);
			master0->stb_o(stb_o0);
			master0->ack_i(ack_i0);
			master0->we_o(we_o0);
			master0->dat_i(dat_i0);
			master0->dat_o(dat_o0);
			master0->adr_o(adr_o0);
			
			master1 = new wb_master("master1");
			master1->clk(clk);
			master1->rst(rst);
			master1->start(start);
			master1->done(done1);
			
			master1->cyc_o(cyc_o1);
			master1->stb_o(stb_o1);
			master1->ack_i(ack_i1);
			master1->we_o(we_o1);
			master1->dat_i(dat_i1);
			master1->dat_o(dat_o1);
			master1->adr_o(adr_o1);
			
		//Initialize process as a thread, with reset active high
		SC_CTHREAD(run, clk.pos());
		reset_signal_is(rst, false);
	}
};