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
	reg clk;
	reg [6:0] pc;

	// Outputs
	wire [6:0] pc_inc;

	// Instantiate the Unit Under Test (UUT)
	sumador uut (
		.clk(clk), 
		.pc(pc), 
		.pc_inc(pc_inc)
	);

	initial begin
		clk = 0;
		pc = 0;

		#100;
		clk=1;
		
		#100
		clk=0;
		pc=1;
		
		#100
		clk=1;
		
		#100
		clk=0;
		pc=2;
		#100;
		clk=1;
		
		#100;
		clk=0;
		$stop;
        
	end
      
endmodule

