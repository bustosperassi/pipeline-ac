`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:15:10 11/28/2013
// Design Name:   latch_wb
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_wb_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_wb
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_wb_test;

	// Inputs
	reg clk;
	reg rst;
	reg reg_write;
	reg mem_to_reg;

	// Outputs
	wire reg_write_reg;
	wire mem_to_reg_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_wb uut (
		.clk(clk),
		.rst(rst),
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		reg_write = 0;
		mem_to_reg = 0;
		
		#100;
		rst = 0;
		#100;

		// Wait 100 ns for global reset to finish
		clk = 0;
		reg_write = 1;
		mem_to_reg = 1;
		#100;
		clk = 1;
		#100;
		clk = 0;
		reg_write = 0;
		mem_to_reg = 0;
		#100;
		clk = 1;
		#100;
	end
      
endmodule

