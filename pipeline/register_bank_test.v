`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:32:50 06/17/2013
// Design Name:   register_bank
// Module Name:   /home/nico/pipeline-ac/pipeline/register_bank_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_bank_test;

	// Inputs
	reg clk;
	reg [4:0] read_register1;
	reg [4:0] read_register2;
	reg [4:0] write_register;
	reg [31:0] write_data;
	reg Reg_write;

	// Outputs
	wire [31:0] busA;
	wire [31:0] busB;

	// Instantiate the Unit Under Test (UUT)
	register_bank uut (
		.clk(clk), 
		.read_register1(read_register1), 
		.read_register2(read_register2), 
		.write_register(write_register), 
		.write_data(write_data), 
		.Reg_write(Reg_write), 
		.busA(busA), 
		.busB(busB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		read_register1 = 0;
		read_register2 = 0;
		write_register = 0;
		write_data = 0;
		Reg_write = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		Reg_write = 1;
		write_data = 10;
		write_register = 31;
      clk = 1;
		#100;
		
		clk = 0;
		#100;
		
		Reg_write = 1;
		write_data = 31;
		write_register = 16;
      clk = 1;
		#100
		// Add stimulus here

		clk = 0;
		#100;
		
		read_register1 = 31;
		read_register2 = 16;
		#100;
		
	end
      
endmodule

