`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:33 11/28/2013 
// Design Name: 
// Module Name:    latch_id_ex 
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
module latch_id_ex(
    input [5:0] alu_op,
    input reg_dst,
    input alu_src,
    input branch,
    input mem_write,
    input reg_write,
    input mem_to_reg,
    input [6:0] pc_next,
    input [31:0] data1,
    input [31:0] data2,
    input [31:0] sign_extend,
    input [4:0] reg1,
    input [4:0] reg2,
	 input [4:0] rs,
	 input [4:0] rt,
    input clk,
	 input rst,
	 output [5:0] alu_op_reg,
    output reg_dst_reg,
    output alu_src_reg,
    output branch_reg,
    output mem_write_reg,
    output reg_write_reg,
    output mem_to_reg_reg,
    output reg[6:0] pc_next_reg,
    output reg[31:0] data1_reg,
    output reg[31:0] data2_reg,
    output reg[31:0] sign_extend_reg,
    output reg[4:0] reg1_reg,
    output reg[4:0] reg2_reg,
	 output reg[4:0] rs_reg,
	 output reg[4:0] rt_reg
    );
	 
	 latch_ex ex (
		.clk(clk),
		.rst(rst),		
		.alu_src(alu_src), 
		.alu_op(alu_op), 
		.reg_dst(reg_dst), 
		.alu_src_reg(alu_src_reg), 
		.alu_op_reg(alu_op_reg), 
		.reg_dst_reg(reg_dst_reg)
	);
	 
	 latch_m m (
		.clk(clk),
		.rst(rst),		
		.mem_write(mem_write), 
		.branch(branch), 
		.mem_write_reg(mem_write_reg),  
		.branch_reg(branch_reg)
	);
	
	 latch_wb wb (
		.clk(clk),
		.rst(rst),		
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg)
	);
	
	always@(posedge clk) begin
		if (rst == 1) 	begin
			pc_next_reg <= 0;
			data1_reg <= 0;
			data2_reg <= 0;
			sign_extend_reg <= 0;
			reg1_reg <= 0;
			reg2_reg <= 0;
			rs_reg <= 0;
			rt_reg <= 0;
		end
		else begin
			pc_next_reg <= pc_next;
			data1_reg <= data1;
			data2_reg <= data2;
			sign_extend_reg <= sign_extend;
			reg1_reg <= reg1;
			reg2_reg <= reg2;
			rs_reg <= rs;
			rt_reg <= rt;
		end
	end

endmodule
