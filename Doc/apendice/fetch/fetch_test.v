`timescale 1ns / 1ps

//////////////////////////////////////////////////
// Create Date:   14:42:15 06/05/2013
// Design Name:   fetch_stage
// Module Name:   fetch_test.v
// Project Name:  pipeline 
// Description: 	Test para la etapa de busqueda de instruccion 
//						
//////////////////////////////////////////////////

module fetch_test;

	// Entradas
	reg clk;
	reg dec;
	reg rst;
	reg enbl;
	reg [6:0] pc_mux;

	// Salidas
	wire [6:0] pc_out;
	wire [31:0] DR;

	// Instancia del modulo fetch
	fetch_stage uut (
		.clk(clk), 
		.rst(rst),
		.enbl(enbl),
		.dec(dec), 
		.pc_mux(pc_mux), // 0
		.pc_out(pc_out), // 1	
		.DR(DR)
	);
	
	always #50
		clk = ~clk;

	initial begin
		// Inicializacion de entradas
		clk = 0;
		dec = 1;
		pc_mux = 0;
		rst = 1;
		enbl = 0;
		
		#100;
		//dec=0;
		rst = 0;
		enbl = 1;
		pc_mux=1;
		
		#100
		//	dec=1;
		
		#100;
		pc_mux=2;


	end
      
endmodule

