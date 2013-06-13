`timescale 1ns / 1ps
////////////////////////////////////////////
// Create Date:    23:53:58 06/08/2013 
// Module Name:    sign_extended 
// Description:  Extiende a 32 bits 
//					Un numero negativo inmediato
////////////////////////////////////////////
module sign_extended(
    input [15:0] offset,
    output [31:0] extension
    );
	 assign extension = {{16{offset[15]}},offset};
endmodule
