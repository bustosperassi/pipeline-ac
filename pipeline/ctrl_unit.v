`timescale 1ns / 1ps
//////////////////////////////////////////
// Create Date:    16:45:24 06/08/2013 
// Module Name:    ctrl_unit
// Description: 
//////////////////////////////////////////
module ctrl_unit(
    input [5:0] opcode,
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
	
	assign load		= opcode[5] && (~opcode[3]);
	assign store	= opcode[5] && opcode[3];
	assign b_type	= opcode[2] && (~load) && (~store);
	assign r_type	= 1 && (~load) && (~store) && (~b_type);
	
	assign RegDst 		= (~load) && r_type;
	assign ALUSrc 		= (load || store) && (~r_type) && (~b_type);
	assign MemtoReg 	= load && (~r_type);
	assign RegWrite 	= (load || r_type) &&(~store) && (~b_type);
	assign MemRead 	= load && (~store) && (~r_type) && (~b_type);
	assign MemWrite 	= (~load) && store && (~r_type) && (~b_type);
	assign branch 		= (~load) && (~store) && (~r_type) && b_type;
	assign AluOp[0] 	= (~load) && (~store) && (~r_type) && b_type;
	assign AluOp[1] 	= (~load) && (~store) && r_type && (~b_type);
	
endmodule
