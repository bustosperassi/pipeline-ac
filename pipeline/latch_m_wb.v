`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:26 11/29/2013 
// Design Name: 
// Module Name:    latch_m_wb 
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
module latch_m_wb(
    input reg_write,
    input mem_to_reg,
    input [31:0] alu_result,
    input [31:0] data_load,
    input [4:0] dst,
    input clk,
	 input rst,
	 output reg_write_reg,
    output mem_to_reg_reg,
    output reg [31:0] alu_result_reg,
    output reg [31:0] data_load_reg,
    output reg [4:0] dst_reg
    );

	latch_wb wb (
		.clk(clk),
		.rst(rst), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg)
	);
	
	always@(posedge rst)
	begin
		alu_result_reg <= 0;
		data_load_reg <= 0;
    	dst_reg <= 0;
	end
	
	always@(posedge clk)
	begin
		alu_result_reg <= alu_result;
		data_load_reg <= data_load;
    	dst_reg <= dst;
	end
	
endmodule
