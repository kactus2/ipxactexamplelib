//-----------------------------------------------------------------------------
// File          : MemoryExample.v
// Creation date : 07.04.2017
// Creation time : 14:55:19
// Description   : 
// Created by    : TermosPullo
// Tool : Kactus2 3.4.19 32-bit
// Plugin : Verilog generator 2.0d
// This file was generated based on IP-XACT component tut.fi:testBench:MemoryExample:1.0
// whose XML file is D:/kactus2Repos/ipxactexamplelib/tut.fi/testBench/MemoryExample/1.0/MemoryExample.1.0.xml
//-----------------------------------------------------------------------------

module MemoryExample();

    // Memory_tb_0_wb_system_to_MemoryExample_0_wb_system wires:
    wire        Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk;
    wire        Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst;

    // Ad-hoc wires:
    wire [27:0] MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed;
    wire        Memory_tb_0_rst_o_to_MemoryExample_0_rst_i;
    wire        MemoryExample_0_clk_i_to_Memory_tb_0_clk_o;
    wire        MemoryExample_0_stall_o_to_Memory_tb_0_stall_i;

    // MemoryExample_0 port wires:
    wire        MemoryExample_0_clk_i;
    wire [27:0] MemoryExample_0_instruction_feed;
    wire        MemoryExample_0_rst_i;
    wire        MemoryExample_0_stall_o;
    // Memory_tb_0 port wires:
    wire        Memory_tb_0_clk_o;
    wire [27:0] Memory_tb_0_instruction_feed;
    wire        Memory_tb_0_rst_o;
    wire        Memory_tb_0_stall_i;

    // MemoryExample_0 assignments:
    assign MemoryExample_0_clk_i = MemoryExample_0_clk_i_to_Memory_tb_0_clk_o;
    assign MemoryExample_0_clk_i = Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk;
    assign MemoryExample_0_instruction_feed[27:0] = MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed[27:0];
    assign MemoryExample_0_rst_i = Memory_tb_0_rst_o_to_MemoryExample_0_rst_i;
    assign MemoryExample_0_rst_i = Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst;
    assign MemoryExample_0_stall_o_to_Memory_tb_0_stall_i = MemoryExample_0_stall_o;
    // Memory_tb_0 assignments:
    assign MemoryExample_0_clk_i_to_Memory_tb_0_clk_o = Memory_tb_0_clk_o;
    assign Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemclk = Memory_tb_0_clk_o;
    assign MemoryExample_0_instruction_feed_to_Memory_tb_0_instruction_feed[27:0] = Memory_tb_0_instruction_feed[27:0];
    assign Memory_tb_0_rst_o_to_MemoryExample_0_rst_i = Memory_tb_0_rst_o;
    assign Memory_tb_0_wb_system_to_MemoryExample_0_wb_systemrst = Memory_tb_0_rst_o;
    assign Memory_tb_0_stall_i = MemoryExample_0_stall_o_to_Memory_tb_0_stall_i;

    // IP-XACT VLNV: tut.fi:processor:MemoryExample:1.0
    MemoryExample_0     MemoryExample_0(
        // Interface: wb_system
        .clk_i               (MemoryExample_0_clk_i),
        .rst_i               (MemoryExample_0_rst_i),
        // These ports are not in any interface
        .ext_data_i          (0),
        .instruction_feed    (MemoryExample_0_instruction_feed),
        .ext_data_o          (),
        .stall_o             (MemoryExample_0_stall_o));

    // IP-XACT VLNV: tut.fi:testBench:Memory_tb:1.0
    Memory_tb #(
        .DATA_WIDTH          (32),
        .INSTRUCTION_WIDTH   (28))
    Memory_tb_0(
        // Interface: wb_system
        .clk_o               (Memory_tb_0_clk_o),
        .rst_o               (Memory_tb_0_rst_o),
        // These ports are not in any interface
        .stall_i             (Memory_tb_0_stall_i),
        .instruction_feed    (Memory_tb_0_instruction_feed));


endmodule
