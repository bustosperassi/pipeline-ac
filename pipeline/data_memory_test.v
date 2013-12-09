`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:07:19 12/06/2013
// Design Name:   data_memory
// Module Name:   /home/nico/pipeline-ac/pipeline/data_memory_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_memory_test;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [9:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
				// Wait 100 ns for global reset to finish
		#100;
		clka = 1;
		wea = 1;
		addra = 1;
		dina = 65535;
		
		#100;
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;
		
		#100;
		clka = 1;
		wea = 0;
		addra = 1;
		dina = 0;
		
		#100;
		clka = 0;
		#100;
		clka = 1;
      end
endmodule

