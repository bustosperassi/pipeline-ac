`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:31:22 11/29/2013
// Design Name:   latch_m_wb
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_m_wb_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_m_wb
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_m_wb_test;

	// Inputs
	reg reg_write;
	reg mem_to_reg;
	reg [31:0] alu_result;
	reg [31:0] data_load;
	reg [4:0] dst;
	reg clk;

	// Outputs
	wire reg_write_reg;
	wire mem_to_reg_reg;
	wire [0:0] alu_result_reg;
	wire [0:0] data_load_reg;
	wire [0:0] dst_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_m_wb uut (
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.alu_result(alu_result), 
		.data_load(data_load), 
		.dst(dst), 
		.clk(clk), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg), 
		.alu_result_reg(alu_result_reg), 
		.data_load_reg(data_load_reg), 
		.dst_reg(dst_reg)
	);

	initial begin
		// Initialize Inputs
		reg_write = 0;
		mem_to_reg = 0;
		alu_result = 0;
		data_load = 0;
		dst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reg_write = 1;
		mem_to_reg = 1;
		alu_result = 1;
		data_load = 1;
		dst = 1;
		clk = 0;
		
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		reg_write = 0;
		mem_to_reg = 0;
		alu_result = 0;
		data_load = 0;
		dst = 0;
		clk = 0;
		
		#100;
		clk = 1;
		
		#100;
		clk = 0;
		
	end
      
endmodule

