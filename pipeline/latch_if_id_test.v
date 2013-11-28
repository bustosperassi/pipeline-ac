`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:02 11/28/2013
// Design Name:   latch_if_id
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_if_id_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_if_id
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_if_id_test;

	// Inputs
	reg clk;
	reg [7:0] next_pc;
	reg [31:0] instruction;

	// Outputs
	wire [7:0] next_pc_reg;
	wire [31:0] instruction_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_if_id uut (
		.clk(clk), 
		.next_pc(next_pc), 
		.instruction(instruction), 
		.next_pc_reg(next_pc_reg), 
		.instruction_reg(instruction_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		next_pc = 0;
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 0;
		next_pc = 1;
		instruction = 2;
		#100;
		clk = 1;
		#100;
		clk = 0;
		next_pc = 2;
		instruction = 4;
		#100;
		clk = 1;
		#100;
		
		
	end
      
endmodule

