`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:32:42 06/04/2013 
// Module Name:    fetch_stage 
// Project Name:   pipeline 
// Additional Comments: Etapa de busqueda de instruccion en memoria
//								Tiene de salida la propia instruccion
//////////////////////////////////////////////////////////////////////////////////
module fetch_stage(
	 input wire clk,
    input [6:0] pc_mux,
    output wire [6:0] pc_out,
    output wire [31:0] DR
    );
	 // Declaracion de seniales internas
	 wire [6:0] wire_pc;
	 wire [6:0] wire_inc;
	 wire [6:0] wire_mux;
	 reg [6:0] PC;
	 
	 
	 mem instruction_mem (
		.clka(clk), 
		.addra(wire_pc), 
		.douta(DR)
	);

	// Cuerpo
	always@(clk)
	begin
		PC = pc_out;
	end
	
endmodule
