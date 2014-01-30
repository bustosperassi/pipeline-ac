`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:33:25 01/28/2014
// Design Name:   hazard
// Module Name:   /home/nico/pipeline-ac/pipeline/hazard_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hazard
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hazard_test;

	// Inputs
	reg [31:0] instruction;
	reg [4:0] rt_ex;
	reg mem_to_reg_ex;

	// Outputs
	wire stop;

	// Instantiate the Unit Under Test (UUT)
	hazard uut (
		.instruction(instruction), 
		.rt_ex(rt_ex), 
		.mem_to_reg_ex(mem_to_reg_ex), 
		.stop(stop)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		rt_ex = 0;
		mem_to_reg_ex = 0;

		// Wait 100 ns for global reset to finish
		#100;
      mem_to_reg_ex = 1;
		instruction[25:21] = 4;
		rt_ex = 4;
		#100;
		instruction[20:16] = 3;
		rt_ex = 3;
		#100;
		instruction[20:16] = 3;
		rt_ex = 2;
		mem_to_reg_ex = 1;
		#100;
		instruction[25:21] = 3;
		rt_ex = 2;
		mem_to_reg_ex = 1;
		// Add stimulus here

	end
      
endmodule

