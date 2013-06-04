`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:55 06/04/2013
// Design Name:   mem
// Module Name:   /home/nico/pipeline-ac/pipeline/mem_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mem_test;

	// Inputs
	reg clka;
	reg [6:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	mem uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;

		// Testeando las posiciones de memoria. 0 a 2 hay intrucciones, siguientes en 0. 
		#100;
      clka = 1;
		// Muestra la primera instruccion
		
		#100;
		clka = 0;
		addra = 1;
		#100;
      clka = 1;
		// Muestra la segunda instruccion

		#100;
		clka = 0;
		addra = 2;
		#100;
      clka = 1;
		// Muestra la tercera instruccion

		#100;
		clka = 0;
		addra = 3;
		#100;
      clka = 1;
		// Muestra ceros

		#100;
		clka = 0;
		addra = 0;
		#100;
		clka = 1;
		// Muestra ceros

		#100;
		clka = 0;
		
		
	end
      
endmodule

