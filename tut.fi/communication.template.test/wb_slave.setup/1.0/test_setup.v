//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 28.11.2017
// Creation time : 16:01:32
// Description   : Test arrangement for verifying the wishbone slave template.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1184 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:communication.template.test:wb_slave.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/communication.template.test/wb_slave.setup/1.0/wb_slave.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // wb_slave_0_wb_system_to_clock_generator_0_wb_system wires:
    wire        wb_slave_0_wb_system_to_clock_generator_0_wb_systemclk;
    wire        wb_slave_0_wb_system_to_clock_generator_0_wb_systemrst;
    // wb_master_0_wb_master_to_wb_slave_0_wb_slave wires:
    wire        wb_master_0_wb_master_to_wb_slave_0_wb_slaveack;
    wire [15:0] wb_master_0_wb_master_to_wb_slave_0_wb_slaveadr;
    wire        wb_master_0_wb_master_to_wb_slave_0_wb_slavecyc;
    wire [31:0] wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_ms;
    wire [31:0] wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_sm;
    wire        wb_master_0_wb_master_to_wb_slave_0_wb_slaveerr;
    wire        wb_master_0_wb_master_to_wb_slave_0_wb_slavestb;
    wire        wb_master_0_wb_master_to_wb_slave_0_wb_slavewe;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // wb_master_0 port wires:
    wire        wb_master_0_ack_i;
    wire [15:0] wb_master_0_adr_o;
    wire        wb_master_0_clk_i;
    wire        wb_master_0_cyc_o;
    wire [31:0] wb_master_0_dat_i;
    wire [31:0] wb_master_0_dat_o;
    wire        wb_master_0_err_i;
    wire        wb_master_0_rst_i;
    wire        wb_master_0_stb_o;
    wire        wb_master_0_we_o;
    // wb_slave_0 port wires:
    wire        wb_slave_0_ack_o;
    wire [15:0] wb_slave_0_adr_i;
    wire        wb_slave_0_clk_i;
    wire        wb_slave_0_cyc_i;
    wire [31:0] wb_slave_0_dat_i;
    wire [31:0] wb_slave_0_dat_o;
    wire        wb_slave_0_err_o;
    wire        wb_slave_0_rst_i;
    wire        wb_slave_0_stb_i;
    wire        wb_slave_0_we_i;

    // clock_generator_0 assignments:
    assign wb_slave_0_wb_system_to_clock_generator_0_wb_systemclk = clock_generator_0_clk_o;
    assign wb_slave_0_wb_system_to_clock_generator_0_wb_systemrst = clock_generator_0_rst_o;
    // wb_master_0 assignments:
    assign wb_master_0_ack_i = wb_master_0_wb_master_to_wb_slave_0_wb_slaveack;
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slaveadr[15:0] = wb_master_0_adr_o[15:0];
    assign wb_master_0_clk_i = wb_slave_0_wb_system_to_clock_generator_0_wb_systemclk;
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slavecyc = wb_master_0_cyc_o;
    assign wb_master_0_dat_i[31:0] = wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_sm[31:0];
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_ms[31:0] = wb_master_0_dat_o[31:0];
    assign wb_master_0_err_i = wb_master_0_wb_master_to_wb_slave_0_wb_slaveerr;
    assign wb_master_0_rst_i = wb_slave_0_wb_system_to_clock_generator_0_wb_systemrst;
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slavestb = wb_master_0_stb_o;
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slavewe = wb_master_0_we_o;
    // wb_slave_0 assignments:
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slaveack = wb_slave_0_ack_o;
    assign wb_slave_0_adr_i[15:0] = wb_master_0_wb_master_to_wb_slave_0_wb_slaveadr[15:0];
    assign wb_slave_0_clk_i = wb_slave_0_wb_system_to_clock_generator_0_wb_systemclk;
    assign wb_slave_0_cyc_i = wb_master_0_wb_master_to_wb_slave_0_wb_slavecyc;
    assign wb_slave_0_dat_i[31:0] = wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_ms[31:0];
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slavedat_sm[31:0] = wb_slave_0_dat_o[31:0];
    assign wb_master_0_wb_master_to_wb_slave_0_wb_slaveerr = wb_slave_0_err_o;
    assign wb_slave_0_rst_i = wb_slave_0_wb_system_to_clock_generator_0_wb_systemrst;
    assign wb_slave_0_stb_i = wb_master_0_wb_master_to_wb_slave_0_wb_slavestb;
    assign wb_slave_0_we_i = wb_master_0_wb_master_to_wb_slave_0_wb_slavewe;

    // IP-XACT VLNV: tut.fi:other.test:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:communication.template:wb_master:1.0
    wb_master #(
        .ADDR_WIDTH          (16),
        .DATA_COUNT          (8),
        .DATA_WIDTH          (32),
        .BASE_ADDRESS        (3840),
        .SEND_ERR_ADDR       (1))
    wb_master_0(
        // Interface: wb_master
        .ack_i               (wb_master_0_ack_i),
        .dat_i               (wb_master_0_dat_i),
        .err_i               (wb_master_0_err_i),
        .adr_o               (wb_master_0_adr_o),
        .cyc_o               (wb_master_0_cyc_o),
        .dat_o               (wb_master_0_dat_o),
        .stb_o               (wb_master_0_stb_o),
        .we_o                (wb_master_0_we_o),
        // Interface: wb_system
        .clk_i               (wb_master_0_clk_i),
        .rst_i               (wb_master_0_rst_i),
        // These ports are not in any interface
        .start               (0),
        .done                ());

    // IP-XACT VLNV: tut.fi:communication.template:wb_slave:1.0
    wb_slave #(
        .ADDR_WIDTH          (16),
        .DATA_WIDTH          (32),
        .DATA_COUNT          (8),
        .BASE_ADDRESS        (3840))
    wb_slave_0(
        // Interface: wb_slave
        .adr_i               (wb_slave_0_adr_i),
        .cyc_i               (wb_slave_0_cyc_i),
        .dat_i               (wb_slave_0_dat_i),
        .stb_i               (wb_slave_0_stb_i),
        .we_i                (wb_slave_0_we_i),
        .ack_o               (wb_slave_0_ack_o),
        .dat_o               (wb_slave_0_dat_o),
        .err_o               (wb_slave_0_err_o),
        // Interface: wb_system
        .clk_i               (wb_slave_0_clk_i),
        .rst_i               (wb_slave_0_rst_i));


endmodule
