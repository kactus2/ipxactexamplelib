#include "header.hh"
#include "systemc.h"

SC_MODULE (hier_slave)
{
    sc_in_clk                                        clk; // The mandatory clock, as this is synchronous logic.
    sc_in<bool>                                    rst; // The mandatory reset, as this is synchronous logic.
    
    sc_in<bool>                                    cyc_i; // Asserted by master for transfer.
    sc_in<bool>                                    stb_i; // Asserted, when this specific slave is selected.
    sc_out<bool>                                ack_o; // Slave asserts acknowledge.
    sc_in<bool>                                    we_i; // Write = 1, Read = 0.
    sc_out<sc_uint<DATA_WIDTH> >    dat_o; // Data from slave to master.
    sc_in<sc_uint<DATA_WIDTH> >        dat_i; //Data from master to slave.
    sc_in<sc_uint<ADDR_WIDTH> >    adr_i; // The address of the data.

    wb_slave* slave;
    
    SC_CTOR(hier_slave)
    {
        slave = new wb_slave("slave");
            slave->clk(clk);
            slave->rst(rst);
            
            slave->cyc_i(cyc_i);
            slave->stb_i(stb_i);
            slave->ack_o(ack_o);
            slave->we_i(we_i);
            slave->dat_o(dat_o);
            slave->dat_i(dat_i);
            slave->adr_i(adr_i);
    }
};