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
	reg branch;
	reg zero;
	reg mem_write;
	reg [9:0] address;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] data_out;
	wire pc_src;

	// Instantiate the Unit Under Test (UUT)
	mem_stage uut (
		.no_clk(no_clk), 
		.branch(branch), 
		.zero(zero), 
		.mem_write(mem_write), 
		.address(address), 
		.write_data(write_data), 
		.data_out(data_out), 
		.pc_src(pc_src)
	);

	initial begin
		// Initialize Inputs
		no_clk = 0;
		branch = 0;
		zero = 0;
		mem_write = 1;
		address = 0;
		write_data = 10;

		// Wait 100 ns for global reset to finish
		#100;
      no_clk = 1;
		branch = 1;
		zero = 1;
		mem_write = 1;
		address = 0;
		write_data = 4; 
		
		#100;
      no_clk = 0;
		branch = 1;
		zero = 0;
		mem_write = 0;
		address = 0;
		write_data = 0;
		
		#100;
		// Add stimulus here

	end
      
endmodule

