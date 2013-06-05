`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    19:50:11 06/04/2013 
// Module Name:    mux 
// Project Name:   pipeline
// Additional Comments: Demultiplexor, devuelve msb_7 si dec es 1
//								o lsb_7 si dec es 0
//
//////////////////////////////////////////////////////////////////////////////////
module mux(
    input [6:0] msb_7,
    input [6:0] lsb_7,
    output reg [6:0] out_7,
    input dec
    );
	 
	 
	 always@(dec)
	 if (dec == 0)
	 begin
		out_7 = lsb_7;
	 end
	 else
	 begin
		out_7 = msb_7;
	 end
endmodule
