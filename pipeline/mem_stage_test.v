`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Create Date:   19:58:39 12/06/2013
// Design Name:   mem_stage
// Module Name:   mem_stage_test.v
// Project Name:  pipeline
////////////////////////////////////////////////////////////////////////////////

module mem_stage_test;

	// Inputs
	reg no_clk;
	reg mem_write;
	reg [4:0] address;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	mem_stage uut (
		.no_clk(no_clk),
		.mem_write(mem_write), 
		.address(address), 
		.write_data(write_data), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		no_clk = 0;
		mem_write = 0;
		address = 1;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
      no_clk = 1;
		mem_write = 0;
		address = 2;
		write_data = 0; 
		
		#100;
      no_clk = 0;
		mem_write = 0;
		address = 1;
		write_data = 0;
		
		#100;
		// Add stimulus here

	end
      
endmodule

