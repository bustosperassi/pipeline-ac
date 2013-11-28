`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:05:58 11/28/2013
// Design Name:   latch_m
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_m_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_m
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_m_test;

	// Inputs
	reg clk;
	reg mem_write;
	reg mem_read;
	reg branch;

	// Outputs
	wire mem_write_reg;
	wire mem_read_reg;
	wire branch_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_m uut (
		.clk(clk), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.branch(branch), 
		.mem_write_reg(mem_write_reg), 
		.mem_read_reg(mem_read_reg), 
		.branch_reg(branch_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		mem_write = 0;
		mem_read = 0;
		branch = 0;

		// Wait 100 ns for global reset to finish
		clk = 0;
		mem_write = 1;
		mem_read = 1;
		branch = 1;
		#100;
		clk = 1;
		#100;
		clk = 0;
		mem_write = 0;
		mem_read = 0;
		branch = 0;
		#100;
		clk = 1;
		#100;

	end
      
endmodule

