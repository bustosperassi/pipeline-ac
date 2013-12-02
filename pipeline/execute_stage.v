`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:53 12/02/2013 
// Design Name: 
// Module Name:    execute_stage 
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
module execute_stage(
    input alu_src,
    input [5:0] alu_op,
    input reg_dst,
    input [6:0] pc_next,
    input [31:0] data1,
    input [31:0] data2,
    input [31:0] sign_extend,
    input [4:0] reg1,
    input [4:0] reg2,
    output [6:0] branch_pc,
    output zero,
    output [31:0] alu_result,
    output [31:0] data2_out,
    output [4:0] dst
    );
	 
	 wire [3:0]  wire_operation;
	 wire [31:0] wire_data2;
	 
	 assign data2_out = data2;
	 
	 alu alu_instance (
		.data1(data1), 
		.data2(wire_data2), 
		.operation(wire_operation), 
		.alu_result(alu_result), 
		.zero(zero)
	 );
	 
	 branch_sum sum_instance (
		.pc_next(pc_next), 
		.pc_branch(sign_extend), 
		.branch_pc(branch_pc)
	 );
	 
	 alu_ctrl alu_ctrl_instance (
		.ff(sign_extend[5:0]), 
		.aluOp(alu_op), 
		.operation(wire_operation)
	 );
	 
	 mux #(.nbits(32)) mux_data(
		.msb(sign_extend), 
		.lsb(data2), 
		.out(wire_data2), 
		.dec(alu_src)
	 );
	 
	 mux #(.nbits(5)) mux_reg(
		.msb(reg2), 
		.lsb(reg1), 
		.out(dst), 
		.dec(reg_dst)
	 );

endmodule
