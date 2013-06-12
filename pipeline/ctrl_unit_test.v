`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:31:57 06/10/2013
// Design Name:   ctrl_unit
// Module Name:   /home/nico/pipeline-ac/pipeline/ctrl_unit_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ctrl_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ctrl_unit_test;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire jump;
	wire branch;
	wire MemRead;
	wire MemtoReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire RegDst;
	wire [4:0] AluOp;

	// Instantiate the Unit Under Test (UUT)
	ctrl_unit uut (
		.opcode(opcode), 
		.jump(jump), 
		.branch(branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.RegDst(RegDst), 
		.AluOp(AluOp)
	);

	initial begin
		// Initialize Inputs
		
		opcode = 6'b000000;
		#100;
		opcode = 6'b100000;
		#100;
		opcode = 6'b100001;
		#100;
		opcode = 6'b100011;
		#100;
		opcode = 6'b100111;
		#100;
		opcode = 6'b100100;
		#100;
		opcode = 6'b100101;
		#100;
		opcode = 6'b101000;
		#100;
		opcode = 6'b101001;
		#100;
		opcode = 6'b101011;
		#100;
		opcode = 6'b001000;
		#100;
		opcode = 6'b001001;
		#100;
		opcode = 6'b001100;
		#100;
		opcode = 6'b001101;
		#100;
		opcode = 6'b001110;
		#100;
		opcode = 6'b001111;
		#100;
		opcode = 6'b001010;
		#100;
		opcode = 6'b001011;
		#100;
		opcode = 6'b000100;
		#100;
		opcode = 6'b000101;
		#100;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
      
endmodule

