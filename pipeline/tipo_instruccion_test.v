`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:12 06/08/2013
// Design Name:   tipo_instruccion
// Module Name:   /home/nico/pipeline-ac/pipeline/tipo_instruccion_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tipo_instruccion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tipo_instruccion_test;

	// Inputs
	reg [31:0] DR;
	// Outputs
	wire load_store;
	wire alu_inm;
	wire branch;
	wire jump_abs;
	wire alu_reg;
	wire jump_rel;
	wire shift_var;
	wire shift;

	// Instantiate the Unit Under Test (UUT)
	tipo_instruccion uut (
		.DR(DR), 
		.load_store(load_store), 
		.alu_inm(alu_inm), 
		.branch(branch), 
		.jump_abs(jump_abs), 
		.alu_reg(alu_reg), 
		.jump_rel(jump_rel), 
		.shift_var(shift_var), 
		.shift(shift)
	);

	initial begin
	
		// Initialize Inputs
		DR = 32'b11100111111111111111111111101011;
		#100;
      DR = 32'b00101110100000010000000000000000;
		#100;
		DR = 32'b00010000010000100001000000100110;
		#100;
		DR = 32'b00001110100000010000000000000000;
		#100;
		DR = 32'b00000010100000010000000000100000;
		#100;
		DR = 32'b00000010100000010000000000001000;
		#100;
		DR = 32'b00000010100000010000000000000100;
		#100;
		DR = 32'b00000010100000010000000000000010;
		#100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

