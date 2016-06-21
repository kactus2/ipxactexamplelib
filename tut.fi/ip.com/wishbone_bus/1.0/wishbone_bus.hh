#include "header.hh"
#include "systemc.h"

SC_MODULE (wishbone_bus)
{
    sc_out<bool>								cyc_i_0; // Asserted by master for transfer.
    sc_out<bool>								stb_i_0; // Asserted, when this specific slave is selected.
    sc_in<bool>									ack_o_0; // Slave asserts acknowledge.
    sc_out<bool>								we_i_0; // Write = 1, Read = 0.
	sc_in<sc_uint<DATA_WIDTH> >		dat_o_0; // Data from master to slave.
	sc_out<sc_uint<DATA_WIDTH> >	dat_i_0; // Data from slave to master.
	sc_out<sc_uint<ADDR_WIDTH> >	adr_i_0; // The address of the data.
	
    sc_out<bool>								cyc_i_1; // Asserted by master for transfer.
    sc_out<bool>								stb_i_1; // Asserted, when this specific slave is selected.
    sc_in<bool>									ack_o_1; // Slave asserts acknowledge.
    sc_out<bool>								we_i_1; // Write = 1, Read = 0.
	sc_in<sc_uint<DATA_WIDTH> >		dat_o_1; // Data from master to slave.
	sc_out<sc_uint<DATA_WIDTH> >	dat_i_1; // Data from slave to master.
	sc_out<sc_uint<ADDR_WIDTH> >	adr_i_1; // The address of the data.
	
    sc_in<bool>									cyc_o_master; // Asserted by master for transfer.
    sc_in<bool>									stb_o_master; // Asserted by master for transfer.
    sc_out<bool>								ack_i_master; // Slave asserts acknowledge.
    sc_in<bool>									we_o_master; // Write = 1, Read = 0.
	sc_in<sc_uint<DATA_WIDTH> >		dat_o_master; // Data from master to slave.
	sc_out<sc_uint<DATA_WIDTH> >	dat_i_master; // Data from slave to master.
	sc_in<sc_uint<ADDR_WIDTH> >	adr_o_master; // The address of the data

	void run()
	{
		// Assign most of the master outputs directly to slave inputs.
		adr_i_0 = adr_o_master;
		cyc_i_0 = cyc_o_master;
		dat_i_0 = dat_o_master;
		we_i_0 = we_o_master;
		
		adr_i_1 = adr_o_master;
		cyc_i_1 = cyc_o_master;
		dat_i_1 = dat_o_master;
		we_i_1 = we_o_master;
		
		// The strobes are a wee exception: It is decided based on the address, which one is active.
		if ( adr_o_master.read() >= SLAVE_SPLIT + BASE_ADDRESS )
		{
			stb_i_0 = 0;
			stb_i_1 = stb_o_master;
		}
		else
		{
			stb_i_1 = 0;
			stb_i_0 = stb_o_master;
		}
		
		// For master inputs, outputs of the selected slave is chosen. Again, based on the  address.
		if ( adr_o_master.read() >= SLAVE_SPLIT + BASE_ADDRESS )
		{
			dat_i_master = dat_o_1;
			ack_i_master = ack_o_1;
		}
		else
		{
			dat_i_master = dat_o_0;
			ack_i_master = ack_o_0;
		}
	}

	SC_CTOR(wishbone_bus)
	{
		// Initialize process as a method.
		SC_METHOD(run);
		//  Run ANY TIME ANY INPUT changes. This is module is combinatoric!
		sensitive << adr_o_master <<  cyc_o_master << dat_o_master << we_o_master << stb_o_master
		<< dat_o_0 << ack_o_0 << dat_o_1 << ack_o_1;
	}
};