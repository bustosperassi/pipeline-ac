`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:03:30 06/08/2013 
// Module Name:    register_bank 
// Description:    Dependiendo del tipo de instruccion
//						 asigna los valores a los registros
//////////////////////////////////////////////////////////////////////////////////
module register_bank(
	 input clk,
	 input rst,
    input [4:0]read_register1,	//Registro a leer 1. Sale por el busA.
	 input [4:0]read_register2,	//Registro a leer 2. Sale por el busB.
	 input [4:0]write_register,			//Registro que se va a escribir.
	 input [31:0]write_data,		//Datos que se van a escribir sobre el anterior registro.
	 input Reg_write,					//Señal para escribir en el registro.
	 output reg [31:0] busA,
    output reg [31:0] busB
    );

	reg [31:0] registros [31:0];
	
	always@(posedge clk) begin //!!!!!!!!!!!!!!!!!!!!!!!!
		if (rst == 1) begin
			registros[0] <= 0;
			registros[1] <= 0;
			registros[2] <= 0;
			registros[3] <= 0;
			registros[4] <= 0;
			registros[5] <= 0;
			registros[6] <= 0;
			registros[7] <= 0;
			registros[8] <= 0;
			registros[9] <= 0;
			registros[10] <= 0;
			registros[11] <= 0;
			registros[12] <= 0;
			registros[13] <= 0;
			registros[14] <= 0;
			registros[15] <= 0;
			registros[16] <= 0;
			registros[17] <= 0;
			registros[18] <= 0;
			registros[19] <= 0;
			registros[20] <= 0;
			registros[21] <= 0;
			registros[22] <= 0;
			registros[23] <= 0;
			registros[24] <= 0;
			registros[25] <= 0;
			registros[26] <= 0;
			registros[27] <= 0;
			registros[28] <= 0;
			registros[29] <= 0;
			registros[30] <= 0;
			registros[31] <= 0;
		end
		else begin
			if(Reg_write==1) begin
					registros[write_register] <= write_data;
			end
		end
	end
	
	always @(posedge clk) begin
		busA <= registros[read_register1];
		busB <= registros[read_register2];
	end

endmodule
