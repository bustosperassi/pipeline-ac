`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:32 11/25/2013 
// Design Name: 
// Module Name:    alu_ctrl 
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
module alu_ctrl(
    input [5:0] ff,
    input [4:0] aluOp,
    output [2:0] operation
    );
	 
	 assign operation[0] = (ff[0] || ff[3]) && (aluOp[1]);
	 assign operation[1] = ~(ff[2]) || ~(aluOp[1]);
	 assign operation[2] = (aluOp[1] && ff[1]) || aluOp[0];
	
endmodule
