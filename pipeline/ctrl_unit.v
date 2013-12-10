`timescale 1ns / 1ps
//////////////////////////////////////////
// Create Date:    16:45:24 06/08/2013 
// Module Name:    ctrl_unit
// Description: 
//////////////////////////////////////////
module ctrl_unit(
    input [5:0] opcode,
	 output Jump,
	 output Branch,
	 output MemRead,
	 output MemWrite,
	 output MemtoReg,
	 output RegDst,
	 output RegWrite,
	 output ALUSrc,
	 output [5:0] AluOp
	);
	
	assign load		= (~opcode[3]) && (~opcode[4]) && opcode[5];
	assign store	= opcode[3] && (~opcode[4]) && opcode[5];
	assign i_type	= opcode[3] && (~opcode[4]) && (~opcode[5]);
	assign b_type	= (~opcode[1])&&opcode[2]&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign r_type	= (~opcode[0])&&(~opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign j 		= (~opcode[0])&&(opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	
	assign Jump			= (j) && (~load) && (~store) && (~r_type) && (~b_type) && (~i_type);		//Instruccion que realiza un salto
	assign Branch 		= (~load) && (~store) && (~r_type) && b_type && (~i_type) && (~j);	//Instruccion que realiza un branch
	assign MemRead 	= load && (~store) && (~r_type) && (~b_type);																		//La instruccion requiere una lectura de memoria
	assign MemWrite 	= (~load) && store && (~r_type) && (~b_type) && (~i_type) && (~j);	//La instruccion desencadena una escritura en memoria
	assign MemtoReg 	= load && (~r_type) && (~i_type);																						//La instruccion guarda un dato de memoria en un registro
	assign RegDst 		= (~load) && (r_type) && (~i_type);																			//Un dato se guardara en el registro
	assign RegWrite 	= (load || r_type || i_type) &&(~store) && (~b_type);											//Se escribira en un registro
	assign ALUSrc 		= (load || store || i_type) && (~r_type) && (~b_type);															//Multiplexor de segunda entrada de la ALU
	assign AluOp[0] 	= (~load) && (~store) && (~r_type) && (b_type || i_type);
	assign AluOp[1] 	= (r_type || i_type) && (~load) && (~store) && (~b_type);
	assign AluOp[2] 	= opcode[0];
	assign AluOp[3] 	= opcode[1];
	assign AluOp[4] 	= opcode[2];
	
endmodule
