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
	 input clk,
	 input rst,
    input [31:0] instruction,
    input [4:0] rt_ex,
    input mem_to_reg_ex,
    output reg stop
    );
	
	wire cond1, cond2;
	
	assign cond1 = ((instruction[25]~^rt_ex[4]) & (instruction[24]~^rt_ex[3]) & (instruction[23]~^rt_ex[2]) & (instruction[22]~^rt_ex[1]) & (instruction[21]~^rt_ex[0]));
	assign cond2 = ((instruction[20]~^rt_ex[4]) & (instruction[19]~^rt_ex[3]) & (instruction[18]~^rt_ex[2]) & (instruction[17]~^rt_ex[1]) & (instruction[16]~^rt_ex[0]));	
		
	always @ (mem_to_reg_ex) begin
		stop = (cond1 | cond2) & mem_to_reg_ex;
	end
	
endmodule
