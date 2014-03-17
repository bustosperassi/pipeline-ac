`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:55:53 03/17/2014
// Design Name:   debug_unit
// Module Name:   /home/nico/pipeline-ac/pipeline/debug_unit_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debug_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debug_unit_test;

	// Inputs
	reg top_clk;
	reg rst;
	reg rx_done_tick;
	reg [7:0] rx_bus;
	reg tx_done_tick;
	reg [31:0] instruccion;
	reg [6:0] pc;
	reg [38:0] if_id;
	reg [126:0] id_ex;
	reg [71:0] ex_m;
	reg [70:0] m_wb;
	reg [1023:0] registers;
	reg [31:0] data;

	// Outputs
	wire clk_pipe;
	wire alter_mux;
	wire alter_clk;
	wire [4:0] alter_address;
	wire rst_pipe;
	wire tx_start;
	wire [7:0] tx_bus;

	// Instantiate the Unit Under Test (UUT)
	debug_unit uut (
		.top_clk(top_clk), 
		.rst(rst), 
		.rx_done_tick(rx_done_tick), 
		.rx_bus(rx_bus), 
		.tx_done_tick(tx_done_tick), 
		.instruccion(instruccion), 
		.pc(pc), 
		.if_id(if_id), 
		.id_ex(id_ex), 
		.ex_m(ex_m), 
		.m_wb(m_wb), 
		.registers(registers), 
		.data(data), 
		.clk_pipe(clk_pipe), 
		.alter_mux(alter_mux), 
		.alter_clk(alter_clk), 
		.alter_address(alter_address), 
		.rst_pipe(rst_pipe), 
		.tx_start(tx_start), 
		.tx_bus(tx_bus)
	);

	initial begin
		// Initialize Inputs
		top_clk = 0;
		rst = 0;
		rx_done_tick = 0;
		rx_bus = 0;
		tx_done_tick = 0;
		instruccion = 0;
		pc = 0;
		if_id = 0;
		id_ex = 0;
		ex_m = 0;
		m_wb = 0;
		registers = 0;
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

