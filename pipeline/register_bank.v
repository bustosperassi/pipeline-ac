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
    output reg [31:0] busB,
	 output wire [1023:0] registros
    );

	reg [31:0] registers [31:0];
	
	assign registros = {registers[31],registers[30],registers[29],registers[28],registers[27],registers[26],registers[25],registers[24],registers[23],registers[22],registers[21],registers[20],registers[19],registers[18],registers[17],registers[16],registers[15],registers[14],registers[13],registers[12],registers[11],registers[10],registers[9],registers[8],registers[7],registers[6],registers[5],registers[4],registers[3],registers[2],registers[1],registers[0]};
	
	always@(posedge clk) begin //!!!!!!!!!!!!!!!!!!!!!!!!
		if (rst == 1) begin
			registers[0] <= 0;
			registers[1] <= 0;
			registers[2] <= 0;
			registers[3] <= 0;
			registers[4] <= 0;
			registers[5] <= 0;
			registers[6] <= 0;
			registers[7] <= 0;
			registers[8] <= 0;
			registers[9] <= 0;
			registers[10] <= 0;
			registers[11] <= 0;
			registers[12] <= 0;
			registers[13] <= 0;
			registers[14] <= 0;
			registers[15] <= 0;
			registers[16] <= 0;
			registers[17] <= 0;
			registers[18] <= 0;
			registers[19] <= 0;
			registers[20] <= 0;
			registers[21] <= 0;
			registers[22] <= 0;
			registers[23] <= 0;
			registers[24] <= 0;
			registers[25] <= 0;
			registers[26] <= 0;
			registers[27] <= 0;
			registers[28] <= 0;
			registers[29] <= 0;
			registers[30] <= 0;
			registers[31] <= 0;
		end
		else begin
			if(Reg_write==1) begin
					registers[write_register] <= write_data;
			end
		end
	end
	
	always @(posedge clk) begin
		busA <= registers[read_register1];
		busB <= registers[read_register2];
	end

endmodule
