`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:09 06/24/2013
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
	wire Jump;
	wire Jal;
	wire Branch;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire RegSrc;
	wire RegDst;
	wire RegWrite;
	wire PCSrc;
	wire ALUSrc;
	wire [4:0] AluOp;

	// Instantiate the Unit Under Test (UUT)
	ctrl_unit uut (
		.opcode(opcode), 
		.Jump(Jump), 
		.Jal(Jal), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.RegSrc(RegSrc), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.PCSrc(PCSrc), 
		.ALUSrc(ALUSrc), 
		.AluOp(AluOp)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
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
		opcode = 6'b000010;
		#100;
		opcode = 6'b000011;
		#100;
		opcode = 6'b000111;
		#100;
		opcode = 6'b010100;
		#100;
		

	end
      
endmodule

