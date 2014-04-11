`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:23:51 04/11/2014
// Design Name:   execute_stage
// Module Name:   /home/nico/pipeline-ac/pipeline/execute_stage_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: execute_stage
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module execute_stage_test;

	// Inputs
	reg rst;
	reg alu_src;
	reg [5:0] alu_op;
	reg reg_dst;
	reg [31:0] data1;
	reg [31:0] data2;
	reg [31:0] sign_extend;
	reg [4:0] reg1;
	reg [4:0] reg2;

	// Outputs
	wire [31:0] alu_result;
	wire [31:0] data2_out;
	wire [4:0] dst;

	// Instantiate the Unit Under Test (UUT)
	execute_stage uut (
		.rst(rst), 
		.alu_src(alu_src), 
		.alu_op(alu_op), 
		.reg_dst(reg_dst), 
		.data1(data1), 
		.data2(data2), 
		.sign_extend(sign_extend), 
		.reg1(reg1), 
		.reg2(reg2), 
		.alu_result(alu_result), 
		.data2_out(data2_out), 
		.dst(dst)
	);

	initial begin
	// Initialize Inputs
		rst = 1;
		alu_src = 0;
		alu_op = 0;
		reg_dst = 0;
		data1 = 4;
		data2 = 0;
		sign_extend = 0;
		reg1 = 0;
		reg2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		#100;
		
		//Probando una AND entre data1 y data2 - Suma entre pc_next y sign_extend
      alu_src = 1;
		alu_op = 6'b000010;
		reg_dst = 0;
		data1 = 10;
		data2 = 6;
		sign_extend = 4'b0100;
		reg1 = 0;
		reg2 = 0;
		
		#100;
		
		alu_src = 0;
		alu_op = 0;
		reg_dst = 0;
		data1 = 4;
		data2 = 0;
		sign_extend = 0;
		reg1 = 1;
		reg2 = 3;

		#100;
		
		alu_src = 0;
		alu_op = 0;
		reg_dst = 1;
		data1 = 4;
		data2 = 0;
		sign_extend = 0;
		reg1 = 1;
		reg2 = 3;

	end
      
endmodule

