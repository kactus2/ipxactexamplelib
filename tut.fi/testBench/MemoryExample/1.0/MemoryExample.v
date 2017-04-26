//-----------------------------------------------------------------------------
// File          : MemoryExample.v
// Creation date : 26.04.2017
// Creation time : 16:34:45
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.74 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:MemoryExample:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/MemoryExample/1.0/MemoryExample.1.0.xml
//-----------------------------------------------------------------------------

module MemoryExample();

    // spi_slave_0_slave_if_to_MemoryExample_0_master_if wires:
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK;
    wire        spi_slave_0_slave_if_to_MemoryExample_0_master_ifSS;
    // clock_generator_0_wb_system_to_MemoryExample_0_wb_system wires:
    wire        clock_generator_0_wb_system_to_MemoryExample_0_wb_systemclk;
    wire        clock_generator_0_wb_system_to_MemoryExample_0_wb_systemrst;

    // Ad-hoc wires:
    wire [27:0] instruction_memory_0_instruction_feed_to_MemoryExample_0_instruction_feed;
    wire [7:0]  MemoryExample_0_iaddr_o_to_instruction_memory_0_iaddr_o;
    wire        clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    wire        clock_generator_0_clk_o_to_MemoryExample_0_clk_i;
    wire        clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    wire        clock_generator_0_rst_o_to_MemoryExample_0_rst_i;
    wire        clock_generator_0_rst_o_to_spi_slave_0_rst_in;

    // MemoryExample_0 port wires:
    wire        MemoryExample_0_clk_i;
    wire        MemoryExample_0_clk_out;
    wire        MemoryExample_0_data_in;
    wire        MemoryExample_0_data_out;
    wire [7:0]  MemoryExample_0_iaddr_o;
    wire [27:0] MemoryExample_0_instruction_feed;
    wire        MemoryExample_0_rst_i;
    wire        MemoryExample_0_slave_select_out;
    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // instruction_memory_0 port wires:
    wire        instruction_memory_0_clk_i;
    wire [7:0]  instruction_memory_0_iaddr_o;
    wire [27:0] instruction_memory_0_instruction_feed;
    wire        instruction_memory_0_rst_i;
    // spi_slave_0 port wires:
    wire        spi_slave_0_clk_in;
    wire        spi_slave_0_data_in;
    wire        spi_slave_0_data_out;
    wire        spi_slave_0_rst_in;
    wire        spi_slave_0_slave_select_in;

    // MemoryExample_0 assignments:
    assign MemoryExample_0_clk_i = clock_generator_0_wb_system_to_MemoryExample_0_wb_systemclk;
    assign MemoryExample_0_clk_i = clock_generator_0_clk_o_to_MemoryExample_0_clk_i;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK = MemoryExample_0_clk_out;
    assign MemoryExample_0_data_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI = MemoryExample_0_data_out;
    assign MemoryExample_0_iaddr_o_to_instruction_memory_0_iaddr_o[7:0] = MemoryExample_0_iaddr_o[7:0];
    assign MemoryExample_0_instruction_feed[27:0] = instruction_memory_0_instruction_feed_to_MemoryExample_0_instruction_feed[27:0];
    assign MemoryExample_0_rst_i = clock_generator_0_rst_o_to_MemoryExample_0_rst_i;
    assign MemoryExample_0_rst_i = clock_generator_0_wb_system_to_MemoryExample_0_wb_systemrst;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifSS = MemoryExample_0_slave_select_out;
    // clock_generator_0 assignments:
    assign clock_generator_0_wb_system_to_MemoryExample_0_wb_systemclk = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_MemoryExample_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_instruction_memory_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_rst_o_to_MemoryExample_0_rst_i = clock_generator_0_rst_o;
    assign clock_generator_0_rst_o_to_instruction_memory_0_rst_i = clock_generator_0_rst_o;
    assign clock_generator_0_rst_o_to_spi_slave_0_rst_in = clock_generator_0_rst_o;
    assign clock_generator_0_wb_system_to_MemoryExample_0_wb_systemrst = clock_generator_0_rst_o;
    // instruction_memory_0 assignments:
    assign instruction_memory_0_clk_i = clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    assign instruction_memory_0_iaddr_o[7:0] = MemoryExample_0_iaddr_o_to_instruction_memory_0_iaddr_o[7:0];
    assign instruction_memory_0_instruction_feed_to_MemoryExample_0_instruction_feed[27:0] = instruction_memory_0_instruction_feed[27:0];
    assign instruction_memory_0_rst_i = clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    // spi_slave_0 assignments:
    assign spi_slave_0_clk_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifSCLK;
    assign spi_slave_0_data_in = spi_slave_0_slave_if_to_MemoryExample_0_master_ifMOSI;
    assign spi_slave_0_slave_if_to_MemoryExample_0_master_ifMISO = spi_slave_0_data_out;
    assign spi_slave_0_rst_in = clock_generator_0_rst_o_to_spi_slave_0_rst_in;
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

    // IP-XACT VLNV: tut.fi:testBench:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:testBench:instruction_memory:1.1
    instruction_memory #(
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    instruction_memory_0(
        // These ports are not in any interface
        .clk_i               (instruction_memory_0_clk_i),
        .iaddr_o             (instruction_memory_0_iaddr_o),
        .rst_i               (instruction_memory_0_rst_i),
        .instruction_feed    (instruction_memory_0_instruction_feed));

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
