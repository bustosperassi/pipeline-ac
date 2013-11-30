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
	reg [5:0] msb;
	reg [5:0] lsb;
	reg dec;

	// Salidas
	wire [5:0] out;
	
	// Instancia del modulo a testear
	mux #(.nbits(6)) uut(
		.msb(msb), 
		.lsb(lsb), 
		.out(out), 
		.dec(dec)
	);

	initial begin
		// Inicializacion de entradas
		msb = 7;
		lsb = 2;
		dec = 0;
		// Comienzo de simulacion
		#100;
		dec=1;
		
		#100;
		dec=0;
		$stop;
	end
      
endmodule

