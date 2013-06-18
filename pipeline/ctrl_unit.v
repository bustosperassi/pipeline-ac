`timescale 1ns / 1ps
//////////////////////////////////////////
// Create Date:    16:45:24 06/08/2013 
// Module Name:    ctrl_unit
// Description: 
//////////////////////////////////////////
module ctrl_unit(
    input [5:0] opcode,
	 output jump,
	 output jal,
	 output branch,
	 output MemRead,
	 output MemtoReg,
	 output MemWrite,
	 output ALUSrc,
	 output RegWrite,
	 output RegDst,
	 output jal_signal,
	 output [4:0] AluOp
	);
	
	assign load		= (~opcode[3]) && (~opcode[4]) && opcode[5];
	assign store	= opcode[3] && (~opcode[4]) && opcode[5];
	assign i_type	= opcode[3] && (~opcode[4]) && (~opcode[5]);
	assign b_type	= (~opcode[1])&&opcode[2]&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign r_type	= (~opcode[0])&&(~opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign j 		= (~opcode[0])&&(opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign jal		= (opcode[0])&&(opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign jr		= (~opcode[0])&&(~opcode[1])&&(~opcode[2])&&(opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign jalr		= (opcode[0])&&(~opcode[1])&&(~opcode[2])&&(opcode[3])&&(~opcode[4])&&(~opcode[5]);
	
	assign RegDst 		= (~load) && (r_type || jalr) && (~i_type);
	assign ALUSrc 		= (load || store || i_type) && (~r_type) && (~b_type);
	assign MemtoReg 	= load && (~r_type) && (~i_type);
	assign RegWrite 	= (load || r_type || i_type || jal || jalr) &&(~store) && (~b_type);
	assign MemRead 	= load && (~store) && (~r_type) && (~b_type);
	assign MemWrite 	= (~load) && store && (~r_type) && (~b_type) && (~i_type) && (~j) && (~jal) && (~jalr) && (~jr);
	assign branch 		= (~load) && (~store) && (~r_type) && b_type && (~i_type) && (~j) && (~jal) && (~jalr) && (~jr);
	assign jump			= (j || jal) && (~load) && (~store) && (~r_type) && (~b_type) && (~i_type) && (~jalr) && (~jr);
	assign RegSrc		= (jal || jalr) && (~load) && (~store) && (~r_type) && (~b_type) && (~i_type) && (~j) && (~jr);
	assign PCSrc		= (jr || jalr) && (~load) && (~store) && (~r_type) && (~b_type) && (~i_type) && (~j) && (~jal);
	assign AluOp[0] 	= (~load) && (~store) && (~r_type) && (b_type || i_type);
	assign AluOp[1] 	= (~load) && (~store) && (r_type || i_type) && (~b_type);
	assign AluOp[2]	= opcode[0];
	assign AluOp[3]	= opcode[1];
	assign AluOp[4]	= opcode[2];
	
endmodule
