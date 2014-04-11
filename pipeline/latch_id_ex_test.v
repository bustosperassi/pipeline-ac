`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:00:26 04/11/2014
// Design Name:   latch_id_ex
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_id_ex_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_id_ex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_id_ex_test;

	// Inputs
	reg [5:0] alu_op;
	reg reg_dst;
	reg alu_src;
	reg mem_write;
	reg reg_write;
	reg mem_to_reg;
	reg [31:0] data1;
	reg [31:0] data2;
	reg [31:0] sign_extend;
	reg [4:0] reg1;
	reg [4:0] reg2;
	reg clk;
	reg rst;

	// Outputs
	wire [5:0] alu_op_reg;
	wire reg_dst_reg;
	wire alu_src_reg;
	wire mem_write_reg;
	wire reg_write_reg;
	wire mem_to_reg_reg;
	wire [31:0] data1_reg;
	wire [31:0] data2_reg;
	wire [31:0] sign_extend_reg;
	wire [4:0] reg1_reg;
	wire [4:0] reg2_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_id_ex uut (
		.alu_op(alu_op), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.mem_write(mem_write), 
		.reg_write(reg_write), 
		.mem_to_reg(mem_to_reg), 
		.data1(data1), 
		.data2(data2), 
		.sign_extend(sign_extend), 
		.reg1(reg1), 
		.reg2(reg2), 
		.clk(clk), 
		.rst(rst), 
		.alu_op_reg(alu_op_reg), 
		.reg_dst_reg(reg_dst_reg), 
		.alu_src_reg(alu_src_reg), 
		.mem_write_reg(mem_write_reg), 
		.reg_write_reg(reg_write_reg), 
		.mem_to_reg_reg(mem_to_reg_reg), 
		.data1_reg(data1_reg), 
		.data2_reg(data2_reg), 
		.sign_extend_reg(sign_extend_reg), 
		.reg1_reg(reg1_reg), 
		.reg2_reg(reg2_reg)
	);

	initial begin
		// Initialize Inputs
		alu_op = 0;
		reg_dst = 0;
		alu_src = 0;
		mem_write = 0;
		reg_write = 0;
		mem_to_reg = 0;
		data1 = 0;
		data2 = 0;
		sign_extend = 0;
		reg1 = 0;
		reg2 = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
      #100;
		
		alu_op = 1;
		reg_dst = 1;
		alu_src = 1;
		mem_write = 1;
		reg_write = 1;
		mem_to_reg = 1;
		data1 = 5;
		data2 = 4;
		sign_extend = 3;
		reg1 = 2;
		reg2 = 1;
		clk = 1;
		
		#100;
		
		clk = 0;
		
		#100;
		
		alu_op = 0;
		reg_dst = 0;
		alu_src = 0;
		mem_write = 0;
		reg_write = 0;
		mem_to_reg = 0;
		data1 = 0;
		data2 = 0;
		sign_extend = 0;
		reg1 = 0;
		reg2 = 0;
		clk = 1;
		
	end
      
endmodule

