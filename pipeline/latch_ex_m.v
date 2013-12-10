`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:34 11/29/2013 
// Design Name: 
// Module Name:    latch_ex_m 
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
module latch_ex_m(
    input mem_to_reg,
    input reg_write,
    input branch,
    input mem_write,
    input mem_read,
    input [6:0] pc_branch,
    input zero,
    input [31:0] alu_result,
    input [31:0] data2,
    input [4:0] dst,
	 input clk,
	 output mem_to_reg_reg,
    output reg_write_reg,
    output branch_reg,
    output mem_write_reg,
    output mem_read_reg,
    output reg [6:0] pc_branch_reg,
    output reg zero_reg,
    output reg [31:0] alu_result_reg,
    output reg [31:0] data2_reg,
    output reg [4:0] dst_reg
    );

	latch_m m (
		.clk(clk), 
		.mem_write(mem_write), 
		.mem_read(mem_read), 
		.branch(branch), 
		.mem_write_reg(mem_write_reg), 
		.mem_read_reg(mem_read_reg), 
		.branch_reg(branch_reg)
	);
	 
	 latch_wb wb (
		.clk(clk), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg)
	);
	
	always@(posedge clk)
	begin
		data2_reg <= data2;
		pc_branch_reg <= pc_branch;
		zero_reg <= zero;
		alu_result_reg <= alu_result;
		dst_reg <= dst;
	end

endmodule
