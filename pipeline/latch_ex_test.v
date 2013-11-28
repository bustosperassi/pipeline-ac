`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:51:40 11/28/2013
// Design Name:   latch_ex
// Module Name:   /home/nico/pipeline-ac/pipeline/latch_ex_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch_ex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_ex_test;

	// Inputs
	reg clk;
	reg alu_src;
	reg [5:0] alu_op;
	reg reg_dst;

	// Outputs
	wire alu_src_reg;
	wire [5:0] alu_op_reg;
	wire reg_dst_reg;

	// Instantiate the Unit Under Test (UUT)
	latch_ex uut (
		.clk(clk), 
		.alu_src(alu_src), 
		.alu_op(alu_op), 
		.reg_dst(reg_dst), 
		.alu_src_reg(alu_src_reg), 
		.alu_op_reg(alu_op_reg), 
		.reg_dst_reg(reg_dst_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		alu_src = 0;
		alu_op = 0;
		reg_dst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		clk = 0;
		alu_src = 1;
		alu_op = 31;
		reg_dst = 1;
		#100;
		clk = 1;
		#100;
		clk = 0;
		alu_src = 0;
		alu_op = 0;
		reg_dst = 0;
		#100;
		clk = 1;
		#100;
		
	end
      
endmodule

