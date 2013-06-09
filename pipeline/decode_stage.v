`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:51 06/06/2013 
// Design Name: 
// Module Name:    decode_stage 
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
module decode_stage(
    input [31:0] DR,
    input [31:0] WB,
    output [4:0] bus_A,
    output [4:0] bus_B,
    output [31:0] ext_sig
    ); 
	 
	 wire load_store, alu_inm,branch, jump_abs, alu_reg, jump_rel, shift_var, shift;
	 
	tipo_instruccion tipo (
		.DR(DR), 
		.load_store(load_store), 
		.alu_inm(alu_inm), 
		.branch(branch), 
		.jump_abs(jump_abs), 
		.alu_reg(alu_reg), 
		.jump_rel(jump_rel), 
		.shift_var(shift_var), 
		.shift(shift)
	);
	
	

endmodule
