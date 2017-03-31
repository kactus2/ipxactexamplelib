//-----------------------------------------------------------------------------
// File          : WishboneCPUWrapper.v
// Creation date : 31.03.2017
// Creation time : 14:52:24
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.6 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:WishboneCPUWrapper:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/WishboneCPUWrapper/1.0/WishboneCPUWrapper.1.0.xml
//-----------------------------------------------------------------------------

module WishboneCPUWrapper();

    // wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_system wires:
    wire        wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemclk;
    wire        wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemrst;
    // wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_master wires:
    wire        wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterack;
    wire [15:0] wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masteradr;
    wire        wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastercyc;
    wire [31:0] wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_ms;
    wire [31:0] wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_sm;
    wire        wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastererr;
    wire        wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterstb;
    wire        wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterwe;
    // wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contoller wires:
    wire [15:0] wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contolleraddress;
    wire [31:0] wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_ms;
    wire [31:0] wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_sm;
    wire        wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollermaster_rdy;
    wire        wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerslave_rdy;
    wire        wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerwe;

    // TestClockSource_0 port wires:
    wire        TestClockSource_0_clk_o;
    wire        TestClockSource_0_rst_o;
    // wb_cpu_wrapper_0 port wires:
    wire        wb_cpu_wrapper_0_ack_i;
    wire [15:0] wb_cpu_wrapper_0_adr_o;
    wire        wb_cpu_wrapper_0_clk_i;
    wire        wb_cpu_wrapper_0_cyc_o;
    wire [31:0] wb_cpu_wrapper_0_dat_i;
    wire [31:0] wb_cpu_wrapper_0_dat_o;
    wire        wb_cpu_wrapper_0_err_i;
    wire [15:0] wb_cpu_wrapper_0_mem_address_in;
    wire [31:0] wb_cpu_wrapper_0_mem_data_in;
    wire [31:0] wb_cpu_wrapper_0_mem_data_out;
    wire        wb_cpu_wrapper_0_mem_master_rdy;
    wire        wb_cpu_wrapper_0_mem_slave_rdy;
    wire        wb_cpu_wrapper_0_mem_we_in;
    wire        wb_cpu_wrapper_0_rst_i;
    wire        wb_cpu_wrapper_0_stb_o;
    wire        wb_cpu_wrapper_0_we_o;
    // wb_cpu_wrapper_tb_0 port wires:
    wire        wb_cpu_wrapper_tb_0_ack_o;
    wire [15:0] wb_cpu_wrapper_tb_0_adr_i;
    wire        wb_cpu_wrapper_tb_0_clk_i;
    wire        wb_cpu_wrapper_tb_0_cyc_i;
    wire [31:0] wb_cpu_wrapper_tb_0_dat_i;
    wire [31:0] wb_cpu_wrapper_tb_0_dat_o;
    wire        wb_cpu_wrapper_tb_0_err_o;
    wire [15:0] wb_cpu_wrapper_tb_0_mem_address_o;
    wire [31:0] wb_cpu_wrapper_tb_0_mem_data_i;
    wire [31:0] wb_cpu_wrapper_tb_0_mem_data_o;
    wire        wb_cpu_wrapper_tb_0_mem_master_rdy;
    wire        wb_cpu_wrapper_tb_0_mem_slave_rdy;
    wire        wb_cpu_wrapper_tb_0_mem_we_o;
    wire        wb_cpu_wrapper_tb_0_rst_i;
    wire        wb_cpu_wrapper_tb_0_stb_i;
    wire        wb_cpu_wrapper_tb_0_we_i;

    // TestClockSource_0 assignments:
    assign wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemclk = TestClockSource_0_clk_o;
    assign wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemrst = TestClockSource_0_rst_o;
    // wb_cpu_wrapper_0 assignments:
    assign wb_cpu_wrapper_0_ack_i = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterack;
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masteradr[15:0] = wb_cpu_wrapper_0_adr_o[15:0];
    assign wb_cpu_wrapper_0_clk_i = wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemclk;
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastercyc = wb_cpu_wrapper_0_cyc_o;
    assign wb_cpu_wrapper_0_dat_i[31:0] = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_sm[31:0];
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_ms[31:0] = wb_cpu_wrapper_0_dat_o[31:0];
    assign wb_cpu_wrapper_0_err_i = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastererr;
    assign wb_cpu_wrapper_0_mem_address_in[15:0] = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contolleraddress[15:0];
    assign wb_cpu_wrapper_0_mem_data_in[31:0] = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_ms[31:0];
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_sm[31:0] = wb_cpu_wrapper_0_mem_data_out[31:0];
    assign wb_cpu_wrapper_0_mem_master_rdy = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerwe;
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerslave_rdy = wb_cpu_wrapper_0_mem_slave_rdy;
    assign wb_cpu_wrapper_0_mem_we_in = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollermaster_rdy;
    assign wb_cpu_wrapper_0_rst_i = wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemrst;
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterstb = wb_cpu_wrapper_0_stb_o;
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterwe = wb_cpu_wrapper_0_we_o;
    // wb_cpu_wrapper_tb_0 assignments:
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterack = wb_cpu_wrapper_tb_0_ack_o;
    assign wb_cpu_wrapper_tb_0_adr_i[15:0] = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masteradr[15:0];
    assign wb_cpu_wrapper_tb_0_clk_i = wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemclk;
    assign wb_cpu_wrapper_tb_0_cyc_i = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastercyc;
    assign wb_cpu_wrapper_tb_0_dat_i[31:0] = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_ms[31:0];
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterdat_sm[31:0] = wb_cpu_wrapper_tb_0_dat_o[31:0];
    assign wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_mastererr = wb_cpu_wrapper_tb_0_err_o;
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contolleraddress[15:0] = wb_cpu_wrapper_tb_0_mem_address_o[15:0];
    assign wb_cpu_wrapper_tb_0_mem_data_i[31:0] = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_sm[31:0];
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerdata_ms[31:0] = wb_cpu_wrapper_tb_0_mem_data_o[31:0];
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollermaster_rdy = wb_cpu_wrapper_tb_0_mem_master_rdy;
    assign wb_cpu_wrapper_tb_0_mem_slave_rdy = wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerslave_rdy;
    assign wb_cpu_wrapper_tb_0_memory_interface_to_wb_cpu_wrapper_0_contollerwe = wb_cpu_wrapper_tb_0_mem_we_o;
    assign wb_cpu_wrapper_tb_0_rst_i = wb_cpu_wrapper_0_wb_system_to_TestClockSource_0_wb_systemrst;
    assign wb_cpu_wrapper_tb_0_stb_i = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterstb;
    assign wb_cpu_wrapper_tb_0_we_i = wb_cpu_wrapper_tb_0_wb_slave_to_wb_cpu_wrapper_0_wb_masterwe;

    // IP-XACT VLNV: tut.fi:testBench:TestClockSource:1.0
    TestClockSource #(
        .WAIT_TIME           (2000))
    TestClockSource_0(
        // Interface: wb_system
        .clk_o               (TestClockSource_0_clk_o),
        .rst_o               (TestClockSource_0_rst_o));

    // IP-XACT VLNV: tut.fi:communication:wb_cpu_wrapper:1.0
    wb_master #(
        .ADDR_WIDTH          (16),
        .DATA_WIDTH          (32),
        .BASE_ADDRESS        (3840),
        .RANGE               (512))
    wb_cpu_wrapper_0(
        // Interface: contoller
        .mem_address_in      (wb_cpu_wrapper_0_mem_address_in),
        .mem_data_in         (wb_cpu_wrapper_0_mem_data_in),
        .mem_master_rdy      (wb_cpu_wrapper_0_mem_master_rdy),
        .mem_we_in           (wb_cpu_wrapper_0_mem_we_in),
        .mem_data_out        (wb_cpu_wrapper_0_mem_data_out),
        .mem_slave_rdy       (wb_cpu_wrapper_0_mem_slave_rdy),
        // Interface: wb_master
        .ack_i               (wb_cpu_wrapper_0_ack_i),
        .dat_i               (wb_cpu_wrapper_0_dat_i),
        .err_i               (wb_cpu_wrapper_0_err_i),
        .adr_o               (wb_cpu_wrapper_0_adr_o),
        .cyc_o               (wb_cpu_wrapper_0_cyc_o),
        .dat_o               (wb_cpu_wrapper_0_dat_o),
        .stb_o               (wb_cpu_wrapper_0_stb_o),
        .we_o                (wb_cpu_wrapper_0_we_o),
        // Interface: wb_system
        .clk_i               (wb_cpu_wrapper_0_clk_i),
        .rst_i               (wb_cpu_wrapper_0_rst_i));

    // IP-XACT VLNV: tut.fi:testBench:wb_cpu_wrapper_tb:1.0
    wb_slave_mem_master #(
        .ADDR_WIDTH          (16),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8),
        .BASE_ADDRESS        (3840))
    wb_cpu_wrapper_tb_0(
        // Interface: memory_interface
        .mem_data_i          (wb_cpu_wrapper_tb_0_mem_data_i),
        .mem_slave_rdy       (wb_cpu_wrapper_tb_0_mem_slave_rdy),
        .mem_address_o       (wb_cpu_wrapper_tb_0_mem_address_o),
        .mem_data_o          (wb_cpu_wrapper_tb_0_mem_data_o),
        .mem_master_rdy      (wb_cpu_wrapper_tb_0_mem_master_rdy),
        .mem_we_o            (wb_cpu_wrapper_tb_0_mem_we_o),
        // Interface: wb_slave
        .adr_i               (wb_cpu_wrapper_tb_0_adr_i),
        .cyc_i               (wb_cpu_wrapper_tb_0_cyc_i),
        .dat_i               (wb_cpu_wrapper_tb_0_dat_i),
        .stb_i               (wb_cpu_wrapper_tb_0_stb_i),
        .we_i                (wb_cpu_wrapper_tb_0_we_i),
        .ack_o               (wb_cpu_wrapper_tb_0_ack_o),
        .dat_o               (wb_cpu_wrapper_tb_0_dat_o),
        .err_o               (wb_cpu_wrapper_tb_0_err_o),
        // Interface: wb_system
        .clk_i               (wb_cpu_wrapper_tb_0_clk_i),
        .rst_i               (wb_cpu_wrapper_tb_0_rst_i));


endmodule
