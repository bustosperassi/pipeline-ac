`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:46 01/28/2014 
// Design Name: 
// Module Name:    hazard 
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
module hazard(
	 input rst,
    input [9:0] instruction,
    input [4:0] rt_ex,
    input mem_to_reg_ex,
    output reg stop
    );
	
	wire cond1, cond2;
	
	assign cond1 = instruction[9:5]~^rt_ex;
	assign cond2 = instruction[4:0]~^rt_ex;
	
	always @ (mem_to_reg_ex) begin 
		stop = (cond1 | cond2) & mem_to_reg_ex;
	end
	
endmodule
