`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:18:44 04/11/2014
// Design Name:   decode_stage
// Module Name:   /home/nico/pipeline-ac/pipeline/decode_stage_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode_stage
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decode_stage_test;

	// Inputs
	reg clk;
	reg rst;
	reg ena;
	reg stop;
	reg reg_write_in;
	reg [31:0] instruccion;
	reg [4:0] WR;
	reg [31:0] WD;

	// Outputs
	wire [31:0] data1;
	wire [31:0] data2;
	wire [31:0] ext_sig;
	wire [11:0] palabra_salida;
	wire [1023:0] registros;

	// Instantiate the Unit Under Test (UUT)
	decode_stage uut (
		.clk(clk), 
		.rst(rst), 
		.ena(ena), 
		.stop(stop), 
		.reg_write_in(reg_write_in), 
		.instruccion(instruccion), 
		.WR(WR), 
		.WD(WD), 
		.data1(data1), 
		.data2(data2), 
		.ext_sig(ext_sig), 
		.palabra_salida(palabra_salida), 
		.registros(registros)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		ena = 0;
		stop = 0;
		reg_write_in = 0;
		instruccion = 0;
		WR = 0;
		WD = 0;

		#100;
      rst = 0;
		ena = 1;
		clk = 0;
		reg_write_in = 1;
		// Tipo R         |  6  | 5  |  5 |  5 |    11   |
		instruccion = 32'b00000000000000000000000000000001;
		WR = 0;
		WD = 32'b10101010101010101010101010101010;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1;
		// A partir de aca, el reg0 ya tiene un dato
		#100;
		clk = 0;
      reg_write_in = 1;// |  6  | 5  |  5 |  5 |    11   |
		instruccion =   32'b10000000000000000000000000000001;
		WD = 32'b01010101010101010101010101010101;
		WR = 1;
		
		// Se comprueba la funcionalidad de lectura y escritura de registros
		#100;
		clk = 1;
		//	Load	 			|  6  | 5  |  5 |  5 |    11   |
		instruccion = 32'b10000000000000010000000000000001;
      reg_write_in = 0;
		
		#100;
		clk = 0;
      // Store          |  6  | 5  |  5 |  5 |    11   |
		instruccion = 32'b10100000000000000000000000000001;
		
		#100;
		clk = 1;
      
		#100;
		clk = 0;
      // Branch         |  6  | 5  |  5 |  5 |    11   |
		instruccion = 32'b00010000000000000000000000000001;
		
		#100;
		clk = 1;
      
		#100;
		clk = 0;
	end
      
endmodule

