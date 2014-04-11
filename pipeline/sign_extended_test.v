`timescale 1ns / 1ps

////////////////////////////////////////////////////////////
// Create Date:   23:56:40 06/08/2013
// Module Name:   sign_extended_test.v
// Project Name:  pipeline
// Description: Testbench del modulo extension de signo
////////////////////////////////////////////////////////////

module sign_extended_test;

	// Entradas
	reg clk;
	reg rst;
	reg [15:0] offset;

	// Salidas
	wire [31:0] extension;

	// Instancia del modulo
	sign_extended uut (
		.clk(clk),
		.rst(rst),
		.offset(offset), 
		.extension(extension)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		offset = 0;
		#100;
		rst = 0;
		#100;
		clk = 1;
		offset = -32;
		#100;
		clk = 0;
		#100;
		clk = 1;
		offset = 15;
		#100;
		clk = 0;
		#100;
		$stop;
	end
      
endmodule

