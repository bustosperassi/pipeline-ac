`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:32:42 06/04/2013 
// Module Name:    fetch_stage 
// Project Name:   pipeline 
// Additional Comments: Etapa de busqueda de instruccion en memoria
//								Tiene de salida la propia instruccion
//////////////////////////////////////////////////////////////////////////////////
module fetch_stage(
	 input clk,
	 input dec,
	 input rst,
	 input enbl,
    input [6:0] pc_mux,
    output [6:0] pc_out,
    output [31:0] DR,
	 output bubble
    );
	 
	 // Declaracion de senales internas
	 wire [6:0] pc_next;
	 wire [6:0] pc_in;
	 wire [1:0] flag;
	 wire stop_branch;
	 wire [6:0] PC;
	 
	 mem instruction_mem (
		.clka(clk), 
		.addra(PC),
		.ena(enbl),
		.douta(DR)
	);
	
	mux_program_counter mux1(
		.rst(rst),
		.dec(dec),
		.msb(pc_mux),
		.lsb(pc_next),
		.out(pc_in)
	);
	
	sumador sum (
		.pc(PC), 
		.pc_inc(pc_next)
	);
	
	branch_detection branches (
		.instruccion(DR[31:26]),
		.stop(stop_branch)
	);
	assign pc_out = pc_next;
	
	program_counter contPrograma (
		.clk(clk), 
		.rst(rst), 
		.enable(enbl), 
		.pc_in(pc_in), 
		.stop(stop_branch), 
		.bubble(bubble), 
		.PC(PC)
	);
	
endmodule
