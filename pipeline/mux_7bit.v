`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:11 06/04/2013 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input [6:0] msb_7,
    input [6:0] lsb_7,
    output [6:0] out_7,
    input dec
    );
	
	reg msb [6:0];
	reg lsb [6:0];
	
	
	
	if(dec == 0){
			msb = out_7;
	}else{
			lsb = out_7;
	}

endmodule
