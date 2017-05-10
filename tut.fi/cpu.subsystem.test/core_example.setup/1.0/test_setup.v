//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 10.05.2017
// Creation time : 13:47:18
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.104 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:cpu.subsystem.test:core_example.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.subsystem.test/core_example.setup/1.0/core_example.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // Ad-hoc wires:
    wire [27:0] instruction_memory_0_instruction_feed_to_core_example_0_instruction_feed;
    wire        clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    wire        clock_generator_0_clk_o_to_core_example_0_clk_i;
    wire        core_example_0_rst_i_to_clock_generator_0_rst_o;
    wire        clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    wire [7:0]  core_example_0_iaddr_o_to_instruction_memory_0_iaddr_o;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // core_example_0 port wires:
    wire        core_example_0_clk_i;
    wire [7:0]  core_example_0_iaddr_o;
    wire [27:0] core_example_0_instruction_feed;
    wire        core_example_0_rst_i;
    // instruction_memory_0 port wires:
    wire        instruction_memory_0_clk_i;
    wire [7:0]  instruction_memory_0_iaddr_o;
    wire [27:0] instruction_memory_0_instruction_feed;
    wire        instruction_memory_0_rst_i;

    // clock_generator_0 assignments:
    assign clock_generator_0_clk_o_to_core_example_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_instruction_memory_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_rst_o_to_instruction_memory_0_rst_i = clock_generator_0_rst_o;
    assign core_example_0_rst_i_to_clock_generator_0_rst_o = clock_generator_0_rst_o;
    // core_example_0 assignments:
    assign core_example_0_clk_i = clock_generator_0_clk_o_to_core_example_0_clk_i;
    assign core_example_0_iaddr_o_to_instruction_memory_0_iaddr_o[7:0] = core_example_0_iaddr_o[7:0];
    assign core_example_0_instruction_feed[27:0] = instruction_memory_0_instruction_feed_to_core_example_0_instruction_feed[27:0];
    assign core_example_0_rst_i = core_example_0_rst_i_to_clock_generator_0_rst_o;
    // instruction_memory_0 assignments:
    assign instruction_memory_0_clk_i = clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    assign instruction_memory_0_iaddr_o[7:0] = core_example_0_iaddr_o_to_instruction_memory_0_iaddr_o[7:0];
    assign instruction_memory_0_instruction_feed_to_core_example_0_instruction_feed[27:0] = instruction_memory_0_instruction_feed[27:0];
    assign instruction_memory_0_rst_i = clock_generator_0_rst_o_to_instruction_memory_0_rst_i;

    // IP-XACT VLNV: tut.fi:other.test:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:cpu.subsystem:core_example:1.0
    core_example_0 #(
        .DATA_WIDTH          (32),
        .ADDR_WIDTH          (9),
        .SUPPORTED_MEMORY    (512),
        .PERIPHERAL_BASE     (128),
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    core_example_0(
        // Interface: peripheral_access
        .mem_data_i          (0),
        .mem_slave_rdy       (0),
        .mem_address_o       (),
        .mem_data_o          (),
        .mem_master_rdy      (),
        .mem_we_o            (),
        // These ports are not in any interface
        .clk_i               (core_example_0_clk_i),
        .instruction_feed    (core_example_0_instruction_feed),
        .rst_i               (core_example_0_rst_i),
        .iaddr_o             (core_example_0_iaddr_o));

    // IP-XACT VLNV: tut.fi:cpu.logic.test:instruction_memory:1.0
    instruction_memory #(
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    instruction_memory_0(
        // These ports are not in any interface
        .clk_i               (instruction_memory_0_clk_i),
        .iaddr_o             (instruction_memory_0_iaddr_o),
        .rst_i               (instruction_memory_0_rst_i),
        .instruction_feed    (instruction_memory_0_instruction_feed));


endmodule
