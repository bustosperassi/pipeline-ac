`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Create Date:   22:52:32 06/04/2013
// Design Name:   mux
// Module Name:   mux_test.v
// Project Name:  pipeline
// Description:   TestBench para el demultiplexor de 7 bits
//						0: out_7=lsb_7
//						1: out_7=msb_7
////////////////////////////////////////////////////////////////////////////////

module mux_test;

	// Inputs
	reg [6:0] msb_7;
	reg [6:0] lsb_7;
	reg dec;

	// Salidas
	wire [6:0] out_7;
	
	// Instancia del modulo a testear
	mux uut (
		.msb_7(msb_7), 
		.lsb_7(lsb_7), 
		.out_7(out_7), 
		.dec(dec)
	);

	initial begin
		// Inicializacion de entradas
		msb_7 = 10;
		lsb_7 = 2;
		dec = 0;
		// Comienzo de simulacion
		#100;
		dec=1;
		
		#100;
		dec=0;
		$stop;
	end
      
endmodule

