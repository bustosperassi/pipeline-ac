`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:30:03 12/02/2013
// Design Name:   alu
// Module Name:   alu_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] data1;
	reg [31:0] data2;
	reg [3:0] operation;

	// Outputs
	wire [31:0] alu_result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.data1(data1), 
		.data2(data2), 
		.operation(operation), 
		.alu_result(alu_result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		data1 = 2;
		data2 = 1;
		operation = 4'b0010;

		// Wait 100 ns for global reset to finish
		#100; //Substract operatio
		data1 = 2;
		data2 = 2;
		operation = 4'b0110;
		#100; // AND operation
		data1 = 10;
		data2 = 6;
		operation = 4'b0000;
		#100; // OR operation
		data1 = 10;
		data2 = 5;
		operation = 4'b0001;
		#100; // SET ON lESS THAN operation
		data1 = -10;
		data2 = 5;
		operation = 4'b0111;
		// Add stimulus here

	end
      
endmodule

