`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Create Date:   13:46:05 11/30/2013
// Design Name:   decode_stage
// Module Name:   decode_stage_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: Testbench de la etapa de decodificacion de la instruccion
////////////////////////////////////////////////////////////////////////////////

module decode_stage_test;

	// Inputs
	reg clk;
	reg reg_write_in;
	reg [31:0] instruccion;
	reg [31:0] WR;
	reg [31:0] WD;

	// Outputs
	wire [31:0] data1;
	wire [31:0] data2;
	wire [31:0] ext_sig;
	wire branch;
	wire mem_read;
	wire mem_write;
	wire mem_to_reg;
	wire reg_dst;
	wire reg_write_out;
	wire alu_src;
	wire [5:0] alu_op;

	// Instantiate the Unit Under Test (UUT)
	decode_stage uut (
		.clk(clk), 
		.reg_write_in(reg_write_in), 
		.instruccion(instruccion), 
		.WR(WR), 
		.WD(WD), 
		.data1(data1), 
		.data2(data2), 
		.ext_sig(ext_sig), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_dst(reg_dst), 
		.reg_write_out(reg_write_out), 
		.alu_src(alu_src), 
		.alu_op(alu_op)
	);

	initial begin
		// Initialize Inputs
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

