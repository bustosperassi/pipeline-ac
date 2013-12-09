`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:36:37 11/30/2013
// Design Name:   mux
// Module Name:   /home/nico/pipeline-ac/pipeline/mux1_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux1_test;

	// Inputs
	reg [2:0] msb;
	reg [2:0] lsb;
	reg dec;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux #(.nbits(3))uut(
		.msb(msb), 
		.lsb(lsb), 
		.out(out), 
		.dec(dec)
	);

	initial begin
		// Initialize Inputs
		msb = 3;
		lsb = 0;
		dec = 0;

		// Wait 100 ns for global reset to finish
		#100;
      dec = 1;
		#100;
		dec = 0;
		#100;
		dec = 1;
		#100;
		dec = 0;
		#100;
		// Add stimulus here

	end
      
endmodule

