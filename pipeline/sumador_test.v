`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Create Date:   00:21:49 06/05/2013
// Design Name:   sumador
// Module Name:  sumador_test.v
// Project Name:  pipeline
// Description: 	TestBench para el sumador de la etapa fetch.
////////////////////////////////////////////////////////////////////////////////

module sumador_test;

	// Inputs
	reg [6:0] pc;

	// Outputs
	wire [6:0] pc_inc;

	// Instantiate the Unit Under Test (UUT)
	sumador uut (
		.pc(pc), 
		.pc_inc(pc_inc)
	);

	initial begin
		pc=0;
		#100;
		pc=1;
		#100;
		pc=2;		
		#100;
		pc=3;
		#100;
		pc=4;
		#100;
		pc=5;
		#100;
		$stop;
        
	end
      
endmodule

