`timescale 1ns / 1ps

///////////////////////////////////////
// Create Date:   00:53:17 06/13/2013
// Design Name:   register_bank
// Module Name:   register_bank_test.v
// Project Name:  pipeline  
// Description: 	Testbench del banco de registros
///////////////////////////////////////

module register_bank_test;

	// Entradas
	reg clk;
	reg [4:0] read_register1;
	reg [4:0] read_register2;
	reg write_register;
	reg [31:0] write_data;
	reg Reg_write;

	// Salidas
	wire [31:0] busA;
	wire [31:0] busB;

	// Instantiate the Unit Under Test (UUT)
	register_bank uut (
		.clk(clk), 
		.read_register1(read_register1), 
		.read_register2(read_register2), 
		.write_register(write_register), 
		.write_data(write_data), 
		.Reg_write(Reg_write), 
		.busA(busA), 
		.busB(busB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		read_register1 = 0;
		read_register2 = 0;
		write_register = 0;
		write_data = 0;
		Reg_write = 0;

		#100;
      

	end
      
endmodule

