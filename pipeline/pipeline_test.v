`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:33:51 12/10/2013
// Design Name:   pipeline
// Module Name:   /home/nico/pipeline-ac/pipeline/pipeline_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipeline_test;

	// Inputs
	reg clk;
	reg rst;
	reg enable;

	// Instantiate the Unit Under Test (UUT)
	pipeline uut (
		.clk(clk),
		.rst(rst),
		.enable(enable)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		enable = 0;
		#100;
      clk = 0;
		rst = 0;
		enable = 1;
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
		#100;
      clk = 0;
	end
      
endmodule

