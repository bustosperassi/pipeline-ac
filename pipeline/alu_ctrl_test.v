`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:33:21 11/25/2013
// Design Name:   alu_ctrl
// Module Name:   /home/nico/pipeline-ac/pipeline/alu_ctrl_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_ctrl_test;

	// Inputs
	reg [5:0] ff;
	reg [4:0] aluOp;

	// Outputs
	wire [2:0] operation;

	// Instantiate the Unit Under Test (UUT)
	alu_ctrl uut (
		.ff(ff), 
		.aluOp(aluOp), 
		.operation(operation)
	);

	initial begin
		// Initialize Inputs
		ff = 0;
		aluOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		ff = 6'b000000;
		aluOp = 5'b00000;
		#100;
		ff = 6'b000000;
		aluOp = 5'b00011;
		#100;
		ff = 6'b010000;
		aluOp = 5'b00010;
		#100;
		ff = 6'b100010;
		aluOp = 5'b00010;
		#100;
		ff = 6'b000100;
		aluOp = 5'b00010;
		#100;
		ff = 6'b000101;
		aluOp = 5'b00010;
		#100;
		ff = 6'b001010;
		aluOp = 5'b00010;
		#100;
		
	end
      
endmodule

