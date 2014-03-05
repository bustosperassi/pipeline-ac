`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:55:54 02/23/2014
// Design Name:   branch_detection
// Module Name:   /home/nico/pipeline-ac/pipeline/branch_detection_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_detection
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_detection_test;

	// Inputs
	reg clk;
	reg rst;
	reg [5:0] instruccion;
	reg branch_mem;

	// Outputs
	wire stop_pc;
	wire stop_latch;
	wire bubble;

	// Instantiate the Unit Under Test (UUT)
	branch_detection uut (
		.clk(clk), 
		.rst(rst), 
		.instruccion(instruccion), 
		.branch_mem(branch_mem), 
		.stop_pc(stop_pc), 
		.stop_latch(stop_latch), 
		.bubble(bubble)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		instruccion = 0;
		branch_mem = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		#100;
		rst = 0;
		#100;
		
		instruccion = 6'b000101;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		instruccion = 6'b100010;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		


	end
      
endmodule

