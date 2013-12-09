`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:29:21 12/02/2013
// Design Name:   branch_sum
// Module Name:   /home/nico/pipeline-ac/pipeline/branch_sum_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_sum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_sum_test;

	// Inputs
	reg [6:0] pc_next;
	reg [31:0] pc_branch;

	// Outputs
	wire [6:0] branch_pc;

	// Instantiate the Unit Under Test (UUT)
	branch_sum uut (
		.pc_next(pc_next), 
		.pc_branch(pc_branch), 
		.branch_pc(branch_pc)
	);

	initial begin
		// Initialize Inputs
		pc_next = 0;
		pc_branch = 0;

		#100;
		
		pc_next = 1;
		pc_branch = 1;

		#100;
	end
      
endmodule

