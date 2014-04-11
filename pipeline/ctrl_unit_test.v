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
	reg clk;
	reg rst;
	reg ena;

	// Outputs
	wire Branch;
	wire MemWrite;
	wire MemtoReg;
	wire RegDst;
	wire RegWrite;
	wire ALUSrc;
	wire [4:0] AluOp;

	// Instantiate the Unit Under Test (UUT)
	ctrl_unit uut (
		.clk(clk),
		.rst(rst),
		.ena(ena),
		.opcode(opcode),
		.Branch(Branch), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.AluOp(AluOp)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		ena = 0;
		rst = 1;
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
      rst = 0;
		ena = 1;
		clk = 1;
		opcode = 6'b000000;  // tipo R
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100000;  // LB
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100001;  // LH
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100011;  // LW
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100111;  // LWU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100100;  // LBU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b100101;  // LHU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b101000;  // SB
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b101001;  // SH
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b101011;  // SLTU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001000;  // ADDI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001001;  // ADDIU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001100;  // ANDI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001101;  // ORI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001110;  // XORI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001111;  // LUI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001010;  // SLTI
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b001011;  // SLTIU
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b000100;  // BEQ
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b000101;  // BNE
		#100;
		clk = 0;
		#100;
		clk = 1;
		opcode = 6'b000010;  // J
		#100;
		clk = 0;
		#100;
		clk = 1;
		

	end
      
endmodule

