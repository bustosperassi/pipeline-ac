`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:03:30 06/08/2013 
// Module Name:    register_bank 
// Description:    Dependiendo del tipo de instruccion
//						 asigna los valores a los registros
//////////////////////////////////////////////////////////////////////////////////
module register_bank(
	 input clk,
    input [4:0]read_register1,
	 input [4:0]read_register2,
	 input write_register,
	 input [31:0]write_data,
	 input Reg_write,
	 output [31:0] busA,
    output [31:0] busB
    );

	reg [31:0] registros [31:0];
	
	
	always@(posedge clk)
	begin
		if(Reg_write==1)
		begin
			registros[write_register] = write_data;
		end
	end
	assign busA = registros[read_register1];
	assign busB = registros[read_register2];
endmodule
