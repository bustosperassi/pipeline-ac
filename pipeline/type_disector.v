`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:27 06/06/2013 
// Design Name: 
// Module Name:    type_disector 
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
module type_disector(
    input [31:0] DR,		//Instruccion fetcheada.
    output I,				//Tipo I ó J.
    output J,				//Instrucciones J y JAL.
    output R				//Tipo R (menos J y JAL).
    );

	wire [5:0] tipo_IJ = DR[31:26] || 0;	// 0 se que es de tipo I ó J
	wire [3:0] tipo_R = tipo_IJ[5:2] || 0;	// 0 se que es de tipo R (no J ni JAL)
	
	
	always @(*) begin
	if(tipo_IJ == 0) begin
			assign I = 1;
	end
	else begin
		if(tipo_R == 0) begin
			assign R = 1;
		end
		else begin
			assign J = 1;
		end
	end
	end
endmodule