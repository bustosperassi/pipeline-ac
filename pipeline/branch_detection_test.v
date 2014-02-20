`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:50:31 02/06/2014
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

	// Instantiate the Unit Under Test (UUT)
	branch_detection uut (
		.clk(clk), 
		.rst(rst), 
		.instruccion(instruccion[5:0])
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		instruccion = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		clk = 0;
		
		#100;
		clk = 1;
		instruccion = 6'b000100;
		
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
		clk = 1;
		instruccion = 6'b000101;
		
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
		clk = 1;
		instruccion = 6'b000010;
		
		#100;
		clk = 0;
		
		#100;
		clk = 1;
		// Add stimulus here
	end
      
endmodule

