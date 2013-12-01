`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Create Date:   11:20:04 12/01/2013
// Design Name:   wb_stage
// Module Name:   wb_stage_test.v
// Project Name:  mem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wb_stage
// 
////////////////////////////////////////////////////////////////////////////////

module wb_stage_test;

	// Inputs
	reg mem_to_reg;
	reg [31:0] data_in;
	reg [31:0] dir;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	wb_stage uut (
		.mem_to_reg(mem_to_reg), 
		.data_in(data_in), 
		.dir(dir), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		mem_to_reg = 0;
		data_in = 32'b10101010101010101010101010101010;
		dir = 1;

		// Wait 100 ns for global reset to finish
		#100;
		mem_to_reg = 1;
		#100;
		data_in = 65535;
		#100;
      mem_to_reg = 0;  
		#100;
		dir = 32'b11111111111111111111111111111111;
		// Add stimulus here

	end
      
endmodule

