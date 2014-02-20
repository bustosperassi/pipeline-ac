`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:48 02/20/2014 
// Design Name: 
// Module Name:    mux_program_counter 
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
module mux_program_counter #(parameter nbits = 7)(
	 input rst,
    input [nbits-1:0] msb,
    input [nbits-1:0] lsb,
    output reg [nbits-1:0] out,
    input dec
    );
	 
	 always @(posedge rst) begin
		out <= 0;
	 end
	 
	 always@(msb, lsb, posedge dec) begin
		 if (dec == 0) begin
			out = lsb;
		 end
		 else begin
			out = msb;
		 end
	 end
	 
endmodule
