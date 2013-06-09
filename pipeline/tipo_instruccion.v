`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:24 06/08/2013 
// Design Name: 
// Module Name:    tipo_instruccion 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tipo_instruccion(
    input [31:0] DR,
	 output load_store,
	 output alu_inm,
	 output branch,
	 output jump_abs,
	 output alu_reg,
	 output jump_rel,
	 output shift_var,
	 output shift
	);

	assign load_store 	= DR[31];					//LB-LH-LW-LWU-LBU-LHU-SB-SH-SW
	assign alu_inm			= DR[29]&&(~DR[31]);	//ADDI-ADDIU-ANDI-ORI-XORI-LUI-SLTI-SLTIU
	assign branch			= DR[28]&&(~DR[29])&&(~DR[31]);	//BEQ-BNE
	assign jump_abs		= DR[27]&&(~DR[28])&&(~DR[29])&&(~DR[31]);	//J-JAL
	assign alu_reg			= DR[5]&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);	//ADD-SUB-SUBU-AND-OR-XOR-NOR-SLT-SLTU
	assign jump_rel		= DR[3]&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//JR-JALR
	assign shift_var		= DR[2]&&(~DR[3])&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//SLLV-SRLV
	assign shift			= DR[1]&&(~DR[2])&&(~DR[3])&&(~DR[5])&&(~DR[27])&&(~DR[28])&&(~DR[29])&&(~DR[31]);		//SRL-SRA
	// Queda SLL que es todos ceros, pero que esta en la categoria de shift.

endmodule
