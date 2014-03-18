`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:32:42 23/02/2014 
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
    output [6:0] pc_out,
    output [31:0] DR
    );
	 // Declaracion de senales internas
	 wire [6:0] pc_in;
	 reg [6:0] PC;
	 wire [31:0] salida_instruccion;
	 
	 mem instruction_mem (
		.clka(clk), 
		.addra(PC), 
		.douta(salida_instruccion),
		.wea(),
		.dina(0)
	);
	
	mux mux1(
		.rst(rst),
		.dec(dec),
		.msb(pc_mux),
		.lsb(pc_out),
		.out(pc_in)
	);
	
	mux #(.nbits(32))branches(
		.rst(rst),
		.dec(dec),
		.msb(0),
		.lsb(salida_instruccion), // Comprobar que la nop funciona
		.out(DR)
	);
	
	sumador sum (
		.pc(PC), 
		.pc_inc(pc_out)
	);
	// Para colocar un nuevo fetch stage
	always@(negedge clk or posedge rst)
	if (rst == 1) PC = 0;
	else
	begin
		if (enbl) begin
			PC = pc_in;
		end
	end
	
endmodule
