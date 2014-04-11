`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:44:05 01/22/2014
// Design Name:   mux4
// Module Name:   /home/nico/pipeline-ac/pipeline/mux4_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux4_test;

	// Inputs
	reg rst;
	reg [31:0] in00;
	reg [31:0] in01;
	reg [31:0] in02;
	reg [31:0] in03;
	reg [1:0] signal;

	// Outputs
	wire [31:0] out_mux4;

	// Instantiate the Unit Under Test (UUT)
	mux4 uut (
		.rst(rst),
		.in00(in00), 
		.in01(in01), 
		.in02(in02), 
		.in03(in03), 
		.signal(signal), 
		.out_mux4(out_mux4)
	);

	initial begin
		// Initialize Inputs
		
		rst = 1;
		in00 = 0;
		in01 = 0;
		in02 = 0;
		in03 = 0;
		signal = 0;
		#100;
		rst = 0;
		#100;
		
		in00 = 1;
		in01 = 2;
		in02 = 3;
		in03 = 4;
		signal = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		in00 = 1;
		in01 = 2;
		in02 = 3;
		in03 = 4;
		signal = 1;

		// Wait 100 ns for global reset to finish
		#100;
      
		in00 = 1;
		in01 = 2;
		in02 = 3;
		in03 = 4;
		signal = 2;

		// Wait 100 ns for global reset to finish
		#100;
      
		in00 = 1;
		in01 = 2;
		in02 = 3;
		in03 = 4;
		signal = 3;

		// Wait 100 ns for global reset to finish
		#100;
      		
		// Add stimulus here

	end
      
endmodule

