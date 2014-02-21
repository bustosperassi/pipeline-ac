`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:45 12/02/2013 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu #(parameter ANCHO_BUS = 32)( 
    input rst,
	 input [ANCHO_BUS-1:0] data1,  		// Primera entrada de datos.
	 input [ANCHO_BUS-1:0] data2,
	 input [3:0] operation,				// eleccion de la operacion 
    output reg[ANCHO_BUS-1:0] alu_result,	// Salida de la operacion de la ALU
    output reg zero
	 );
	
	 always @(operation, data1, data2) begin
		if (rst == 1) begin
			alu_result 	= 0;
			zero 			= 0;
		end
		else begin
			case(operation)
				4'b0000: begin
							alu_result = data1 & data2;
							end
				4'b0001: begin
							alu_result = data1 | data2;
							end
				4'b0010: begin
							alu_result = data1 + data2; // load or store
							end
				4'b0110: begin
							alu_result = data1 - data2; // branch equal
							end
				4'b1001: begin
							alu_result = data1 ^ data2;
							end
				4'b0111: begin
								if(data1 < data2)
									begin
										alu_result = 0;
									end
								else
									begin
										alu_result = 1;
									end
							end
				default :begin 
								alu_result = 8'b11001100;
							end
			endcase
			if(alu_result == 0)begin
				zero = 1;
			end
			else begin
				zero = 0;
			end
		end
	end
	
endmodule
