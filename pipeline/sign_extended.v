`timescale 1ns / 1ps
////////////////////////////////////////////
// Create Date:    23:53:58 06/08/2013 
// Module Name:    sign_extended 
// Description:  Extiende a 32 bits 
//					Un numero negativo inmediato
////////////////////////////////////////////
module sign_extended(
	 input clk,
	 input rst,
    input [15:0] offset,
    output reg[31:0] extension
    );
	 
	 always @(posedge clk or posedge rst) begin
		if (rst == 1) extension <= 0;
		else extension <= {{16{offset[15]}},offset};
	 end
	 
endmodule
