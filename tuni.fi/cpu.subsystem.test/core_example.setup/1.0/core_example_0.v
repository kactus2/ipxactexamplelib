//-----------------------------------------------------------------------------
// File          : core_example_0.v
// Creation date : 28.11.2017
// Creation time : 12:45:33
// Description   : Test arrangement for the example CPU with data memory, instuction memory, clock source, and SPI slave.
// Created by    : TermosPullo
// Tool : Kactus2 3.4.1184 32-bit
// Plugin : Verilog generator 2.1
// This file was generated based on IP-XACT component tut.fi:cpu.subsystem:core_example:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/cpu.subsystem/core_example/1.0/core_example.1.0.xml
//-----------------------------------------------------------------------------

module core_example_0 #(
    parameter                              ADDR_WIDTH       = 9,    // Width of the addresses.
    parameter                              DATA_WIDTH       = 32,    // Width for data in registers and instructions.
    parameter                              INSTRUCTION_ADDRESS_WIDTH = 8,    // Width of an instruction address.
    parameter                              INSTRUCTION_WIDTH = 28,    // Total width of an instruction
    parameter                              OP_CODE_WIDTH    = 4,    // Bits reserved for operation identifiers.
    parameter                              PERIPHERAL_BASE  = 128,    // The first address for peripherals.
    parameter                              REGISTER_COUNT   = 8,    // How many registers are supported in the core.
    parameter                              REGISTER_ID_WIDTH = 3,    // Bits reserved for identification a single register.
    parameter                              SUPPORTED_MEMORY = 512    // How much the system supports memory in total.
) (
    // Interface: instructions
    input          [27:0]               instruction_feed,
    output         [7:0]                iaddr_o,

    // Interface: local_data
    input          [31:0]               local_read_data,
    output         [8:0]                local_address_o,
    output         [31:0]               local_write_data,
    output                              local_write_o,

    // Interface: peripheral_access
    input          [31:0]               mem_data_i,
    input                               mem_slave_rdy,
    output         [8:0]                mem_address_o,
    output         [31:0]               mem_data_o,
    output                              mem_master_rdy,
    output                              mem_we_o,

    // These ports are not in any interface
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input                               rst_i    // The mandatory reset, as this is synchronous logic.
);

    // memory_controller_cpu_system_to_alu_cpu_system wires:
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemaddress;
    wire        memory_controller_cpu_system_to_alu_cpu_systemalu_active;
    wire [2:0]  memory_controller_cpu_system_to_alu_cpu_systemalu_operation;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemalu_result;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemalu_status;
    wire [2:0]  memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1;
    wire [2:0]  memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemload_value;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_active;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_rdy;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_read_rdy;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_we;
    wire        memory_controller_cpu_system_to_alu_cpu_systemregister_active;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemregister_input;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemregister_output_1;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemregister_output_2;
    // clock_cpu_clk_source_to_register_bank_cpu_clk_sink wires:
    wire        clock_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    wire        clock_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    // memory_controller_peripheral_access_to_peripheral_access wires:
    wire [8:0]  memory_controller_peripheral_access_to_peripheral_accessaddress;
    wire [31:0] memory_controller_peripheral_access_to_peripheral_accessdata_ms;
    wire [31:0] memory_controller_peripheral_access_to_peripheral_accessdata_sm;
    wire        memory_controller_peripheral_access_to_peripheral_accessmaster_rdy;
    wire        memory_controller_peripheral_access_to_peripheral_accessslave_rdy;
    wire        memory_controller_peripheral_access_to_peripheral_accesswe;
    // instruction_decoder_instruction_feed_to_instructions wires:
    wire [7:0]  instruction_decoder_instruction_feed_to_instructionsaddress;
    wire [27:0] instruction_decoder_instruction_feed_to_instructionsread_data;
    // memory_controller_local_data_to_local_data wires:
    wire [8:0]  memory_controller_local_data_to_local_dataaddress;
    wire [31:0] memory_controller_local_data_to_local_dataread_data;
    wire        memory_controller_local_data_to_local_datawrite;
    wire [31:0] memory_controller_local_data_to_local_datawrite_data;

    // Ad-hoc wires:
    wire        clock_clk_i_to_clk_i;
    wire        clock_rst_i_to_rst_i;

    // alu port wires:
    wire [2:0]  alu_alu_op_i;
    wire [31:0] alu_alu_result_o;
    wire [31:0] alu_alu_status_o;
    wire [31:0] alu_register_value_i1;
    wire [31:0] alu_register_value_i2;
    // clock port wires:
    wire        clock_clk_i;
    wire        clock_clk_o;
    wire        clock_rst_i;
    wire        clock_rst_o;
    // instruction_decoder port wires:
    wire        instruction_decoder_alu_active_o;
    wire [2:0]  instruction_decoder_alu_op_o;
    wire [31:0] instruction_decoder_alu_status_i;
    wire [2:0]  instruction_decoder_choose_reg1_o;
    wire [2:0]  instruction_decoder_choose_reg2_o;
    wire        instruction_decoder_clk_i;
    wire [7:0]  instruction_decoder_iaddr_o;
    wire [27:0] instruction_decoder_instruction_feed;
    wire [31:0] instruction_decoder_load_value_i;
    wire        instruction_decoder_mem_active_o;
    wire        instruction_decoder_mem_rdy_i;
    wire        instruction_decoder_register_active_o;
    wire [31:0] instruction_decoder_register_value_o;
    wire        instruction_decoder_rst_i;
    wire        instruction_decoder_we_o;
    // memory_controller port wires:
    wire        memory_controller_clk_i;
    wire [8:0]  memory_controller_local_address_o;
    wire [31:0] memory_controller_local_read_data;
    wire [31:0] memory_controller_local_write_data;
    wire        memory_controller_local_write_o;
    wire [8:0]  memory_controller_periph_address_o;
    wire [31:0] memory_controller_periph_data_i;
    wire [31:0] memory_controller_periph_data_o;
    wire        memory_controller_periph_master_rdy;
    wire        memory_controller_periph_slave_rdy;
    wire        memory_controller_periph_we_o;
    wire        memory_controller_rst_i;
    wire        memory_controller_sys_active_i;
    wire [8:0]  memory_controller_sys_address_i;
    wire [31:0] memory_controller_sys_data_i;
    wire [31:0] memory_controller_sys_data_o;
    wire        memory_controller_sys_rdy_o;
    wire        memory_controller_sys_read_rdy_o;
    wire        memory_controller_sys_we_i;
    // register_bank port wires:
    wire        register_bank_alu_active_i;
    wire [31:0] register_bank_alu_result_i;
    wire [2:0]  register_bank_choose_register_i1;
    wire [2:0]  register_bank_choose_register_i2;
    wire        register_bank_clk_i;
    wire [31:0] register_bank_load_value_i;
    wire        register_bank_mem_read_rdy_i;
    wire        register_bank_register_active_i;
    wire [31:0] register_bank_register_input;
    wire [31:0] register_bank_register_output1;
    wire [31:0] register_bank_register_output2;
    wire        register_bank_rst_i;

    // Assignments for the ports of the encompassing component:
    assign clock_clk_i_to_clk_i = clk_i;
    assign iaddr_o[7:0] = instruction_decoder_instruction_feed_to_instructionsaddress[7:0];
    assign instruction_decoder_instruction_feed_to_instructionsread_data[27:0] = instruction_feed[27:0];
    assign local_address_o[8:0] = memory_controller_local_data_to_local_dataaddress[8:0];
    assign memory_controller_local_data_to_local_dataread_data[31:0] = local_read_data[31:0];
    assign local_write_data[31:0] = memory_controller_local_data_to_local_datawrite_data[31:0];
    assign local_write_o = memory_controller_local_data_to_local_datawrite;
    assign mem_address_o[8:0] = memory_controller_peripheral_access_to_peripheral_accessaddress[8:0];
    assign memory_controller_peripheral_access_to_peripheral_accessdata_sm[31:0] = mem_data_i[31:0];
    assign mem_data_o[31:0] = memory_controller_peripheral_access_to_peripheral_accessdata_ms[31:0];
    assign mem_master_rdy = memory_controller_peripheral_access_to_peripheral_accessmaster_rdy;
    assign memory_controller_peripheral_access_to_peripheral_accessslave_rdy = mem_slave_rdy;
    assign mem_we_o = memory_controller_peripheral_access_to_peripheral_accesswe;
    assign clock_rst_i_to_rst_i = rst_i;

    // alu assignments:
    assign alu_alu_op_i[2:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_operation[2:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_result[31:0] = alu_alu_result_o[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_status[31:0] = alu_alu_status_o[31:0];
    assign alu_register_value_i1[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_output_1[31:0];
    assign alu_register_value_i2[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_output_2[31:0];
    // clock assignments:
    assign clock_clk_i = clock_clk_i_to_clk_i;
    assign clock_cpu_clk_source_to_register_bank_cpu_clk_sinkclk = clock_clk_o;
    assign clock_rst_i = clock_rst_i_to_rst_i;
    assign clock_cpu_clk_source_to_register_bank_cpu_clk_sinkrst = clock_rst_o;
    // instruction_decoder assignments:
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_active = instruction_decoder_alu_active_o;
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_operation[2:0] = instruction_decoder_alu_op_o[2:0];
    assign instruction_decoder_alu_status_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_status[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1[2:0] = instruction_decoder_choose_reg1_o[2:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2[2:0] = instruction_decoder_choose_reg2_o[2:0];
    assign instruction_decoder_clk_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign instruction_decoder_instruction_feed_to_instructionsaddress[7:0] = instruction_decoder_iaddr_o[7:0];
    assign instruction_decoder_instruction_feed[27:0] = instruction_decoder_instruction_feed_to_instructionsread_data[27:0];
    assign instruction_decoder_load_value_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemload_value[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_active = instruction_decoder_mem_active_o;
    assign instruction_decoder_mem_rdy_i = memory_controller_cpu_system_to_alu_cpu_systemmem_rdy;
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_active = instruction_decoder_register_active_o;
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_input[31:0] = instruction_decoder_register_value_o[31:0];
    assign instruction_decoder_rst_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_we = instruction_decoder_we_o;
    // memory_controller assignments:
    assign memory_controller_clk_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign memory_controller_local_data_to_local_dataaddress[8:0] = memory_controller_local_address_o[8:0];
    assign memory_controller_local_read_data[31:0] = memory_controller_local_data_to_local_dataread_data[31:0];
    assign memory_controller_local_data_to_local_datawrite_data[31:0] = memory_controller_local_write_data[31:0];
    assign memory_controller_local_data_to_local_datawrite = memory_controller_local_write_o;
    assign memory_controller_peripheral_access_to_peripheral_accessaddress[8:0] = memory_controller_periph_address_o[8:0];
    assign memory_controller_periph_data_i[31:0] = memory_controller_peripheral_access_to_peripheral_accessdata_sm[31:0];
    assign memory_controller_peripheral_access_to_peripheral_accessdata_ms[31:0] = memory_controller_periph_data_o[31:0];
    assign memory_controller_peripheral_access_to_peripheral_accessmaster_rdy = memory_controller_periph_master_rdy;
    assign memory_controller_periph_slave_rdy = memory_controller_peripheral_access_to_peripheral_accessslave_rdy;
    assign memory_controller_peripheral_access_to_peripheral_accesswe = memory_controller_periph_we_o;
    assign memory_controller_rst_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    assign memory_controller_sys_active_i = memory_controller_cpu_system_to_alu_cpu_systemmem_active;
    assign memory_controller_sys_address_i[8:0] = memory_controller_cpu_system_to_alu_cpu_systemaddress[8:0];
    assign memory_controller_sys_data_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_output_1[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemload_value[31:0] = memory_controller_sys_data_o[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_rdy = memory_controller_sys_rdy_o;
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_read_rdy = memory_controller_sys_read_rdy_o;
    assign memory_controller_sys_we_i = memory_controller_cpu_system_to_alu_cpu_systemmem_we;
    // register_bank assignments:
    assign register_bank_alu_active_i = memory_controller_cpu_system_to_alu_cpu_systemalu_active;
    assign register_bank_alu_result_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_result[31:0];
    assign register_bank_choose_register_i1[2:0] = memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1[2:0];
    assign register_bank_choose_register_i2[2:0] = memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2[2:0];
    assign register_bank_clk_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign register_bank_load_value_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemload_value[31:0];
    assign register_bank_mem_read_rdy_i = memory_controller_cpu_system_to_alu_cpu_systemmem_read_rdy;
    assign register_bank_register_active_i = memory_controller_cpu_system_to_alu_cpu_systemregister_active;
    assign register_bank_register_input[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_input[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_output_1[31:0] = register_bank_register_output1[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemaddress[31:0] = register_bank_register_output2[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_output_2[31:0] = register_bank_register_output2[31:0];
    assign register_bank_rst_i = clock_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;

    // IP-XACT VLNV: tut.fi:cpu.logic:alu:1.0
    alu #(
        .DATA_WIDTH          (32))
    alu(
        // Interface: cpu_system
        .alu_op_i            (alu_alu_op_i),
        .register_value_i1   (alu_register_value_i1),
        .register_value_i2   (alu_register_value_i2),
        .alu_result_o        (alu_alu_result_o),
        .alu_status_o        (alu_alu_status_o));

    // IP-XACT VLNV: tut.fi:cpu.logic:clock:1.0
    clock clock(
        // Interface: cpu_clk_source
        .clk_o               (clock_clk_o),
        .rst_o               (clock_rst_o),
        // These ports are not in any interface
        .clk_i               (clock_clk_i),
        .rst_i               (clock_rst_i));

    // IP-XACT VLNV: tut.fi:cpu.logic:instruction_decoder:1.0
    instruction_decoder #(
        .REGISTER_ID_WIDTH   (3),
        .INSTRUCTION_WIDTH   (28),
        .DATA_WIDTH          (32),
        .INSTRUCTION_ADDRESS_WIDTH(8))
    instruction_decoder(
        // Interface: cpu_clk_sink
        .clk_i               (instruction_decoder_clk_i),
        .rst_i               (instruction_decoder_rst_i),
        // Interface: cpu_system
        .alu_status_i        (instruction_decoder_alu_status_i),
        .load_value_i        (instruction_decoder_load_value_i),
        .mem_rdy_i           (instruction_decoder_mem_rdy_i),
        .alu_active_o        (instruction_decoder_alu_active_o),
        .alu_op_o            (instruction_decoder_alu_op_o),
        .choose_reg1_o       (instruction_decoder_choose_reg1_o),
        .choose_reg2_o       (instruction_decoder_choose_reg2_o),
        .mem_active_o        (instruction_decoder_mem_active_o),
        .register_active_o   (instruction_decoder_register_active_o),
        .register_value_o    (instruction_decoder_register_value_o),
        .we_o                (instruction_decoder_we_o),
        // Interface: instructions
        .instruction_feed    (instruction_decoder_instruction_feed),
        .iaddr_o             (instruction_decoder_iaddr_o));

    // IP-XACT VLNV: tut.fi:cpu.logic:memory_controller:1.0
    memory_controller #(
        .DATA_WIDTH          (32),
        .ADDR_WIDTH          (9),
        .MEMORY_SIZE         (512),
        .PERIPHERAL_BASE     (128),
        .REGISTER_COUNT      (8))
    memory_controller(
        // Interface: cpu_clk_sink
        .clk_i               (memory_controller_clk_i),
        .rst_i               (memory_controller_rst_i),
        // Interface: cpu_system
        .sys_active_i        (memory_controller_sys_active_i),
        .sys_address_i       (memory_controller_sys_address_i),
        .sys_data_i          (memory_controller_sys_data_i),
        .sys_we_i            (memory_controller_sys_we_i),
        .sys_data_o          (memory_controller_sys_data_o),
        .sys_rdy_o           (memory_controller_sys_rdy_o),
        .sys_read_rdy_o      (memory_controller_sys_read_rdy_o),
        // Interface: local_data
        .local_read_data     (memory_controller_local_read_data),
        .local_address_o     (memory_controller_local_address_o),
        .local_write_data    (memory_controller_local_write_data),
        .local_write_o       (memory_controller_local_write_o),
        // Interface: peripheral_access
        .periph_data_i       (memory_controller_periph_data_i),
        .periph_slave_rdy    (memory_controller_periph_slave_rdy),
        .periph_address_o    (memory_controller_periph_address_o),
        .periph_data_o       (memory_controller_periph_data_o),
        .periph_master_rdy   (memory_controller_periph_master_rdy),
        .periph_we_o         (memory_controller_periph_we_o));

    // IP-XACT VLNV: tut.fi:cpu.logic:register_bank:1.0
    register_bank #(
        .DATA_WIDTH          (32),
        .REGISTER_ID_WIDTH   (3),
        .REGISTER_COUNT      (8))
    register_bank(
        // Interface: cpu_clk_sink
        .clk_i               (register_bank_clk_i),
        .rst_i               (register_bank_rst_i),
        // Interface: cpu_system
        .alu_active_i        (register_bank_alu_active_i),
        .alu_result_i        (register_bank_alu_result_i),
        .choose_register_i1  (register_bank_choose_register_i1),
        .choose_register_i2  (register_bank_choose_register_i2),
        .load_value_i        (register_bank_load_value_i),
        .mem_read_rdy_i      (register_bank_mem_read_rdy_i),
        .register_active_i   (register_bank_register_active_i),
        .register_input      (register_bank_register_input),
        .register_output1    (register_bank_register_output1),
        .register_output2    (register_bank_register_output2));


endmodule
