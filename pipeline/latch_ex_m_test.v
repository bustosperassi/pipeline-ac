`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:42 04/11/2014
// Design Name:   latch_ex_m
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_ex_m_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_ex_m
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_ex_m_test;

	// Inputs
	reg mem_to_reg;
	reg reg_write;
	reg mem_write;
	reg [31:0] alu_result;
	reg [31:0] data2;
	reg [4:0] dst;
	reg clk;
	reg rst;

	// Outputs
	wire mem_to_reg_reg;
	wire reg_write_reg;
	wire mem_write_reg;
	wire [31:0] alu_result_reg;
	wire [31:0] data2_reg;
	wire [4:0] dst_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_ex_m uut (
		.mem_to_reg(mem_to_reg), 
		.reg_write(reg_write), 
		.mem_write(mem_write), 
		.alu_result(alu_result), 
		.data2(data2), 
		.dst(dst), 
		.clk(clk), 
		.rst(rst), 
		.mem_to_reg_reg(mem_to_reg_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_write_reg(mem_write_reg), 
		.alu_result_reg(alu_result_reg), 
		.data2_reg(data2_reg), 
		.dst_reg(dst_reg)
	);

	initial begin
		// Initialize Inputs
		mem_to_reg = 0;
		reg_write = 0;
		mem_write = 0;
		alu_result = 0;
		data2 = 0;
		dst = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		mem_to_reg = 1;
		reg_write = 1;
		mem_write = 1;
		alu_result = 1;
		data2 = 1;
		dst = 1;
		clk = 1;
		rst = 0;

		#100;
		clk = 0;
		#100;
		mem_to_reg = 0;
		reg_write = 0;
		mem_write = 0;
		alu_result = 0;
		data2 = 0;
		dst = 0;
		clk = 1;
		rst = 0;
		#100;
		clk = 0;
		
		// Add stimulus here

	end
      
endmodule

