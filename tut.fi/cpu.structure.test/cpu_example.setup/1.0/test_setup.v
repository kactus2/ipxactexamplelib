//-----------------------------------------------------------------------------
// File          : test_setup.v
// Creation date : 28.11.2017
// Creation time : 16:31:16
// Description   : Test arrangement for the example CPU with data memory, instuction memory, clock source, and SPI slave.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1184 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:cpu.structure.test:cpu_example.setup:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.structure.test/cpu_example.setup/1.0/cpu_example.setup.1.0.xml
//-----------------------------------------------------------------------------

module test_setup();

    // cpu_example_0_wb_system_to_clock_generator_0_wb_system wires:
    wire        cpu_example_0_wb_system_to_clock_generator_0_wb_systemclk;
    wire        cpu_example_0_wb_system_to_clock_generator_0_wb_systemrst;
    // instruction_memory_0_slave_to_cpu_example_0_iaddr_o wires:
    wire [7:0]  instruction_memory_0_slave_to_cpu_example_0_iaddr_oaddress;
    wire [27:0] instruction_memory_0_slave_to_cpu_example_0_iaddr_oread_data;
    // cpu_example_0_local_data_to_data_memory_0_slave wires:
    wire [9:0]  cpu_example_0_local_data_to_data_memory_0_slaveaddress;
    wire [31:0] cpu_example_0_local_data_to_data_memory_0_slaveread_data;
    wire        cpu_example_0_local_data_to_data_memory_0_slavewrite;
    wire [31:0] cpu_example_0_local_data_to_data_memory_0_slavewrite_data;
    // spi_slave_0_slave_if_to_cpu_example_0_spi_master wires:
    wire        spi_slave_0_slave_if_to_cpu_example_0_spi_masterMISO;
    wire        spi_slave_0_slave_if_to_cpu_example_0_spi_masterMOSI;
    wire        spi_slave_0_slave_if_to_cpu_example_0_spi_masterSCLK;
    wire        spi_slave_0_slave_if_to_cpu_example_0_spi_masterSS;

    // Ad-hoc wires:
    wire        spi_slave_0_rst_in_to_clock_generator_0_rst_o;
    wire        clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    wire        clock_generator_0_rst_o_to_cpu_example_0_rst_i;
    wire        clock_generator_0_clk_o_to_cpu_example_0_clk_i;
    wire        clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    wire        clock_generator_0_rst_o_to_data_memory_0_rst_i;
    wire        data_memory_0_clk_i_to_clock_generator_0_clk_o;

    // clock_generator_0 port wires:
    wire        clock_generator_0_clk_o;
    wire        clock_generator_0_rst_o;
    // cpu_example_0 port wires:
    wire        cpu_example_0_clk_i;
    wire        cpu_example_0_clk_out;
    wire        cpu_example_0_data_in;
    wire        cpu_example_0_data_out;
    wire [7:0]  cpu_example_0_iaddr_o;
    wire [27:0] cpu_example_0_instruction_feed;
    wire [9:0]  cpu_example_0_local_address_o;
    wire [15:0] cpu_example_0_local_read_data;
    wire [15:0] cpu_example_0_local_write_data;
    wire        cpu_example_0_local_write_o;
    wire        cpu_example_0_rst_i;
    wire        cpu_example_0_slave_select_out;
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
    // spi_slave_0 port wires:
    wire        spi_slave_0_clk_in;
    wire        spi_slave_0_data_in;
    wire        spi_slave_0_data_out;
    wire        spi_slave_0_rst_in;
    wire        spi_slave_0_slave_select_in;

    // clock_generator_0 assignments:
    assign cpu_example_0_wb_system_to_clock_generator_0_wb_systemclk = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_cpu_example_0_clk_i = clock_generator_0_clk_o;
    assign clock_generator_0_clk_o_to_instruction_memory_0_clk_i = clock_generator_0_clk_o;
    assign data_memory_0_clk_i_to_clock_generator_0_clk_o = clock_generator_0_clk_o;
    assign clock_generator_0_rst_o_to_cpu_example_0_rst_i = clock_generator_0_rst_o;
    assign clock_generator_0_rst_o_to_data_memory_0_rst_i = clock_generator_0_rst_o;
    assign clock_generator_0_rst_o_to_instruction_memory_0_rst_i = clock_generator_0_rst_o;
    assign cpu_example_0_wb_system_to_clock_generator_0_wb_systemrst = clock_generator_0_rst_o;
    assign spi_slave_0_rst_in_to_clock_generator_0_rst_o = clock_generator_0_rst_o;
    // cpu_example_0 assignments:
    assign cpu_example_0_clk_i = cpu_example_0_wb_system_to_clock_generator_0_wb_systemclk;
    assign cpu_example_0_clk_i = clock_generator_0_clk_o_to_cpu_example_0_clk_i;
    assign spi_slave_0_slave_if_to_cpu_example_0_spi_masterSCLK = cpu_example_0_clk_out;
    assign cpu_example_0_data_in = spi_slave_0_slave_if_to_cpu_example_0_spi_masterMISO;
    assign spi_slave_0_slave_if_to_cpu_example_0_spi_masterMOSI = cpu_example_0_data_out;
    assign instruction_memory_0_slave_to_cpu_example_0_iaddr_oaddress[7:0] = cpu_example_0_iaddr_o[7:0];
    assign cpu_example_0_instruction_feed[27:0] = instruction_memory_0_slave_to_cpu_example_0_iaddr_oread_data[27:0];
    assign cpu_example_0_local_data_to_data_memory_0_slaveaddress[9:0] = cpu_example_0_local_address_o[9:0];
    assign cpu_example_0_local_read_data[15:0] = cpu_example_0_local_data_to_data_memory_0_slaveread_data[15:0];
    assign cpu_example_0_local_data_to_data_memory_0_slavewrite_data[15:0] = cpu_example_0_local_write_data[15:0];
    assign cpu_example_0_local_data_to_data_memory_0_slavewrite = cpu_example_0_local_write_o;
    assign cpu_example_0_rst_i = clock_generator_0_rst_o_to_cpu_example_0_rst_i;
    assign cpu_example_0_rst_i = cpu_example_0_wb_system_to_clock_generator_0_wb_systemrst;
    assign spi_slave_0_slave_if_to_cpu_example_0_spi_masterSS = cpu_example_0_slave_select_out;
    // data_memory_0 assignments:
    assign data_memory_0_adr_i[8:0] = cpu_example_0_local_data_to_data_memory_0_slaveaddress[8:0];
    assign data_memory_0_clk_i = data_memory_0_clk_i_to_clock_generator_0_clk_o;
    assign cpu_example_0_local_data_to_data_memory_0_slaveread_data[31:0] = data_memory_0_read_data[31:0];
    assign data_memory_0_rst_i = clock_generator_0_rst_o_to_data_memory_0_rst_i;
    assign data_memory_0_write = cpu_example_0_local_data_to_data_memory_0_slavewrite;
    assign data_memory_0_write_data[31:0] = cpu_example_0_local_data_to_data_memory_0_slavewrite_data[31:0];
    // instruction_memory_0 assignments:
    assign instruction_memory_0_clk_i = clock_generator_0_clk_o_to_instruction_memory_0_clk_i;
    assign instruction_memory_0_iaddr_i[7:0] = instruction_memory_0_slave_to_cpu_example_0_iaddr_oaddress[7:0];
    assign instruction_memory_0_slave_to_cpu_example_0_iaddr_oread_data[27:0] = instruction_memory_0_instruction_feed[27:0];
    assign instruction_memory_0_rst_i = clock_generator_0_rst_o_to_instruction_memory_0_rst_i;
    // spi_slave_0 assignments:
    assign spi_slave_0_clk_in = spi_slave_0_slave_if_to_cpu_example_0_spi_masterSCLK;
    assign spi_slave_0_data_in = spi_slave_0_slave_if_to_cpu_example_0_spi_masterMOSI;
    assign spi_slave_0_slave_if_to_cpu_example_0_spi_masterMISO = spi_slave_0_data_out;
    assign spi_slave_0_rst_in = spi_slave_0_rst_in_to_clock_generator_0_rst_o;
    assign spi_slave_0_slave_select_in = spi_slave_0_slave_if_to_cpu_example_0_spi_masterSS;

    // IP-XACT VLNV: tut.fi:other.test:clock_generator:1.1
    clock_generator clock_generator_0(
        // Interface: wb_system
        .clk_o               (clock_generator_0_clk_o),
        .rst_o               (clock_generator_0_rst_o));

    // IP-XACT VLNV: tut.fi:cpu.structure:cpu_example:1.0
    cpu_example_0 #(
        .ADDR_WIDTH          (10),
        .DATA_WIDTH          (16),
        .SUPPORTED_MEMORY    (1024),
        .INSTRUCTION_WIDTH   (28),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    cpu_example_0(
        // Interface: instructions
        .instruction_feed    (cpu_example_0_instruction_feed),
        .iaddr_o             (cpu_example_0_iaddr_o),
        // Interface: local_data
        .local_read_data     (cpu_example_0_local_read_data),
        .local_address_o     (cpu_example_0_local_address_o),
        .local_write_data    (cpu_example_0_local_write_data),
        .local_write_o       (cpu_example_0_local_write_o),
        // Interface: spi_master
        .data_in             (cpu_example_0_data_in),
        .clk_out             (cpu_example_0_clk_out),
        .data_out            (cpu_example_0_data_out),
        .slave_select_out    (cpu_example_0_slave_select_out),
        // Interface: wb_system
        .clk_i               (cpu_example_0_clk_i),
        .rst_i               (cpu_example_0_rst_i));

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

    // IP-XACT VLNV: tut.fi:communication.template:spi_slave:1.0
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
