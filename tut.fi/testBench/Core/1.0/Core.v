//-----------------------------------------------------------------------------
// File          : Core.v
// Creation date : 05.04.2017
// Creation time : 11:32:35
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.27 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:Core:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/Core/1.0/Core.1.0.xml
//-----------------------------------------------------------------------------

module Core();

    // Ad-hoc wires:
    wire        Core_tb_0_rst_o_to_CoreExample_0_rst_i;
    wire        CoreExample_0_clk_i_to_Core_tb_0_clk_o;
    wire [31:0] Core_tb_0_new_value_to_CoreExample_0_new_value;
    wire [27:0] Core_tb_0_instruction_feed_to_CoreExample_0_instruction_feed;

    // CoreExample_0 port wires:
    wire        CoreExample_0_clk_i;
    wire [27:0] CoreExample_0_instruction_feed;
    wire [31:0] CoreExample_0_new_value;
    wire        CoreExample_0_rst_i;
    // Core_tb_0 port wires:
    wire        Core_tb_0_clk_o;
    wire [27:0] Core_tb_0_instruction_feed;
    wire [31:0] Core_tb_0_new_value;
    wire        Core_tb_0_rst_o;

    // CoreExample_0 assignments:
    assign CoreExample_0_clk_i = CoreExample_0_clk_i_to_Core_tb_0_clk_o;
    assign CoreExample_0_instruction_feed[27:0] = Core_tb_0_instruction_feed_to_CoreExample_0_instruction_feed[27:0];
    assign Core_tb_0_new_value_to_CoreExample_0_new_value[31:0] = CoreExample_0_new_value[31:0];
    assign CoreExample_0_rst_i = Core_tb_0_rst_o_to_CoreExample_0_rst_i;
    // Core_tb_0 assignments:
    assign CoreExample_0_clk_i_to_Core_tb_0_clk_o = Core_tb_0_clk_o;
    assign Core_tb_0_instruction_feed_to_CoreExample_0_instruction_feed[27:0] = Core_tb_0_instruction_feed[27:0];
    assign Core_tb_0_new_value[31:0] = Core_tb_0_new_value_to_CoreExample_0_new_value[31:0];
    assign Core_tb_0_rst_o_to_CoreExample_0_rst_i = Core_tb_0_rst_o;

    // IP-XACT VLNV: tut.fi:core:CoreExample:1.0
    CoreExample_0 #(
        .DATA_WIDTH          (32),
        .ADDR_WIDTH          (9),
        .SUPPORTED_MEMORY    (512),
        .PERIPHERAL_BASE     (128),
        .INSTRUCTION_WIDTH   (28))
    CoreExample_0(
        // Interface: mem_control
        .mem_data_i          (0),
        .mem_slave_rdy       (0),
        .mem_address_o       (),
        .mem_data_o          (),
        .mem_master_rdy      (),
        .mem_we_o            (),
        // These ports are not in any interface
        .clk_i               (CoreExample_0_clk_i),
        .instruction_feed    (CoreExample_0_instruction_feed),
        .rst_i               (CoreExample_0_rst_i),
        .new_value           (CoreExample_0_new_value));

    // IP-XACT VLNV: tut.fi:testBench:Core_tb:1.0
    Core_tb #(
        .DATA_WIDTH          (32),
        .INSTRUCTION_WIDTH   (28))
    Core_tb_0(
        // These ports are not in any interface
        .new_value           (Core_tb_0_new_value),
        .clk_o               (Core_tb_0_clk_o),
        .instruction_feed    (Core_tb_0_instruction_feed),
        .rst_o               (Core_tb_0_rst_o));


endmodule
