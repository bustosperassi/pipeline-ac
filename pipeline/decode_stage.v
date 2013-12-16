`timescale 1ns / 1ps
////////////////////////////////////////////////
// Module Name:    decode_stage 
// Description: 	Etapa de decodificacion de
//						de la instruccion que proviene
//						desde la etapa fetch.
////////////////////////////////////////////////
module decode_stage(
	 input clk,
	 // Entradas al decode stage
	 input reg_write_in,
	 input [31:0] instruccion,
    input [4:0] WR,
    input [31:0] WD,
	 // Salidas desde el banco de registros
    output reg [31:0] data1,
    output reg [31:0] data2,
	 // Salida del modulo extension de signo
    output reg [31:0] ext_sig,
	 // Salidas de la unidad de control
	 //output Jump, 
	 output reg branch,
	 output reg mem_read,
	 output reg mem_write,
	 output reg mem_to_reg,
	 output reg reg_dst,
	 output reg reg_write_out,
	 output reg alu_src,
	 output reg [5:0] alu_op
    ); 
	 
	 
	 register_bank banco (
		.clk(~clk), 
		.read_register1(instruccion[25:21]), 
		.read_register2(instruccion[20:16]), 
		.write_register(WR), 
		.write_data(WD), 
		.Reg_write(reg_write_in), 
		.busA(data1), 
		.busB(data2)
	);
	
	sign_extended extension_signo (
		.offset(instruccion[15:0]), 
		.extension(ext_sig)
	);
	
	ctrl_unit unidad_control (
		.opcode(instruccion[31:26]),
		.Branch(branch), 
		.MemRead(mem_read), 
		.MemWrite(mem_write), 
		.MemtoReg(mem_to_reg), 
		.RegDst(reg_dst), 
		.RegWrite(reg_write_out), 
		.ALUSrc(alu_src), 
		.AluOp(alu_op)
	);
	always @(negedge clk) 
	 begin
	 
	end
	
endmodule