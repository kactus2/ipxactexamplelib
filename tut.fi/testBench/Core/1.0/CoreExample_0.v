//-----------------------------------------------------------------------------
// File          : CoreExample_0.v
// Creation date : 03.04.2017
// Creation time : 16:25:14
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.24 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:core:CoreExample:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/core/CoreExample/1.0/CoreExample.1.0.xml
//-----------------------------------------------------------------------------

module CoreExample_0 #(
    parameter                              DATA_WIDTH       = 32,    // Width for data in registers and instructions.
    parameter                              REGISTER_ID_WIDTH = 3,    // Bits reserved for identification a single register.
    parameter                              ADDR_WIDTH       = 9,    // Width of the addresses.
    parameter                              SUPPORTED_MEMORY = 512,    // How much the system supports memory in total.
    parameter                              REGISTER_COUNT   = 8,    // How many registers are supported in the core.
    parameter                              PERIPHERAL_BASE  = 128,    // The first address for peripherals.
    parameter                              OP_CODE_WIDTH    = 3    // Bits reserved for operation identifiers.
) (
    // Interface: mem_control
    input          [31:0]               mem_data_i,
    input                               mem_slave_rdy,
    output         [8:0]                mem_address_o,
    output         [31:0]               mem_data_o,
    output                              mem_master_rdy,
    output                              mem_we_o,

    // These ports are not in any interface
    input                               clk_i,    // The mandatory clock, as this is synchronous logic.
    input          [31:0]               instruction_feed,
    input                               rst_i,    // The mandatory reset, as this is synchronous logic.
    output         [31:0]               new_value
);

    // memory_controller_cpu_system_to_alu_cpu_system wires:
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemaddress;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemalu_active;
    wire [1:0]  memory_controller_cpu_system_to_alu_cpu_systemalu_operation;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemalu_result;
    wire [2:0]  memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1;
    wire [2:0]  memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2;
    wire [32:0] memory_controller_cpu_system_to_alu_cpu_systemliteral;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemload_value;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_active;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_rdy;
    wire        memory_controller_cpu_system_to_alu_cpu_systemmem_we;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemregister_value_1;
    wire [31:0] memory_controller_cpu_system_to_alu_cpu_systemregister_value_2;
    // clock_0_cpu_clk_source_to_register_bank_cpu_clk_sink wires:
    wire        clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    wire        clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    // memory_controller_memory_interface_to_mem_control wires:
    wire [8:0]  memory_controller_memory_interface_to_mem_controladdress;
    wire [31:0] memory_controller_memory_interface_to_mem_controldata_ms;
    wire [31:0] memory_controller_memory_interface_to_mem_controldata_sm;
    wire        memory_controller_memory_interface_to_mem_controlmaster_rdy;
    wire        memory_controller_memory_interface_to_mem_controlslave_rdy;
    wire        memory_controller_memory_interface_to_mem_controlwe;

    // Ad-hoc wires:
    wire [31:0] instruction_decoder_instruction_feed_to_instruction_feed;
    wire        clock_0_clk_i_to_clk_i;
    wire        clock_0_rst_i_to_rst_i;
    wire [31:0] register_bank_new_value_to_new_value;

    // alu port wires:
    wire        alu_alu_active_i;
    wire [1:0]  alu_alu_op_i;
    wire [31:0] alu_alu_result_o;
    wire [31:0] alu_register_value1_i;
    wire [31:0] alu_register_value2_i;
    // clock_0 port wires:
    wire        clock_0_clk_i;
    wire        clock_0_clk_o;
    wire        clock_0_rst_i;
    wire        clock_0_rst_o;
    // instruction_decoder port wires:
    wire        instruction_decoder_alu_active_o;
    wire [1:0]  instruction_decoder_alu_op_o;
    wire [2:0]  instruction_decoder_choose_reg1_o;
    wire [2:0]  instruction_decoder_choose_reg2_o;
    wire        instruction_decoder_clk_i;
    wire [31:0] instruction_decoder_instruction_feed;
    wire [32:0] instruction_decoder_literal_o;
    wire        instruction_decoder_mem_active_o;
    wire        instruction_decoder_mem_rdy_i;
    wire        instruction_decoder_rst_i;
    wire        instruction_decoder_we_o;
    // memory_controller port wires:
    wire [8:0]  memory_controller_address_i;
    wire        memory_controller_clk_i;
    wire [31:0] memory_controller_load_value_o;
    wire        memory_controller_mem_active_i;
    wire [8:0]  memory_controller_mem_address_o;
    wire [31:0] memory_controller_mem_data_i;
    wire [31:0] memory_controller_mem_data_o;
    wire        memory_controller_mem_master_rdy;
    wire        memory_controller_mem_rdy_o;
    wire        memory_controller_mem_slave_rdy;
    wire        memory_controller_mem_we_o;
    wire [31:0] memory_controller_register_value_i;
    wire        memory_controller_rst_i;
    wire        memory_controller_we_i;
    // register_bank port wires:
    wire [31:0] register_bank_alu_active_i;
    wire [31:0] register_bank_alu_result_i;
    wire [2:0]  register_bank_choose_register_i1;
    wire [2:0]  register_bank_choose_register_i2;
    wire        register_bank_clk_i;
    wire [32:0] register_bank_literal_i;
    wire [31:0] register_bank_load_value_i;
    wire        register_bank_mem_active_i;
    wire        register_bank_mem_rdy_i;
    wire [31:0] register_bank_new_value;
    wire [31:0] register_bank_register_value1;
    wire [31:0] register_bank_register_value2;
    wire        register_bank_rst_i;
    wire        register_bank_we_i;

    // Assignments for the ports of the encompassing component:
    assign clock_0_clk_i_to_clk_i = clk_i;
    assign instruction_decoder_instruction_feed_to_instruction_feed[31:0] = instruction_feed[31:0];
    assign mem_address_o[8:0] = memory_controller_memory_interface_to_mem_controladdress[8:0];
    assign memory_controller_memory_interface_to_mem_controldata_sm[31:0] = mem_data_i[31:0];
    assign mem_data_o[31:0] = memory_controller_memory_interface_to_mem_controldata_ms[31:0];
    assign mem_master_rdy = memory_controller_memory_interface_to_mem_controlmaster_rdy;
    assign memory_controller_memory_interface_to_mem_controlslave_rdy = mem_slave_rdy;
    assign mem_we_o = memory_controller_memory_interface_to_mem_controlwe;
    assign new_value[31:0] = register_bank_new_value_to_new_value[31:0];
    assign clock_0_rst_i_to_rst_i = rst_i;

    // alu assignments:
    assign alu_alu_active_i = memory_controller_cpu_system_to_alu_cpu_systemalu_active[0];
    assign alu_alu_op_i[1:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_operation[1:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_result[31:0] = alu_alu_result_o[31:0];
    assign alu_register_value1_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_value_1[31:0];
    assign alu_register_value2_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_value_2[31:0];
    // clock_0 assignments:
    assign clock_0_clk_i = clock_0_clk_i_to_clk_i;
    assign clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkclk = clock_0_clk_o;
    assign clock_0_rst_i = clock_0_rst_i_to_rst_i;
    assign clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkrst = clock_0_rst_o;
    // instruction_decoder assignments:
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_active[0] = instruction_decoder_alu_active_o;
    assign memory_controller_cpu_system_to_alu_cpu_systemalu_operation[1:0] = instruction_decoder_alu_op_o[1:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1[2:0] = instruction_decoder_choose_reg1_o[2:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2[2:0] = instruction_decoder_choose_reg2_o[2:0];
    assign instruction_decoder_clk_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign instruction_decoder_instruction_feed[31:0] = instruction_decoder_instruction_feed_to_instruction_feed[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemliteral[32:0] = instruction_decoder_literal_o[32:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_active = instruction_decoder_mem_active_o;
    assign instruction_decoder_mem_rdy_i = memory_controller_cpu_system_to_alu_cpu_systemmem_rdy;
    assign instruction_decoder_rst_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_we = instruction_decoder_we_o;
    // memory_controller assignments:
    assign memory_controller_address_i[8:0] = memory_controller_cpu_system_to_alu_cpu_systemaddress[8:0];
    assign memory_controller_clk_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign memory_controller_cpu_system_to_alu_cpu_systemload_value[31:0] = memory_controller_load_value_o[31:0];
    assign memory_controller_mem_active_i = memory_controller_cpu_system_to_alu_cpu_systemmem_active;
    assign memory_controller_memory_interface_to_mem_controladdress[8:0] = memory_controller_mem_address_o[8:0];
    assign memory_controller_mem_data_i[31:0] = memory_controller_memory_interface_to_mem_controldata_sm[31:0];
    assign memory_controller_memory_interface_to_mem_controldata_ms[31:0] = memory_controller_mem_data_o[31:0];
    assign memory_controller_memory_interface_to_mem_controlmaster_rdy = memory_controller_mem_master_rdy;
    assign memory_controller_cpu_system_to_alu_cpu_systemmem_rdy = memory_controller_mem_rdy_o;
    assign memory_controller_mem_slave_rdy = memory_controller_memory_interface_to_mem_controlslave_rdy;
    assign memory_controller_memory_interface_to_mem_controlwe = memory_controller_mem_we_o;
    assign memory_controller_register_value_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemregister_value_1[31:0];
    assign memory_controller_rst_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    assign memory_controller_we_i = memory_controller_cpu_system_to_alu_cpu_systemmem_we;
    // register_bank assignments:
    assign register_bank_alu_active_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_active[31:0];
    assign register_bank_alu_result_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemalu_result[31:0];
    assign register_bank_choose_register_i1[2:0] = memory_controller_cpu_system_to_alu_cpu_systemchoose_register_1[2:0];
    assign register_bank_choose_register_i2[2:0] = memory_controller_cpu_system_to_alu_cpu_systemchoose_register_2[2:0];
    assign register_bank_clk_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkclk;
    assign register_bank_literal_i[32:0] = memory_controller_cpu_system_to_alu_cpu_systemliteral[32:0];
    assign register_bank_load_value_i[31:0] = memory_controller_cpu_system_to_alu_cpu_systemload_value[31:0];
    assign register_bank_mem_active_i = memory_controller_cpu_system_to_alu_cpu_systemmem_active;
    assign register_bank_mem_rdy_i = memory_controller_cpu_system_to_alu_cpu_systemmem_rdy;
    assign register_bank_new_value_to_new_value[31:0] = register_bank_new_value[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_value_1[31:0] = register_bank_register_value1[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemaddress[31:0] = register_bank_register_value2[31:0];
    assign memory_controller_cpu_system_to_alu_cpu_systemregister_value_2[31:0] = register_bank_register_value2[31:0];
    assign register_bank_rst_i = clock_0_cpu_clk_source_to_register_bank_cpu_clk_sinkrst;
    assign register_bank_we_i = memory_controller_cpu_system_to_alu_cpu_systemmem_we;

    // IP-XACT VLNV: tut.fi:core:alu:1.0
    alu #(
        .DATA_WIDTH          (32))
    alu(
        // Interface: cpu_system
        .alu_active_i        (alu_alu_active_i),
        .alu_op_i            (alu_alu_op_i),
        .register_value1_i   (alu_register_value1_i),
        .register_value2_i   (alu_register_value2_i),
        .alu_result_o        (alu_alu_result_o));

    // IP-XACT VLNV: tut.fi:core:clock:1.0
    clock #(
        .SCALE               (1))
    clock_0(
        // Interface: cpu_clk_source
        .clk_o               (clock_0_clk_o),
        .rst_o               (clock_0_rst_o),
        // These ports are not in any interface
        .clk_i               (clock_0_clk_i),
        .rst_i               (clock_0_rst_i));

    // IP-XACT VLNV: tut.fi:core:instruction_decoder:1.0
    instruction_decoder #(
        .REGISTER_ID_WIDTH   (3),
        .DATA_WIDTH          (32))
    instruction_decoder(
        // Interface: cpu_clk_sink
        .clk_i               (instruction_decoder_clk_i),
        .rst_i               (instruction_decoder_rst_i),
        // Interface: cpu_system
        .mem_rdy_i           (instruction_decoder_mem_rdy_i),
        .alu_active_o        (instruction_decoder_alu_active_o),
        .alu_op_o            (instruction_decoder_alu_op_o),
        .choose_reg1_o       (instruction_decoder_choose_reg1_o),
        .choose_reg2_o       (instruction_decoder_choose_reg2_o),
        .literal_o           (instruction_decoder_literal_o),
        .mem_active_o        (instruction_decoder_mem_active_o),
        .we_o                (instruction_decoder_we_o),
        // These ports are not in any interface
        .instruction_feed    (instruction_decoder_instruction_feed));

    // IP-XACT VLNV: tut.fi:core:memory_controller:1.0
    memory_controller #(
        .DATA_WIDTH          (32),
        .ADDR_WIDTH          (9),
        .MEMORY_SIZE         (512),
        .PERIPHERAL_BASE     (128))
    memory_controller(
        // Interface: cpu_clk_sink
        .clk_i               (memory_controller_clk_i),
        .rst_i               (memory_controller_rst_i),
        // Interface: cpu_system
        .address_i           (memory_controller_address_i),
        .mem_active_i        (memory_controller_mem_active_i),
        .register_value_i    (memory_controller_register_value_i),
        .we_i                (memory_controller_we_i),
        .load_value_o        (memory_controller_load_value_o),
        .mem_rdy_o           (memory_controller_mem_rdy_o),
        // Interface: memory_interface
        .mem_data_i          (memory_controller_mem_data_i),
        .mem_slave_rdy       (memory_controller_mem_slave_rdy),
        .mem_address_o       (memory_controller_mem_address_o),
        .mem_data_o          (memory_controller_mem_data_o),
        .mem_master_rdy      (memory_controller_mem_master_rdy),
        .mem_we_o            (memory_controller_mem_we_o));

    // IP-XACT VLNV: tut.fi:core:register_bank:1.0
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
        .literal_i           (register_bank_literal_i),
        .load_value_i        (register_bank_load_value_i),
        .mem_active_i        (register_bank_mem_active_i),
        .mem_rdy_i           (register_bank_mem_rdy_i),
        .we_i                (register_bank_we_i),
        .register_value1     (register_bank_register_value1),
        .register_value2     (register_bank_register_value2),
        // These ports are not in any interface
        .new_value           (register_bank_new_value));


endmodule
