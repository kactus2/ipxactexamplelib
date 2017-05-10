#include "systemc.h"
#include "header.hh"
#include "master.hh"
#include "wb_slave.hh"
#include "hier_slave.hh"
#include "wishbone_bus.hh"

SC_MODULE (SampleHW)
{
    sc_in_clk                                        clk; // The mandatory clock, as this is synchronous logic.
    sc_in<bool>                                    rst; // The mandatory rst, as this is synchronous logic.
    sc_in<bool>                                    start; // Input used to signal that is is ok to start the masters.
    sc_out<bool>                                done; // Output used to signal that the masters are done sending.

    sc_signal<bool>                                cyc0; // Asserted by master for transfer.
    sc_signal<bool>                                stb0; // Asserted by master for transfer.
    sc_signal<bool>                                ack0; // Slave asserts acknowledge.
    sc_signal<bool>                                we0; // Write = 1, Read = 0.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_ms0; // Data from master to slave.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_sm0; // Data from slave to master.
    sc_signal<sc_uint<ADDR_WIDTH> >    adr0; // The address of the data.

    sc_signal<bool>                                cyc1; // Asserted by master for transfer.
    sc_signal<bool>                                stb1; // Asserted by master for transfer.
    sc_signal<bool>                                ack1; // Slave asserts acknowledge.
    sc_signal<bool>                                we1; // Write = 1, Read = 0.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_ms1; // Data from master to slave.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_sm1; // Data from slave to master.
    sc_signal<sc_uint<ADDR_WIDTH> >    adr1; // The address of the data.

    sc_signal<bool>                                cycM; // Asserted by master for transfer.
    sc_signal<bool>                                stbM; // Asserted by master for transfer.
    sc_signal<bool>                                ackM; // Slave asserts acknowledge.
    sc_signal<bool>                                weM; // Write = 1, Read = 0.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_msM; // Data from master to slave.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_smM; // Data from slave to master.
    sc_signal<sc_uint<ADDR_WIDTH> >    adrM; // The address of the data.

    sc_signal<bool>                                cycD; // Asserted by master for transfer.
    sc_signal<bool>                                stbD; // Asserted by master for transfer.
    sc_signal<bool>                                ackD; // Slave asserts acknowledge.
    sc_signal<bool>                                weD; // Write = 1, Read = 0.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_msD; // Data from master to slave.
    sc_signal<sc_uint<DATA_WIDTH> >    dat_smD; // Data from slave to master.
    sc_signal<sc_uint<ADDR_WIDTH> >    adrD; // The address of the data.

    //The submodules
    master* masterI;
    wb_slave* slave0;
    wb_slave* slave1;
    hier_slave* slave2;
    wishbone_bus* bus;
    sc_trace_file *wf;

    SC_CTOR(SampleHW)
    {
        bus = new wishbone_bus("wishbone_bus");
            bus->cyc_i_0(cyc0);
            bus->stb_i_0(stb0);
            bus->ack_o_0(ack0);
            bus->we_i_0(we0);
            bus->dat_o_0(dat_sm0);
            bus->dat_i_0(dat_ms0);
            bus->adr_i_0(adr0);
            
            bus->cyc_i_1(cyc1);
            bus->stb_i_1(stb1);
            bus->ack_o_1(ack1);
            bus->we_i_1(we1);
            bus->dat_o_1(dat_sm1);
            bus->dat_i_1(dat_ms1);
            bus->adr_i_1(adr1);
            
            bus->cyc_o_master(cycM);
            bus->stb_o_master(stbM);
            bus->ack_i_master(ackM);
            bus->we_o_master(weM);
            bus->dat_o_master(dat_msM);
            bus->dat_i_master(dat_smM);
            bus->adr_o_master(adrM);
        
        masterI = new master("master");
            masterI->clk(clk);
            masterI->rst(rst);
            masterI->start(start);
            masterI->done(done);
            
            masterI->cyc_o0(cycM);
            masterI->stb_o0(stbM);
            masterI->ack_i0(ackM);
            masterI->we_o0(weM);
            masterI->dat_i0(dat_smM);
            masterI->dat_o0(dat_msM);
            masterI->adr_o0(adrM);
            
            masterI->cyc_o1(cycD);
            masterI->stb_o1(stbD);
            masterI->ack_i1(ackD);
            masterI->we_o1(weD);
            masterI->dat_i1(dat_smD);
            masterI->dat_o1(dat_msD);
            masterI->adr_o1(adrD);
            
        slave0 = new wb_slave("slave0");
            slave0->clk(clk);
            slave0->rst(rst);
            
            slave0->cyc_i(cyc0);
            slave0->stb_i(stb0);
            slave0->ack_o(ack0);
            slave0->we_i(we0);
            slave0->dat_o(dat_sm0);
            slave0->dat_i(dat_ms0);
            slave0->adr_i(adr0);
            
        slave1 = new wb_slave("slave1");
            slave1->clk(clk);
            slave1->rst(rst);
            
            slave1->cyc_i(cyc1);
            slave1->stb_i(stb1);
            slave1->ack_o(ack1);
            slave1->we_i(we1);
            slave1->dat_o(dat_sm1);
            slave1->dat_i(dat_ms1);
            slave1->adr_i(adr1);
            
        slave2 = new hier_slave("slave2");
            slave2->clk(clk);
            slave2->rst(rst);
            
            slave2->cyc_i(cycD);
            slave2->stb_i(stbD);
            slave2->ack_o(ackD);
            slave2->we_i(weD);
            slave2->dat_o(dat_smD);
            slave2->dat_i(dat_msD);
            slave2->adr_i(adrD);

        // Open VCD file
        wf = sc_create_vcd_trace_file("wave");
        // Dump the desired signals
        sc_trace(wf, clk, "clk");
        sc_trace(wf, rst, "rst");
        sc_trace(wf, start, "start");
        sc_trace(wf, done, "done");
        
        sc_trace(wf, cyc0, "cyc0");
        sc_trace(wf, stb0, "stb0");
        sc_trace(wf, ack0, "ack0");
        sc_trace(wf, we0, "we0");
        sc_trace(wf, dat_ms0, "masterData0");
        sc_trace(wf, dat_sm0, "slaveData0");
        sc_trace(wf, adr0, "address0");
        
        sc_trace(wf, cyc1, "cyc1");
        sc_trace(wf, stb1, "stb1");
        sc_trace(wf, ack1, "ack1");
        sc_trace(wf, we1, "we1");
        sc_trace(wf, dat_ms1, "masterData1");
        sc_trace(wf, dat_sm1, "slaveData1");
        sc_trace(wf, adr1, "address1");
        
        
        sc_trace(wf, cycD, "cycD");
        sc_trace(wf, stbD, "stbD");
        sc_trace(wf, ackD, "ackD");
        sc_trace(wf, weD, "weD");
        sc_trace(wf, dat_msD, "masterDataD");
        sc_trace(wf, dat_smD, "slaveDataD");
        sc_trace(wf, adrD, "addressD");
        sc_trace(wf, dat_smD, "dat_smD");
        sc_trace(wf, dat_msD, "dat_msD");
    }
};
