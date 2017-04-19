//-----------------------------------------------------------------------------
// File          : MemoryExample.v
// Creation date : 19.04.2017
// Creation time : 11:50:27
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.73 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:MemoryExample:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/MemoryExample/1.0/MemoryExample.1.0.xml
//-----------------------------------------------------------------------------

module MemoryExample();

    // Memory_tb_0_wb_system_to_MemoryExample_0_wb_system wires:
    wire        Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk;
    wire        Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst;
    // spi_slave_0_slave_if_to_MemoryExample_0_master_if wires:
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifSS;

    // Ad-hoc wires:
    wire [27:0] MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed;
    wire        Memory_tb_0_rst_o_to_MemoryExample_0_rst_i;
    wire        MemoryExample_0_clk_i_to_Memory_tb_0_clk_o;
    wire        Memory_tb_0_rst_o_to_spi_slave_0_rst_in;
    wire [7:0]  MemoryExample_0_iaddr_o_to_Memory_tb_0_iaddr_o;

    // MemoryExample_0 port wires:
    wire        MemoryExample_0_clk_i;
    wire        MemoryExample_0_clk_out;
    wire        MemoryExample_0_data_in;
    wire        MemoryExample_0_data_out;
    wire [7:0]  MemoryExample_0_iaddr_o;
    wire [27:0] MemoryExample_0_instruction_feed;
    wire        MemoryExample_0_rst_i;
    wire        MemoryExample_0_slave_select_out;
    // Memory_tb_0 port wires:
    wire        Memory_tb_0_clk_o;
    wire [7:0]  Memory_tb_0_iaddr_o;
    wire [27:0] Memory_tb_0_instruction_feed;
    wire        Memory_tb_0_rst_o;
    // spi_slave_0 port wires:
    wire        spi_slave_0_clk_in;
    wire        spi_slave_0_data_in;
    wire        spi_slave_0_data_out;
    wire        spi_slave_0_rst_in;
    wire        spi_slave_0_slave_select_in;

    // MemoryExample_0 assignments:
    assign MemoryExample_0_clk_i = MemoryExample_0_clk_i_to_Memory_tb_0_clk_o;
    assign MemoryExample_0_clk_i = Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK = MemoryExample_0_clk_out;
    assign MemoryExample_0_data_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI = MemoryExample_0_data_out;
    assign MemoryExample_0_iaddr_o_to_Memory_tb_0_iaddr_o[7:0] = MemoryExample_0_iaddr_o[7:0];
    assign MemoryExample_0_instruction_feed[27:0] = MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed[27:0];
    assign MemoryExample_0_rst_i = Memory_tb_0_rst_o_to_MemoryExample_0_rst_i;
    assign MemoryExample_0_rst_i = Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifSS = MemoryExample_0_slave_select_out;
    // Memory_tb_0 assignments:
    assign MemoryExample_0_clk_i_to_Memory_tb_0_clk_o = Memory_tb_0_clk_o;
    assign Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk = Memory_tb_0_clk_o;
    assign Memory_tb_0_iaddr_o[7:0] = MemoryExample_0_iaddr_o_to_Memory_tb_0_iaddr_o[7:0];
    assign MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed[27:0] = Memory_tb_0_instruction_feed[27:0];
    assign Memory_tb_0_rst_o_to_MemoryExample_0_rst_i = Memory_tb_0_rst_o;
    assign Memory_tb_0_rst_o_to_spi_slave_0_rst_in = Memory_tb_0_rst_o;
    assign Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst = Memory_tb_0_rst_o;
    // spi_slave_0 assignments:
    assign spi_slave_0_clk_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK;
    assign spi_slave_0_data_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO = spi_slave_0_data_out;
    assign spi_slave_0_rst_in = Memory_tb_0_rst_o_to_spi_slave_0_rst_in;
    assign spi_slave_0_slave_select_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifSS;

    // IP-XACT VLNV: tut.fi:processor:MemoryExample:1.0
    MemoryExample_0     MemoryExample_0(
        // Interface: master_if
        .data_in             (MemoryExample_0_data_in),
        .clk_out             (MemoryExample_0_clk_out),
        .data_out            (MemoryExample_0_data_out),
        .slave_select_out    (MemoryExample_0_slave_select_out),
        // Interface: wb_system
        .clk_i               (MemoryExample_0_clk_i),
        .rst_i               (MemoryExample_0_rst_i),
        // These ports are not in any interface
        .instruction_feed    (MemoryExample_0_instruction_feed),
        .iaddr_o             (MemoryExample_0_iaddr_o));

    // IP-XACT VLNV: tut.fi:testBench:Memory_tb:1.0
    Memory_tb #(
        .DATA_WIDTH          (32),
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    Memory_tb_0(
        // Interface: wb_system
        .clk_o               (Memory_tb_0_clk_o),
        .rst_o               (Memory_tb_0_rst_o),
        // These ports are not in any interface
        .iaddr_o             (Memory_tb_0_iaddr_o),
        .instruction_feed    (Memory_tb_0_instruction_feed));

    // IP-XACT VLNV: tut.fi:template:spi_slave:1.0
    spi_slave #(
        .SLAVE_ID            (0))
    spi_slave_0(
        // Interface: slave_if
        .clk_in              (spi_slave_0_clk_in),
        .data_in             (spi_slave_0_data_in),
        .slave_select_in     (spi_slave_0_slave_select_in),
        .data_out            (spi_slave_0_data_out),
        // These ports are not in any interface
        .rst_in              (spi_slave_0_rst_in));


endmodule
