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
	reg reg_write;
	reg mem_to_reg;

	// Outputs
	wire reg_write_reg;
	wire memto_reg_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_wb uut (
		.clk(clk), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write_reg(reg_write_reg), 
		.memto_reg_reg(memto_reg_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reg_write = 0;
		mem_to_reg = 0;

		// Wait 100 ns for global reset to finish
		clk = 0;
		reg_write = 1;
		mem_to_reg = 1;
		branch = 1;
		#100;
		clk = 1;
		#100;
		clk = 0;
		reg_write = 0;
		mem_to_reg = 0;
		branch = 0;
		#100;
		clk = 1;
		#100;
	end
      
endmodule

