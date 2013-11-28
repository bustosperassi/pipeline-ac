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
	 input wire dec,
	 input rst,
	 input enbl,
    input [6:0] pc_mux,
    output wire [6:0] pc_out,
    output wire [31:0] DR
    );
	 // Declaracion de senales internas
	 wire [6:0] pc_in;
	 reg [6:0] PC;
	 
	 mem instruction_mem (
		.clka(clk), 
		.addra(PC), 
		.douta(DR)
	);
	
	mux mux1(
		.dec(dec),
		.msb(pc_out),
		.lsb(pc_mux),
		.out(pc_in)
	);
	
	sumador sum ( 
		.pc(PC), 
		.pc_inc(pc_out)
	);


	// Cuerpo
	always@(posedge clk)
	begin
		if (rst)
			PC = 0;
		else
			if (enbl)
				PC = pc_in;
	end
	
endmodule
