`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:56 12/09/2013
// Design Name:   fetch_stage
// Module Name:   /home/nico/pipeline-ac/pipeline/fetch_stage_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch_stage
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fetch_stage_test;

	// Inputs
	reg clk;
	reg dec;
	reg rst;
	reg enbl;
	reg [6:0] pc_mux;

	// Outputs
	wire [6:0] pc_out;
	wire [31:0] DR;

	// Instantiate the Unit Under Test (UUT)
	fetch_stage uut (
		.clk(clk), 
		.dec(dec), 
		.rst(rst), 
		.enbl(enbl), 
		.pc_mux(pc_mux), 
		.pc_out(pc_out), 
		.DR(DR)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dec = 0;
		rst = 1;
		enbl = 0;
		pc_mux = 0;
		#100;
      
		clk=1;
		
		#100;
		clk=0;
		rst=0;
		enbl=1;
		
		#100;
      clk=1;
		
		#100;
		clk=0;
		
		#100;
      clk=1;
		
		#100;
      clk=0;
		
		#100;
      clk=1;
		
		#100;
		
	end
      
endmodule
