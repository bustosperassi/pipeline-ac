`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:38 11/28/2013 
// Design Name: 
// Module Name:    latch_if_id 
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
module latch_if_id(
    input clk,
	 input rst,
	 input ena,
	 input stop,
	 input [6:0] next_pc,
    input [31:0] instruction,
	 output reg ena_if_id_reg,
    output reg [6:0] next_pc_reg,
    output reg [31:0] instruction_reg
    );

	always @(posedge rst) begin
		next_pc_reg 		<= 0;
		instruction_reg 	<= 0;
		ena_if_id_reg		<= 0;
	end
	
	always @(posedge clk) begin
		if(~stop) begin
			next_pc_reg 		<= next_pc;
			instruction_reg 	<= instruction;
			ena_if_id_reg		<= ena;
		end
	end
	
endmodule
