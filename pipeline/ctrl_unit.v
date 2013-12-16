`timescale 1ns / 1ps
//////////////////////////////////////////
// Create Date:    16:45:24 06/08/2013 
// Module Name:    ctrl_unit
// Description: 
//////////////////////////////////////////
module ctrl_unit(
	 input clk,
    input [5:0] opcode,
	 output reg Jump,
	 output reg Branch,
	 output reg MemRead,
	 output reg MemWrite,
	 output reg MemtoReg,
	 output reg RegDst,
	 output reg RegWrite,
	 output reg ALUSrc,
	 output reg [5:0] AluOp
	);
	
	assign load		= (~opcode[3]) && (~opcode[4]) && opcode[5];
	assign store	= opcode[3] && (~opcode[4]) && opcode[5];
	assign i_type	= opcode[3] && (~opcode[4]) && (~opcode[5]);
	assign b_type	= (~opcode[1])&&opcode[2]&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign r_type	= (~opcode[0])&&(~opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	assign j 		= (~opcode[0])&&(opcode[1])&&(~opcode[2])&&(~opcode[3])&&(~opcode[4])&&(~opcode[5]);
	
	always @(posedge clk)
	begin
		Jump			<= (j) && (~load) && (~store) && (~r_type) && (~b_type) && (~i_type);		//Instruccion que realiza un salto
		Branch 		<= (~load) && (~store) && (~r_type) && b_type && (~i_type) && (~j);	//Instruccion que realiza un branch
		MemRead 	<= load && (~store) && (~r_type) && (~b_type);																		//La instruccion requiere una lectura de memoria
		MemWrite 	<= (~load) && store && (~r_type) && (~b_type) && (~i_type) && (~j);	//La instruccion desencadena una escritura en memoria
		MemtoReg 	<= load && (~r_type) && (~i_type);																						//La instruccion guarda un dato de memoria en un registro
		RegDst 		<= (~load) && (r_type) && (~i_type);																			//Un dato se guardara en el registro
		RegWrite 	<= (load || r_type || i_type) &&(~store) && (~b_type);											//Se escribira en un registro
		ALUSrc 		<= (load || store || i_type) && (~r_type) && (~b_type);															//Multiplexor de segunda entrada de la ALU
		AluOp[0] 	<= (~load) && (~store) && (~r_type) && (b_type || i_type);
		AluOp[1] 	<= (r_type || i_type) && (~load) && (~store) && (~b_type);
		AluOp[2] 	<= opcode[0];
		AluOp[3] 	<= opcode[1];
		AluOp[4] 	<= opcode[2];
	end
	
endmodule
