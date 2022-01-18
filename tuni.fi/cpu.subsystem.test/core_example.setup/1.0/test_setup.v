//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 28.11.2017
// Creation time : 12:45:33
// Description   : Test arrangement for the example core with data memory, instuction memory and clock source. Peripheral access is unused, as it is tested in other setups.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1184 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:cpu.subsystem.test:core_example.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.subsystem.test/core_example.setup/1.0/core_example.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // core_example_0_instructions_to_instruction_memory_0_slave wires:
    wire [7:0]  core_example_0_instructions_to_instruction_memory_0_slaveaddress;
    wire [27:0] core_example_0_instructions_to_instruction_memory_0_slaveread_data;
    // data_memory_0_slave_to_core_example_0_local_data wires:
    wire [8:0]  data_memory_0_slave_to_core_example_0_local_dataaddress;
    wire [31:0] data_memory_0_slave_to_core_example_0_local_dataread_data;
    wire        data_memory_0_slave_to_core_example_0_local_datawrite;
    wire [31:0] data_memory_0_slave_to_core_example_0_local_datawrite_data;

    // Ad-hoc wires:
    wire        clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    wire        clock_generator_0_clk_o_to_core_example_0_clk_i;
    wire        core_example_0_rst_i_to_clock_generator_0_rst_o;
    wire        clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    wire        data_memory_0_rst_i_to_clock_generator_0_rst_o;
    wire        data_memory_0_clk_i_to_clock_generator_0_clk_o;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // core_example_0 port wires:
    wire        core_example_0_clk_i;
    wire [7:0]  core_example_0_iaddr_o;
    wire [27:0] core_example_0_instruction_feed;
    wire [8:0]  core_example_0_local_address_o;
    wire [31:0] core_example_0_local_read_data;
    wire [31:0] core_example_0_local_write_data;
    wire        core_example_0_local_write_o;
    wire        core_example_0_rst_i;
    // data_memory_0 port wires:
    wire [8:0]  data_memory_0_adr_i;
    wire        data_memory_0_clk_i;
    wire [31:0] data_memory_0_read_data;
    wire        data_memory_0_rst_i;
    wire        data_memory_0_write;
    wire [31:0] data_memory_0_write_data;
    // instruction_memory_0 port wires:
    wire        instruction_memory_0_clk_i;
    wire [7:0]  instruction_memory_0_iaddr_i;
    wire [27:0] instruction_memory_0_instruction_feed;
    wire        instruction_memory_0_rst_i;

    // clock_generator_0 assignments:
    assign clock_generator_0_clk_o_to_core_example_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_instruction_memory_0_clk_i = clock_generator_0_clk_o;
    assign data_memory_0_clk_i_to_clock_generator_0_clk_o = clock_generator_0_clk_o;
    assign clock_generator_0_rst_o_to_instruction_memory_0_rst_i = clock_generator_0_rst_o;
    assign core_example_0_rst_i_to_clock_generator_0_rst_o = clock_generator_0_rst_o;
    assign data_memory_0_rst_i_to_clock_generator_0_rst_o = clock_generator_0_rst_o;
    // core_example_0 assignments:
    assign core_example_0_clk_i = clock_generator_0_clk_o_to_core_example_0_clk_i;
    assign core_example_0_instructions_to_instruction_memory_0_slaveaddress[7:0] = core_example_0_iaddr_o[7:0];
    assign core_example_0_instruction_feed[27:0] = core_example_0_instructions_to_instruction_memory_0_slaveread_data[27:0];
    assign data_memory_0_slave_to_core_example_0_local_dataaddress[8:0] = core_example_0_local_address_o[8:0];
    assign core_example_0_local_read_data[31:0] = data_memory_0_slave_to_core_example_0_local_dataread_data[31:0];
    assign data_memory_0_slave_to_core_example_0_local_datawrite_data[31:0] = core_example_0_local_write_data[31:0];
    assign data_memory_0_slave_to_core_example_0_local_datawrite = core_example_0_local_write_o;
    assign core_example_0_rst_i = core_example_0_rst_i_to_clock_generator_0_rst_o;
    // data_memory_0 assignments:
    assign data_memory_0_adr_i[8:0] = data_memory_0_slave_to_core_example_0_local_dataaddress[8:0];
    assign data_memory_0_clk_i = data_memory_0_clk_i_to_clock_generator_0_clk_o;
    assign data_memory_0_slave_to_core_example_0_local_dataread_data[31:0] = data_memory_0_read_data[31:0];
    assign data_memory_0_rst_i = data_memory_0_rst_i_to_clock_generator_0_rst_o;
    assign data_memory_0_write = data_memory_0_slave_to_core_example_0_local_datawrite;
    assign data_memory_0_write_data[31:0] = data_memory_0_slave_to_core_example_0_local_datawrite_data[31:0];
    // instruction_memory_0 assignments:
    assign instruction_memory_0_clk_i = clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    assign instruction_memory_0_iaddr_i[7:0] = core_example_0_instructions_to_instruction_memory_0_slaveaddress[7:0];
    assign core_example_0_instructions_to_instruction_memory_0_slaveread_data[27:0] = instruction_memory_0_instruction_feed[27:0];
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
        // Interface: instructions
        .instruction_feed    (core_example_0_instruction_feed),
        .iaddr_o             (core_example_0_iaddr_o),
        // Interface: local_data
        .local_read_data     (core_example_0_local_read_data),
        .local_address_o     (core_example_0_local_address_o),
        .local_write_data    (core_example_0_local_write_data),
        .local_write_o       (core_example_0_local_write_o),
        // Interface: peripheral_access
        .mem_data_i          (0),
        .mem_slave_rdy       (0),
        .mem_address_o       (),
        .mem_data_o          (),
        .mem_master_rdy      (),
        .mem_we_o            (),
        // These ports are not in any interface
        .clk_i               (core_example_0_clk_i),
        .rst_i               (core_example_0_rst_i));

    // IP-XACT VLNV: tut.fi:cpu.logic.test:data_memory:1.0
    data_memory #(
        .DATA_WIDTH          (32),
        .ADDR_WIDTH          (9),
        .MEMORY_SIZE         (128),
        .AUB                 (8))
    data_memory_0(
        // Interface: slave
        .adr_i               (data_memory_0_adr_i),
        .write               (data_memory_0_write),
        .write_data          (data_memory_0_write_data),
        .read_data           (data_memory_0_read_data),
        // These ports are not in any interface
        .clk_i               (data_memory_0_clk_i),
        .rst_i               (data_memory_0_rst_i));

    // IP-XACT VLNV: tut.fi:cpu.logic.test:instruction_memory:1.0
    instruction_memory #(
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    instruction_memory_0(
        // Interface: slave
        .iaddr_i             (instruction_memory_0_iaddr_i),
        .instruction_feed    (instruction_memory_0_instruction_feed),
        // These ports are not in any interface
        .clk_i               (instruction_memory_0_clk_i),
        .rst_i               (instruction_memory_0_rst_i));


endmodule
