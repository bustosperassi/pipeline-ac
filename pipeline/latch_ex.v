`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:01 11/28/2013 
// Design Name: 
// Module Name:    latch_ex 
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
module latch_ex(
    input clk,
	 input rst,
	 input alu_src,
    input [5:0] alu_op,
    input reg_dst,
    output reg alu_src_reg,
    output reg [5:0] alu_op_reg,
    output reg reg_dst_reg
    );

	always @(posedge clk) begin
		if (rst == 1) begin
			alu_src_reg	<= 0;
			alu_op_reg 	<= 0;
			reg_dst_reg <= 0;
		end
		else begin
			alu_src_reg	<= alu_src;
			alu_op_reg 	<= alu_op;
			reg_dst_reg <= reg_dst;
		end
	end

endmodule
