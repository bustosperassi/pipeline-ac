`timescale 1ns / 1ps
//////////////////////////////////////////
// Create Date:    16:45:24 06/08/2013 
// Module Name:    ctrl_unit
// Description: 
//////////////////////////////////////////
module ctrl_unit(
    input [31:0] DR,
	 output jump,
	 output branch,
	 output MemRead,
	 output MemtoReg,
	 output MemWrite,
	 output ALUSrc,
	 output RegWrite,
	 output RegDst,
	 output [1:0] AluOp
	);
	
	wire load_store;

	assign load_store 	= DR[31];					//LB-LH-LW-LWU-LBU-LHU-SB-SH-SW
	assign load = DR[31] && DR[29];
	assign store = DR[31] && ~DR[29];
	assign alu_inm			= DR[29]&&(~DR[31]);	//ADDI-ADDIU-ANDI-ORI-XORI-LUI-SLTI-SLTIU
	assign branch			= DR[28]&&(~DR[29])&&(~DR[31]);	//BEQ-BNE
	assign jump_abs		= DR[27]&&(~DR[28])&&(~DR[29])&&(~DR[31]);	//J-JAL
	assign alu_reg			= DR[5]&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);	//ADD-SUB-SUBU-AND-OR-XOR-NOR-SLT-SLTU
	assign jump_rel		= DR[3]&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//JR-JALR
	assign shift_var		= DR[2]&&(~DR[3])&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//SLLV-SRLV
	assign shift			= DR[1]&&(~DR[2])&&(~DR[3])&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//SRL-SRA
	assign sll					= 1 && (DR[1])&&(~DR[2])&&(~DR[3])&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);
endmodule
