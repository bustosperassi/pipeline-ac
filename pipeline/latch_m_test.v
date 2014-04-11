`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:36 04/11/2014
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
	reg rst;
	reg mem_write;

	// Outputs
	wire mem_write_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_m uut (
		.clk(clk), 
		.rst(rst), 
		.mem_write(mem_write), 
		.mem_write_reg(mem_write_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		mem_write = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 0;
		
		#100;
		mem_write = 1;
		clk = 1;
		#100;
		clk = 0;
        
		// Add stimulus here

	end
      
endmodule

