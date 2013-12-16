`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:03:30 06/08/2013 
// Module Name:    register_bank 
// Description:    Dependiendo del tipo de instruccion
//						 asigna los valores a los registros
//////////////////////////////////////////////////////////////////////////////////
module register_bank(
	 input clk,
    input [4:0]read_register1,	//Registro a leer 1. Sale por el busA.
	 input [4:0]read_register2,	//Registro a leer 2. Sale por el busB.
	 input [4:0]write_register,			//Registro que se va a escribir.
	 input [31:0]write_data,		//Datos que se van a escribir sobre el anterior registro.
	 input Reg_write,					//Señal para escribir en el registro.
	 output reg [31:0] busA,
    output reg [31:0] busB
    );

	reg [31:0] registros [31:0];
	initial registros
	always@(negedge clk)
	begin
		if(Reg_write==1)
		begin
			registros[write_register] = write_data;
		end
	end
	always @(posedge clk) begin
		busA <= registros[read_register1];
		busB <= registros[read_register2];
	end
endmodule
