`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:01:25 04/11/2014
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
	reg rst;
	reg [5:0] opcode;
	reg [31:0] d1;
	reg [31:0] d2;
	reg [6:0] pc_next;
	reg [6:0] pc_branch;

	// Outputs
	wire taken;
	wire [6:0] branch_pc;

	// Instantiate the Unit Under Test (UUT)
	branch_sum uut (
		.rst(rst), 
		.opcode(opcode), 
		.d1(d1), 
		.d2(d2), 
		.pc_next(pc_next), 
		.pc_branch(pc_branch), 
		.taken(taken), 
		.branch_pc(branch_pc)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		opcode = 0;
		d1 = 0;
		d2 = 0;
		pc_next = 0;
		pc_branch = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		
      #100;
		opcode = 6'b000100;
		d1 = 2;
		d2 = 2;
		pc_next = 4;
		pc_branch = 2;
		
		#100;
		opcode = 6'b000101;
		d1 = 2;
		d2 = 3;
		pc_next = 4;
		pc_branch = 2;
		
		#100;
		opcode = 6'b000010;
		d1 = 4;
		d2 = 5;
		pc_next = 10;
		pc_branch = 2;
		
		#100;
		opcode = 6'b000100;
		d1 = 2;
		d2 = 3;
		pc_next = 4;
		pc_branch = 2;
		
	end
      
endmodule

